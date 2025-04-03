variable "dashboard" {
  type        = string
  default     = ""
  description = "The Datadog dashboard URL shown in the alert message, globally for all monitors"
}

variable "evaluation_delay" {
  type        = number
  default     = null
  description = "Seconds to delay evaluation to ensure the monitor has a full data period, globally for all monitors"
}

variable "include_tags" {
  type        = bool
  default     = true
  description = "Whether to insert the triggering tags into the monitoring title, globally for all monitors"
}

variable "monitors" {
  type = map(object({
    name                = string
    message             = string
    query               = string
    type                = string
    enable_logs_sample  = optional(bool, null)
    escalation_message  = optional(string, null)
    evaluation_delay    = optional(number, null)
    force_delete        = optional(bool, null)
    include_tags        = optional(bool, null)
    locked              = optional(bool, null)
    new_group_delay     = optional(number, null)
    no_data_timeframe   = optional(number, null)
    notify_audit        = optional(bool, null)
    notify_no_data      = optional(bool, null)
    priority            = optional(string, null)
    renotify_interval   = optional(number, null)
    require_full_window = optional(bool, null)
    tag_list            = optional(list(string), null)
    threshold_windows   = optional(map(string), null)
    thresholds          = optional(map(string), null)
    timeout             = optional(number, null)
    tags                = optional(list(string), []) // Additional tags to add to the monitor, will be merged with the tags from the tag_map and tag_list
  }))
  default     = null
  description = "The set of monitor specific attributes, overrides the global attributes"
}

variable "new_group_delay" {
  type        = number
  default     = null
  description = "Seconds after booting before starting the evaluation of monitor results, globally for all monitors"
}

variable "no_data_timeframe" {
  type        = number
  default     = null
  description = "The number of minutes before a monitor will notify when data stops reporting, globally for all monitors"
}

variable "notifiers" {
  type        = list(string)
  default     = []
  description = "The notifiers to which the alerts get send, globally for all monitors"
}

variable "notify_no_data" {
  type        = bool
  default     = true
  description = "Whether this monitor will notify when data stops reporting, globally for all monitors"
}

variable "priority" {
  type        = number
  default     = null
  description = "Integer from 1 (high) to 5 (low) indicating alert severity, globally for all monitors"
}

variable "renotify_interval" {
  type        = number
  default     = null
  description = "The number of minutes before a monitor will re-notify on the current status, globally for all monitors"
}

variable "require_full_window" {
  type        = bool
  default     = true
  description = "A boolean indicating whether the monitor needs a full window of data before it's evaluated, globally for all monitors"
}

variable "tag_list" {
  type        = list(string)
  default     = []
  description = "A list of tags to assign to all the monitors"
}

variable "tag_map" {
  type        = map(string)
  default     = {}
  description = "A map of tags to assign to all the monitors"
}

variable "timeout" {
  type        = number
  default     = null
  description = "The timeout in hours before a monitor resolves automatically after not receiving data, globally for all monitors"
}
