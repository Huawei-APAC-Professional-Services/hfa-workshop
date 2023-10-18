# Introduction
Security Logs are important for security operation, we will transfer all CTS logs from every region of every account to the `Security Operation Account` for log archive.

# Tasks
## Configure Environment Variables
1. Change to `hfa/HFA-IAM` directory
2. Execute the following commands with `hfa_terraform` user credential to get AK/SK for this module(if you are in a team to apply this module, Please ask your team member who is responsible for [HFA IAM Configuration](./04_HFA_IAM_Configuration.md) to execute the following command and provide you the AK/SK)
```
terraform output hfa_iam_pipeline_base_ak
terraform output hfa_iam_pipeline_base_sk
```
3. Follow the instructions in [Loal Environment Setup](./03_Local_Env_Setup.md#configure-environment-variables) to configure both sets of environment variables.
The following figure use powershell as example
[SetupEnvironmentVariables](./images/network/001_network_aksk_01.png)

## Apply hfa/HFA-Base Configuration
1. Change to `hfa/HFA-Base` directory
2. Open `obs.tfbackend` file to configure terraform backend
3. Change the `bucket` parameters to the name of the bucket that you created in the [Account Initialization](./02_Account_Initialization.md#create-a-obs-bucket-for-terraform-state-storage)
4. Open `terraform.tfvars` file to configure input variables
   * `hfa_terraform_state_bucket`: the bucket that you created in the [Account Initialization](./02_Account_Initialization.md#create-a-obs-bucket-for-terraform-state-storage)
   * `hfa_cts_notification_email_address`: the email you would like to receive security alerts
   * `hfa_security_obs_bucket_name`: obs bucket name that store logging, it name must be uniq

6. Execute the following commands to format terraform configuration and Initialize terraform
```
terraform fmt
terraform init -backend-config="obs.tfbackend"
```

7. Execute `terraform validate` to validate the correctness of the terraform configuration, you should get the following result:
```
Success! The configuration is valid
```

8. Execute `terraform plan` to generate a execution plan and view all the changes

9. Execute `terraform apply` to apply all the configuration to Huawei Cloud