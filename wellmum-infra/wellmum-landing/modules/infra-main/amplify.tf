resource "aws_amplify_app" "wellmum_app" {
  name                 = "wellmum-landing-${var.environment}"
  repository           = "https://github.com/AnselmeG300/wellmum.git"
  access_token         = var.github_token
  iam_service_role_arn = data.aws_iam_role.wellmum-landing_role.arn

  platform = "WEB_COMPUTE" 

  enable_branch_auto_build = true

  enable_auto_branch_creation = true
  
  build_spec = file("${path.module}/amplify.yml")

  environment_variables = {
    AMPLIFY_MONOREPO_APP_ROOT = local.AMPLIFY_MONOREPO_APP_ROOT
    }


  tags = {
    name = "wellmum-landing-${var.environment}"
    Env     = var.environment
  }
}


resource "aws_amplify_branch" "wellmum_app_branch" {
  app_id      = aws_amplify_app.wellmum_app.id
  branch_name = var.environment == "production" ? "main" : "develop"

  enable_auto_build = true    
  framework         = "Next.js - SSR"
  stage             =  "PRODUCTION"
}

resource "aws_amplify_domain_association" "wellmum_domain" {
  app_id      = aws_amplify_app.wellmum_app.id
  domain_name = var.environment == "production" ? "prod-wordpress.com" : "dev.prod-wordpress.com"

  # Configuration du sous-domaine pour www (optionnel en prod)
  sub_domain {
    branch_name = aws_amplify_branch.wellmum_app_branch.branch_name
    prefix      = var.environment == "production" ? "" : ""
  }

  # Sous-domaine www en production
  dynamic "sub_domain" {
    for_each = var.environment == "production" ? [1] : []
    content {
      branch_name = aws_amplify_branch.wellmum_app_branch.branch_name
      prefix      = "www"
    }
  }

  wait_for_verification = false
}

# Déclencher le premier déploiement automatiquement
resource "null_resource" "trigger_initial_deploy" {
  depends_on = [aws_amplify_branch.wellmum_app_branch]

  triggers = {
    branch_id = aws_amplify_branch.wellmum_app_branch.id
  }

  provisioner "local-exec" {
    command = "aws amplify start-job --app-id ${aws_amplify_app.wellmum_app.id} --branch-name ${aws_amplify_branch.wellmum_app_branch.branch_name} --job-type RELEASE --region ${data.aws_region.current.region}"
  }
}