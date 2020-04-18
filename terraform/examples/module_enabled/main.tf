# ------------------------------------------------------------------------------
# The resources in this module will be created.
# ------------------------------------------------------------------------------
module "hello-world" {
  source = "../../modules/terraform-null-resource"

  string          = "Hello World!"
  list_of_strings = ["hello", "world!"]
}

# ------------------------------------------------------------------------------
# No resources in this module will be created
# ------------------------------------------------------------------------------
module "the-cake-is-a-lie" {
  source = "../../modules/terraform-null-resource"

  module_enabled = false

  string          = "Hello Portal!"
  list_of_strings = ["hello", "portal!"]
}
