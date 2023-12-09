<!-- markdownlint-disable MD041 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD028 -->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Terraform][terraform-shield]][terraform-url]
[![pre-commit][pre-commit-shield]][pre-commit-url]
[![taskfile][taskfile-shield]][taskfile-url]

# Techtales GCloud Infra

<details>
  <summary style="font-size:1.2em;">Table of Contents</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Code-Style](#code-style)
  - [Best practices](#best-practices)
  - [Naming of Terraform resources](#naming-of-terraform-resources)
  - [Naming of Google resources](#naming-of-google-resources)
- [Getting started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Initialize repository](#initialize-repository)
  - [Authentication](#authentication)
- [Configuration](#configuration)
- [Contribution](#contribution)
- [Known Issues](#known-issues)
- [Terraform docs](#terraform-docs)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Modules](#modules)
  - [Resources](#resources)
  - [Inputs](#inputs)
  - [Outputs](#outputs)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>

## Code-Style

### Best practices

[terraform-best-practices.com][terraform-best-practices]

### Naming of Terraform resources

- lower-case characters
- underscores

Pattern: `[a-z_]+`

### Naming of Google resources

- lower-case characters
- hyphen

Pattern: `[a-z-]+`

## Getting started

### Prerequisites

- [terraform][terraform-url]
- [pre-commit][pre-commit]
- [terraform-docs][terraform-docs]
- [tflint][tflint]
- [tfsec][tfsec-url]
- [yamllint][yamllint]

### Initialize repository

Terraform and pre-commit framework need to get initialized.

```console
pre-commit install
terraform init
```

### Authentication

Run `gcloud auth application-default login` to authenticate with GCP.

## Configuration

<!-- TBD -->

## Contribution

<!-- TBD -->

## Known Issues

<!-- TBD -->

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[terraform-best-practices]: https://www.terraform-best-practices.com/naming
[pre-commit]: https://pre-commit.com/
[terraform-docs]: https://github.com/terraform-docs/terraform-docs
[tflint]: https://github.com/terraform-linters/tflint
[tfsec-url]: https://aquasecurity.github.io/tfsec
[yamllint]: https://github.com/adrienverge/yamllint

<!-- Badges -->

[terraform-url]: https://www.terraform.io/
[terraform-shield]: https://img.shields.io/badge/terraform-1.x-844fba?style=for-the-badge&logo=terraform
[pre-commit-url]: https://github.com/pre-commit/pre-commit
[pre-commit-shield]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&style=for-the-badge
[taskfile-url]: https://taskfile.dev/
[taskfile-shield]: https://img.shields.io/badge/taskfile-enabled-brightgreen?logo=task&style=for-the-badge

## Terraform docs

<!-- prettier-ignore-start -->
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0, <= 1.5.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.8.0 |

### Providers

No providers.

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_google"></a> [google](#module\_google) | ./google | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_project_number"></a> [project\_number](#input\_project\_number) | n/a | `string` | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | n/a | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | n/a | yes |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- prettier-ignore-end -->
