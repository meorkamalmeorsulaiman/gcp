#!/bin/bash

cd ~/gcp/01-LAB-ACCESS
scp terraform.tfstate 192.168.101.247:tf-state/01-LAB-ACCESS/terraform.tfstate
rm -rf .terraform terraform.tfstate* .terraform.lock.hcl
