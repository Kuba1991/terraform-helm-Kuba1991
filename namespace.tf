resource "kubernetes_namespace" "example" {
  metadata {
    name = "nginx"
  }
}


resource "kubernetes_resource_quota" "podlimit" {
  metadata {
    name = "podlimit"
    namespace = "nginx"
  }
  spec {
    hard = {
      pods = 10
    }
    scopes = ["BestEffort"]
  }
}




resource "kubernetes_limit_range_v1" "nginx-limit" {
  metadata {
    name = "nginx-limit"
    namespace = "nginx"
  }
  spec {
    limit {
      type = "Pod"
      max = {
        cpu    = "200m"
        memory = "1024Mi"
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