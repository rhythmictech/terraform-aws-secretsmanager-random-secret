
variable "namespace" {
  type = string
}

variable "env" {
  type = string
}

variable "owner" {
  type = string
}

variable "additional_tags" {
  default = {}
  type    = map(string)
}

variable "length" {
    type = number
  
}

variable "special" {
  type = bool
  default = false
}

variable "min_special" {
    type = number
    default = 0
  
}

variable "override_special" {
    type = string
    default = ""
  
}

variable "pass_version" {
  type = number
  default = 1
}

variable "description" {
  type = string
  default = ""
}

variable "name_prefix" {
  type = string
  default = "terraform"
}

