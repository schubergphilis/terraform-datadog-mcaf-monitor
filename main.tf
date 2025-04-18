locals {
  message = "{{#is_alert}} %s ${var.dashboard} {{/is_alert}} ${join(" ", var.notifiers)}"
  tags    = concat([for k, v in var.tag_map : "${k}:${v}"], var.tag_list)

  monitors = {
    for k, v in var.monitors : k => {
      name                = v.name
      message             = v.message
      enable_logs_sample  = v.enable_logs_sample
      escalation_message  = v.escalation_message
      evaluation_delay    = try(coalesce(v.evaluation_delay, var.evaluation_delay), var.evaluation_delay)
      force_delete        = v.force_delete
      include_tags        = coalesce(v.include_tags, var.include_tags)
      locked              = v.locked
      new_group_delay     = try(coalesce(v.new_group_delay, var.new_group_delay), var.new_group_delay)
      no_data_timeframe   = try(coalesce(v.no_data_timeframe, var.no_data_timeframe), var.no_data_timeframe)
      notify_audit        = v.notify_audit
      notify_no_data      = coalesce(v.notify_no_data, var.notify_no_data)
      priority            = try(coalesce(v.priority, var.priority), var.priority)
      query               = v.query
      renotify_interval   = try(coalesce(v.renotify_interval, var.renotify_interval), var.renotify_interval)
      require_full_window = coalesce(v.require_full_window, var.require_full_window)
      tags                = concat(local.tags, v.tags)
      threshold_windows   = v.threshold_windows
      thresholds          = v.thresholds
      timeout             = try(coalesce(v.timeout, var.timeout), var.timeout)
      type                = v.type
    }
  }
}

resource "datadog_monitor" "default" {
  for_each = local.monitors

  name                = each.value.name
  message             = format(local.message, each.value.message)
  enable_logs_sample  = each.value.enable_logs_sample
  escalation_message  = each.value.escalation_message
  evaluation_delay    = each.value.evaluation_delay
  force_delete        = each.value.force_delete
  include_tags        = each.value.include_tags
  locked              = each.value.locked
  new_group_delay     = each.value.new_group_delay
  no_data_timeframe   = each.value.no_data_timeframe
  notify_audit        = each.value.notify_audit
  notify_no_data      = each.value.notify_no_data
  priority            = each.value.priority
  query               = each.value.query
  renotify_interval   = each.value.renotify_interval
  require_full_window = each.value.require_full_window
  timeout_h           = each.value.timeout
  type                = each.value.type
  tags                = each.value.tags

  dynamic "monitor_threshold_windows" {
    for_each = each.value.threshold_windows != null ? { create : true } : {}

    content {
      trigger_window  = each.value.threshold_windows.trigger_window
      recovery_window = each.value.threshold_windows.recovery_window
    }
  }

  dynamic "monitor_thresholds" {
    for_each = each.value.thresholds != null ? { create : true } : {}

    content {
      ok                = try(each.value.thresholds["ok"], null)
      warning           = try(each.value.thresholds["warning"], null)
      critical          = try(each.value.thresholds["critical"], null)
      unknown           = try(each.value.thresholds["unknown"], null)
      warning_recovery  = try(each.value.thresholds["warning_recovery"], null)
      critical_recovery = try(each.value.thresholds["critical_recovery"], null)
    }
  }
}
