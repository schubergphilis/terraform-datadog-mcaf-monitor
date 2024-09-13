# terraform-datadog-mcaf-monitor

A module for building Datadog monitors in Terraform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.default](https://registry.terraform.io/providers/datadog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboard"></a> [dashboard](#input\_dashboard) | The Datadog dashboard URL shown in the alert message | `string` | `""` | no |
| <a name="input_monitors"></a> [monitors](#input\_monitors) | The set of monitor specific attributes per monitor | <pre>map(object({<br>    name                = string<br>    message             = string<br>    query               = string<br>    type                = string<br>    enable_logs_sample  = optional(bool, null)<br>    escalation_message  = optional(string, null)<br>    evaluation_delay    = optional(number, null)<br>    force_delete        = optional(bool, null)<br>    include_tags        = optional(bool, null)<br>    locked              = optional(bool, null)<br>    new_host_delay      = optional(number, null)<br>    no_data_timeframe   = optional(number, null)<br>    notify_audit        = optional(bool, null)<br>    notify_no_data      = optional(bool, null)<br>    priority            = optional(string, null)<br>    renotify_interval   = optional(number, null)<br>    require_full_window = optional(bool, null)<br>    tags                = optional(list(string), null)<br>    threshold_windows   = optional(map(string), null)<br>    thresholds          = optional(map(string), null)<br>    timeout_h           = optional(number, null)<br>  }))</pre> | `null` | no |
| <a name="input_notifiers"></a> [notifiers](#input\_notifiers) | The notifiers to which the alerts get send | `list(string)` | `[]` | no |
| <a name="input_tag_list"></a> [tag\_list](#input\_tag\_list) | A list of tags to assign to the monitor | `list(string)` | `[]` | no |
| <a name="input_tag_map"></a> [tag\_map](#input\_tag\_map) | A map of tags to assign to the monitor | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_monitor_ids"></a> [monitor\_ids](#output\_monitor\_ids) | A map with all monitor names and IDs |
<!-- END_TF_DOCS -->
