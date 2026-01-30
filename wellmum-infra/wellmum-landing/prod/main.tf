module "wellmum_landing" {
  source       = "../modules/infra-main"
  environment  = "production"
  github_token = var.github_token
}