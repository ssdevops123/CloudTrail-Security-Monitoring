resource "aws_cloudwatch_metric_alarm" "cloudtrail_alarms" {
  for_each = { for f in var.new_metric_filters : f.name => f }

  alarm_name          = each.value.alarm_name
  alarm_description   = "Alert for ${each.key}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = each.value.metric_name
  namespace           = "LogMetrics"   # MUST MATCH
  period              = 60
  statistic           = "Sum"
  threshold           = each.value.threshold
  treat_missing_data  = "notBreaching"

  alarm_actions = [aws_sns_topic.alerts.arn]
}
