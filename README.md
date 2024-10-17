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
| <a name="input_dashboard"></a> [dashboard](#input\_dashboard) | The Datadog dashboard URL shown in the alert message, globally for all monitors | `string` | `""` | no |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Seconds to delay evaluation to ensure the monitor has a full data period, globally for all monitors | `number` | `null` | no |
| <a name="input_include_tags"></a> [include\_tags](#input\_include\_tags) | Whether to insert the triggering tags into the monitoring title, globally for all monitors | `bool` | `true` | no |
| <a name="input_monitors"></a> [monitors](#input\_monitors) | The set of monitor specific attributes, overrides the global attributes | <pre>map(object({<br>    name                = string<br>    message             = string<br>    query               = string<br>    type                = string<br>    enable_logs_sample  = optional(bool, null)<br>    escalation_message  = optional(string, null)<br>    evaluation_delay    = optional(number, null)<br>    force_delete        = optional(bool, null)<br>    include_tags        = optional(bool, null)<br>    locked              = optional(bool, null)<br>    new_group_delay     = optional(number, null)<br>    no_data_timeframe   = optional(number, null)<br>    notify_audit        = optional(bool, null)<br>    notify_no_data      = optional(bool, null)<br>    priority            = optional(string, null)<br>    renotify_interval   = optional(number, null)<br>    require_full_window = optional(bool, null)<br>    tag_list            = optional(list(string), null)<br>    threshold_windows   = optional(map(string), null)<br>    thresholds          = optional(map(string), null)<br>    timeout             = optional(number, null)<br>    tags                = optional(list(string), []) // Additional tags to add to the monitor, will be merged with the tags from the tag_map and tag_list<br>  }))</pre> | `null` | no |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Seconds after booting before starting the evaluation of monitor results, globally for all monitors | `number` | `null` | no |
| <a name="input_no_data_timeframe"></a> [no\_data\_timeframe](#input\_no\_data\_timeframe) | The number of minutes before a monitor will notify when data stops reporting, globally for all monitors | `number` | `null` | no |
| <a name="input_notifiers"></a> [notifiers](#input\_notifiers) | The notifiers to which the alerts get send, globally for all monitors | `list(string)` | `[]` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Whether this monitor will notify when data stops reporting, globally for all monitors | `bool` | `true` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Integer from 1 (high) to 5 (low) indicating alert severity, globally for all monitors | `number` | `null` | no |
| <a name="input_renotify_interval"></a> [renotify\_interval](#input\_renotify\_interval) | The number of minutes before a monitor will re-notify on the current status, globally for all monitors | `number` | `null` | no |
| <a name="input_require_full_window"></a> [require\_full\_window](#input\_require\_full\_window) | A boolean indicating whether the monitor needs a full window of data before it's evaluated, globally for all monitors | `bool` | `true` | no |
| <a name="input_tag_list"></a> [tag\_list](#input\_tag\_list) | A list of tags to assign to all the monitors | `list(string)` | `[]` | no |
| <a name="input_tag_map"></a> [tag\_map](#input\_tag\_map) | A map of tags to assign to all the monitors | `map(string)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | The timeout in hours before a monitor resolves automatically after not receiving data, globally for all monitors | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_monitor_ids"></a> [monitor\_ids](#output\_monitor\_ids) | A map with all monitor names and IDs |
<!-- END_TF_DOCS -->
