variable "tags" {
  default = {}
  type    = map(string)
}

variable "length" {
  type = number

}

variable "special" {
  type    = bool
  default = false
}

variable "min_special" {
  type    = number
  default = 0

}

variable "override_special" {
  type    = string
  default = ""

}

variable "pass_version" {
  type    = number
  default = 1
}

variable "description" {
  type    = string
  default = ""
}

variable "name_prefix" {
  type        = string
  default     = "terraform"
  description = "Name Prefix (not used if name specified)"
}

variable "name" {
  type        = string
  default     = ""
  description = "Name (omit to use name_prefix)"
}

