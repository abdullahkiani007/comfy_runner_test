#!/bin/bash

set -e

MODEL_DIR=/opt/ComfyUI/models/checkpoints
mkdir -p $MODEL_DIR
chmod -R 777 /opt/ComfyUI/models

# Download models if they are not already present
if [ ! -f "$MODEL_DIR/flux1-dev-fp8.safetensors" ]; then
    wget -c https://huggingface.co/lllyasviel/flux1_dev/blob/main/flux1-dev-fp8.safetensors -P $MODEL_DIR
fi

if [ ! -f "$MODEL_DIR/42lux-UltimateAtHome-flux-highresfix.safetensors" ]; then
    wget -c https://huggingface.co/okaris/flux-hires/resolve/618a72cc96bedf98f86837f28810cd73276753d9/42lux-UltimateAtHome-flux-highresfix.safetensors -P $MODEL_DIR
fi

if [ ! -f "$MODEL_DIR/Dramatic_portrait_v1-Flux.safetensors" ]; then
    wget -c https://huggingface.co/ababiya/Dramatic_Portrait/resolve/cfaa0e62445ab8a2614f918897b4f5b37597ff5a/Dramatic_portrait_v1-Flux.safetensors -P $MODEL_DIR
fi

if [ ! -f "$MODEL_DIR/Porsche_911.safetensors" ]; then
    wget -c https://huggingface.co/all4five/911/resolve/6c722fe7984fc9c1520077796c84080401b099cf/Porsche%20911.safetensors -P $MODEL_DIR
fi

if [ ! -f "$MODEL_DIR/clip_l.safetensors" ]; then
    wget -c https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors -P $MODEL_DIR
fi

if [ ! -f "$MODEL_DIR/t5xxl_fp16.safetensors" ]; then
    wget -c https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors -P $MODEL_DIR
fi

if [ ! -f "$MODEL_DIR/ae.safetensors" ]; then
    wget -c https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors -P $MODEL_DIR
fi

# Start the comfyui-api
exec ./comfyui-api