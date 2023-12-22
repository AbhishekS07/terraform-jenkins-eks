#!/bin/bash
sudo apt update
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

#Java installaion
sudo apt update
sudo apt install fontconfig openjdk-17-jre -y
java -version

#long term support package release
sudo apt update
sudo apt install wget -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

#Enable Jenkins
sudo systemctl enable jenkins

#Start Jenkins
sudo systemctl start jenkins

# Install Git
sudo apt install -y git

# Install Terraform
#!/bin/bash

# Update the package repositories
sudo apt update -y

# Install unzip if not already installed
sudo apt install unzip  -y

# Download the latest version of Terraform
TERRAFORM_VERSION=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Unzip the downloaded file and move it to the /usr/local/bin directory
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Clean up downloaded files
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Verify the installation
terraform --version


# Install kubectl
#sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
#sudo chmod +x ./kubectl
#sudo mv ./kubectl /usr/local/bin/kubectl
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version