# This script will install terraform in windows linux sub-system
echo 'Installing Terraform in Ubuntu WLS'
echo 'It will need sudo'
echo 'Step 1 - Upadte SO'
sudo apt-get update
sudo apt-get upgrade
echo 'Step 2 - Install Unzip'
sudo apt-get install unzip
echo 'Step3 - Install Terraform'
echo 'downloading lastest version'
# On terraform site, grab the most recent linux 64-bit download URL
# wget <terraform_url> -O terraform.zip;
wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip -O terraform.zip
echo 'unziping file'
unzip terraform.zip
echo 'move terraform to /usr/local/bin ("installing it")'
sudo mv terraform /usr/local/bin
echo 'removing downloaded file'
rm terraform.zip
echo 'installing autocomplete'
terraform -install-autocomplete
echo 'Step 4 - Test Terraform'
echo 'testing terraform'
terraform -help
terraform -v