# Introduction
In this workshop, the following organization structure are designed for the customer to meet their business and governance requirements.

This is the foundation of this workshop, all the OUs and accounts must be created manually.

```mermaid
erDiagram
    Master_Organization ||--|| Core_OU : contains
    Master_Organization ||--|| Production_OU : contains
    Core_OU ||--o{ Centralized_IAM_Account : contains
    Core_OU ||--o{ Transit_Account : contains
    Core_OU ||--o{ Security_Operation_Account : contains
    Core_OU ||--o{ Common_Services_Account : contains
    Production_OU ||--o{ Production_Account : contains
``` 
# Tasks
## Create OU
1. Login into Master Account
2. On the top panel of Huawei Cloud console, Choose "More" -> "Enterprise" -> "Organizations and Accounts"
![GotoOrganizationService](./images/001_CreateOU.png)
3. Under `Organizations and Accounts`, choose `Create Organization`
![CreateOU](./images/002_CreateOU.png)
4. Create the core OU first, choose the root level as the `Parent Organization`
![CreateCoreOU](./images/003_CreateCoreOU.png)
5. Create the production OU,choose the root level as the `Parent Organization`
![CreateProductionOU](./images/003_CreateProductionOU.png)

## Create Accounts
1. Login into Master Account
2. On the top panel of Huawei Cloud console, Choose "More" -> "Enterprise" -> "Organizations and Accounts"
![GotoOrganizationService](./images/001_CreateOU.png)
3. On the `Organization Management` page, choose `Add member account` at the `Operation` field for a specific OU
![CreateAccountStep1](./images/004_CreateAccounts.png)
4. On the new page, choose `Create Member Account`
![CreateAccountStep2](./images/005_CreateAccounts_01.png)
5. Choose `Next`, provide the Account Name and Email Address as defined before
![CreateAccountStep3](./images/005_CreateAccounts_02.png)
6. Choose `Next`, provide a alias for the to be created account and select the permission for managing your member account
![CreateAccountStep4](./images/005_CreateAccounts_03.png)
7. Choose `Next`, check if all the information is correct, choose `Obtain Verification Code` to send a verification code to the provided email address, once you get the verification code, enter the verification code and choose `Submit` to finish account creation process
![CreateAccountStep5](./images/005_CreateAccounts_04.png)
8. Create all other accounts by repeating step 3 to 7
