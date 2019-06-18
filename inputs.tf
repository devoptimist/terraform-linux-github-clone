variable "git_repo_url" {
  type    = "string"
  default = ""
}

variable "git_key" {
  type    = "string"
  default = ""
}

variable "workstation_count" {
  default = 1
}

variable "workstation_ips" {
  default = []
}

variable "ssh_password" {
  type    = "string"
}

variable "ssh_user" {
  type    = "string"
}
