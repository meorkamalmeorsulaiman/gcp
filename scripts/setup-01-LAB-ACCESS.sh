#!/bin/bash

cd ~/gcp
scp 192.168.101.247:tf-state/01-LAB-ACCESS/terraform.tfstate 01-LAB-ACCESS
cd 01-LAB-ACCESS
terraform init -migrate-state
