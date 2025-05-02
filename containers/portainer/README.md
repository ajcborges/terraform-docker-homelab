# 🚀 Portainer Deployment with Terraform


[![Terraform](https://img.shields.io/badge/Terraform-v1.3%2B-623CE4?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Docker](https://img.shields.io/badge/Docker-%23121011.svg?style=flat&logo=docker&logoColor=white)](https://www.docker.com/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](./LICENSE)

This project sets up [Portainer](https://www.portainer.io/) using **Terraform**. It includes a helper script to manage backend config, init, and common Terraform commands.

---

## 🖼️ Architecture Overview

```plaintext
   ┌─────────────┐
   │ tfinit.sh   │
   └─────┬───────┘
         │
         ▼
 ┌──────────────┐
 │ backend file │◄──────────────────────────┐
 └────┬─────────┘                           │
      ▼                                     │
┌──────────────┐     ┌────────────────┐     │
│ terraform    │ ◄──►│ portainer.tf   │     │
│ init/plan/...│     │ variables.tf   │     │
└────┬─────────┘     │ tfvars file    │─────┘
     ▼               └────────────────┘
 ┌──────────────┐
 │  Docker Host │◄── SSH (if remote)
 └──────────────┘
```

## 📁 Project Structure

```bash
.
├── portainer.tf         # Terraform resources to deploy Portainer
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── version.tf           # Required provider + Terraform version
├── portainer.tfvars     # Variable values for Portainer deployment
├── portainer.backend    # Generated backend config (auto-created)
├── tfinit.sh            # Bootstrap script for terraform init/plan/apply
```

## ⚙️ Prerequisites
- Terraform installed (v1.3+ recommended)
- Docker (running locally or remote Docker host)
- SSH access to the Docker host (if using remote provider)
- Executable permissions on the script:
``` bash
chmod +x tfinit.sh
```

## 🧠 How It Works
This setup:

- Uses the Docker provider via SSH (you can configure it in portainer.tf)
- Manages your backend state via a .backend file created by the script
- Uses .tfvars for variable overrides
- Provides an interactive menu to plan, apply, or destroy the infra

## 🚀 Usage

### Step 1: Run the Script

``` bash
./tfinit.sh portainer
```
This will:

- Generate portainer.backend
- Run terraform init with backend config
- Ask what action you wanna do (plan/apply/destroy)

### Step 2: Choose Your Action
Use the interactive menu to plan/apply/destroy your Portainer setup.

## 📦 Example Variables (portainer.tfvars)

``` hcl
container_name = "portainer"
image          = "portainer/portainer-ce"
ports = {
  "8000" = "8000"
  "9443" = "9443"
}
```

## ✅ Outputs

Once applied, you’ll see outputs like:

- container_id
- port_mappings

Defined in outputs.tf.

## 🧹 Cleanup
To destroy the stack:

```
./tfinit.sh portainer
# Choose: destroy
```

## 💡 Tips
- You can replicate this setup for other containers by copying the tfvars/backend logic
- Make sure your Docker daemon is accessible over SSH if you're not running local
- This is a great base for CI/CD pipelines or scaling up using Ansible/Terraform combo

## 🧑‍💻 Author
Built with ❤️ by a fellow DevOps 🤘
Feel free to fork, adapt, and improve!