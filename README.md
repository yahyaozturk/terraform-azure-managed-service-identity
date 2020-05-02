# Problem Definition
If you want to provision infrastructure by CI/CD job to make the development team self-sufficient, the main challenge to keep Cloud Credentials secured. CI/CD is not a trusted environment, credentials can not be stored on it either in the repo or runtime variable.

In this repo you will find a terraform script to provision a Gitlab Runner on Azure as VM and system identity is enabled. 

I also try to fix a couple of common problems related Gitlab Runner provioning and terraform state.

- Terraform state cannot be stored on local, this should be generally available because of infra history
- Gitlab Runner should be provisioned automatically and needs to be ready for build without manual interaction
- Gitlab Runner needs to be unregistered during de-provisioning

## Solution
In order to secure CI/CD process I proposed to use Managed Service Identity method for Azure Cloud (https://www.terraform.io/docs/providers/azurerm/guides/managed_service_identity.html).

Managed identities for Azure resources can be used to authenticate to services that support Azure Active Directory (Azure AD) authentication. There are two types of managed identities: system-assigned and user-assigned. This article is based on system-assigned managed identities.

For more information please visit : https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview


## How to apply the solution
Please change variables to apply terraform script

- make sure to have azure cli installed
- make sure to have terraform installed
- make sure to have azure subscription with required permission

```
clone the repo
az login
terraform init
terraform plan
terraform apply /
-var="location=northeurope" /
-var="prefix=gitlab" /
-var="environment=Gitlab" /
-var="admin_username=yahyaozturk" /
-var="admin_password=<password>" /
-var="gitlab_server=https://gitlab.com/" /
-var="gitlab_token=<token>" 
```

Once you run the script it will provision gitlab-runner, then you are ready to use this runner to provision infrastructure by terraform as Gitlab pipeline.

Good part is that, you do not specify any credentials, VM itself already has permission to provision resources on Azure.

