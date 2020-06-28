# Clouds of Honey
Automates creating an SSH honeypot so you can get to the fun stuff. ;) 

![honey stick material](assets/honey.jpg)

The project uses the following tools: 
* [Circleci](https://circleci.com)
* [DigitalOcean](https://www.digitalocean.com)
* [Packer](https://www.packer.io/) 
* [Terraform](https://https://www.terraform.io/)
* [ssh-honeypot](https://github.com/droberson/ssh-honeypot)

## How to use this project

### Setup 

1. Sign up with CircleCI if you haven't already. It's free and uses your GitHub account for authorization and authentication
2. Sign up for a [DigitalOcean](https://cloud.digitalocean.com/registrations/new) account
3. Create a [Personal Access Token](https://www.digitalocean.com/docs/apis-clis/api/create-personal-access-token/) in DigitalOcean
4. Crate an [SSH key](https://www.digitalocean.com/docs/droplets/how-to/add-ssh-keys/create-with-openssh/) and [upload your ssh
key](https://www.digitalocean.com/docs/droplets/how-to/add-ssh-keys/to-account/) to your DigitalOcean account
5. In CircleCI [add this project](https://circleci.com/docs/2.0/project-build/)
6. In the CircleCI [project settings add the following environment variables:](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project) 
  * `DIGITALOCEAN_API_TOKEN` - the value should be your DigitalOcean Personal Access token
  * `TF_VAR_do_token` - the value should be your DigitalOcean Personal Access token
  * `TF_VAR_ssh_fingerprint` - the value should be the SSH fingerprint of the public key you added to your DigitalOcean account

### Start building

Now that you've got everything setup all you need to do is run the CircleCI workflow on the master branch. Anytime you make commits and they 
land on the master branch it will create a honeypot. You can change the CircleCI workflow to do whatever you want. 

## Uses

### ssh-honeypot

This project was created by the one and only [Daniel Roberson](https://github.com/droberson/).

This project uses `ssh-honeypot` as the SSH honeypot mechanism itself. 
This project was choosen because of how easy it is to get the honeypot set up and view logs at `/var/log/ssh-honeypot`. 
Please check out the rest of Daniel's work and give him a follow. 

### DigitalOcean

DigitalOcean is a cloud provider that makes it simple to launch in the cloud and scale up.

This project uses DigitalOcean as the cloud provider that hosts the `honeypot` virtual machine. DigitalOcean was uses with this project because of it's ease of 
use, simple billing model, and great documentation.

### Packer

Packer allows you to build automated machine images. This project uses Packer to create an image with the `ssh-honeypot` installed on it. 


### Terraform

Terraform allows us to express infrastructure as code. 

Once the image is created all we need to do is create a droplet using our new image.
We Terraform to create a droplet from the most recently created `honeypot` image.
This project uses Terraform as it is currently one of the most prominent infrastructure-as-code tools.

### CircleCi

CircleCi is a continuous integration and delivery platform.

This project uses CircleCi as the CI/CD pipeline to piece the whole project together. It is responsible for the following:
* Run the job that validates our Packer template file
* Run the job that creates the `honeypot` image using Packer on DigitalOcean
* Run the job that creates a new droplet using the most recent `honeypot` image

This project uses CircleCi because it is easy to get setup with, very powerful, and has a great free plan if you already have a GitHub account. 
