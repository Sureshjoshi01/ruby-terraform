# Namespace for app deployment
resource "kubernetes_namespace" "appspace" {
  metadata {
    name = "appspace"
  }
}
