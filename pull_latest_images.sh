#!/bin/bash

# ECR/Docker login
$(aws ecr get-login --region eu-west-1 --no-include-email)

docker-compose pull
