terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

# ==========================================
# 📝 TASK SERVICE INFRASTRUCTURE
# ==========================================
resource "kubernetes_deployment_v1" "task_service" {
  metadata {
    name = "task-service-deployment"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "task-service"
      }
    }
    template {
      metadata {
        labels = {
          app = "task-service"
        }
      }
      spec {
        container {
          image             = "task-service:v2" # <-- FIXED: Now uses v2
          name              = "task-service"
          image_pull_policy = "IfNotPresent" # Forces K8s to use your local build!
          
          port {
            container_port = 3002 # We will verify this port below
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "task_service" {
  metadata {
    name = "task-service"
  }
  spec {
    selector = {
      app = "task-service"
    }
    port {
      port        = 80
      target_port = 3002
      node_port   = 30001
    }
    type = "NodePort"
  }
}

# ==========================================
# 👤 USER SERVICE INFRASTRUCTURE
# ==========================================
resource "kubernetes_deployment_v1" "user_service" {
  metadata {
    name = "user-service-deployment"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "user-service"
      }
    }
    template {
      metadata {
        labels = {
          app = "user-service"
        }
      }
      spec {
        container {
          image             = "user-service:latest"
          name              = "user-service"
          image_pull_policy = "IfNotPresent"
          
          port {
            container_port = 3001
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "user_service" {
  metadata {
    name = "user-service"
  }
  spec {
    selector = {
      app = "user-service"
    }
    port {
      port        = 80
      target_port = 3001
      node_port   = 30002
    }
    type = "NodePort"
  }
}

# ==========================================
# 🌐 FRONTEND SERVICE INFRASTRUCTURE
# ==========================================
resource "kubernetes_deployment_v1" "frontend_service" {
  metadata {
    name = "frontend-service-deployment"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "frontend-service"
      }
    }
    template {
      metadata {
        labels = {
          app = "frontend-service"
        }
      }
      spec {
        container {
          image             = "frontend-service:v3" # <-- FIXED: Changed back to latest
          name              = "frontend-service"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "frontend_service" {
  metadata {
    name = "frontend-service"
  }
  spec {
    selector = {
      app = "frontend-service"
    }
    port {
      port        = 80
      target_port = 80
      node_port   = 30000
    }
    type = "NodePort"
  }
}