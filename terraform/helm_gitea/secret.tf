resource "kubernetes_secret" "gitea" {
  metadata {
    name      = "regcred"
    namespace = kubernetes_namespace.gitea.metadata[0].name
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = (jsonencode({
      "auths" = {
        "${var.registry_domain}" = {
          "username" = var.username,
          "password" = var.password,
          "email"    = var.mail,
          "auth"     = base64encode("${var.username}:${var.password}")
        }
      }
    }))
  }
}
