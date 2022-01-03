locals {
  message = "{{#is_alert}} %s ${var.dashboard} {{/is_alert}} ${join(" ", var.notifiers)}"
  tags    = concat([for k, v in var.tag_map : "${k}:${v}"], var.tag_list)
}

resource "datadog_monitor" "default" {
  for_each = var.monitors

  name    = each.value.name
  message = format(local.message, each.value.message)
  dynamic "monitor_threshold_windows" {
    for_each = each.value.monitor_threshold_windows != null ? { create : true } : {}
    content {
      critical          = each.value.monitor_threshold_windows.critical
      critical_recovery = each.value.monitor_threshold_windows.critical_recovery
    }
  }
  query               = each.value.query
  evaluation_delay    = var.evaluation_delay
  include_tags        = var.include_tags
  new_group_delay     = var.new_group_delay
  no_data_timeframe   = var.no_data_timeframe
  notify_no_data      = var.notify_no_data
  renotify_interval   = var.renotify_interval
  require_full_window = var.require_full_window
  timeout_h           = var.timeout
  type                = each.value.type
  tags                = local.tags

  dynamic "monitor_thresholds" {
    for_each = each.value.thresholds != null ? { create : true } : {}

    content {
      trigger_window    = try(each.value.thresholds["trigger_window"], null)
      recovery_window   = try(each.value.thresholds["recovery_window"], null)
      ok                = try(each.value.thresholds["ok"], null)
      warning           = try(each.value.thresholds["warning"], null)
      critical          = try(each.value.thresholds["critical"], null)
      unknown           = try(each.value.thresholds["unknown"], null)
      warning_recovery  = try(each.value.thresholds["warning_recovery"], null)
      critical_recovery = try(each.value.thresholds["critical_recovery"], null)
    }
  }
}
