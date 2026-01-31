terraform {
  cloud { 
    organization = "REX-WELLMUM-Services-Infrastructure" 

    workspaces { 
      name = "prod-rex-wellmum-ai"
    }
  }

}
