# Build-a-Dev-Environment-with-Terraform-and-AWS
In this project, VS Code is configured to have direct access to our development node through a remote SSH session. This setup allows us to seamlessly manage files and execute commands on our EC2 instance, providing full control over the development environment directly from VS Code.

🌟 Project Overview: AWS Developer Environment Setup with Terraform & VS Code
I have successfully set up a developer environment on AWS using Terraform and Visual Studio Code (VS Code). The environment comprises several key components:

🛠️ 1. Infrastructure Configuration with Terraform:
📂 Terraform Configuration Files: I created Terraform configuration files, including the provider, variables, main Terraform file, and .tfvars files to define the infrastructure.

🔧 Provider Configuration: Configured the Terraform provider to work with AWS, enabling resource provisioning on the cloud platform.

📊 Variables: Defined necessary variables such as IP addresses, subnet IDs, and instance types to ensure flexible and reusable configurations.

📑 Main Configuration: This file outlines the resources to be created, including a Virtual Private Cloud (VPC), Internet Gateway, Route Tables, Security Groups, Subnets, and an EC2 instance.

🚀 User Data: Incorporated user data scripts to automate the bootstrapping of the EC2 instance during initialization.

🏗️ 2. AWS Infrastructure Setup:
🌐 VPC: Built a Virtual Private Cloud (VPC) to isolate the developer environment.

🌍 Internet Gateway: Attached is an Internet Gateway to the VPC to enable internet access.

🚦 Public Route Table: Set up a routeing table to direct internet-bound traffic through the Internet Gateway.

🔒 Security Group: Defined a security group to allow the necessary inbound and outbound traffic.

🏘️ Public Subnet: Created a public subnet within the VPC to host the EC2 instance.

💻 EC2 Instance: Launched an EC2 instance within the public subnet, serving as the development node.

💻 3. VS Code Configuration:
⚙️ VS Code Settings: Configured VS Code based on the IP address and other details of the development node.

🔗 Remote SSH Setup: Set up a remote SSH session from VS Code to the EC2 instance, enabling direct file access and command execution on the node.

⚠️ 4. Challenges and Troubleshooting:
🚧 Issues with terraform apply:

🛑 Resource Addition Problems: Encountered issues where some resources were not added as expected, leading to an incomplete infrastructure setup. Error messages indicated problems with resource dependencies and creation order.
🔍 Debugging Approach: Reviewed the Terraform configuration files and state, re-ran plans and applied specific targets to isolate and resolve problematic resources.
💡 Challenges with Terraform console:

❌ Incorrect Outputs: Some variables were not resolving correctly, particularly in complex expressions during the use of the terraform console.
🧩 Troubleshooting: Simplified expressions and broke down logic to identify and resolve the root causes of these errors.
📉 Configuration Issues with .tfvars File:

⚙️ Variable Misconfigurations: The .tfvars file contained inconsistencies that led to incorrect values being passed to the Terraform configuration, causing misconfigured resources.
🔄 Resolution: Cross-checked .tfvars values with expected inputs, corrected discrepancies, and re-applied the configuration to resolve issues.
🔍 Monitoring and Troubleshooting via AWS Console:

👁️ Active Monitoring: Actively monitored the AWS Console to verify resource creation and status, identifying missing or misconfigured resources.
🛠️ Direct Intervention: Used the AWS Console to manually inspect and address issues not apparent in Terraform outputs.
✅ Successful Deployment: Through continuous monitoring, debugging, and reapplying the configuration, successfully deployed the environment.
🎯 5. Outcome:
Once the Terraform configurations were applied and the infrastructure provisioned, the VS Code setup allowed seamless SSH access to the EC2 instance. This setup enabled efficient development tasks such as running commands and managing files directly from VS Code, creating a streamlined developer environment on AWS.
