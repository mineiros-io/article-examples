<img src="https://i.imgur.com/t8IkKoZl.png" width="200"/>

[![Maintained by Mineiros.io](https://img.shields.io/badge/maintained%20by-mineiros.io-00607c.svg)](https://www.mineiros.io/ref=repo_article-examples)
[![Terraform Version](https://img.shields.io/badge/terraform-~%3E%200.12.20-brightgreen.svg)](https://github.com/hashicorp/terraform/releases)
[![License](https://img.shields.io/badge/License-Apache%202.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)

# How to make a module depend on external hidden dependencies

This example shows how to make a module depend on external hidden dependencies
using the `module_depends_on` list of dependencies.

How to implement this is discussed in more detail in our article
[xxxxx]() and implementation details can be seen in the code of the
module this example uses: [terraform-null-resource](../../modules/terraform-null-resource).

## What this example does
The code in [main.tf](main.tf) defines two resources and two modules where
one module depends on one of the resources.

```
module "has-no-dependency" {
  ....
}

resource "null_resource" "is-no-dependency" {
  ....
}

module "has-external-dependency" {
  ....

  module_depends_on = [
    null_resource.is-external-dependency
  ]
}

resource "null_resource" "is-external-dependency" {
  ....
}
```

## Running the example
The example will only create `null` resources as provided by the
[null provider](https://www.terraform.io/docs/providers/null/index.html).
No infrastructure is created anywhere and no costs will be generated.
Running the example will use the
[local backend](https://www.terraform.io/docs/backends/types/local.html)
by default to store the terraform state.

### Cloning the repository
```
git clone https://github.com/mineiros-io/article-examples.git
cd article-examples/terraform/examples/module_depends_on
```

### Initializing Terraform
Run `terraform init` to initialize the example. The output should look like:
```
Initializing modules...
- has-external-dependency in ../../modules/terraform-null-resource
- has-no-dependency in ../../modules/terraform-null-resource

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "null" (hashicorp/null) 2.1.2...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

### Applying the example
Run `terraform apply -auto-approve` to create the resources.
You can see in the output how creation of
`module.has-external-dependency.*` resources is deferred after creation is completed for the
`null_resource.is-external-dependency` resource:
```
module.has-no-dependency.null_resource.single[0]: Creating...
null_resource.is-external-dependency: Creating...
null_resource.is-no-dependency: Creating...
null_resource.is-external-dependency: Creation complete after 0s [id=2158780084618493749]
null_resource.is-no-dependency: Creation complete after 0s [id=1313529758799204548]
module.has-no-dependency.null_resource.single[0]: Creation complete after 0s [id=933328012311274445]
module.has-external-dependency.null_resource.single[0]: Creating...
module.has-external-dependency.null_resource.single[0]: Creation complete after 0s [id=3613129016092343865]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
```

### Destroying the example
Run `terraform destroy -refresh=false -auto-approve` to destroy all resources again and see that
the resource `null_resource.is-external-dependency` is destroyed after the resources that depend on it:
```
null_resource.is-no-dependency: Destroying... [id=1313529758799204548]
module.has-external-dependency.null_resource.single[0]: Destroying... [id=3613129016092343865]
module.has-external-dependency.null_resource.single[0]: Destruction complete after 0s
module.has-no-dependency.null_resource.single[0]: Destroying... [id=933328012311274445]
module.has-no-dependency.null_resource.single[0]: Destruction complete after 0s
null_resource.is-no-dependency: Destruction complete after 0s
null_resource.is-external-dependency: Destroying... [id=2158780084618493749]
null_resource.is-external-dependency: Destruction complete after 0s

Destroy complete! Resources: 4 destroyed.
```
