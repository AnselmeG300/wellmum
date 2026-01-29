terraform { 
  cloud { 
    
    organization = "REX-WELLMUM-Services-Infrastructure" 

    workspaces { 
      name = "rex-wellmum-stockage" 
    } 
  } 
}