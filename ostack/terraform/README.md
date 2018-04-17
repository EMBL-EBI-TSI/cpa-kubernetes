# Instructions

Copy `terraform.tfvars.example` in a `terraform.tfvars` and compile the mandatory variables.

    cp terraform.tfvars.example terraform.tfvars
    vim terraform.tfvars

This configuration will be ignored by the git repository.

## Deploy

Test the configuration with:

    terraform plan

Deploy the instance:

    terraform apply

Remove the instance:

    terraform destroy

## Requirements

A network is expected to be shared with other virtual machine, therefore is not provided and destroyed with this terraform description.  
You need to set up the name of the network inside of the terraform.tfvars file.  
If you want to provide a new network you can use the `cpa-network` terraform description.
