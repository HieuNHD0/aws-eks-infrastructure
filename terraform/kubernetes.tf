provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.this.token
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}

resource "kubernetes_namespace" "openwebui" {
  metadata {
    name = "openwebui"
  }
}

resource "kubernetes_secret" "webui_auth" {
  metadata {
    name      = "webui-auth"
    namespace = kubernetes_namespace.openwebui.metadata[0].name
  }

  type = "Opaque"

  data = {
    ADMIN_PASSWORD = base64encode(var.webui_admin_password)
  }
}

