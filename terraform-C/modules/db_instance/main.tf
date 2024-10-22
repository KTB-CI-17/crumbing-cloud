resource "aws_db_instance" "database" {
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  engine                = var.engine
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  identifier            = var.db_instance_name
  db_name               = var.db_name
  username              = var.username
  password              = var.password
  parameter_group_name  = var.parameter_group_name
  skip_final_snapshot   = var.skip_final_snapshot
  publicly_accessible   = var.publicly_accessible
  db_subnet_group_name  = var.db_subnet_group_name

  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = var.db_instance_name
  }
}
