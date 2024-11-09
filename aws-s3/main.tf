resource "random_string" "random" {
  length = 10
  special = false
  upper = false
}

resource "random_integer" "random" {
    min = 1
    max = 10000
}

resource "aws_s3_bucket" "this" {
    bucket = "random-bucket-${random_string.random.result}-${random_integer.random.result}"
}

output "bucket_name" {
  value = aws_s3_bucket.this.name
}
