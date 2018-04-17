#### Deployment ####
variable "name" {
  default     = "kubernetes"
  description = "The name of the deployment"
}

variable "node_instances" {
  default     = 2
  description = "Number of node instances to install"
}

variable "deployment_path" {
  default     = "."
  description = "Local path where to save terraform deployment output"
}

#### OpenStack ####
variable "disk_image_name" {
  default     = "centos-7.4"
  description = "OS image name to use for installation"
}

variable "machine_type" {
  default     = "s1.tiny"
  description = "Machine type (flavor)"
}

variable "floating_ip_pool" {
  default = "ext-net"
}

variable "network_name" {
  description = "The name of the OpenStack network where to deploy the instance"
}

#### SSH ####
variable "public_key_path" {
  description = "The path of the public SSH key to be injected in the vm"
  type        = "string"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  description = "The path of the private SSH key to be used to connect to the the vm"
  type        = "string"
  default     = "~/.ssh/id_rsa"
}

variable "ssh_key" {
  description = "The public SSH key to be injected in the vm"
  type        = "string"
}

variable "user_private_key_path" {
  description = "The path of the private SSH key connected to the public SSH key to be injected in the vm. This key will be not used by terraform or ansible, but the path will used only to build a personalised ssh.config file. If not set up, it will assume the key is located in ~/.ssh/id_rsa"
  type        = "string"
  default     = "~/.ssh/id_rsa"
}
