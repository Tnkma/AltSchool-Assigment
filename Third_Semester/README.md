# AltSchool Cloud Engineering – Third Semester Assignment 1

This repository contains the solutions for **Task 1** and **Task 2** of the AltSchool Cloud Engineering Assignment.  

---

## Task 1: S3 Static Website Hosting & IAM Setup

### What I Did

- **Created three S3 buckets** and enabled **static website hosting**.  
- ***Cloudlaunch-site-bucket-tnkma***  
- Uploaded HTML/CSS files to serve as the website content.  
- Configured an **IAM user** (`cloudlaunch-user`) with a **custom JSON policy** that allows:  
  - S3 access for uploading and managing site content.  
  - Enable static website hosting.
  - Publicly accessible (read-only for anonymous users).
  - Set up a CloudFront distribution in front of the bucket for HTTPS and global caching.  
- Restricted the bucket so it is only accessible via CloudFront.  

- ***Cloudlauch-private-bucket-tnkma***
- Turned off public access from outside.
- Created a designated IAM user that have permissions only to GetObject and PutObject only (no Delete).

- ***Cloudlaunch-visible-only-bucket-tnkma***
- Not publicly accessible also.
- The IAM user was able to list this bucket (see it in S3 list) but not access its contents

- **Created a user named Cloudlaunch and gave it the following permission using JSON policy**
- Access limited to only the above three buckets.
- ListBucket on all three.
- GetObject/PutObject on cloudlaunch-private-bucket only.
- GetObject on cloudlaunch-site-bucket only.
- No DeleteObject permissions anywhere.
- No access to cloudlaunch-visible-only-bucket content.

### Outputs  

- **S3 Static Site URL:** [S3 Static site Url]: (http://cloudlaunch-site-bucket-tnkma.s3-website.eu-north-1.amazonaws.com/)  
- **CloudFront URL:** [CloudFront URL:](https://d1q7xwlbxx7ttz.cloudfront.net/)  
- **IAM Policy JSON:** See [policy.json](./policy.json)  

---

## Task 2: VPC and Security Groups

### What I Did  

- **Created a custom VPC** (`cloudlaunch-vpc`).  
- Configured **subnets** (public subnet for load balancers, private for the app servers and private for the database).  
- Set up a **route table** both the ***public subnet*** and ***private subnet***.  
- **Created Security Groups**:  
  - **`cloudlaunch-app-sg`**  
    - Allows **HTTP (port 80)** access **within the VPC only**.  
  - **`cloudlaunch-db-sg`**  
    - Allows **MySQL (port 3306)** access **only from the app subnet/security group**.  
- Updated the **IAM policy** to allow the IAM user **read-only access to VPC resources**.  

### Output

- Security group configurations with restricted inbound/outbound rules.  
- Verified that only the app subnet can communicate with the database subnet.  

---
