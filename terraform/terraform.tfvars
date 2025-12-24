
app_name    = "testing-test1"
environment = "qa"
aws_region  = "us-west-2"

cloudtrail_log_group  = "CloudTrail/DefaultLogGroup"
alert_emails  = ["sowjanyam@nousinfo.com"]

new_metric_filters = [
  /* {
   name           = "aws-env-notification1-RootLoginFilter"
   filter_pattern = "{($.eventName=ConsoleLogin) && ($.userIdentity.type=Root) && ($.responseElements.ConsoleLogin=Success)}"
   metric_name    = "RootConsoleLogin"
      
    alarm_name     = "RootConsoleLoginAlarm"
    threshold      = 1
    create_sns     = true
    sns_name       = "RootLoginAlarmTopic"
  } */

  {
    name           = "aws-env-notification1-IAMConsoleLoginFilter"
    filter_pattern = "{ ($.eventName = \"ConsoleLogin\") && ($.userIdentity.type = \"IAMUser\") }"
    metric_name    = "IAMConsoleLogin"

    alarm_name     = "IAMConsoleLoginAlarm"
    threshold      = 1
    create_sns     = true
    sns_name       = "IAMConsoleLoginAlarmTopic"
  },
  {
    name           = "aws-env-notification1-IAMChangesFilter"
    //filter_pattern = "{($.eventSource=iam.amazonaws.com) && (($.eventName=CreateUser) || ($.eventName=DeleteUser) || ($.eventName=AttachUserPolicy))}"
      filter_pattern = "{($.eventSource=iam.amazonaws.com) && (($.eventName=CreateAccessKey) || ($.eventName=DeleteAccessKey) || ($.eventName=UpdateLoginProfile) || ($.eventName=ChangePassword))}"
    
    metric_name    = "IAMChanges"
    alarm_name     = "IAMChangesAlarm"
    threshold      = 1
    create_sns     = true
    sns_name       = "IAMChangesAlarmTopic"
  }
  ]

