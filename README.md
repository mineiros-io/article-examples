[<img src="https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg" width="400"/>](https://mineiros.io/?ref=article-examples)

[![license](https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Terraform Version](https://img.shields.io/badge/terraform-~%3E%200.12.20-623CE4.svg)](https://github.com/hashicorp/terraform/releases)
[<img src="https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack">](https://join.slack.com/t/mineiros-community/shared_invite/zt-ehidestg-aLGoIENLVs6tvwJ11w9WGg)

# Mineiros Article Examples

A generic repository for examples and references used in our published articles.

- [List of Articles referencing this repository](#list-of-articles-referencing-this-repository)
- [Table of Examples](#table-of-examples)
  - [Terraform examples](#terraform-examples)
  - [Terraform modules](#terraform-modules)
- [About Mineiros](#about-mineiros)
- [Reporting Issues](#reporting-issues)
- [Contributing](#contributing)
- [Makefile Targets](#makefile-targets)
- [License](#license)

## List of Articles referencing this repository

- April 2020: [The Ultimate Guide on How to Write Terraform Modules — Part 1 — Building a Foundation](https://medium.com/mineiros/the-ultimate-guide-on-how-to-write-terraform-modules-part-1-81f86d31f024).

## Table of Examples

### Terraform examples

- [`terraform/examples/module_depends_on`](terraform/examples/module_depends_on) -
  example use case of the `module_depends_on` feature
- [`terraform/examples/module_enabled`](terraform/examples/module_enabled) -
  example use case of the `module_enabled` feature

### Terraform modules

- [`terraform/modules/terraform-null-resource`](terraform/modules/terraform-null-resource) -
  example implementation of a module implementing the features `module_depends_on`
  and `module_enabled`.

## About Mineiros

Mineiros is a [DevOps as a Service](https://mineiros.io/?ref=article-examples) company based in Berlin, Germany. We offer commercial support
for all of our projects and encourage you to reach out if you have any questions or need help.
Feel free to send us an email at [hello@mineiros.io](mailto:hello@mineiros.io).

We can also help you with:

- Terraform modules for all types of infrastructure such as VPCs, Docker clusters, databases, logging and monitoring, CI, etc.
- Consulting & training on AWS, Terraform and DevOps

## Reporting Issues

We use GitHub [Issues](https://github.com/mineiros-io/article-examples/issues)
to track community reported issues and missing features.

## Contributing

Contributions are always encouraged and welcome! For the process of accepting changes, we use
[Pull Requests](https://github.com/mineiros-io/article-examples/pulls). If you'd like more information, please
see our [Contribution Guidelines](https://github.com/mineiros-io/article-examples/blob/master/CONTRIBUTING.md).

## Makefile Targets

This repository comes with a handy
[Makefile](https://github.com/mineiros-io/article-examples/blob/master/Makefile).
Run `make help` to see details on each available target.

## License

This module is licensed under the Apache License Version 2.0, January 2004.
Please see [LICENSE](https://github.com/mineiros-io/article-examples/blob/master/LICENSE) for full details.

Copyright &copy; 2020 Mineiros GmbH

