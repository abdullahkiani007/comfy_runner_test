# Custom Workflow ComfyUI

A specialized workflow management system for ComfyUI that helps automate model loading, custom node installation, and workflow execution.

## Features

- Automated model downloading and management
- Custom node installation and configuration
- JSON-based workflow configuration
- Support for high-resolution image generation
- Integration with various ComfyUI extensions and nodes

## Prerequisites

- ComfyUI installation
- Python environment
- Required environment variables:
  ```bash
  COMFY_BASE_PATH=/workspace/ComfyUI/
  COMFY_MODELS_BASE_PATH=/workspace/ComfyUI/
  ```

## Setup

1. Clone this repository
2. Set up the required environment variables
3. Install the required dependencies

## Usage

The system uses `rp_handler.py` to process workflow configurations. Here's how to structure your input:

### 1. Configure Custom Models

Specify the models you need in your JSON configuration. You can leave this array empty if you don't need any custom models. Note: If the models are already available in the comfy_runner repository's database, you don't need to include them here.

```json
{
  "customModels": [
    {
      "filename": "model_name.safetensors",
      "url": "https://model-source-url.com/model.safetensors",
      "dest": "/ComfyUI/models/type"
    }
  ]
}
```

### 2. Configure Custom Nodes

Add required custom nodes to your workflow:

```json
{
  "customNodes": [
    {
      "title": "Node Name",
      "url": "https://github.com/author/node-repository.git"
    }
  ]
}
```

### 3. Define Workflow

Create your workflow configuration in the JSON format by exporting your workflow from ComfyUI in API format. To do this:
1. Enable Dev mode Options in ComfyUI settings
2. Click on "Save (API format)" button to export your workflow

The workflow should specify:
- Model loaders
- VAE configurations
- CLIP settings
- Workflow nodes and connections
- Output parameters

## Supported Custom Nodes

The project includes support for various custom nodes including:
- ComfyUI-FluxMod
- ComfyUI-QualityOfLifeSuit
- ComfyUI-essentials
- ComfyUI-Fluxtapoz
- ComfyUI-42lux
- ComfyUI-Detail-Daemon
- ComfyUI-Inspire-Pack
- And many more

## High-Resolution Workflow Support

The system includes specialized support for high-resolution image generation with:
- Normalized sigma scheduling
- Optimized resolution handling
- Noise injection capabilities
- Token count management for CLIP-L and T5-XXL

## Sample Workflow

Here's an example of an inpainting workflow configuration:

```json
{
    "input": {
      "uid": "mani1122",
      "customModels": [],
      "customNodes": [
        {
          "title": "TK",
          "url": "https://github.com/lodestone-rock/ComfyUI_FluxMod.git"
        },
        {
          "title": "TK",
          "url": "https://github.com/omar92/ComfyUI-QualityOfLifeSuit_Omar92"
        },
        {
          "title": "TK",
          "url": "https://github.com/cubiq/ComfyUI_essentials"
        },
        {
          "title": "TK",
          "url": "https://github.com/logtd/ComfyUI-Fluxtapoz"
        },
        {
          "title": "TK",
          "url": "https://github.com/42lux/ComfyUI-42lux.git"
        },
        {
          "title": "TK",
          "url": "https://github.com/Jonseed/ComfyUI-Detail-Daemon.git"
        },
        {
          "title": "TK",
          "url": "https://github.com/ltdrdata/ComfyUI-Inspire-Pack"
        },
        {
          "title": "TK",
          "url": "https://github.com/pamparamm/ComfyUI-ppm"
        },
        {
          "title": "TK",
          "url": "https://github.com/ltdrdata/ComfyUI-Manager.git"
        },
        {
          "title": "TK",
          "url": "https://github.com/kijai/ComfyUI-KJNodes"
        },
        {
            "title":"TK",
            "url":"https://github.com/Fannovel16/comfyui_controlnet_aux"
    
        },
        {
            "title":"TK",
            "url":"https://github.com/chflame163/ComfyUI_LayerStyle"
        },
        {
            "title":"TK",
            "url":"https://github.com/john-mnz/ComfyUI-Inspyrenet-Rembg"
        },
        {
            "title":"TK",
            "url":"https://github.com/rgthree/rgthree-comfy"
        },
        {
            "title":"TK",
            "url":"https://github.com/rdancer/ComfyUI_Florence2SAM2"
        },
        {
            "title":"TK",
            "url":"https://github.com/ltdrdata/ComfyUI-Impact-Pack"
        },
        {
            "title":"TK",
            "url":"https://github.com/WASasquatch/was-node-suite-comfyui"
        },
        {
            "title":"TK",
            "url":"https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
        },
        {
            "title":"TK",
            "url":"https://github.com/stavsap/comfyui-ollama"
        }
      ],
      "workflow": {
        "1": {
          "inputs": {
            "images": [
              "16",
              0
            ]
          },
          "class_type": "PreviewImage",
          "_meta": {
            "title": "Preview Image"
          }
        },
        "2": {
          "inputs": {
            "vae_name": "ae.safetensors"
          },
          "class_type": "VAELoader",
          "_meta": {
            "title": "Load VAE"
          }
        },
        "3": {
          "inputs": {
            "samples": [
              "35",
              0
            ],
            "vae": [
              "2",
              0
            ]
          },
          "class_type": "VAEDecode",
          "_meta": {
            "title": "VAE Decode"
          }
        },
        "4": {
          "inputs": {
            "mask": [
              "18",
              1
            ]
          },
          "class_type": "MaskToImage",
          "_meta": {
            "title": "Convert Mask to Image"
          }
        },
        "7": {
          "inputs": {
            "clip_name1": "clip_l.safetensors",
            "clip_name2": "t5xxl_fp16.safetensors",
            "type": "flux",
            "device": "default"
          },
          "class_type": "DualCLIPLoader",
          "_meta": {
            "title": "DualCLIPLoader"
          }
        },
        "8": {
          "inputs": {
            "direction": "right",
            "match_image_size": true,
            "image1": [
              "32",
              0
            ],
            "image2": [
              "18",
              0
            ]
          },
          "class_type": "ImageConcanate",
          "_meta": {
            "title": "Image Concatenate"
          }
        },
        "9": {
          "inputs": {
            "width": [
              "32",
              1
            ],
            "height": [
              "32",
              2
            ],
            "batch_size": 1,
            "color": 0
          },
          "class_type": "EmptyImage",
          "_meta": {
            "title": "EmptyImage"
          }
        },
        "10": {
          "inputs": {
            "direction": "right",
            "match_image_size": true,
            "image1": [
              "9",
              0
            ],
            "image2": [
              "4",
              0
            ]
          },
          "class_type": "ImageConcanate",
          "_meta": {
            "title": "Image Concatenate"
          }
        },
        "12": {
          "inputs": {
            "model": [
              "21",
              0
            ]
          },
          "class_type": "DifferentialDiffusion",
          "_meta": {
            "title": "Differential Diffusion"
          }
        },
        "13": {
          "inputs": {
            "noise_mask": false,
            "positive": [
              "28",
              0
            ],
            "negative": [
              "93",
              0
            ],
            "vae": [
              "2",
              0
            ],
            "pixels": [
              "8",
              0
            ],
            "mask": [
              "23",
              0
            ]
          },
          "class_type": "InpaintModelConditioning",
          "_meta": {
            "title": "InpaintModelConditioning"
          }
        },
        "15": {
          "inputs": {
            "image": [
              "22",
              0
            ]
          },
          "class_type": "ImageGenResolutionFromImage",
          "_meta": {
            "title": "Generation Resolution From Image"
          }
        },
        "16": {
          "inputs": {
            "width": [
              "15",
              0
            ],
            "height": [
              "15",
              1
            ],
            "x": [
              "32",
              1
            ],
            "y": 0,
            "image": [
              "3",
              0
            ]
          },
          "class_type": "ImageCrop",
          "_meta": {
            "title": "Image Crop"
          }
        },
        "17": {
          "inputs": {
            "unet_name": "flux1-fill-dev.safetensors",
            "weight_dtype": "default"
          },
          "class_type": "UNETLoader",
          "_meta": {
            "title": "Load Diffusion Model"
          }
        },
        "18": {
          "inputs": {
            "aspect_ratio": "original",
            "proportional_width": 1,
            "proportional_height": 1,
            "fit": "letterbox",
            "method": "lanczos",
            "round_to_multiple": "8",
            "scale_to_side": "height",
            "scale_to_length": [
              "15",
              1
            ],
            "background_color": "#000000",
            "image": [
              "22",
              0
            ],
            "mask": [
              "53",
              0
            ]
          },
          "class_type": "LayerUtility: ImageScaleByAspectRatio V2",
          "_meta": {
            "title": "LayerUtility: ImageScaleByAspectRatio V2"
          }
        },
        "21": {
          "inputs": {
            "lora_name": "comfyui_subject_lora16.safetensors",
            "strength_model": 1,
            "model": [
              "17",
              0
            ]
          },
          "class_type": "LoraLoaderModelOnly",
          "_meta": {
            "title": "LoraLoaderModelOnly"
          }
        },
        "22": {
          "inputs": {
            "image": "26bd39116a1b821000ac681af333b91d.jpeg",
            "upload": "image"
          },
          "class_type": "LoadImage",
          "_meta": {
            "title": "Enviroment image"
          }
        },
        "23": {
          "inputs": {
            "channel": "red",
            "image": [
              "10",
              0
            ]
          },
          "class_type": "ImageToMask",
          "_meta": {
            "title": "Convert Image to Mask"
          }
        },
        "28": {
          "inputs": {
            "text": [
              "72",
              0
            ],
            "clip": [
              "42",
              0
            ]
          },
          "class_type": "CLIPTextEncode",
          "_meta": {
            "title": "CLIP Text Encode (Prompt)"
          }
        },
        "29": {
          "inputs": {
            "images": [
              "31",
              0
            ]
          },
          "class_type": "PreviewImage",
          "_meta": {
            "title": "Preview Image"
          }
        },
        "30": {
          "inputs": {
            "image": [
              "31",
              0
            ]
          },
          "class_type": "ImageRemoveAlpha+",
          "_meta": {
            "title": "🔧 Image Remove Alpha"
          }
        },
        "31": {
          "inputs": {
            "torchscript_jit": "default",
            "image": [
              "33",
              0
            ]
          },
          "class_type": "InspyrenetRembg",
          "_meta": {
            "title": "Inspyrenet Rembg"
          }
        },
        "32": {
          "inputs": {
            "width": 0,
            "height": [
              "15",
              1
            ],
            "interpolation": "nearest",
            "method": "keep proportion",
            "condition": "always",
            "multiple_of": 0,
            "image": [
              "30",
              0
            ]
          },
          "class_type": "ImageResize+",
          "_meta": {
            "title": "🔧 Image Resize"
          }
        },
        "33": {
          "inputs": {
            "image": "_130935174_whopper.jpg",
            "upload": "image"
          },
          "class_type": "LoadImage",
          "_meta": {
            "title": "Reference Image"
          }
        },
        "34": {
          "inputs": {
            "rgthree_comparer": {
              "images": [
                {
                  "name": "A",
                  "selected": true,
                  "url": "/api/view?filename=rgthree.compare._temp_bxdth_00005_.png&type=temp&subfolder=&rand=0.33143455656090115"
                },
                {
                  "name": "B",
                  "selected": true,
                  "url": "/api/view?filename=rgthree.compare._temp_bxdth_00006_.png&type=temp&subfolder=&rand=0.6377474322231507"
                }
              ]
            },
            "image_a": [
              "16",
              0
            ],
            "image_b": [
              "22",
              0
            ]
          },
          "class_type": "Image Comparer (rgthree)",
          "_meta": {
            "title": "Image Comparer (rgthree)"
          }
        },
        "35": {
          "inputs": {
            "seed": 852586969044312,
            "steps": 28,
            "cfg": 1.5,
            "sampler_name": "euler",
            "scheduler": "normal",
            "denoise": 1,
            "model": [
              "12",
              0
            ],
            "positive": [
              "13",
              0
            ],
            "negative": [
              "13",
              1
            ],
            "latent_image": [
              "13",
              2
            ]
          },
          "class_type": "KSampler",
          "_meta": {
            "title": "KSampler"
          }
        },
        "40": {
          "inputs": {
            "apply_to_query": false,
            "apply_to_key": false,
            "apply_to_value": false,
            "apply_to_out": true,
            "clip_l_0": 1,
            "clip_l_1": 1,
            "clip_l_2": 1,
            "clip_l_3": 1,
            "clip_l_4": 1,
            "clip_l_5": 1,
            "clip_l_6": 1,
            "clip_l_7": 1,
            "clip_l_8": 1,
            "clip_l_9": 1,
            "clip_l_10": 1,
            "clip_l_11": 1,
            "t5xxl_0": 1,
            "t5xxl_1": 1,
            "t5xxl_2": 1,
            "t5xxl_3": 1,
            "t5xxl_4": 1,
            "t5xxl_5": 1,
            "t5xxl_6": 1,
            "t5xxl_7": 1,
            "t5xxl_8": 1,
            "t5xxl_9": 1,
            "t5xxl_10": 1,
            "t5xxl_11": 1,
            "t5xxl_12": 1,
            "t5xxl_13": 1,
            "t5xxl_14": 1,
            "t5xxl_15": 1,
            "t5xxl_16": 1,
            "t5xxl_17": 1,
            "t5xxl_18": 1,
            "t5xxl_19": 1,
            "t5xxl_20": 1,
            "t5xxl_21": 1,
            "t5xxl_22": 1,
            "t5xxl_23": 1,
            "RESET ALL": "",
            "ZERO ALL": "",
            "REPEAT FIRST": "",
            "clip": [
              "7",
              0
            ]
          },
          "class_type": "FluxAttentionSeeker+",
          "_meta": {
            "title": "🔧 Flux Attention Seeker"
          }
        },
        "42": {
          "inputs": {
            "apply_to_query": true,
            "apply_to_key": true,
            "apply_to_value": false,
            "apply_to_out": false,
            "clip_l_0": 1,
            "clip_l_1": 1,
            "clip_l_2": 1,
            "clip_l_3": 1,
            "clip_l_4": 1,
            "clip_l_5": 1,
            "clip_l_6": 1,
            "clip_l_7": 1,
            "clip_l_8": 1,
            "clip_l_9": 1,
            "clip_l_10": 1,
            "clip_l_11": 1,
            "t5xxl_0": 1,
            "t5xxl_1": 1,
            "t5xxl_2": 1,
            "t5xxl_3": 1,
            "t5xxl_4": 1,
            "t5xxl_5": 1,
            "t5xxl_6": 1,
            "t5xxl_7": 1,
            "t5xxl_8": 1,
            "t5xxl_9": 1,
            "t5xxl_10": 1,
            "t5xxl_11": 1,
            "t5xxl_12": 1,
            "t5xxl_13": 1,
            "t5xxl_14": 3.458579292037941,
            "t5xxl_15": 1,
            "t5xxl_16": 1,
            "t5xxl_17": 1,
            "t5xxl_18": 1,
            "t5xxl_19": 1,
            "t5xxl_20": 1,
            "t5xxl_21": 1,
            "t5xxl_22": 1,
            "t5xxl_23": 1,
            "RESET ALL": "",
            "ZERO ALL": "",
            "REPEAT FIRST": "",
            "clip": [
              "40",
              0
            ]
          },
          "class_type": "FluxAttentionSeeker+",
          "_meta": {
            "title": "🔧 Flux Attention Seeker"
          }
        },
        "46": {
          "inputs": {
            "images": [
              "33",
              0
            ]
          },
          "class_type": "PreviewImage",
          "_meta": {
            "title": "Preview Image"
          }
        },
        "48": {
          "inputs": {
            "sam2_model": "sam2_hiera_large.pt",
            "device": "cpu",
            "prompt": [
              "52",
              0
            ],
            "keep_model_loaded": false,
            "image": [
              "22",
              0
            ]
          },
          "class_type": "RdancerFlorence2SAM2GenerateMask",
          "_meta": {
            "title": "RdancerFlorence2SAM2GenerateMask"
          }
        },
        "52": {
          "inputs": {
            "text": [
              "89",
              0
            ]
          },
          "class_type": "Text _O",
          "_meta": {
            "title": "Product Prompt"
          }
        },
        "53": {
          "inputs": {
            "select": 2,
            "sel_mode": false,
            "input1": [
              "22",
              1
            ],
            "input2": [
              "64",
              0
            ]
          },
          "class_type": "ImpactSwitch",
          "_meta": {
            "title": "1 = manual / 2 = auto"
          }
        },
        "56": {
          "inputs": {
            "mask": [
              "48",
              1
            ]
          },
          "class_type": "MaskPreview+",
          "_meta": {
            "title": "🔧 Mask Preview"
          }
        },
        "59": {
          "inputs": {
            "mask": [
              "62",
              1
            ]
          },
          "class_type": "MaskPreview+",
          "_meta": {
            "title": "🔧 Mask Preview"
          }
        },
        "62": {
          "inputs": {
            "sam2_model": "sam2_hiera_large.pt",
            "device": "cpu",
            "prompt": "hand",
            "keep_model_loaded": false,
            "image": [
              "22",
              0
            ]
          },
          "class_type": "RdancerFlorence2SAM2GenerateMask",
          "_meta": {
            "title": "RdancerFlorence2SAM2GenerateMask"
          }
        },
        "64": {
          "inputs": {
            "mask1": [
              "48",
              1
            ],
            "mask2": [
              "62",
              1
            ]
          },
          "class_type": "SubtractMask",
          "_meta": {
            "title": "Pixelwise(MASK - MASK)"
          }
        },
        "65": {
          "inputs": {
            "mask": [
              "64",
              0
            ]
          },
          "class_type": "MaskPreview+",
          "_meta": {
            "title": "🔧 Mask Preview"
          }
        },
        "72": {
          "inputs": {
            "text": [
              "74",
              0
            ],
            "find": "{Item}",
            "replace": [
              "52",
              0
            ]
          },
          "class_type": "Text Find and Replace",
          "_meta": {
            "title": "Text Find and Replace"
          }
        },
        "74": {
          "inputs": {
            "text": "the item is a {Item}"
          },
          "class_type": "Text _O",
          "_meta": {
            "title": "Prompt"
          }
        },
        "76": {
          "inputs": {
            "text": [
              "72",
              0
            ],
            "text2": "the item is a  burger   "
          },
          "class_type": "ShowText|pysssss",
          "_meta": {
            "title": "Show Text 🐍"
          }
        },
        "89": {
          "inputs": {
            "query": "You are an AI that analyzes image description prompts.\nYour only task is to identify the main subject of the prompt.\nRespond with exactly ONE WORD that represents the primary subject.\n\nExample:\nInput: \"A majestic eagle soaring over mountains at sunset\"\nOutput: eagle",
            "debug": "enable",
            "url": "http://127.0.0.1:11434",
            "model": "llava:latest",
            "keep_alive": 5,
            "format": "text",
            "images": [
              "30",
              0
            ]
          },
          "class_type": "OllamaVision",
          "_meta": {
            "title": "Ollama Vision"
          }
        },
        "90": {
          "inputs": {
            "text": [
              "89",
              0
            ],
            "text2": " burger "
          },
          "class_type": "ShowText|pysssss",
          "_meta": {
            "title": "Show Text 🐍"
          }
        },
        "91": {
          "inputs": {
            "inputcount": 3,
            "direction": "right",
            "match_image_size": true,
            "Update inputs": null,
            "image_1": [
              "22",
              0
            ],
            "image_2": [
              "33",
              0
            ],
            "image_3": [
              "16",
              0
            ]
          },
          "class_type": "ImageConcatMulti",
          "_meta": {
            "title": "Image Concatenate Multi"
          }
        },
        "92": {
          "inputs": {
            "filename_prefix": "ComfyUI",
            "images": [
              "91",
              0
            ]
          },
          "class_type": "SaveImage",
          "_meta": {
            "title": "Save Image"
          }
        },
        "93": {
          "inputs": {
            "conditioning": [
              "28",
              0
            ]
          },
          "class_type": "ConditioningZeroOut",
          "_meta": {
            "title": "ConditioningZeroOut"
          }
        }
      }
    }
  }
```

This workflow demonstrates:
- Empty customModels array (since required models are in comfy_runner database)
- Comprehensive list of custom nodes required for inpainting
- Complete workflow configuration with various nodes for:
  - Image loading and preprocessing
  - Mask generation and manipulation
  - VAE handling
  - CLIP text encoding
  - Sampling and conditioning
  - Image saving and preview

## Repository Structure

### ComfyUI Directory
The main working directory containing all essential components:

#### Core Files and Features

1. **Workflow Processing and API Handling** (`rp_handler.py`)
   - API polling and availability checks
   ```python
   COMFY_API_AVAILABLE_INTERVAL_MS = 50
   COMFY_POLLING_INTERVAL_MS = int(os.environ.get("COMFY_POLLING_INTERVAL_MS", 250))
   ```
   - RunPod serverless integration
   - Response processing and upload handling

2. **Workflow Execution** (`main.py`)
   - ComfyUI runner initialization
   - Workflow configuration processing
   - Integration with comfy_runner library
   ```python
   from comfy_runner.inf import ComfyRunner
   runner = ComfyRunner()
   ```

3. **Environment Initialization** (`start.sh`)
   - Service startup
   - Environment variable configuration
   - ComfyUI service initialization

4. **Model and Node Management** (`test_input.json`)
   - Custom model configuration:
   ```json
   "customModels": [
     {
       "filename": "model_name.safetensors",
       "url": "model_url",
       "dest": "/ComfyUI/models/type"
     }
   ]
   ```
   - Custom node registration:
   ```json
   "customNodes": [
     {
       "title": "TK",
       "url": "https://github.com/repository/node.git"
     }
   ]
   ```

5. **Workflow Templates** (`inpainting_refined_test.json`)
   - Complete inpainting workflow configuration
   - Node interconnections and parameters
   - Model and VAE settings
   - CLIP and conditioning configurations

#### Docker Implementation

1. **Base Environment** (`Dockerfile.lite`)
   ```dockerfile
   FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04 as base
   ENV DEBIAN_FRONTEND=noninteractive
   ENV PIP_PREFER_BINARY=1
   ```
   - CUDA and cuDNN support
   - Python environment setup
   - Base dependency installation

2. **Development Environment** (`Dockerfile.staging`)
   - Extended configuration for staging
   - Additional development tools
   - Testing environment setup

#### Feature-to-File Mapping

1. **Model Management**
   - Configuration: `test_input.json`
   - Processing: `rp_handler.py`
   - Storage paths: Defined in environment variables

2. **Custom Node Integration**
   - Node list: `test_input.json`
   - Installation: Handled by Docker setup
   - Processing: `rp_handler.py`

3. **Workflow Processing**
   - Template: `inpainting_refined_test.json`
   - Execution: `main.py`
   - API handling: `rp_handler.py`

4. **Environment Setup**
   - Base configuration: `Dockerfile.lite`
   - Development setup: `Dockerfile.staging`
   - Runtime configuration: `start.sh`

5. **API Integration**
   - Handler configuration: `rp_handler.py`
   ```python
   COMFY_HOST = "127.0.0.1:4333"
   REFRESH_WORKER = os.environ.get("REFRESH_WORKER", "false").lower() == "true"
   ```
   - Execution management: `main.py`

#### Environment Variables
Required environment variables (set in Docker and used across files):
```bash
COMFY_BASE_PATH=/workspace/ComfyUI/
COMFY_MODELS_BASE_PATH=/workspace/ComfyUI/
```

### Docker Workflow
The Docker implementation orchestrates all components:

1. **Environment Setup** (`Dockerfile.lite`, `Dockerfile.staging`)
   - System dependencies
   - Python environment
   - ComfyUI installation

2. **Automation** (`start.sh`, `rp_handler.py`)
   - Model downloading
   - Custom node installation
   - Environment initialization

3. **Integration** (`main.py`, `rp_handler.py`)
   - comfy_runner setup
   - API configuration
   - Resource management

4. **Execution** (All components)
   - Workflow processing
   - Model management
   - Output handling