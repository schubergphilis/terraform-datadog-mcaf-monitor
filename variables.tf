variable "include_tags" {
  type        = bool
  default     = true
  description = "Indicates whether notifications from this monitor automatically insert its triggering tags into the monitoring title"
}
variable "message" {
  type        = string
  description = "Message to be send in case of alert"
}

variable "name" {
  type        = string
  description = "Name of the Datadog monitor"
}

variable "new_host_delay" {
  type        = number
  default     = 300
  description = "Seconds to allow a host to boot and applications to fully start before starting the evaluation of monitor results"
}

variable "notify_no_data" {
  type        = bool
  default     = true
  description = "Indicator whether to alarm if data is missing"
}

variable "no_data_timeframe" {
  type        = number
  default     = 20
  description = "The number of minutes before a monitor will notify when data stops reporting"
}

variable "query" {
  type        = string
  description = "The query used by the monitor"
}

variable "renotify_interval" {
  type        = number
  default     = 0
  description = "The number of minutes after the last notification before a monitor will re-notify on the current status, 0 means never"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the role"
}

variable "timeout_h" {
  type        = number
  default     = 0
  description = "The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state, 0 means never"
}

variable "thresholds" {
  type        = map(string)
  description = "A mapping of thresholds for the monitor"
}

variable "type" {
  type        = string
  default     = "query alert"
  description = "type of the Datadog monitor"
}


