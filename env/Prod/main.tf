module "aws_prod" {
  aplication_name = "web-docker"
  source          = "../../infra"
  ami             = "ami-0866a3c8686eaeeba"
  instancia       = "t2.micro"
  chave           = "aws_key"
  region_aws      = "us-east-1"
  security_group  = "acesso-web"
}
