#!/bin/bash

cd ~/gcp/01-LAB-ACCESS
scp terraform.tfstate strg02:tf-state/01-LAB-ACCESS/terraform.tfstate
rm -rf .terraform terraform.tfstate* .terraform.lock.hcl
