module "helm-nginx" {
  source = "../"

  app_name = "nginx"
  namespace = "nginx"

  cpu_max = "300m"
  mem_max = "1024Mi"
}
