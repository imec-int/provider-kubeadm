variable "BASE_VERSION" {
  default = "0.6.0"
}

group "default" {
  targets = ["provider-kubeadm-22-04-nvidia-jetson", "provider-kubeadm-22-04"]
}

target "provider-kubeadm-24-04" {
  context = "."
  dockerfile = "Dockerfile"
  platforms = ["linux/arm64", "linux/amd64"]
  args = {
    UBUNTU_VERSION = "24.04"
  }
  output = [
    "type=image,name=edgelabacr.azurecr.io/kairos/provider-kubeadm:24.04-${BASE_VERSION},push=true,compression=zstd,compression-level=17,force-compression=true"
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
    "type=image,name=edgelabacr.azurecr.io/kairos/provider-kubeadm:22.04-${BASE_VERSION},push=true,compression=zstd,compression-level=17,force-compression=true"
  ]
}

target "provider-kubeadm-22-04-nvidia-jetson" {
  context = "."
  dockerfile = "Dockerfile.jetson"
  platforms = ["linux/arm64"]
  contexts = {
    base = "target:provider-kubeadm-22-04"
  }
  output = [
    "type=image,name=edgelabacr.azurecr.io/kairos/provider-kubeadm:22.04-${BASE_VERSION}-nvidia-jetson,push=true,compression=zstd,compression-level=17,force-compression=true"
  ]
}
