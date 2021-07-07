#Automation terraform assignment 1:

#Group 7 
#Team members: Naga sai mounika panangipalli,Vamsi Krishna Lakshmipuram

#modules- this directory consists of individual modules
#root main.tf has source path for all modules 
#backend.tf - this file has the storage account for the azure

#modules : 1. network - this module has details like subnets,virtual networks,security groups
#2. vmlinux- all resources related to linux virtual machine
#3. vmwindows - all resources related to windows virtual machine
#4. loadbalancer - created a load balancer with linux vm's behind it
#5. rgroup - resource group details
#6. common - this module has recoveryservicesvault,loganalytics,storage account with blob container
#7. datadisk - Three 10 GB disks created and attached to each of the three VMs.
#8. database - : One Azure DB for PostgreSQL instance
