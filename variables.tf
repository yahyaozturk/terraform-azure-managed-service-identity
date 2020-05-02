variable location {
  type    = string
  default = "northeurope"
}

variable "prefix" {
  default = "gitlab"
}

variable "environment" {
  default = "Gitlab"
}

variable "admin_username" {
  default = "yahyaozturk"
}

variable "admin_password" {
  default = ""
}

variable "gitlab_server" {
  default = "https://gitlab.com/"
}

variable "gitlab_token" {
  default = ""
}