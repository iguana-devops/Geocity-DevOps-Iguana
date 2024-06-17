resource "kubernetes_namespace" "gitea" {
  metadata {
    name = "${var.env}-${var.region}-${var.app}"
  }
}