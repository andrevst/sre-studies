# Configure Azure Provider
terraform {
	required_providers {
		azurerm = {
			source = "hashicorp/azurerm"
			version = ">= 2.26"
		}
	}
}

provider "azurerm" {
	features {}

    # azure Sub
    subscription_id = ""
}

resource "azurerm_resource_group" "rg" {
	name = "$domain-rg-$product-$env-$location"
	location = "eastus"
	tags = {
		ProductName = ""	
	}
}

