# Add Prometheus Datasources in Grafana

## Prerequisite

1. Prometheus Deployed & endpoint URL of prometheus. Headless service name if on same cluster or URL if prometheus deployed on another server.
2. Grafana endpoint URL & Port number. (default is 3000)
3. Username & Password for admin access.

## Setup Authentication

1. export environment variable for authentication

```bash
export GRAFANA_AUTH="admin_username:admin_password"
```
2. Add Grafana URL & port in [main.tf](./main.tf) file 

```
provider "grafana" {
  url  = "http://your-grafana-url:port"
}
```

## Add Prometheus Datasources

### Step 1

1. Open [datasources.auto.tfvars](./datasources.auto.tfvars) file.
2. Add a map configs for your datasource

```hcl
  {
    source_name = "test-app"
    type        = "prometheus"
    url         = "http://prometheus-operated.test.svc.cluster.local:9090"
  }
```

### Step 2

1. Install provider plugins

```
terraform init
```

2. Check Terraform plan

```
terraform plan
```

3. Apply the terraform configurations

```
terraform apply
```