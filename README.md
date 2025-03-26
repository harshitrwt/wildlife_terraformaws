# Static Website Hosting on AWS S3 with Terraform

## 📌 Project Overview
This project automates the deployment of a static website on **AWS S3** using **Terraform**. By leveraging Infrastructure as Code (IaC), we ensure a reproducible, scalable, and efficient setup for hosting static websites on AWS.


## The static site hosted in this project.

![img1](https://github.com/user-attachments/assets/bbf2484d-f1b2-4e52-9cf9-ecf459c91851)

## 🔧 Technologies Used
- **Terraform** - Infrastructure as Code (IaC) tool to provision AWS resources.
- **AWS S3** - Object storage service used for hosting the static website.
- **AWS IAM** - For managing permissions and security.
- **AWS CLI** - To interact with AWS services.
- **Git & GitHub** - For version control.

---

## 🚀 Project Setup and Installation

### 1️⃣ **Prerequisites**
Before starting, ensure you have the following installed:
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [Git](https://git-scm.com/downloads)
- And offcourse an **AWS account**

### 2️⃣ **AWS CLI Configuration**
First, configure AWS CLI with your IAM credentials:
```sh
aws configure
```
Provide your **Access Key ID**, **Secret Access Key**, **Region**, and **Output format**.

### 3️⃣ **Clone the Repository**
```sh
git clone https://github.com/your-repo-name.git
cd your-repo-name
```

### 4️⃣ **Initialize Terraform**
```sh
terraform init
```
This downloads the necessary Terraform provider plugins.

### 5️⃣ **Plan & Apply Terraform Configuration**
```sh
terraform plan
terraform apply -auto-approve
```
Terraform will provision the required AWS resources, including:
- An **S3 bucket** for static website hosting.
- **Bucket policies** for public access.
- **IAM roles** for access management.

### 6️⃣ **Upload Website Files**
Once the S3 bucket is created, upload your static website files:
```sh
aws s3 cp ./website s3://your-bucket-name --recursive
```

### 7️⃣ **Access Your Website**
Once uploaded, visit your website using the **S3 Static Website Endpoint**:
```
http://your-bucket-name.s3-website-region.amazonaws.com
```

---

## 🗑️ Destroying Infrastructure
To clean up and remove all AWS resources created by Terraform:
```sh
terraform destroy -auto-approve
```

---

## 🔥 Challenges Faced
- **Git Large File Issue**: Terraform's `.terraform/` directory contained large provider binaries that exceeded GitHub's file size limit. Resolved by adding `.terraform/` to `.gitignore`.
- **Bucket Policy Restrictions**: Needed to configure the correct permissions for public access.
- **IAM Permissions**: Ensured the right IAM roles were assigned for security best practices.

---

## 📢 Future Enhancements
- Automate deployment with **GitHub Actions** for CI/CD.
- Implement **CloudFront CDN** for better performance and HTTPS support.

---

