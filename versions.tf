terraform {
  required_providers {
    datadog = {
      source  = "datadog/datadog"
      version = ">= 2.20.0"
    }
  }
  required_version = ">= 0.13"
}
