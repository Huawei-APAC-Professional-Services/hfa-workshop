# HFA Reference Implementation

HFA is a well-architected, multi-account Huawei Cloud environment that  is a starting point from which you can deploy workloads and applications. It provides a baseline to get started with multi-account architecture, identity and access management, governance, data security, network design, and logging.

HFA ollows key design principles across different design areas which accommodate all application portfolios and enable application migration, modernization, and innovation at scale.

This is reference implementation of Huaweicloud HFA, this implementation will initialize the following accounts in HFA:
* Centralized IAM Account
* Common Services Account
* Transit Account
* Security Account
* Production Account(workloads)

# Procedures To Terraform HFA
Implementing all HFA elements through Terraform at this stage is not possible because of service limitations, you need to follow the following steps precisely to accomplish the goal.

# Security Account

The security account serves as the central account for security operation and archiving security related logs across HFA accounts. 

One OBS bucket in security account will be used to store all CTS system trace data that can only be accessed by security team out of security investigation and security operation purpose and by audit team for compliance reason.

For some enterprises, security operation relies on security solutions like SIEM, EASM, etc. The current HFA Terraform implementation does not including all those customized configurations, Please talk to customers and implement it in HFA-Security Level.

Due to the current limitations of Terraform Huawei Cloud provider, the security Account can not be configured entirely through Terraform. The following configurations need to be configured manually, please refer to [Security Account Configuration](./workshop/08_Security_Setup.md) for details.

* Enable CTS

For all other configurations that will be configured automatically, Please refer to [Security Account Terraform Implementation](./HFA-Security/Log.md#security-account)

