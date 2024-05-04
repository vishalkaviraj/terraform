terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "vish_terraform_org"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}


resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_database" "simple" {
  name                        = "testing"
  comment                     = "test comment"
  data_retention_time_in_days = 3
}