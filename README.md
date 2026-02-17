# felipe-setup-script 

Automated post-installation and provisioning script for **Ubuntu 24.04**. 
Designed to streamline the setup of a professional SRE/DevOps workstation and the development environment for [prodpanel.com](https://prodpanel.com).


##  Stack & Tooling

The script automates the installation of the following tools:

* **Development:** Go SDK (Golang), VS Code, Postman, and DataGrip.
* **Cloud & Orchestration:** Docker Engine, MicroK8s (Local Kubernetes), and Istio Service Mesh.
* **Infrastructure & Networking:** Wireshark, htop, Filezilla, and KVM (Virtualization).
* **Utilities:** Draw.io (Infrastructure Diagrams).


##  Getting Started

### 1. Prerequisites
Ensure you are running **Ubuntu 24.04** and have `sudo` privileges.

### 2. Permissions
Before running the script, grant execution permissions:
```bash
chmod +x setup.sh

### 3. Execution
### Run the script and follow the prompts:
./setup.sh

## 4. Post-Installation
## After the script completes, restart your system or log out to apply the new group permissions for Docker, MicroK8s, and Wireshark.

