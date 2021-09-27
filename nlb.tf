# ===============================================================================
# Target Group(Application)
# ===============================================================================
resource "aws_lb_target_group" "tg" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = var.tg_protocol
  target_type = var.tg_target_type
  vpc_id      = module.vpc.vpc_id
  
  stickiness {
    type = var.tg_stickiness_type
    enabled = true
  }
  depends_on = [
    module.vpc,
  ]
}

# ===============================================================================
# Network Load Balancer (Application)
# ===============================================================================
resource "aws_lb" "nlb" {
  name               = var.nlb_name
  internal           = var.nlb_internal
  load_balancer_type = var.nlb_lb_type
  subnets            = module.vpc.public_subnets
  enable_deletion_protection = var.nlb_deletion_protection
  depends_on = [
    module.vpc,
  ]
}

# ===============================================================================
# NLB TCP Listener (Application)
# ===============================================================================
resource "aws_lb_listener" "a2a-attachment_02" {
  load_balancer_arn = aws_lb.nlb.arn
  port = var.nlb_tcp_listener_port
  protocol = var.nlb_tcp_listener_protocol

  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = var.nlb_tcp_listener_action_type
  }

  depends_on = [
    module.vpc,
  ]
}

