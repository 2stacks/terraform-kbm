# CloudInit Variables
variable "user_name" {}
variable "ssh_authorized-key" {}

# Libvirt Variables
variable "libvirt_uri" {
  description = "URI of server running libvirtd"
  default = "qemu:///system"
}

variable "prefix" {
  description = "Resources will be prefixed with this to avoid clashing names"
  default = "kbm"
}

variable "guest_count" {
  description = "Number of Guests to Create"
  default     = "1"
}

variable "libvirt_volume_source" {
  description = "Volume Image Source"
  default = "https://cloud-images.ubuntu.com/releases/xenial/release/ubuntu-16.04-server-cloudimg-amd64-disk1.img"
}

variable "libvirt_volume_pool" {
  description = "Volume Storage Pool"
  default = "default"
}

variable "libvirt_volume_size" {
  description = "Volume Size in Bytes"
  default = "10737418240"
}

variable "hostname" {
  description = "Guest Hostname"
  default     = "kbm"
}

variable "memory" {
  default = "2048"
}

variable "vcpu" {
  default = "2"
}

variable "network" {
  description = "Name of Libvirt Network"
  default = "default"
}
