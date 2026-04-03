# 🚀 Terraform AWS Infrastructure Project

## 📌 Project Overview

This project demonstrates how to provision and manage AWS infrastructure using **Terraform (Infrastructure as Code)**.

The goal of this project is to automate the creation of core AWS resources such as VPC, Subnet, and EC2 instance in a clean, reusable, and scalable way.

---

## 🧱 Architecture

The infrastructure created in this project includes:

* Virtual Private Cloud (VPC)
* Public Subnet
* Internet Gateway
* Route Table
* Security Group --> Ingress rule and Egress rule
* EC2 Instance
* S3 Bucket

📊 Basic Flow:

```
VPC → Subnet → Internet Gateway → Route Table → EC2 Instance → S3 Bucket 
```

---

## 🛠️ Technologies Used

* Terraform
* AWS (Amazon Web Services)
* EC2 (Elastic Compute Cloud)
* VPC (Virtual Private Cloud)
* S3 (Simple Storage Service)

---

## 📂 Project Structure

```
terraform-aws-infra/
│── main.tf          # Main infrastructure configuration
│── provider.tf      # AWS provider configuration
│── README.md        # Project documentation
```

---

## ⚙️ Prerequisites

Before running this project, make sure you have:

* AWS Account
* AWS CLI configured (`aws configure`)
* Terraform installed

---

## 🚀 How to Use

### 1️⃣ Clone the Repository

```
git clone https://github.com/Kunalvhatkar/terraform-aws-infra.git
cd terraform-aws-infra
```

---

### 2️⃣ Initialize Terraform

```
terraform init
```

---

### 3️⃣ Preview Changes

```
terraform plan
```

---

### 4️⃣ Apply Configuration

```
terraform apply
```

Type `yes` when prompted.

---

### 5️⃣ Destroy Infrastructure (Optional)

```
terraform destroy
```

---

## 🔑 Key Features

* Infrastructure as Code (IaC) using Terraform
* Modular and reusable configuration
* Automated AWS resource provisioning
* Clean and simple structure for beginners


---



## 📈 Future Improvements

* Use Terraform Modules
* Implement Remote Backend (S3 + DynamoDB)
* Add CI/CD pipeline (GitHub Actions / Jenkins)
* Multi-environment setup (dev/prod)

---

## 🎯 Learning Outcomes

* Understanding of Terraform workflow (`init`, `plan`, `apply`, `destroy`)
* Hands-on experience with AWS infrastructure
* Basics of networking in AWS (VPC, Subnet, Routing)
* Writing reusable Terraform configurations
* Resource Dependency & Execution Order

---

## 👨‍💻 Author

**Kunal Vhatkar**
Cloud & DevOps Enthusiast

---

## ⭐ Contribute / Feedback

If you have suggestions or improvements, feel free to fork the repo or open an issue.

---

