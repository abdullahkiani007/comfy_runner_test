#!/bin/bash
# 1. SSM into EC2
aws ssm start-session --target "$(aws ec2 describe-instances --filters "Name=tag:Name,Values=ComfyUIStack/Host" "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].[InstanceId]' --output text)" --region $AWS_DEFAULT_REGION

# 2. SSH into Container
container_id=$(sudo docker container ls --format '{{.ID}} {{.Image}}' | grep 'comfyui:latest$' | awk '{print $1}')
sudo docker exec -it $container_id /bin/bash


wget -c https://huggingface.co/lllyasviel/flux1_dev/blob/main/flux1-dev-fp8.safetensors -P ./models/flux/
wget -c https://huggingface.co/some-lora/model/lora-highresfix.safetensors -P ./models/lora/
wget -c https://huggingface.co/some-controlnet/model/controlnet-pose.safetensors -P ./models/controlnet/
wget --header="Authorization: Bearer ${HUGGINGFACE_TOKEN}" https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors



# Ensure Flux Loader points to downloaded models
export FLUX_UNET_MODEL_PATH="./models/unet/flux1-dev-fp8.safetensors"
export FLUX_LORA_PATH="./models/lora/lora-highresfix.safetensors"
export FLUX_CONTROLNET_PATH="./models/controlnet/controlnet-pose.safetensors"

# Initialize ComfyUI Workflow
echo "Launching ComfyUI Flux Workflow..."
python3 launch.py --workflow-config workflow.json
