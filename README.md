# 🚀 Azure Virtual Machine Deployment with Bash Automation

## Project Overview
This project demonstrates how to create and deploy a Virtual Machine (VM) on Microsoft Azure using Azure CLI. I also automated the entire process using a Bash script to make the deployment faster and more efficient.

The script:
- Logs into Azure
- Creates a Resource Group
- Deploys a Virtual Machine
- Opens port 80 to allow web traffic
- Retrieves the public IP address of the VM
- Provides an option to automatically clean up resources to avoid extra costs

## Table of Contents
- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Folder Structure](#folder-structure)
- [How to Use the Bash Script](#how-to-use-the-bash-script)
- [Manual Deployment Steps](#manual-deployment-steps)
- [Learnings](#learnings)
- [Resources](#resources)
- [Deployment Success Screenshot](#deployment-success-screenshot)

## Technologies Used
- Azure CLI
- Ubuntu 22.04 LTS Virtual Machine
- Bash scripting

## Prerequisites
- Azure CLI installed on your machine
- An active Azure subscription
- Basic terminal/command line knowledge
- SSH key setup (Azure CLI can auto-generate this)

## Folder Structure
```bash
azure-vm-deployment/
├── image       # Screenshot of successful deployment
├── README.md              # Project documentation
└── vm-deployment.sh       # Bash automation script
