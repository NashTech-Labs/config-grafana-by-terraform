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