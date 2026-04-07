resource "aws_s3_bucket" "mybucket" {
    bucket = "${var.env}-gokz-terraform-state-bucket"
  
}