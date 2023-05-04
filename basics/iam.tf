# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "test_role_01" {
  name = "test_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  inline_policy {
    name = "describe_ec2_resources_inline"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["ec2:Describe*"]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }
  managed_policy_arns = [
    aws_iam_policy.test_policy_01.arn,
    aws_iam_policy.test_policy_02.arn,
    "arn:aws:iam::aws:policy/ReadOnlyAccess"]
}


resource "aws_iam_policy" "test_policy_01" {
  name = "list_s3_buckets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:ListBucket"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy" "test_policy_02" {
  name = "allow_s3_full_access"
  policy = data.aws_iam_policy_document.allow_s3_full_access_policy.json
}


data "aws_iam_policy_document" "allow_s3_full_access_policy" {
  statement {
    effect  = "Allow"
    actions = [
      "s3:*",
    ]
    resources = [
      "arn:aws:s3:::*",
    ]
  }
}