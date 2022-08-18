# Bhagwat Sapkota Final Project

This is the final project that combines everything learned so far.

# DevOps Lifecycle with AWS

In this project, you’ll be creating the infra using terraform and will perform application/tool stack configuration using shell scripts and will effectively use Jenkins for running automated CICD for both the application and infra deployment. Provisioning a managed EKS cluster and setting up a mutable environment setup which ensures the HA and Resilience of the application. 

Post-Mortem SRE Scoped Project: 


Install and configure the monitoring tool stack (Splunk and Dynatrace) to monitor the Application and Infra which is very essential for every production software system.


# Steps Check list and Complition
    Step 1: Setting up an EC2 for Jenkins - Complete
    step 2: Set up jenkins on EC2 - Complete
    step 3: Create Terraform Script to create an EKS Cluster - Complete
    Step 4: Create a pipeline in jenkins - complete
    step 5: Create culster using jenkins and terraform - complete
    step 6: Deploy an app on cluster - Complete
    Step 7: Monitor with Dynatrace - in-progress
    Step 8: Make pipeline portable - in-progress
    Step 9: monitor with Splunk - Ran out of time

# Issues Experienced

IAM user authentication issue with creation of Role policies. I experienced a lot of Issue with that. it took me almost a whole day to figure it out. I also had some issue with kubectl authentication and took some time to fix it.