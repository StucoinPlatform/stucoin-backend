variable "vpc_cidr_block" {
  type = string
  description = "vpc default cidr block"
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  type = string
  description = "subnet default cidr block"
  default = "10.0.1.0/24"
}

variable "route_cidr_block" {
  type = string
  description = "route default cidr block"
  default = "0.0.0.0/0"
}

variable "keypair_name" {
    type = string
    description = "keypair name"
    default = "kubeadm_stucoin_keypair"
}

variable "ubuntu_ami" {
    type = string
    description = "ubuntu ami"
    default = "ami-053b0d53c279acc90"
}

variable "worker_nodes_count" {
    type = number
    description = "worker nodes count"
    default = 2
}