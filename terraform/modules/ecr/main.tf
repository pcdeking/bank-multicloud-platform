resource "aws_ecr_repository" "frontend" {
  name = "${var.environment}-frontend"

  image_scanning_configuration {
    scan_on_push = true
  }

  force_delete = true
}

resource "aws_ecr_repository" "backend" {
  name = "${var.environment}-backend"

  image_scanning_configuration {
    scan_on_push = true
  }

  force_delete = true
}