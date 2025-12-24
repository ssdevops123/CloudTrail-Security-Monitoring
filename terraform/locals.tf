locals {
  cloudtrail_metric_filters = {
    ConsoleLoginSuccess = {
      pattern     = "{($.eventName=ConsoleLogin) && ($.responseElements.ConsoleLogin=Success)}"
      metric_name = "ConsoleLogin"
      create_sns  = true
  
      
    }
    ConsoleAuthFailure = {
      pattern     = "{($.eventName=ConsoleLogin) && ($.errorMessage=\"Failed authentication\")}"
      metric_name = "ConsoleAuthenticationFailure"
      create_sns  = true
   
    }
  }
}
