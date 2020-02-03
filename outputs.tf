output "monitor_ids" {
  value       = { for name, monitor in datadog_monitor.default : name => monitor.id }
  description = "A map with all monitor names and IDs"
}
