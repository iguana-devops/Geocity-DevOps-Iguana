resource "helm_release" "awx_release" {
  name       = "awx-operator"
  repository = "https://ansible.github.io/awx-operator/"
  chart      = "awx-operator"
  namespace  = kubernetes_namespace.awx.metadata[0].name
}
