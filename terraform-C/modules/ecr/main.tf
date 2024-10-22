resource "aws_ecr_repository" "erc-ktb-cruming-FE" {
  name                 = var.ecr_fe_name
  image_tag_mutability = var.ecr_fe_tag
  image_scanning_configuration {
    scan_on_push = var.ecr_scan
  }
}

resource "aws_ecr_repository" "erc-ktb-cruming-BE" {
  name                 = var.ecr_be_name
  image_tag_mutability = var.ecr_be_tag
  image_scanning_configuration {
    scan_on_push = var.ecr_scan
  }
}