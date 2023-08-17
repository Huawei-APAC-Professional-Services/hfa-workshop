# Introduction
Security Logs are important for security operation, we will transfer all CTS logs from every region of every account to the `Security Operation Account` for log archive.

# Tasks
## Configure Environment Variables
1. Change to `hfa/HFA-Base` directory
2. Execute the following commands with `hfa_terraform` credential to get AK/SK for this module
```
terraform output hfa_iam_pipeline_network_ak
terraform output hfa_iam_pipeline_network_sk
```
3. Follow the instructions in [Loal Environment Setup](./03_Local_Env_Setup.md#configure-environment-variables) to configure both sets of environment variables.
The following figure use powershell as example
[SetupEnvironmentVariables](./images/network/001_network_aksk_01.png)

4. Open `obs.tfbackend` file to configure terraform backend
5. Change the `bucket` parameters to the name of the bucket that you created in the [hfa_terraform policy](./02_Account_Initialization.md#create-a-obs-bucket-for-terraform-state-storage)
6. Open `terraform.tfvars` file to configure input variables
7. Change `hfa_terraform_state_bucket` to match your environment, you can leave all the cidr as it is if you don't have specific requirements.
8. Execute the following commands to format terraform configuration and Initialize terraform
```
terraform fmt
terraform init -backend-config="obs.tfbackend"
```

9. Execute `terraform validate` to validate the correctness of the terraform configuration, you should get the following result:
```
Success! The configuration is valid
```

10. Execute `terraform plan` to generate a execution plan and view all the changes

11. Execute `terraform apply` to apply all the configuration to Huawei Cloud