variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "webui_admin_password" {
  type      = string
  sensitive = true
}
