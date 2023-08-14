# Introduction
There are requirements before you can provision resources on Huawei Cloud with terraform

# Tasks
## Install Terraform
If you haven't installed the Terraform on your computer yet, Please refer to the ![Terraform Document](https://developer.hashicorp.com/terraform/downloads)

## Install Git
If you haven't installed the Git tool on your computer yet, Please download ![Git](https://git-scm.com/download/win) and install it first

## Install Visual Studio Code
we recommend using ![Visual Studio Code](https://code.visualstudio.com/download) to edit terraform configuration, but you can choose whatever text editors you like.

## Configure Environment Variables
Before you run any terraform code, Please configure the environment variables accordingly

There are two sets of environment variables that you need to configure during the workshop, one set of environment variable allows terraform to access Huawei Cloud, another allows terraform to read and write state file in OBS bucket.

According to your local environment, choose one of the following methods, you will be reminded if there is a need to configure the environment variable, Please choose one of the following methods accordingly.

### Linux
1. Configure environment for accessing OBS
```
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="ap-southeast-3"
```
2. Configure environment for accessing Huawei Cloud
```
export HW_ACCESS_KEY="anaccesskey"
export HW_SECRET_KEY="asecretkey"
export HW_REGION_NAME="ap-southeast-3"
```

### Windows CMD
1. Configure environment for accessing OBS
```
setx AWS_ACCESS_KEY_ID "anaccesskey"
setx AWS_SECRET_ACCESS_KEY "asecretkey"
setx AWS_DEFAULT_REGION "ap-southeast-3"
```
2. Configure environment for accessing Huawei Cloud
```
setx HW_ACCESS_KEY "anaccesskey"
setx HW_SECRET_KEY "asecretkey"
setx HW_REGION_NAME "ap-southeast-3"
```

### Powershell
1. Configure environment for accessing OBS
```
$Env:AWS_ACCESS_KEY_ID="anaccesskey"
$Env:AWS_SECRET_ACCESS_KEY="asecretkey"
$Env:AWS_DEFAULT_REGION="ap-southeast-3"
```
2. Configure environment for accessing Huawei Cloud
```
$Env:HW_ACCESS_KEY="anaccesskey"
$Env:HW_SECRET_KEY="asecretkey"
$Env:HW_REGION_NAME="ap-southeast-3"
```
