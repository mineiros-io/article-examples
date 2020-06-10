# ------------------------------------------------------------------------------
# module configuration variables
# ------------------------------------------------------------------------------
variable "module_enabled" {
  type        = bool
  description = "(optional) Whether to create resources within the module or not. Default is true."
  default     = true
}

variable "module_depends_on" {
  type        = any
  description = "(optional) A list of external resources the module depends_on. Default is []."
  default     = []
}

# ------------------------------------------------------------------------------
# module input variables
# ------------------------------------------------------------------------------
variable "string" {
  type        = string
  description = "(Optional) A string to create a single resource. Default is \"\"."
  default     = ""
}

variable "list_of_strings" {
  type        = list(string)
  description = "(Optional) A list of strings to create multiple resources. Default is []."
  default     = []
}
