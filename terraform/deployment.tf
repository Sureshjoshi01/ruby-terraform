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

          env {
            name = "Podip"
            value_from{
              field_ref {
                field_path = "status.podIP"
              } 
            }
          }
        # using  liveness command healthcheck as httpget was failing with conention refused 
          liveness_probe {
            exec {
              command = ["sh" , "-c", "curl -i  $Podip/healthcheck"]
              
            }

          initial_delay_seconds = 5
            period_seconds        = 5
          }
          # using  liveness command healthcheck as httpget was failing with conention refused 
          readiness_probe {
            exec {
              command = ["sh" , "-c", "curl -i  $Podip/healthcheck"]
              
            }
            initial_delay_seconds = 5
            period_seconds        = 5
          }
        }
      }
    }
  }
}