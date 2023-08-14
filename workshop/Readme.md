# Introduction 
This workshop demonstrates a typical HFA implementation on Huawei Cloud using Terraform, but at the time of this writing, an end-to-end and fully automated Terraform implementation is not possible because some cloud services and features of cloud service are not provide API for programatic access. 

We hope this workshop will help you gain the necessary knowledge about HFA and Terraform hands-on experiences to help customer build their Huawei Cloud environment following the best practices and state-of-art cloud management concepts.

# Goals

* Build a basic HFA environment
* Expanse the environment with confidence

# Target audience
This is a technical workshop helping customer build their Huawei Cloud HFA environment with Terraform. The participants should have familiarity with Huawei Cloud and HFA as well.

# Prerequisites
Unless you participate a guided workshop, you will need to meet the requirements below to complete the work hop.

* A Huawei Cloud account - Master/Management Account
* 5 email addresses, one for each of the following Huawei Cloud accounts:
    * Centralized IAM account - The Account for managing access to HFA environment
    * Transit Account - where some core network services are deployed
    * Security Operation Account - where security related logs like CTS logs are stored and from where security services like SIEM might be managed
    * Common Services Account - where shared services are deployed
    * Application Account - where production workloads are deployed

you can use Plus Addressing to reduce the complexity of managing multiple email addresses. if your email address is `g@gmail.com`, you can use `g+iam@gmail.com` or `g+transit@gmail.com` to register with Huawei Cloud, all the addresses are valid and can reach the inbox of the `g@gmail.com`.

# Guided workshop
You will get a list of Huawei Cloud accounts if you participate a workshop hosting by Huawei. we will use a conventional name to identify all those accounts, Please refer to the following table for the relationship between a account alias and its conventional name.

| Account Alias | Conventional Name |
| ------------- | ----------------- |
| ${prefix}_iam | Centralized IAM Account |
| ${prefix}_security | Security Operation Account |
| ${prefix}_transit | Transit Account |
| ${prefix}_common  | Common Services Account |
| ${prefix}_app     | Production Account |

# Modules
Following the sequence to implement HFA on Huawei Cloud

```mermaid
flowchart LR
    Start[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa/blob/main/workshop/content/00_CustomerCase.md'>Customer Case</a>] --> Account[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa/blob/main/workshop/content/01_AccountManagement.md'>Account Management</a>]
    Account --> AccountInitialization[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa/blob/main/workshop/content/02_AccountInitialization.md'>Account Initialization</a>]
    
```