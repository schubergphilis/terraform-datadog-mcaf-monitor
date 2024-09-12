provider "datadog" {}

module "custom_metric_monitoring" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  evaluation_delay = 180

  monitors = {
    errors = {
      name              = "Custom metric monitoring"
      message           = "Custom metric count exceeds certain threshold. Please check usage/billing in Datadog"
      query             = "avg(last_1d):avg:datadog.estimated_usage.metrics.custom{*} > 100000"
      thresholds        = { ok = 0, warning = 80000, critical = 100000 }
      threshold_windows = null
      type              = "query alert"
    }
  }
}
