# terraform import aws_iam_user.test_import test_user_for_import

resource "aws_iam_user" "test_import" {
  name = "test_user_01"
  path = "/"
}

# output "test_import_user" {
#     value = aws_iam_user.test_import
# }