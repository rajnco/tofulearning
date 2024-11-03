terraform {
  required_providers {
    azurerm = {
      source = "opentofu/azurerm"
    }
  }
}

variable "subscription_id" {
  description = "Subscription Id"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

