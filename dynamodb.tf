resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.env}-terraform-dynamodb"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hashkey
 

  attribute {
    name = var.hashkey
    type = "S"
  }

}