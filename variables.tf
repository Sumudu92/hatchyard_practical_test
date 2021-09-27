// AWS
variable "aws_region" {
  type        = string
}

variable "aws_profile" {
  type        = string
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}
// S3 Remote backend
#variable "remote_backend_bucket_name" {
#  type        = string
#  description = "Name of the S3 bucket used for terraform remote backend"
#}


// VPC Configuration

variable "vpc_name" {
  type        = string
}


variable "vpc_cidr" {
  type        = string
}

variable "vpc_private_subnet" {
  type        = list(string)
}

variable "vpc_public_subnet" {
  type        = list(string)
}


// Target Group(target host)
variable "tg_name" {
  type = string
}

variable "tg_port" {
  type = number
}

variable "tg_protocol" {
  type = string
}

variable "tg_target_type" {
  type = string
}

variable "tg_stickiness_type" {
  type = string
}

# Network Load Balancer (target host)
variable "nlb_name" {
  type = string
}

variable "nlb_internal" {
  type = bool
}

variable "nlb_lb_type" {
  type = string
}

variable "nlb_deletion_protection" {
  type = bool
}

// NLB TCP Listener (target host)

variable "nlb_tcp_listener_port" {
  type = string
}

variable "nlb_tcp_listener_protocol" {
  type = string
}

variable "nlb_tcp_listener_action_type" {
  type = string
}


// Launch Template (target host)

variable "launch_tmpl_name_prefix" {
  type = string
}

variable "launch_tmpl_image_id" {
  type = string
}

variable "launch_tmpl_instance_type" {
  type = string
}

variable "launch_tmpl_key_name" {
  type = string
}



// Autoscaling Group (target host)

variable "app_name" {
  type        = string
}

variable "asg_desired_capacity" {
  type = number
}

variable "asg_max_size" {
  type = number
}

variable "asg_min_size" {
  type = number
}

variable "asg_health_check_type" {
  type        = string
}

variable "asg_launch_tmpl_version" {
  type = string
}

// Target Host

variable "targethost_image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

// Security Group Configuration

variable "sg1_name" {
  type = string
}

variable "sg2_name" {
  type = string
}

// Launch Template (target host)

variable "launch_tmpl_name_prefix_target" {
  type = string
}


// Autoscaling Group (target host)

variable "app_name_target" {
  type        = string
}

variable "launch_tmpl_key_name_target" {
  type = string
}