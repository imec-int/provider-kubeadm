group "default" {
  targets = ["provider-kubeadm-22-04-nvidia-minimal"]
}

target "provider-kubeadm-24-04" {
  context = "."
  dockerfile = "Dockerfile"
  platforms = ["linux/arm64", "linux/amd64"]
  args = {
    UBUNTU_VERSION = "24.04"
  }
  output = [
    "type=image,name=edgelabacr.azurecr.io/kairos/provider-kubeadm:24.04-0.3.0,push=true,compression=zstd,compression-level=17,force-compression=true"
  ]
}

target "provider-kubeadm-22-04" {
  context = "."
  dockerfile = "Dockerfile"
  platforms = ["linux/arm64", "linux/amd64"]
  args = {
    UBUNTU_VERSION = "22.04"
  }
  output = [
    "type=image,name=edgelabacr.azurecr.io/kairos/provider-kubeadm:22.04-0.3.0,push=true,compression=zstd,compression-level=17,force-compression=true"
  ]
}

target "provider-kubeadm-22-04-nvidia" {
  context = "."
  dockerfile = "Dockerfile"
  platforms = ["linux/arm64"]
  args = {
    UBUNTU_VERSION = "22.04"
    MODEL = "nvidia-jetson-agx-orin"
  }
  output = [
    "type=image,name=edgelabacr.azurecr.io/kairos/provider-kubeadm:22.04-0.3.0-agx-orin,push=true,compression=zstd,compression-level=17,force-compression=true"
  ]
}

target "provider-kubeadm-22-04-nvidia-full" {
  context = "."
  dockerfile = "Dockerfile.jetson1"
  platforms = ["linux/arm64"]
  args = {
    IMAGE = "edgelabacr.azurecr.io/kairos/provider-kubeadm:22.04-0.3.0-agx-orin"
  }
  output = [
    "type=image,name=edgelabacr.azurecr.io/kairos/provider-kubeadm:22.04-0.3.0-agx-orin-full,push=true,compression=zstd,compression-level=17,force-compression=true"
  ]
}

target "provider-kubeadm-22-04-nvidia-minimal" {
  context = "."
  dockerfile = "Dockerfile.jetson"
  platforms = ["linux/arm64"]
  args = {
    IMAGE = "edgelabacr.azurecr.io/kairos/provider-kubeadm:22.04-0.3.0"
  }
  output = [
    "type=image,name=edgelabacr.azurecr.io/kairos/provider-kubeadm:22.04-0.3.15-agx-orin-minimal,push=true,compression=zstd,compression-level=17,force-compression=true"
  ]
}
