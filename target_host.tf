

# ===============================================================================
# Launch Template (target)
# ===============================================================================
resource "aws_launch_template" "launch_tmpl_target" {
  name_prefix   = var.launch_tmpl_name_prefix_target
  image_id      = var.targethost_image_id
  instance_type = var.launch_tmpl_instance_type
  vpc_security_group_ids = ["aws_security_group.sg_practical_1.id","aws_security_group.sg_practical_1.id"]
  key_name = var.launch_tmpl_key_name_target
  depends_on = [
    module.vpc,
  ]

}

# ===============================================================================
# Autoscaling Group (target)
# ===============================================================================
resource "aws_autoscaling_group" "test_asg_target" {
  name               = var.app_name_target
  desired_capacity   = var.asg_desired_capacity
  max_size           = var.asg_max_size
  min_size           = var.asg_min_size
  vpc_zone_identifier = module.vpc.private_subnets
  health_check_type = var.asg_health_check_type
  depends_on = [
    module.vpc,
  ]
  
  launch_template {
    id      = aws_launch_template.launch_tmpl_target.id
    version = var.asg_launch_tmpl_version
  }

}