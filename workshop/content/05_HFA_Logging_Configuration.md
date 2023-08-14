# Introduction
Currently due to the limitations of IAM, OBS does not support creating bucket from another account by switching role, so the bucket for centralized logging must be created manually. in the future, if iam allowed assumed role to create the OBS bucket, the bucket can be imported to terraform state.

# Tasks
## Create OBS bucket in `Security Operation Account` for central logging
1. Log in to `Security Operation Account` using Huawei Cloud account credential
2. From `Service List`, select `Object Storage Service` and choose `Create Bucket`
3. On the creation page,  select `AP-Singapore` as the region, and provide a uniq name, for the workshop, the default value for the rest parameters is sufficient.
![CreateBucket](./images/Logging/001_CreateBucket_01.png)

## Enable CTS in `Security Operation Account`
1. Log in to `Security Operation Account` using Huawei Cloud account credential
2. From `Service List`, search `cts` and choose `Cloud Trace Service`
![SelectCTS](./images/Logging/002_cts_01.png)
3. On the left side panel of `Cloud Trace Service`, Choose `Tracker List` and Click `+Enable CTS` on the top right corner of the page
![EnableCTS](./images/Logging/002_cts_02.png)
4. On the Pop-up browser window, choose `Enable`
![EnableCTS01](./images/Logging/002_cts_04.png)
5. After the system tracker is created， Choose `Configure` under the `Operation` column
![EnableCTS02](./images/Logging/002_cts_05.png)
6. In the configuration, change the configuration to allow CTS transfer log to the LTS
![Transferlog](./images/Logging/002_cts_08.png)
7. From `Service List`, search `lts` and choose `Log Tank Service`
![lts01](./images/Logging/003_lts_01.png)
8. On the left side panel of `Log Tank Service`, Choose `Log Transfer`
![lts02](./images/Logging/003_lts_02.png)
9. Choose `Configure Log Transfer` on the upper right corner of the console
10. Configure Log Transfer to transfer cts log to the bucket created in ![The Firt task](#create-obs-bucket-in-security-operation-account-for-central-logging)
![lts03](./images/Logging/003_lts_03.png)

## Enable CTS in other accounts
1. Log in to `Centralized IAM Account`, `Transit Account`, `Common Services Account` and `Production Account` to do the following configuration separately
2. From `Service List`, search `cts` and choose `Cloud Trace Service`
![SelectCTS](./images/Logging/002_cts_01.png)
3. On the left side panel of `Cloud Trace Service`, Choose `Tracker List` and Click `+Enable CTS` on the top right corner of the page
![EnableCTS](./images/Logging/002_cts_02.png)
4. On the Pop-up browser window, choose `Enable`
![EnableCTS01](./images/Logging/002_cts_04.png)
5. After the system tracker is created， Choose `Configure` under the `Operation` column
![EnableCTS02](./images/Logging/002_cts_05.png)
6. In the configuration, change the configuration to allow CTS transfer log to the LTS
![Transferlog](./images/Logging/002_cts_08.png)

## Transfer CTS Log to `Security Operation Account`
1. Log in to `Security Operation Account` using Huawei Cloud account credential
2. From `Service List`, search `lts` and choose `Log Tank Service`
![lts01](./images/Logging/003_lts_01.png)
3. On the left side panel of `Log Tank Service`, Choose `Log Transfer`
![lts02](./images/Logging/003_lts_02.png)
4. Choose `Configure Log Transfer` on the upper right corner of the console
5. In the configuration page, configure the parameters as following:
* Agency Name: `hfa_log_transfer`
* Delegator Account Name: member accounts of this organization
* Enable Transfer: true
* Transfer Destination: OBS
* Log Group Name: CTS
* Log Stream Name: system-trace
* OBS Bucket: Name of the bucket created in ![The Firt task](#create-obs-bucket-in-security-operation-account-for-central-logging)
![lts04](./images/Logging/003_lts_04.png)
6. Repeat step 4 to step 5 until all member accounts have been configured