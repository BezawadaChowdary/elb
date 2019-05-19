variable "name" {
  default = "dev-elb"
}

variable "subnet_ids" {
  description = "comma separated list of subnet IDs"
}

variable "security_groups" {
  description = "comma separated list of security group IDs"
}

variable "port" {
  description = "Instance port"
  default = 80
}

variable "internal_elb" {
  description = "(Optional) If true, ELB will be an internal ELB. Default: false"
  default = false
}

variable "cross_zone_load_balancing" {
  description = "(Optional) Enable cross-zone load balancing. Default: true"
  default = true
}

variable "idle_timeout" {
  description = "(Optional) The time in seconds that the connection is allowed to be idle. Default: 30"
  default = 30
}

variable "connection_draining" {
  description = "(Optional) Boolean to enable connection draining. Default: true"
  default = true
}

variable "connection_draining_timeout" {
  description = "(Optional) The time in seconds to allow for connections to drain. Default: 15"
  default = 15
}

variable "health_check_port" {
  description = "Listener for the health_check"
  default = 81
}

variable "health_check_url" {
  description = "The URL the ELB should use for health checks"
  default = "HTTP:80/"
}

variable "healthy_threshold" {
  description = "(Required) The number of checks before the instance is declared healthy."
  default = "2"
}

variable "unhealthy_threshold" {
  description = "(Required) The number of checks before the instance is declared unhealthy"
  default = "2"
}

variable "health_check_timeout" {
  description = "(Required) The length of time before the check times out."
  default = "5"
}

variable "health_check_interval" {
  description = "(Required) The interval between checks."
  default = "30"
}

// ARN of an SSL certificate in EC2
variable "ssl_certificate_id" {
  description = "The ARN of the SSL Certificate in EC2"
}

// logging is disabled by default; set a bucket name to enable this.
variable "s3_access_logs_bucket" {
  description = "The s3 bucket to use for ELB access logs"
  default = ""
}

variable "s3_access_logs_bucket_prefix" {
  description = "The s3 bucket prefix to put access logs under"
  default = "logs"
}

variable "s3_access_logs_bucket_interval" {
  description = "The s3 bucket interval"
  default = 60
}

variable "environment" {
  description = "AWS Environment tag, example 'dev', 'stage' or 'prod'. Defaults to 'unknown'"
  default = "unknown"
}

variable "team" {
  description = "AWS tag 'Team' used to associate with an ADC team, example 'marketing' or 'analytics' or 'adc-datascience'"
  default = "unknown"
}

variable "service" {
  description = "AWS tag 'Service' used to associate with a role the service takes part in, example 'importer' or 'exporter' or 'frontend-api', basically a subset of the role tag"
  default = "unknown"
}

variable "product" {
  description = "name of the product which the service belongs"
  default = "unknown"
}

variable "description" {
  description = "Friendly description of the component and its use"
  default = "unknown"
}

variable "owner" {
  description = "team/contact email address"
  default = "unknown"
}
