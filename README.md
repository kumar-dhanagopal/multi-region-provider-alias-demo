# Deploy Resources Across Multiple Oracle Cloud Regions
This Terraform configuration demonstrates the use of the [provider alias feature](https://www.terraform.io/docs/configuration/providers.html#alias-multiple-provider-configurations) to automate the deployment of Oracle Cloud Infrastructure resources across multiple regions.
- [Scenario](#scenario)
- [Usage Instructions](#usage-instructions)
  - [Provision Resources](#provision-resources)
  - [Remove Resources](#remove-resources)

## Scenario
For this demonstration, we implement cross-region Object Storage replication by creating the following resources.
- An IAM policy in the home region of the tenancy, to allow the Object Storage service in a primary region (designated by you) to manage buckets in a compartment that you specify.
- Two Object Storage buckets, one in a primary region and the other in a standby region. You specify the regions.
- An Object Storage replication policy in the primary region to copy objects from the bucket in the primary region to the bucket in the standby region.
The resources are created in the following order:
**Note**: An explicit dependency is defined in `xregion_replication_policy.tf` to ensure that Terraform creates the cross-region Object Region replication policy only after the two buckets and the required IAM policy are created.

## Usage Instructions
### Provision Resources
1. Complete the prerequisites described in https://github.com/oracle-quickstart/oci-prerequisites.
2. Clone this repository.
  ```
  git clone https://github.com/kumar-dhanagopal/multi-region-provider-alias-demo.git
  cd multi-region-provider-alias-demo
  ```
3. Copy `terraform.tfvars.example` in the top-level directory to `terraform.tfvars`.
4. Open `terraform.tfvars` in a plain-text editor, and specify values for the variables in the file.
5. Initialize Terraform.
  ```
  terraform init
  ```
6. Review the plan.
  ```
  terraform plan
  ```
7. Apply the configuration.
  ```
  terraform apply
  ```
  
  When you’re prompted to confirm the action, enter **yes**.
  
  When all components have been created, Terraform displays a completion message. 
  
  For example:
  ```
  Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
  ```
  
  **Note**: The operation to create the Object Storage replicatiopn policy might fail, because the IAM policy to allow the replication might not have been propagated across all the regions. In such a case, the following error message is displayed:
  ```
  Error: Service error:InsufficientServicePermissions. Permissions granted to the object storage service in this region are insufficient to execute this policy.. http status code: 400. Opc request id: iad-1:...

  on xregion_replication_policy.tf line 1, in resource "oci_objectstorage_replication_policy" "replication_policy":
   1: resource "oci_objectstorage_replication_policy" "replication_policy" {
  ```
  Wait a few minutes (to allow the IAM policy to propagate across all the regions), and then run `terraform apply` again.

### Remove Resources
To delete the infrastructure, complete the following steps:
1. Delete all the objects in the bucket in the primary region.
2. Run the following command:
 ```
  $ terraform destroy
  ```
When you’re prompted to confirm the action, enter **yes**.
