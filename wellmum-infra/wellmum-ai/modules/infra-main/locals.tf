# Locals pour définir le préfixe des ressources
locals {
  resource_prefix = var.environment == "development" ? "dev" : "prod"
  image_tag_chat = var.environment == "development" ? "develop" : "main"
  image_tag_food_detector = var.environment == "development" ? "develop" : "main"
  image_tag_nutrition = var.environment == "development" ? "develop" : "main"
  image_tag_routines = var.environment == "development" ? "develop" : "main"
  image_tag_social = var.environment == "development" ? "develop" : "main"
}