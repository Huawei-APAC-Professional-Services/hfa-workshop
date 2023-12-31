# Introduction
This module will responsible for creating all the network resources across different account.

# Tasks
## Configure Environment Variables
1. Change to `hfa/HFA-IAM` directory
2. Execute the following commands with `hfa_terraform` user credential to get AK/SK for this module(if you are in a team to apply this module, Please ask your team member who is responsible for HFA IAM Configuration to execute the following command and provide you the AK/SK)
```
terraform output hfa_iam_pipeline_network_ak
terraform output hfa_iam_pipeline_network_sk
```
`hfa_iam_pipeline_network_ak` and `hfa_iam_pipeline_network_sk` allow terraform to read/write terraform state file and make API call to Huawei Cloud to create network resources
![GetAKSK](./images/network/001_network_aksk.png)

3. Follow the instructions in [Loal Environment Setup](./03_Local_Env_Setup.md#configure-environment-variables) to configure both sets of environment variables.
The following figure use powershell as example
[SetupEnvironmentVariables](./images/network/001_network_aksk_01.png)

## Create Basic Network Resources
1. Change to  `hfa/HFA-Network` directory
2. Open `obs.tfbackend` file to configure terraform backend
3. Only change the `bucket` parameters to the name of the bucket that you created in the [Account Initialization](./02_Account_Initialization.md#create-a-obs-bucket-for-terraform-state-storage)
4. Open `terraform.tfvars` file to configure input variables
5. Change `hfa_terraform_state_bucket` to match your environment, you can leave all the cidr as it is if you don't have specific requirements.
6. Execute the following commands to format terraform configuration and Initialize terraform
```
terraform fmt
terraform init -backend-config="obs.tfbackend"
```
![TerraformInitialization](./images/network/001_network_init.png)

7. Execute `terraform validate` to validate the correctness of the terraform configuration, you should get the following result:
```
Success! The configuration is valid
```

8. Execute `terraform plan` to generate a execution plan and view all the changes
![TerraformPlan01](./images/network/001_network_plan_01.png)
![TerraformPlan02](./images/network/001_network_plan_02.png)

9. Execute `terraform apply` to apply all the configuration to Huawei Cloud

10. Log in to the `Common Services Account` and `Production Account` separately
11. Click the username and select `My Credentials` from the drop-down list
12. Copy and save the `Account ID` for future use
![domainid](./images/network/002_network_share_01.png)
13. Log in to the `Transit Account`
14. From `Service List`, choose `Enterprise Router`
15. On the ER page, click `Manage sharing` button
![er01](./images/network/003_network_er_02.png)
16. On the new page, click `Sahre Enterprise Router` and provide the saved account id to share ER with `Common Services Account` and `Production Account`
![er02](./images/network/003_network_er_03.png)
![er03](./images/network/003_network_er_04.png)
17. Change to  `hfa/HFA-Network-workloads` directory
18. Open `obs.tfbackend` file to configure terraform backend
19. Only change the `bucket` parameters to the name of the bucket that you created in the [Account Initialization](./02_Account_Initialization.md#create-a-obs-bucket-for-terraform-state-storage)
20. Open `terraform.tfvars` file to configure input variables
21. Change `hfa_terraform_state_bucket` to match your environment, you can leave all the cidr as it is if you don't have specific requirements.

22. Execute the following commands to format terraform configuration and Initialize terraform
```
terraform fmt
terraform init -backend-config="obs.tfbackend"
```
23. Execute `terraform apply` command