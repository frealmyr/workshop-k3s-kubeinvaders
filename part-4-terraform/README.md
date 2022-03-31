# Terraform

Now that we have a working cluster, with working kubectl on our development machines. It is time to apply some resouces with Terraform.

> You need to have Terraform (>v1.0.0) on your development machine.

This part will install KubeInvaders and a nginx example app for testing scaling on kubernetes while visually showing chaos engineering on screen.

## Task 1

First we need to setup the terraform providers that we have defined in `providers.tf`, this is done by running this command in our root terraform folder called `tf-workshop/`

```bash
terraform init
```

The required providers for running the terraform code is now downloaded to our machine.

## Task 2

Before we apply our terraform code, we need to change the ip address in a file for KubeInvaders to work properly.

Edit the ip address in `tf-workshop/kubeinvaders.tf` to the ip address of our master raspberry pi node.

## Task 3

You can now apply the terraform code to your repository by running:

```bash
terraform apply
```

If all went well, you should see that multiple resources was applied successfully. And you can continue to the final part of the workshop.
