resource "kubernetes_secret" "gitea" {
  metadata {
    name      = "regcred"
    namespace = kubernetes_namespace.gitea.metadata[0].name
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = (jsonencode({
      "auths" = {
        "registry.iguana-devops.pp.ua" = {
          "username" = var.username,
          "password" = var.password,
          "email"    = var.mail,
          "auth"     = ("${var.username}:${var.password}")
        }
      }
    }))
  }
}