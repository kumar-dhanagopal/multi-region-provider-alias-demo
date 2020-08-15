# Deploy Resources Across Multiple Oracle Cloud Regions
This Terraform configuration demonstrates the use of the [provider alias feature](https://www.terraform.io/docs/configuration/providers.html#alias-multiple-provider-configurations) to automate the deployment of Oracle Cloud Infrastructure resources across multiple regions.
# Usage
1. Complete the prerequisites described in https://github.com/oracle-quickstart/oci-prerequisites.

2. Clone this repository.

  ```
  git clone https://github.com/kumar-dhanagopal/multi-region-provider-alias-demo.git
  cd multi-region-provider-alias-demo
  ```
3. Open `terraform.tfvars` in the top-level directory in a text editor, and set values for all the variables in that file.

4. Initialize Terraform. This will also download the latest `oci` provider.

  ```
  terraform init
  ```
5. Review the plan.

  ```
  terraform plan
  ```

6. Apply the configuration.

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
