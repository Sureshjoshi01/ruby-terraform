# App deployment spec with liveliness and readiness probes 
resource "kubernetes_deployment" "http-server" {
  metadata {
    name = "http-server"
    namespace = kubernetes_namespace.appspace.metadata.0.name
    labels = {
      app = "http-server"
    }
  }

  spec {
    replicas = 1
    
    strategy { 
      type = "RollingUpdate"
      rolling_update {
      max_surge = 1
      max_unavailable = 1
      } 
    }

    selector {
      match_labels = {
        app = "http-server"
      }
    }

    template {
      metadata {
        labels = {
          app = "http-server"
        }
      }

      spec {
        container {
          image = "sureshjoshi01/http_server:latest"
          name  = "http-server"
          port {
            container_port = 80
          }
         /* liveness_probe {
            http_get {
              path = "/healthcheck"
              port = 80
            }

          initial_delay_seconds = 5
            period_seconds        = 5
          }
          readiness_probe {
            http_get {
              path = "/healthcheck"
              port = 80
            }
 
            initial_delay_seconds = 2
            period_seconds        = 5
          }*/
        }
      }
    }
  }
}