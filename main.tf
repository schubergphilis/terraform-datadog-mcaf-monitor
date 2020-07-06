locals {
  message = "{{#is_alert}} %s ${var.dashboard} {{/is_alert}} ${join(" ", var.notifiers)}"
  tags    = concat([for k, v in var.tag_map : "${k}:${v}"], var.tag_list)
}

resource "datadog_monitor" "default" {
  for_each = var.monitors

  name                = each.value.name
  message             = format(local.message, each.value.message)
  query               = each.value.query
  evaluation_delay    = var.evaluation_delay
  include_tags        = var.include_tags
  new_host_delay      = var.new_host_delay
  no_data_timeframe   = var.no_data_timeframe
  notify_no_data      = var.notify_no_data
  renotify_interval   = var.renotify_interval
  require_full_window = var.require_full_window
  timeout_h           = var.timeout
  thresholds          = each.value.thresholds
  type                = each.value.type
  tags                = local.tags
}
