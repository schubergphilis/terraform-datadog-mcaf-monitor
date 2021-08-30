terraform {
  required_providers {
    datadog = {
      source  = "datadog/datadog"
      version = ">= 3.3.0"
    }
  }
  required_version = ">= 0.13"
}
