#!/bin/bash

cd ~/gcp
scp strg01:tf-state/01-LAB-ACCESS/terraform.tfstate 01-LAB-ACCESS
cd 01-LAB-ACCESS
terraform init -migrate-state
