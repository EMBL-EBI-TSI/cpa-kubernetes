> **Note**
> The EBI Cloud Portal has been retired and its code base is no longer updated.

# EBI Cloud Portal - Kubernetes
Kubernetes On-Premises virtual machine.  
It uses the official CentOS 7.4 iso image and configures a Kubernetes cluster using an Ansible role.
Official Ubuntu iso image is also supported specifying a different `disk_image_name`.  
For the connection, your local `~/.ssh/id_rsa` will be used  by default.  
A different location can be specified for your private SSH key, by setting the optional `parameter`: **`user_private_key_path`** in the `Deployment parameters` section.

| Parameter name          | Parameter value              |
| ---                     | ---                          |
| `user_private_key_path` | `local_path_of_your_SSH_key` |

## Instructions

### OpenStack configuration
In addition to the `Cloud Credentials` parameters defined in the
`Profile` section, two additional couples of key-value are required:

| Parameter name    | Parameter value (example)         |
| ---               | ---                               |
| `OS_TENANT_ID `   | `a123b45c678d901efg23h4i5jkl6m789`|
| `OS_REGION_NAME ` | `RegionOne`                       |


## Requirements
A network is expected to be shared with other virtual machines, therefore is not provided and destroyed with this terraform description.  
You need to set up the name of the network inside of the terraform.tfvars file.  
If you want to provide a new network you can use the `cpa-network` terraform description.

## Instructions
Create a new entry in the `Deployment Parameters` section.

This application can be used in combination with one of the following  :  
[https://github.com/EMBL-EBI-TSI/cpa-network](https://github.com/EMBL-EBI-TSI/cpa-network)  

### Default values

| Parameter name          | Parameter value     |
| ---                     | ---                 |
| `name`                  | `kubernetes`        |
| `node_instances`        | 2                   |
| `deployment_path`       | `.`                 |
| `disk_image_name`       | `centos-7.4`        |
| `machine_type`          | `s1.tiny`           |
| `floating_ip_pool`      | `ext-net`           |
| `network_name`          | ``                  |
| `ssh_key`               | ``                  |
| `public_key_path`       | `~/.ssh/id_rsa.pub` |
| `private_key_path`      | `~/.ssh/id_rsa`     |
| `ssh_key`               | ``                  |
| `user_private_key_path` | `~/.ssh/id_rsa`     |

### Open Ports
The virtual machine provided will have this ports open.

`ICMP`  : `all`  
`TCP`   : `22`  
`HTTP`  : `80`  
`HTTPS` : `443`  
`k8s`   : `6443`

### Ansible roles
Ansible Galaxy: mongrelion.docker
[https://galaxy.ansible.com/mongrelion/docker/](https://galaxy.ansible.com/mongrelion/docker/)
