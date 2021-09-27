
# AWS
aws_region = "ap-southeast-1"
aws_profile = ""

# S3 Remote backend
#remote_backend_bucket_name = ""

# VPC Configuration

vpc_name = "vpc_test"
vpc_cidr = "10.0.0.0/16"
vpc_private_subnet = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_public_subnet = ["10.0.3.0/24", "10.0.4.0/24"]

# Target Group
tg_name = "app-tg"
tg_port = 22
tg_protocol = "TCP"
tg_target_type = "instance"
tg_stickiness_type = "source_ip"

# Network Load Balancer 
nlb_name = "app-nlb"
nlb_internal = true
nlb_lb_type = "network"
nlb_deletion_protection = true


# NLB TCP Listener 
nlb_tcp_listener_port = "80"
nlb_tcp_listener_protocol = "TCP"
nlb_tcp_listener_action_type = "forward"


# Launch Template 
launch_tmpl_name_prefix = "launch_tmpl"
launch_tmpl_image_id = "ami-09e20311f03e1afb8"
launch_tmpl_instance_type = "t2.micro"
launch_tmpl_key_name = "Bastion_host"


# Autoscaling Group 
app_name= "app-asg"
asg_desired_capacity = 1
asg_max_size = 1
asg_min_size = 1
asg_health_check_type = "EC2"
asg_launch_tmpl_version = "$Latest"

#Target Host

targethost_image_id = "ami-013a3c479b967c3c7"
instance_type = "t2.micro"
launch_tmpl_name_prefix_target = "target_host"
app_name_target = "app-asg-target"
launch_tmpl_key_name_target = "Target_host"

#Security Group Configuration

sg1_name = "sg1"
sg2_name = "sg2"

