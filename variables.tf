variable "dashboard" {
  type        = string
  default     = ""
  description = "The Datadog dashboard URL shown in the alert message"
}

variable "evaluation_delay" {
  type        = number
  default     = null
  description = "Seconds to delay evaluation to ensure the monitor has a full data period"
}

variable "include_tags" {
  type        = bool
  default     = true
  description = "Whether to insert the triggering tags into the monitoring title"
}

variable "monitors" {
  type = map(object({
    name       = string
    message    = string
    query      = string
    thresholds = map(string)
    type       = string
  }))
  default     = null
  description = "The set of monitor specific attributes per monitor"
}

variable "new_group_delay" {
  type        = number
  default     = null
  description = "Seconds after booting before starting the evaluation of monitor results"
}

variable "notifiers" {
  type        = list(string)
  default     = []
  description = "The notifiers to which the alerts get send"
}

variable "notify_no_data" {
  type        = bool
  default     = true
  description = "Whether this monitor will notify when data stops reporting"
}

variable "no_data_timeframe" {
  type        = number
  default     = null
  description = "The number of minutes before a monitor will notify when data stops reporting"
}

variable "renotify_interval" {
  type        = number
  default     = null
  description = "The number of minutes before a monitor will re-notify on the current status"
}

variable "require_full_window" {
  type        = bool
  default     = true
  description = "A boolean indicating whether the monitor needs a full window of data before it's evaluated"
}

variable "tag_list" {
  type        = list(string)
  default     = []
  description = "A list of tags to assign to the role"
}

variable "tag_map" {
  type        = map(string)
  default     = {}
  description = "A map of tags to assign to the role"
}

variable "timeout" {
  type        = number
  default     = null
  description = "Hours of not reporting data before automatically resolving from a triggered state"
}
