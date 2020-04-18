<img src="https://i.imgur.com/t8IkKoZl.png" width="200"/>

[![Maintained by Mineiros.io](https://img.shields.io/badge/maintained%20by-mineiros.io-00607c.svg)](https://www.mineiros.io/ref=repo_article-examples)
[![Terraform Version](https://img.shields.io/badge/terraform-~%3E%200.12.20-brightgreen.svg)](https://github.com/hashicorp/terraform/releases)
[![License](https://img.shields.io/badge/License-Apache%202.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)

# terraform-null-resource

A [Terraform](https://www.terraform.io) 0.12 module creating a bunch of
[`null_resource`](https://www.terraform.io/docs/providers/null/resource.html) resources to be used in examples.

- [Module Features](#module-features)
- [Getting Started](#getting-started)
- [Module Argument Reference](#module-argument-reference)
- [Module Attributes Reference](#module-attributes-reference)
- [About Mineiros](#about-mineiros)
- [Reporting Issues](#reporting-issues)
- [Contributing](#contributing)
- [License](#license)

## Module Features
This module creates a bunch of
[`null_resources`](https://www.terraform.io/docs/providers/null/index.html)
resources and should be mainly used for examples.

## Getting Started
Most basic usage creating a random named secure AWS bucket.

```hcl
module "example" {
  source  = "."

  string          = "Hello World!"
  list_of_strings = ["hello", "world", "!"]

  module_depends_on = [
    null_resource.dependency
  ]
}

resource "null_resource" "dependency" {}
```

## Module Argument Reference
See [variables.tf](variables.tf),
[examples/module_enabled](../../examples/module_enabled) and
[examples/module_depends_on](../../examples/module_depends_on)
for details and use-cases.

#### Module Configuration
- **`module_enabled`**: *(Optional `bool`)*
Specifies whether resources in the module will be created.
Default is `true`.

- **`module_depends_on`**: *(Optional `list(any)`)*
A list of dependencies. Any object can be assigned to this list to define a hidden
external dependency.

#### Top-level Arguments
- **`string`**: *(Optional `string`)*
A string.
Default is `""`.

- **`list_of_strings`**: *(Optional `list(string)`)*
A list of strings.
Default is `[]`

## Module Attributes Reference
in addition of all arguments above the following attributes are exported by the module:

- **`single`**: A single null resource object as returned by
  [`null_resource`](https://www.terraform.io/docs/providers/null/resource.html#attributes-reference)
- **`count`**: A list of null resource objects as returned by
  [`null_resource`](https://www.terraform.io/docs/providers/null/resource.html#attributes-reference)
- **`for_each`**: A map of null resource objects keyed by the value of the elements of the input list
  [`null_resource`](https://www.terraform.io/docs/providers/null/resource.html#attributes-reference)

## About Mineiros
Mineiros is a [DevOps as a Service](https://mineiros.io/) Company based in Berlin, Germany.
We offer Commercial Support for all of our projects, just send us an email to [hello@mineiros.io](mailto:hello@mineiros.io).

We can also help you with:
- Terraform Modules for all types of infrastructure such as VPC's, Docker clusters,
databases, logging and monitoring, CI, etc.
- Complex Cloud- and Multi Cloud environments.
- Consulting & Training on AWS, Terraform and DevOps.

## Reporting Issues
We use GitHub [Issues](https://github.com/mineiros-io/article-examples/issues) to track community reported issues and missing features.

## Contributing
Contributions are very welcome!
We use [Pull Requests](https://github.com/mineiros-io/article-examples/pulls)
for accepting changes.
Please see our
[Contribution Guidelines](https://github.com/mineiros-io/article-examples/blob/master/CONTRIBUTING.md)
for full details.

## License
This module is licensed under the Apache License Version 2.0, January 2004.
Please see [LICENSE](https://github.com/mineiros-io/article-examples/blob/master/LICENSE) for full details.

Copyright &copy; 2020 Mineiros
