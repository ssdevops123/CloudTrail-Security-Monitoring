resource "aws_cloudwatch_log_metric_filter" "new_filters" {
  for_each = { for f in var.new_metric_filters : f.name => f }

  name           = each.key
  log_group_name = var.cloudtrail_log_group
  pattern        = each.value.filter_pattern

  metric_transformation {
    name      = each.value.metric_name
    namespace = "LogMetrics"
    value     = "1"
  }
}
