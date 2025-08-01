# ⚙️ Deploy in Local Environment

This project uses Terraform and accepts variable values via an `*.auto.tfvars` file, which Terraform automatically loads. These instructions assume you're working locally after cloning the repository from GitHub.

## 📝 Prerequisites

- [Terraform installed](https://developer.hashicorp.com/terraform/downloads) (compatible version specified in `required_version` in `versions.tf`)
- Git
- Any provider CLI/authentication prerequisites (e.g., cloud CLI logged in if required by the provider)

### Terraform

| Name | Version |
| --- | --- |
| terraform | \>= 1.3.3 |

### Providers

| Name | Version |
| --- | --- |
| kreuzwerker/docker | ~> 3.6.2 |

### Modules

| Name | Source | Version |
| --- | --- | --- |
| container | git::[https://github.com/ajcborges/terraform-modules.git//container](https://github.com/ajcborges/terraform-modules.git//container) | container/2.0.0 |

---------

## 🚀 Quickstart

### 1. Clone the repository

```sh
git clone https://github.com/ajcborges/terraform-docker-foundations-2.0.git
cd terraform-docker-foundations-2.0
```

Here is the **Folder Structure**:

```shell
.
├── 📂 codeserver                   # root folder
│   ├── 📄 README.md                # Readme file
│   ├── 📄 main.tf                  # main tf file
│   ├── 📄 container.auto.tfvars    # auto variables tf file
│   ├── 📄 outputs.tf               # outputs tf file
│   ├── 📄 variables.tf             # variables tf file
│   └── 📄 version.tf               # version tf file
└── 📂 docs                         # Documentation 
```

### 2. Create a `container.auto.tfvars` file

Terraform automatically loads any file ending in .auto.tfvars or named terraform.tfvars. Example: container.auto.tfvars

```hcl
# container.auto.tfvars
docker_host                 = "ssh://youruser@yourhost:22"
codeserver_password         = "PleaseChangeMe"
codeserver_sudo_password    = "PleaaseChangeMe"
```

> ⓘ **Tip:** Do not commit secrets. For sensitive values, prefer passing via environment variables or a separate non-committed `*.tfvars` and load it explicitly.

### 3. Secure your variable files

Add to `.gitignore` so you don't accidentally commit local overrides or secrets:

```hcl
# variable overrides and secrets
*.auto.tfvars
*.tfvars
```

### 4. Initialize Terraform

```sh
terraform init
```

### 5. (Optional) Validate and Preview

```sh
terraform validate
terraform plan -out=tfplan
```

The plan step will automatically include values from any `*.auto.tfvars` file in the current directory.

### 6. Apply

```sh
terraform apply "tfplan"
```
