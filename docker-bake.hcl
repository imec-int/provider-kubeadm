variable "BASE_VERSION" {
  default = "0.5.0"
}

group "default" {
  targets = ["provider-kubeadm-22-04","provider-kubeadm-24-04","provider-kubeadm-22-04-nvidia"]
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

target "provider-kubeadm-22-04-nvidia" {
  context = "."
  dockerfile = "Dockerfile.jetson"
  platforms = ["linux/arm64"]
  contexts = {
    base = "target:provider-kubeadm-22-04"
  }
  output = [
    "type=image,name=edgelabacr.azurecr.io/kairos/provider-kubeadm:22.04-${BASE_VERSION}-nvidia,push=true,compression=zstd,compression-level=17,force-compression=true"
  ]
}
