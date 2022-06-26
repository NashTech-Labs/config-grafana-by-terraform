resource "grafana_data_source" "prometheus" {
  for_each = local.prometheus_data_sources_local
  type     = "prometheus"
  name     = each.key
  url      = each.value.url

  json_data {
    http_method = "POST"
  }
}


locals {
  prometheus_data_sources_local = {
    for ds in var.prometheus_data_sources :
    ds.source_name => {
      url = ds.url
    }
    if ds.type == "prometheus"
  }
}
