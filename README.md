# terraform_secure_your_cred
How to secure your credentials in terraform using AWS secrets manager and KMS
<br><br>
### Pre-requisite: Create a secret with your credentials and update tf files.
<br>
<b>In the File backend_s3 we are creating S3 bucket with encryption to store our tfstate file as username/password are store as a plain text in tfstatefile. And we are also creating Dynamodb table for locking terraform state.</b>
<br>
<br>
<b>In the \backend_use\secrets.tf we have demostrate how to use key stored in aws secrets.
First apply the backend_s3.tf file as it creating backend for secrets.tf.</b>
