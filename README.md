# Learn Terraform Provisioning

I Tried to implement High available,Fault tollerent solution for this question.Proposed architecture digaram included as the PNG in the repository


1.Checkout the code and Need to create key pair named practical-test using below command in the current directory.

ssh-keygen -t practical-test

2. Go to your AWS account and get the AMI ID of ubuntu 18.04.Enter it on template.json and template_bastion_host.json under the source AMI.Also create key pair from console Bastion_host.pem for authenticate bastion host
3. Enter your aws access key and aws secret access key in a to of both json files.
4. Enter below command for create AMIs 

     packer init
     packer build template.json
     packer build template_bastion_host.json

5. After executes commands get the AMI IDs from aws console/EC2/AMI section and Put bastion-host - {{timestamp}} key in terraform.tfvars file launchtemplate  under the "launch_tmpl_image_id" Attribute

6. AMI ID target-host-{{timestamp}} put under the targethost_image_id 

7. Put your AWS credential profile under the provider.tf

8. After did previous steps you can execut terrraform script for provision environment.

    terraform init
    terraform plan
    terraform apply

Thank You.Enjoy