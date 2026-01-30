module "wellmum_landing" {
  source = "../modules/infra-main"
  environment    = "development"
  github_token  = var.github_token
}