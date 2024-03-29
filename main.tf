resource "helm_release" "app" {
  name       = var.app_name
  chart      = "${path.module}/nginx"
  namespace = var.namespace

  depends_on = [kubernetes_namespace.example]
  }
