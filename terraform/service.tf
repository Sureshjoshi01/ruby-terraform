# Service to expose the appliation on port 80 
resource "kubernetes_service" "http-server" {
  metadata {
    name      = "http-server"
    namespace = kubernetes_namespace.appspace.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.http-server.spec.0.template.0.metadata.0.labels.app
    }
    type = "NodePort"
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }
  }
}