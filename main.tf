locals {
  map_to_list = [for k, v in var.tag_map : "${k}:${v}"]
  tags        = concat(var.tag_list, local.map_to_list)
}

resource "datadog_monitor" "monitor" {
  name              = var.name
  type              = var.type
  message           = var.message
  query             = var.query
  thresholds        = var.thresholds
  notify_no_data    = var.notify_no_data
  no_data_timeframe = var.no_data_timeframe
  renotify_interval = var.renotify_interval
  timeout_h         = var.timeout_h
  include_tags      = var.include_tags
  new_host_delay    = var.new_host_delay
  tags              = local.tags
}
