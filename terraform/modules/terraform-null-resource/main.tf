# ------------------------------------------------------------------------------
# Create a single null resource.
# Condition: var.module_enabled is true and var.string is not empty
# ------------------------------------------------------------------------------
resource "null_resource" "single" {
  count = var.module_enabled && length(var.string) > 0 ? 1 : 0

  triggers = {
    value = jsonencode(var.string)
  }

  depends_on = [
    var.module_depends_on
  ]
}

# ------------------------------------------------------------------------------
# Create one null resource for every element in var.list_of_strings
# Condition: var.module_enabled is true and list is not empty (implicit)
# Output: A list of null_resource objects
# ------------------------------------------------------------------------------
resource "null_resource" "count" {
  count = var.module_enabled ? length(var.list_of_strings) : 0

  triggers = {
    value = var.list_of_strings[count.index]
  }

  depends_on = [
    var.module_depends_on
  ]
}

# ------------------------------------------------------------------------------
# Create one null resource for every element in var.list_of_strings
# Input: var.list_of_strings will be converted to a set(string) type
# Condition: var.module_enabled is true and the set is not empty (implicit)
# Output: A map of null_resource objects keyed by the elements value
# ------------------------------------------------------------------------------
resource "null_resource" "for_each" {
  for_each = var.module_enabled ? toset(var.list_of_strings) : []

  triggers = {
    value = each.value
  }

  depends_on = [
    var.module_depends_on
  ]
}
