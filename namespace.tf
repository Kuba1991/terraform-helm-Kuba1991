resource "kubernetes_namespace" "example" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_resource_quota" "podlimit" {
  metadata {
    name = "podlimit"
    namespace = var.namespace
  }
  spec {
    hard = {
      pods = var.podlimit
    }
    scopes = ["BestEffort"]
  }
}



resource "kubernetes_limit_range_v1" "nginx-app-limit" {
  metadata {
    name = "nginx-app-limit"
    namespace = var.namespace
  }
  spec {
    limit {
      type = "Pod"
      max = {
        cpu    = var.cpu_max
        memory = var.mem_max
      }
    }
    limit {
      type = "PersistentVolumeClaim"
      min = {
        storage = "24M"
      }
    }
    limit {
      type = "Container"
      default = {
        cpu    = "50m"
        memory = "24Mi"
      }
    }
  }
}