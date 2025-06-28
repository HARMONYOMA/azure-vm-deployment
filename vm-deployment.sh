#!/bin/bash

# Azure VM Deployment Script with Optional Cleanup
# Author: Your Name
# Description: Automates VM deployment on Azure using Azure CLI and provides an option to clean up resources.

# Variables (You can customize these)
RESOURCE_GROUP="myharmzyRG"
LOCATION="eastus"
VM_NAME="myVM"
IMAGE="Ubuntu2204"
ADMIN_USERNAME="azureuser"
PORT=80

# Login to Azure
echo "Logging in to Azure..."
az login

# Create Resource Group
echo "Creating Resource Group: $RESOURCE_GROUP..."
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create Virtual Machine
echo "Creating Virtual Machine: $VM_NAME..."
az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $VM_NAME \
  --image $IMAGE \
  --admin-username $ADMIN_USERNAME \
  --generate-ssh-keys

# Open Port for Web Traffic
echo "Opening Port $PORT for web traffic..."
az vm open-port --port $PORT --resource-group $RESOURCE_GROUP --name $VM_NAME

# Fetch Public IP Address
echo "Fetching Public IP Address..."
PUBLIC_IP=$(az vm show --name $VM_NAME --resource-group $RESOURCE_GROUP -d --query publicIps -o tsv)

echo "✅ Deployment Complete!"
echo "You can SSH into your VM using: ssh $ADMIN_USERNAME@$PUBLIC_IP"
echo "VM Public IP: $PUBLIC_IP"

# Optional Cleanup
read -p "Do you want to delete the resource group to save cost? (y/n): " DELETE_CONFIRM

if [[ $DELETE_CONFIRM == "y" || $DELETE_CONFIRM == "Y" ]]; then
  echo "Deleting resource group: $RESOURCE_GROUP..."
  az group delete --name $RESOURCE_GROUP --yes --no-wait
  echo "Resource group deletion started."
else
  echo "Resource group retained. Remember to delete it later to avoid extra charges."
fi
