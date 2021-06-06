# http_server
A dead simple Ruby web server.
Serves on port 80.
/healthcheck path returns "OK"
All other paths return "Well, hello there!"

`$ ruby webserver.rb`

Architecture  ----> 

Docker 
<---->
Docker file used to build the image for of the ruby app. 

Ansible
<------>
Ansible playbook is used to automate the below steps -
a) Build docker image using the Dockerfile 
b) push the image to the dockerhub


Terraform 
<------->
Terraform is used to create a deployment for the app and deploy to the kubernetes cluster.

Jenkins
<---------->
Jenkins pipeline for continous deployment and to orchestrate the below - 
a) repository clone
b) ansible playbook run 
c) terraform apply to deploy to the kubernetes cluster


Steps to recreate the scenerio. 
<----------------------------->


Prerequisites -
minikube kubernetes cluster in running state
Docker tool is installed on machine
Ansible is installed on the machine 
Terraform installed on machine 
jenkins installed and job configured to run through pipeline**

Note -  For pushing docker images to docker hub we can need to authenticate. Please add username and password in file playbook under task "login  docker registry"

Step 1 - Clone the repository https://github.com/Sureshjoshi01/adjust-task
Step 2 - cd  adjust-task 
Step 3 - run command 
         ansible -i hosts playbook.yaml 
         this will create the app image and push to dockehub repository. 
Step 4 -  cd  terraform 
Step 5 - run below commands 
         terraform init 
         terraform apply 

To check that application is deployed successfully, the the app url by running below command - 
minikube service --url http-server


**Note -To use jenkins file jenkins instance is needed and all tools with cli paths needed to be configured. Not tested. 

