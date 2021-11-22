# Purpose
The purpose of this document is to help you set up an IaC pipeline to deploy GCP infrastructure from Terraform code in GitHub using Cloud Build. The initial deployment is bespoke for a test org where you are the sole owner and are using the specific “out of box” pipelines. This could also just be used for learning purposes. 

# Pre-requisites
* Must have GitHub account that you can create a private repo within
* Must have an IDE set up and connected to your GitHub account
* Must have a GCP org node with Org Admin permissions
* Must have a GCP billing account with Billing Admin permissions

# Setup
1. Create your own new private GitHub repo 
2. Copy the code from the below repo into your new private repo
   1. https://github.com/john-hurringjr/test-org-sample
3. Connect  your IDE to this new repo 
4. Navigate to your Org Node IAM
   1. Don't forget, you need project creator in your org and service usage admin 
5. Open cloud shell 
   1. Run the following command:
    ```bash
    git clone https://github.com/john-hurringjr/build-trigger-bootstrap.git
    ```
6. Connect to the projectbootstrap folder 
    ```bash
    cd build-trigger-bootstrap/projectbootstrap 
    ```
7. For the variables in the projectbootstrap folder Terraform:
   1. unique_id 
      1. This should be a short (6 characters or less) unique identifier you’ll use in your org. For example, jchtst 
   2. org_id 
      1. Your org ID 
   3. billing_account_id 
      1. The appropriate billing account ID 
   4. user_id 
      1. Your user ID which will be granted a set of predefined roles on the bootstrap project 
   5. extra_apis_to_enable 
      1. Leave blank unless you’ve gone through this before and know there are extra APIs you want to enable. 
8. Create project 
   1. Run the following commands:
    ```bash
    terraform init
    ```
    ```bash
    terraform plan
    ```
    ```bash
    terraform apply
    ```
9. Navigate to newly created project and follow the instructions to connect to your GitHub 
10. After connecting your repo, go back to cloud shell and connect to the triggerbootstrap folder. 
    1. From home directory: cd build-trigger-bootstrap/triggerbootstrap 
    2. From projectbootstrap: cd ../triggerbootstrap 
    3. For the variables:
       1. Project_id 
          1. This is the ID of the project you just created
       2. Github_repo_owner 
          1. This is your github ID 
          2. What is the owner of the repo?  For example: The owner for https://github.com/googlecloudplatform/cloud-builders is googlecloudplatform 
       3. Github_repo_name 
          1. This is your github repo name 
          2. What is the name of the repo under that owner? For example: The name for https://github.com/googlecloudplatform/cloud-builders is cloud-builders 
       4. Please note, you may also add the following variables if you wish to make changes, but it’s not necessary:
          1. First_trigger_folder 
             1. I have assumed you are using the sample structure provided where the code to build triggers is located in a folder called “00-triggers”. If you have changed the name of this or want to trigger off another folder location in your code please edit this. 
          2. gcs_terraform_backend_bucket_location 
             1. This is defaulted to US multiregional. If you wish you may change to ASIA or EU. Only multi regional is supported 
          3. Push_branch_trigger_plan 
             1. I have defaulted this to the “development” branch. I.e. when you push to development this will trigger a plan to run. If you want to edit this to another branch you may. 
11. Create the trigger 
    1. Run the following commands:
    ```bash
    terraform init
    ```
    ```bash
    terraform plan
    ```
    ```bash
    terraform apply
    ```
12. Grant the 01 Service Account the Organization Administrator predefined role as well as the Organization Policy Administrator predefined role to your Org Node 
    1. You’ll need to navigate to your project and view the actual service account created for your 01-org-iam-policies pipeline 
13. Grant the 01 Service Account the Billing Administrator predefined role on your Billing Account 
    1. You’ll need to navigate to your project and view the actual service account created for your 01-org-iam-policies pipeline 
14. Go to your IDE where you have your code and create a new branch called “development”. This is the branch we’ll be pushing to and which our triggers are watching for so they may run “Terraform Plan” 
15. 01 Folder Deployment 
    1. Go to your 01 folder in your code and update the input variables with your values 
    2. Again you’ll need to pull some SA’s from this project to enter as input here 
    3. Go to the backend.tf file and update the GCS bucket name to the actual bucket name from your project. Note, you shouldn’t have to edit the prefix. 
    4. Push your changes and validate that the run complete successfully by navigating to Cloud Build history in the Cloud Console 
    5. After validating the push-and-plan ran successfully, navigate to your GitHub and submit a pull request (don’t forget to comment “/gcbrun”!)
    6. Validate it deploys successfully 
    7. Merge your pull request 
16. Repeat step 14 for the rest of the folders

# New Pipeline
To create a new pipeline complete the following:
1. Create the new folder in your code (I recommend continuing the numerical ordering but it’s up to you). Make sure the folder name is short (25 characters or less)
2. Go to the 00-triggers “inputs.auto.tfvars” file and add a new list entry for “code_folders” and make it the exact same name as you did in step 1 
3. Run 00-trigger pipeline (i.e. push your code then pull request and merge)
4. After your new trigger has been set up, add the code you want to your new folder. Follow the same steps you normally would to deploy (push, pull, merge)
