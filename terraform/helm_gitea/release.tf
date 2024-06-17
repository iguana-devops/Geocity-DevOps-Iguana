resource "helm_release" "gitea" {
  name      = "${var.env}-${var.region}-${var.app}-release"
  namespace = kubernetes_namespace.gitea.metadata[0].name

  repository = var.helm_repo
  chart      = var.helm_chart
}
