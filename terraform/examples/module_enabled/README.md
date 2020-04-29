<img src="https://i.imgur.com/t8IkKoZl.png" width="200"/>

[![Maintained by Mineiros.io](https://img.shields.io/badge/maintained%20by-mineiros.io-00607c.svg)](https://www.mineiros.io/ref=repo_article-examples)
[![Terraform Version](https://img.shields.io/badge/terraform-~%3E%200.12.20-brightgreen.svg)](https://github.com/hashicorp/terraform/releases)
[![License](https://img.shields.io/badge/License-Apache%202.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)

# How to dynamically disable modules

This example shows how to dynamically disable modules using
the `module_enabled` toggle.

How to implement this toggle is discussed in more detail in our article
[The Ultimate Guide on How to Write Terraform Modules — Part 1 — Building a Foundation](https://medium.com/mineiros/the-ultimate-guide-on-how-to-write-terraform-modules-part-1-81f86d31f024)
and implementation details can be seen in the code of the
module this example uses: [terraform-null-resource](../../modules/terraform-null-resource).

## What this example does
The code in [main.tf](main.tf) defines two modules where one module will not create
any resources due to setting `module_enabled = false`.

```
module "hello-world" {
  ....
}

module "the-cake-is-a-lie" {
  ....

  module_enabled = false
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
cd article-examples/terraform/examples/module_enabled
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
You can see that only resources inside module `module.hello-world.*` will
be created and no resource of the disabled module:
```
module.hello-world.null_resource.count[1]: Creating...
module.hello-world.null_resource.single[0]: Creating...
module.hello-world.null_resource.for_each["world!"]: Creating...
module.hello-world.null_resource.for_each["hello"]: Creating...
module.hello-world.null_resource.single[0]: Creation complete after 0s [id=30127531696241687]
module.hello-world.null_resource.count[0]: Creating...
module.hello-world.null_resource.count[1]: Creation complete after 0s [id=8363602364283639683]
module.hello-world.null_resource.for_each["hello"]: Creation complete after 0s [id=3274290552939669927]
module.hello-world.null_resource.for_each["world!"]: Creation complete after 0s [id=57837020342794834]
module.hello-world.null_resource.count[0]: Creation complete after 0s [id=7157558843500998853]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.
```
