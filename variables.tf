variable "dashboard" {
  type        = string
  default     = null
  description = "The dashboard url shown in the alert message"
}

variable "evaluation_delay" {
  type        = number
  default     = 900
  description = "Time in seconds to delay evaluation. Ensures that the monitor has a full data period"
}

variable "include_tags" {
  type        = bool
  default     = true
  description = "Whether to insert the triggering tags into the monitoring title"
}

variable "monitors" {
  type = map(object({
    message   = string
    name      = string
    query     = string
    tresholds = map(string)
    type      = string

  }))
  default     = null
  description = "The set of monitor specific attributes per monitor"
}

variable "new_host_delay" {
  type        = number
  default     = null
  description = "Seconds after booting before starting the evaluation of monitor results"
}

variable "notifiers" {
  type        = string
  default     = null
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

