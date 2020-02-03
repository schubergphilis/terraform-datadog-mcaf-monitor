output "monitor_ids" {
  value = { for key, value in var.monitors : key => datadog_monitor.default[key].id }
}
