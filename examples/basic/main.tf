provider "datadog" {}

locals {
  required_tags = ["managedby:unmanaged", "team:core", "env:test", "workload:web"]
}

module "custom_metric_monitoring" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  evaluation_delay = 120
  tag_list         = local.required_tags

  monitors = {
    errors = {
      name              = "Custom metric monitoring"
      message           = "Custom metric count exceeds certain threshold. Please check usage/billing in Datadog"
      evaluation_delay  = 300
      query             = "avg(last_1d):avg:datadog.estimated_usage.metrics.custom{*} > 100000"
      thresholds        = { ok = 0, warning = 80000, critical = 100000 }
      threshold_windows = null
      type              = "query alert"
      tags              = ["msr:yes"]
    }
  }
}
