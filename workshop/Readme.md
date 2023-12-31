# Introduction 
This workshop demonstrates a typical HFA implementation on Huawei Cloud using Terraform, but at the time of this writing, an end-to-end and fully automated Terraform implementation is not possible because some cloud services and features of cloud service are not provide API for programatic access. 

We hope this workshop will help you gain the necessary knowledge about HFA and Terraform hands-on experiences to help customer build their Huawei Cloud environment following the best practices and state-of-art cloud management concepts.

# Goals

* Build a basic HFA environment
* Expanse the environment with confidence

# Target audience
This is a technical workshop helping customer build their Huawei Cloud HFA environment with Terraform. The participants should have experiences with Huawei Cloud and have basic knowledge of HFA.

# Prerequisites
Unless you participate a workshop hosted by Huawei APAC Professional Service, you will need to meet the following requirements to complete the workshop.

* A Huawei Cloud account - Master/Management Account
* 5 email addresses, one for each of the following Huawei Cloud accounts:
    * Centralized IAM account - The Account for managing access to HFA environment
    * Transit Account - where some core network services are deployed
    * Security Operation Account - where security related logs like CTS logs are stored and in where security services like SIEM might be managed
    * Common Services Account - where shared services are deployed
    * Application Account - where production workloads are deployed

you can use Plus Addressing to reduce the complexity of managing multiple email addresses. if your email address is `g@gmail.com`, you can use `g+iam@gmail.com` or `g+transit@gmail.com` to register with Huawei Cloud, all the addresses are valid and can reach the inbox of the `g@gmail.com`.

Whenever we mention a account with a conventional name in this workshop, you can map it to a account entity provided by the workshop facilitators. Please refer to the following table to log in to specific HFA member account to finish the hands-on lab accordingly.

| Account Name | Conventional Name |
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
    Account[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa-workshop/blob/main/workshop/content/01_Account_Management.md'>Account Management</a>]
    style Account fill:#33FF36,stroke:#333,stroke-width:1px
    Account --> AccountInitialization[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa-workshop/blob/main/workshop/content/02_Account_Initialization.md'>Account Initialization</a>]
    style AccountInitialization fill:#33FF36,stroke:#333,stroke-width:1px
    AccountInitialization --> LocalEnvironmentSetup[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa-workshop/blob/main/workshop/content/03_Local_Env_Setup.md'>Local Environment Setup</a>]
    style LocalEnvironmentSetup fill:#3633FF,stroke:#333,stroke-width:1px
    LocalEnvironmentSetup --> HFA_IAM_Configuration[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa-workshop/blob/main/workshop/content/04_HFA_IAM_Configuration.md'>HFA IAM Configuration</a>]
    style HFA_IAM_Configuration fill:#33FF36,stroke:#333,stroke-width:1px
    HFA_IAM_Configuration --> HFA_Base_Configuration[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa-workshop/blob/main/workshop/content/05_HFA_Base_Configuration.md'>HFA Base Configuration</a>]
    style HFA_Base_Configuration fill:#33FF36,stroke:#333,stroke-width:1px
     HFA_IAM_Configuration --> HFA_Network_Configuration[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa-workshop/blob/main/workshop/content/06_HFA_Network_Configuration.md'>HFA Network Configuration</a>]
    style HFA_Network_Configuration fill:#33FF36,stroke:#333,stroke-width:1px
    HFA_Network_Configuration --> HFA_Application_Deployment[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa-workshop/blob/main/workshop/content/07_HFA_Application_Deployment.md'>HFA Application Deployment</a>]
    HFA_Base_Configuration --> HFA_Application_Deployment
    style HFA_Application_Deployment fill:#33FF36,stroke:#333,stroke-width:1px
    HFA_Application_Deployment --> HFA_Integration[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa-workshop/blob/main/workshop/content/08_HFA_Integration.md'>HFA Integration</a>]
    style HFA_Integration fill:#33FF36,stroke:#333,stroke-width:1px
    HFA_Integration --> HFA_Challenge[<a href='https://github.com/Huawei-APAC-Professional-Services/hfa-workshop/blob/main/workshop/content/09_HFA_Challenge.md'>HFA Challenge</a>]
    style HFA_Challenge fill:#33FF36,stroke:#333,stroke-width:1px
```