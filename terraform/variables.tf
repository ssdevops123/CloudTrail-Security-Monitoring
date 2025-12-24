variable "cloudtrail_log_group" {
  description = "Name of the CloudTrail log group"
  type        = string
  default     = "CloudTrail/DefaultLogGroup"  # Change if your log group has a different name
}

variable "alarm_sns_arn" {
  description = "SNS Topic ARN for alarms (optional)"
  type        = string
  default     = ""
}
 
# SNS email recipients/subscriptions
variable "alert_emails" {
  type    = list(string)
  default = []
}

variable "new_metric_filters" {
  type = list(object({
    name           = string
    filter_pattern = string
    metric_name    = string
    alarm_name     = string
    threshold      = number
    create_sns     = bool    # Whether to create SNS automatically
    sns_name       = string  # Name for the SNS topic if created
  }))
}

variable "environment" {
  description = "Environment name"
  type        = string
 # default     = "dev"
}

variable "app_name" {
  description = "Application name"
  type        = string
 # default     = "hello-india"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}
