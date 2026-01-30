locals {
  mappings = {
    SubnetConfig = {
      VPC = {
        CIDR = "10.0.0.0/16"
      }
      Public0 = {
        CIDR = "10.0.0.0/24"
      }
      Public1 = {
        CIDR = "10.0.1.0/24"
      }
      Private0 = {
        CIDR = "10.0.2.0/24"
      }
      Private1 = {
        CIDR = "10.0.3.0/24"
      }
    }
    AZRegions = {
      ap-northeast-1 = {
        AZs = [
          "a",
          "b"
        ]
      }
      ap-northeast-2 = {
        AZs = [
          "a",
          "b"
        ]
      }
      ap-south-1 = {
        AZs = [
          "a",
          "b"
        ]
      }
      ap-southeast-1 = {
        AZs = [
          "a",
          "b"
        ]
      }
      ap-southeast-2 = {
        AZs = [
          "a",
          "b"
        ]
      }
      ca-central-1 = {
        AZs = [
          "a",
          "b"
        ]
      }
      eu-central-1 = {
        AZs = [
          "a",
          "b"
        ]
      }
      eu-west-1 = {
        AZs = [
          "a",
          "b"
        ]
      }
      eu-west-2 = {
        AZs = [
          "a",
          "b"
        ]
      }
      sa-east-1 = {
        AZs = [
          "a",
          "b"
        ]
      }
      us-east-1 = {
        AZs = [
          "a",
          "b"
        ]
      }
      us-east-2 = {
        AZs = [
          "a",
          "b"
        ]
      }
      us-west-1 = {
        AZs = [
          "c",
          "b"
        ]
      }
      us-west-2 = {
        AZs = [
          "a",
          "b"
        ]
      }
      eu-west-3 = {
        AZs = [
          "a",
          "b"
        ]
      }
    }
  }
  stack_name = ""
}