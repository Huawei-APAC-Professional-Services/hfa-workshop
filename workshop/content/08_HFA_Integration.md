# Introduction
This module will responsible for connecting different components on different layer

# Tasks
## Configure Environment Variables
1. Change to `hfa/HFA-IAM` directory
2. Execute the following commands with `hfa_terraform` credential to get AK/SK for this module(if you are in a team to apply this module, Please ask your team member who is responsible for HFA IAM Configuration to execute the following command and provide you the AK/SK)
```
terraform output hfa_iam_pipeline_integration_ak
terraform output hfa_iam_pipeline_integration_sk
```
`hfa_iam_pipeline_network_ak` and `hfa_iam_pipeline_network_sk` allow terraform to read/write terraform state file and make API call to Huawei Cloud to create network resources
![GetAKSK](./images/network/001_network_aksk.png)

3. Follow the instructions in [Loal Environment Setup](./03_Local_Env_Setup.md#configure-environment-variables) to configure both sets of environment variables.
The following figure use powershell as example
[SetupEnvironmentVariables](./images/network/001_network_aksk_01.png)

## Apply hfa/HFA-Integration Configuration
4. Change to  `hfa/HFA-Integration` directory
5. Open `obs.tfbackend` file to configure terraform backend
6. Only change the `bucket` parameters to the name of the bucket that you created in the [Account Initialization](./02_Account_Initialization.md#create-a-obs-bucket-for-terraform-state-storage)
7. Open `terraform.tfvars` file to configure input variables
8. Change `hfa_terraform_state_bucket` to match your environment
9. Execute the following commands to format terraform configuration and Initialize terraform
```
terraform fmt
terraform init -backend-config="obs.tfbackend"
```
10. Execute `terraform validate` to validate the correctness of the terraform configuration, you should get the following result:
```
Success! The configuration is valid
```

11. Execute `terraform plan` to generate a execution plan and view all the changes
12. Execute `terraform apply` to apply all the configuration to Huawei Cloud
13. Access the nginx through the address provided by this module to check if you can access a nginx welcome page.