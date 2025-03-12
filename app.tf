/*resource "kubectl_manifest" "namespace" {
  yaml_body = file("${path.module}/namespace.yaml")
}

resource "kubectl_manifest" "deployment" {
  yaml_body = file("${path.module}/deployment.yaml")
  depends_on = [kubectl_manifest.namespace]
}*/