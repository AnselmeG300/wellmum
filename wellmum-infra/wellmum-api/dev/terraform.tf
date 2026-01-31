terraform {
  cloud {
    organization = "REX-WELLMUM-Services-Infrastructure"
    workspaces {
      name = "dev-rex-wellmum-api"
    }
  }
}