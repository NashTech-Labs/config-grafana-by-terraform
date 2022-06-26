provider "grafana" {
  url  = "localhost:3000"
}

terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "1.11.0"
    }
  }
}

module "grafana_datasoures" {
  source                  = "./grafana_module"
  prometheus_data_sources = var.prometheus_data_sources
}
