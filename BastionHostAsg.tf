# ===============================================================================
# Launch Template (Bastion)
# ===============================================================================
resource "aws_launch_template" "launch_tmpl" {
  name_prefix   = var.launch_tmpl_name_prefix
  image_id      = var.launch_tmpl_image_id
  instance_type = var.launch_tmpl_instance_type
  vpc_security_group_ids = ["aws_security_group.sg_practical_1.id","aws_security_group.sg_practical_1.id"]
  key_name = var.launch_tmpl_key_name
  depends_on = [
    module.vpc,
  ]

}

# ===============================================================================
# Autoscaling Group (Bastion)
# ===============================================================================
resource "aws_autoscaling_group" "test_asg" {
  name               = var.app_name
  desired_capacity   = var.asg_desired_capacity
  max_size           = var.asg_max_size
  min_size           = var.asg_min_size
  target_group_arns  = [aws_lb_target_group.tg.arn]
  vpc_zone_identifier = module.vpc.private_subnets
  health_check_type = var.asg_health_check_type
  depends_on = [
    module.vpc,
  ]
  
  launch_template {
    id      = aws_launch_template.launch_tmpl.id
    version = var.asg_launch_tmpl_version
  }

}

# ===============================================================================
# Autoscaling Group Attachment (Bastion)
# ===============================================================================
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.test_asg.id
  alb_target_group_arn   = aws_lb_target_group.tg.arn
}