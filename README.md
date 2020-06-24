# Clouds of Honey
Automates creating an SSH honeypot so you can get to the fun stuff. ;) 

The project uses the following tools: 
* [Circleci](https://circleci.com)
* [DigitalOcean](https://www.digitalocean.com)
* [Packer](https://www.packer.io/) 
* [Terraform](https://https://www.terraform.io/)
* [ssh-honeypot](https://github.com/droberson/ssh-honeypot)

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
