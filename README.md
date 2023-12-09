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

[![nix][nix-shield]][nix-url]
[![pre-commit][pre-commit-shield]][pre-commit-url]
[![taskfile][taskfile-shield]][taskfile-url]
[![terraform][terraform-shield]][terraform-url]

# Terraform Google Cloud infra for techtales

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
- [SOPS Encryption / Decryption](#sops-encryption--decryption)
- [ENV](#env)
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

- [pre-commit][pre-commit-url]
- [terraform][terraform-url]
- [terraform-docs][terraform-docs]
- [tflint][tflint]
- [tfsec][tfsec]

### Initialize repository

Terraform and pre-commit framework need to get initialized.

```console
pre-commit install
terraform init
```

### Authentication

Run `gcloud auth application-default login` to authenticate with GCP.

## SOPS Encryption / Decryption

Encryption with SOPS and age is in place.

## ENV

Provide the content of `secrets.sops.yaml` as `.envrc`, f.e. with direnv.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[terraform-best-practices]: https://www.terraform-best-practices.com/naming
[terraform-docs]: https://github.com/terraform-docs/terraform-docs
[tflint]: https://github.com/terraform-linters/tflint
[tfsec]: https://aquasecurity.github.io/tfsec

<!-- Badges -->

[terraform-shield]: https://img.shields.io/badge/terraform-1.x-844fba?logo=terraform
[terraform-url]: https://www.terraform.io/
[pre-commit-shield]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit
[pre-commit-url]: https://github.com/pre-commit/pre-commit
[taskfile-shield]: https://img.shields.io/badge/taskfile-enabled-brightgreen?logo=task
[taskfile-url]: https://taskfile.dev/
[nix-shield]: https://img.shields.io/badge/nix-enabled-brightgreen?logo=nixos
[nix-url]: https://search.nixos.org/packages

## Terraform docs

<!-- prettier-ignore-start -->
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0, <= 1.6.5 |
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
| <a name="input_location"></a> [location](#input\_location) | preferred region for gcloud resources | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | gcloud project id | `string` | n/a | yes |
| <a name="input_project_number"></a> [project\_number](#input\_project\_number) | gcloud project number | `string` | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | list of users eligible for gworkspace maintenance | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | preferred zone for gcloud resources | `string` | n/a | yes |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- prettier-ignore-end -->
