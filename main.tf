resource "aws_elb" "main" {
  name = "${var.name}"

  internal                  = "${var.internal_elb}"
  cross_zone_load_balancing = "${var.cross_zone_load_balancing}"
  subnets                   = ["${split(",", var.subnet_ids)}"]
  security_groups           = ["${split(",",var.security_groups)}"]

  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  listener {
    lb_port            = 443
    lb_protocol        = "https"
    instance_port      = "${var.port}"
    instance_protocol  = "http"
    ssl_certificate_id = "${var.ssl_certificate_id}"
  }

  listener {
    lb_port            = "${var.health_check_port}"
    lb_protocol        = "http"
    instance_port      = "${var.health_check_port}"
    instance_protocol  = "http"
  }

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.health_check_timeout}"
    target              = "${var.health_check_url}"
    interval            = "${var.health_check_interval}"
  }

  access_logs {
    bucket = "${var.s3_access_logs_bucket != "" ? var.s3_access_logs_bucket : "none"}"
    bucket_prefix = "${var.s3_access_logs_bucket_prefix}"
    interval = "${var.s3_access_logs_bucket_interval}"
    enabled = "${var.s3_access_logs_bucket != "" ? true : false}"
  }

  tags {
    Name        = "${var.name}-ELB"
    Team        = "${var.team}"
    Environment = "${var.environment}"
    Service     = "${var.service}"
    Product     = "${var.product}"
    Owner       = "${var.owner}"
    Description = "${var.description}"
    managed_by  = "terraform"
  }
}
