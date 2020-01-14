locals {
  tags = concat(var.tag_list, [for k, v in var.tag_map : "${k}:${v}"])
}

resource "datadog_monitor" "monitor" {
  name              = var.name
  type              = var.type
  message           = var.message
  query             = var.query
  include_tags      = var.include_tags
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe
  notify_no_data    = var.notify_no_data
  renotify_interval = var.renotify_interval
  thresholds        = var.thresholds
  timeout_h         = var.timeout
  tags              = local.tags
}
