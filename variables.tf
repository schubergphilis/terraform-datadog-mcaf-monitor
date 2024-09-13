variable "dashboard" {
  type        = string
  default     = ""
  description = "The Datadog dashboard URL shown in the alert message"
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
    new_host_delay      = optional(number, null)
    no_data_timeframe   = optional(number, null)
    notify_audit        = optional(bool, null)
    notify_no_data      = optional(bool, null)
    priority            = optional(string, null)
    renotify_interval   = optional(number, null)
    require_full_window = optional(bool, null)
    tags                = optional(list(string), null)
    threshold_windows   = optional(map(string), null)
    thresholds          = optional(map(string), null)
    timeout_h           = optional(number, null)
  }))
  default     = null
  description = "The set of monitor specific attributes per monitor"
}

variable "notifiers" {
  type        = list(string)
  default     = []
  description = "The notifiers to which the alerts get send"
}

variable "tag_list" {
  type        = list(string)
  default     = []
  description = "A list of tags to assign to the monitor"
}

variable "tag_map" {
  type        = map(string)
  default     = {}
  description = "A map of tags to assign to the monitor"
}
