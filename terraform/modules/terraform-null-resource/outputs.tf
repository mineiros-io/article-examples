# ------------------------------------------------------------------------------
# output module configuration
# ------------------------------------------------------------------------------
output "module_enabled" {
  description = "Whether the module is enabled"
  value       = var.module_enabled
}

# ------------------------------------------------------------------------------
# output all input variables as-is
# ------------------------------------------------------------------------------
output "string" {
  description = "The input string"
  value       = var.string
}

output "list_of_strings" {
  description = "The input list_of_strings"
  value       = var.list_of_strings
}

# ------------------------------------------------------------------------------
# output all resources as full objects
# ------------------------------------------------------------------------------
output "single" {
  description = "The single resource object"
  value       = try(null_resource.single[0], {})
}

output "count" {
  description = "A list of count resource objects"
  value       = null_resource.count
}

output "for_each" {
  description = "A map of for_each resource objects"
  value       = null_resource.for_each
}
