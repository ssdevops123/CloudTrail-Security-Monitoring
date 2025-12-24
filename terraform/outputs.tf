############################################
# Metric Filter Names
############################################
output "cloudtrail_metric_filter_names" {
  value = [
    for _, v in aws_cloudwatch_log_metric_filter.new_filters :
    v.name
  ]
}
 
 ############################################
# Metric Names (from Metric Filters)
############################################
output "cloudtrail_metric_names" {
  description = "CloudWatch metric names created by metric filters"
  value = [
    for _, v in aws_cloudwatch_log_metric_filter.new_filters :
    v.metric_transformation[0].name
  ]
}

############################################
# Alarm Names
############################################
output "cloudwatch_alarm_names" {
  value = [
    for _, v in aws_cloudwatch_metric_alarm.cloudtrail_alarms :
    v.alarm_name
  ]
}

############################################
# SNS
############################################
output "sns_topic_name" {
  value = aws_sns_topic.alerts.name
}

output "sns_topic_arn" {
  value = aws_sns_topic.alerts.arn
}

/*
############################################
# Metric Filter Names
############################################
output "cloudtrail_metric_filter_names" {
  description = "CloudWatch Log Metric Filters created"
  value = [
    for k, v in aws_cloudwatch_log_metric_filter.new_filters :
    v.name
  ]
}

############################################
# Metric Names (CloudWatch Metrics)
############################################
output "cloudtrail_metric_names" {
  description = "CloudWatch metrics created from log filters"
  value = [
    for k, v in local.cloudtrail_metric_filters :
    v.metric_name
  ]
}

############################################
# Alarm Names
############################################
output "cloudwatch_alarm_names" {
  description = "CloudWatch alarms created"
  value = [
    for k, v in aws_cloudwatch_metric_alarm.cloudtrail_alarms :
    v.alarm_name
  ]
}

 # SNS Topic Name
 ##
output "sns_topic_name" {
  description = "SNS topic name used for all CloudTrail alarms"
  value       = aws_sns_topic.alerts.name
 
}

 
# SNS Topic ARN
 
output "sns_topic_arn" {
  description = "SNS topic ARN used for all CloudTrail alarms"
  value       = aws_sns_topic.alerts.arn
}


output "sns_topic_names" {
  description = "SNS topic names created for alarms"
  value = [
    for t in aws_sns_topic.new_topics :
    t.name
  ]
}

output "sns_topic_arns" {
  description = "SNS topic ARNs created for alarms"
  value = [
    for t in aws_sns_topic.new_topics :
    t.arn
  ]
}
*/