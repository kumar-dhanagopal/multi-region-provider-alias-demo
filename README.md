# Deploy Resources Across Multiple Oracle Cloud Regions
This Terraform configuration demonstrates the use of the [provider alias feature](https://www.terraform.io/docs/configuration/providers.html#alias-multiple-provider-configurations) to automate the deployment of Oracle Cloud Infrastructure resources across multiple regions.
## Scenario
For this demonstration, we implement cross-region Object Storage replication by creating the following resources.
- An IAM policy to allow the Object Storage service in a primary region (designated by you) to manage buckets in a compartment that you specify.
- Two Object Storage buckets, one in the primary region and the other in the standby region. You specify the regions.
- A replication policy to copy objects from the bucket in the primary region to the bucket in the standby region.

## Usage Instructions
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
  terraform apply -parallelism=1
  ```
  **Note**: The `parallelism=1` option ensures that Terraform performs only one operation at a time. This restriction is necessary because the tenancy-level resources created by this configuration (such as the IAM policy) need to be propagated across all the regions, which might take a few minutes. Eliminating parallelism gives us a better chance of making sure that such resources are fully propagated before the subsequent/dependent operations start.
  When you’re prompted to confirm the action, enter **yes**.
  When all components have been created, Terraform displays a completion message. 
  For example:
  ```
  Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
  ```
  **Note**: If an error occurs indicating that a resources wasn't created, run `terraform apply -parallelism=1` again.
If you want to delete the infrastructure, run:
 ```
  $ terraform destroy
  ```
  When you’re prompted to confirm the action, enter **yes**.
