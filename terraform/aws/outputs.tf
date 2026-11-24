output "namespace" {
  value = kubernetes_namespace.scenario2.metadata[0].name
}

output "deployment_name" {
  value = kubernetes_deployment.nginx.metadata[0].name
}

output "service_name" {
  value = kubernetes_service.nginx.metadata[0].name
}

output "node_port" {
  value = kubernetes_service.nginx.spec[0].port[0].node_port
}
