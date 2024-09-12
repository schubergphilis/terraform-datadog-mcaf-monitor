terraform {
  required_version = ">= 1.2.0"

  required_providers {
    datadog = {
      source  = "datadog/datadog"
      version = ">= 3.3.0"
    }
  }
}
