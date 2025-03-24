resource "aws_iam_role" "instance_role" {
  name = var.ec2_role_name

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

#   tags = {
#     Name = "tag-value"
#   }
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  for_each   = toset(var.managed_policy_arns)
  role       = aws_iam_role.instance_role.name
  policy_arn = each.value
}

resource "aws_iam_role_policy" "inline_policies" {
  for_each = var.inline_policies
  name     = each.key
  role     = aws_iam_role.instance_role.name
  policy   = jsonencode(each.value)
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = var.iam_instance_profile
  role = aws_iam_role.instance_role.id
}