# 🚀 Azure Virtual Machine Deployment with Bash Automation

## Project Overview
This project demonstrates how to create and deploy a Virtual Machine (VM) on Microsoft Azure using Azure CLI.  
I also automated the entire process using a Bash script to make the deployment faster and more efficient.

The script:
- Logs into Azure
- Creates a Resource Group
- Deploys a Virtual Machine
- Opens port 80 to allow web traffic
- Retrieves the public IP address of the VM
- Provides an option to automatically clean up resources to avoid extra costs

---

## Table of Contents
- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Folder Structure](#folder-structure)
- [How to Use the Bash Script](#how-to-use-the-bash-script)
- [Manual Deployment Steps](#manual-deployment-steps)
- [Learnings](#learnings)
- [Resources](#resources)
- [image](#image)

---

## Technologies Used
- Azure CLI
- Ubuntu 22.04 LTS Virtual Machine
- Bash scripting

---

## Prerequisites
- Azure CLI installed on your machine
- An active Azure subscription
- Basic terminal/command line knowledge
- SSH key setup (Azure CLI can auto-generate this)

---

## Folder Structure
```bash
azure-vm-deployment/
├── image/                 # Screenshot of successful deployment
├── README.md              #Project documentation
└── vm-deployment.sh       #Bash automation script
```

---

## Manual-deployment-steps
If you want to manually deploy the VM instead of using the Bash script, follow these steps:
### 1. Log into Azure using:
```bash
az login

### 2. Create a Virtual Machine using Azure CLI.
```bash
az vm create \
  --resource-group <your-resource-group> \
  --name <your-vm-name> \
  --image Ubuntu2204 \
  --admin-username azureuser \
  --generate-ssh-keys

### 3. Open port 80 to allow web traffic:
```bash
az vm open-port --port 80 --resource-group <your-resource-group> --name <your-vm-name>

### 4. Retrieve the public IP address of the VM:
```bash
az vm list-ip-addresses --name <your-vm-name> --resource-group <your-resource-group>

### 5. Connect to the VM via SSH:
```bash
ssh azureuser@<your-public-ip>
```
---

## How to Use the Bash Script
### 1. Make the Script Executable
In your terminal, navigate to the project folder and run:
```bash
chmod +x vm-deployment.sh

### 2. Execute the script with
```bash
./vm-deployment.sh

### 3. After the script finishes, it will display the SSH command.
Use it to connect to your VM:
```bash
 azureuser@<your-public-ip>
```
---

## Learnings
- How to deploy and manage Azure cloud resources using CLI.
- How to automate virtual machine deployment with Bash.
- How to securely connect to virtual machines using SSH.
- The importance of cleaning up resources to prevent unnecessary cloud costs.

---

## Resources
- [Azure CLI Documentation](https://learn.microsoft.com/en-us/cli/azure/)
- [Azure VM Quickstart Guide](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-cli)
- [Blog Post](https://cloudsteps.hashnode.dev/deploy-a-virtual-machine-on-azure-using-azure-cli#heading-step-1-prepare-azure-cli)
---

## Image
- Screenshot of successful deployment