#! /bin/bash

REGION=us-east-1
ACCOUNT=682452625784
TOKEN=`aws ecr get-login --region ${REGION} --registry-ids ${ACCOUNT} | cut -d' ' -f6`
echo "Login to Docker"

sudo docker login -u AWS -p $TOKEN 682452625784.dkr.ecr.us-east-1.amazonaws.com
echo "Login succeeded"
echo" Building Docker Image"
sudo docker build -f Dockerfile -t qdb .

echo "Image Building succeeded"
sudo docker tag qdb ${ACCOUNT}.dkr.ecr.us-east-1.amazonaws.com/qdb
sudo docker push ${ACCOUNT}.dkr.ecr.us-east-1.amazonaws.com/qdb:latest

echo "Pushed the Image into ECR"
