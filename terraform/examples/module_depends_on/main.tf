# ------------------------------------------------------------------------------
# Case 1:
# Default module usage without hidden external dependencies
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Resources in this module will be created/destroyed as soon as possible
# ------------------------------------------------------------------------------
module "has-no-dependency" {
  source  = "../../modules/terraform-null-resource"

  string = "ASAP!"
}

# ------------------------------------------------------------------------------
# This resource will be created/destroyed as soon as possible
# ------------------------------------------------------------------------------
resource "null_resource" "is-no-dependency" {}

# ------------------------------------------------------------------------------
# Case 2:
# Make use of module_depends_on to define hidden external dependencies
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Apply: Resources in this module will be created after creation of the
# null_resource.is-external-dependency is completed.
#
# Destroy: Resources in this module will be destroyed before destructiong of the
# null_resource.is-external-dependency is started.
# ------------------------------------------------------------------------------
module "has-external-dependency" {
  source  = "../../modules/terraform-null-resource"

  string = "Let's wait!"

  module_depends_on = [
    null_resource.is-external-dependency
  ]
}

# ------------------------------------------------------------------------------
# Apply: This resource will be created before creation of the resources
# module.has-external-dependency.* is started
#
# Destroy: Destruction of this resource will be deffered after all
# module.has-external-dependency.* resources have been destroyed completely
# ------------------------------------------------------------------------------
resource "null_resource" "is-external-dependency" {}
