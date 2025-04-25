resource "aws_iam_role" "ec2_role" {

  count = var.already_existing_role == "" ? 1 : 0

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

}

locals {
  role_name = var.already_existing_role == "" ? aws_iam_role.ec2_role[0].name : var.already_existing_role
}

resource "aws_iam_role_policy_attachment" "managed" {
  count      = var.already_existing_role == "" ? length(var.managed_policy_arns) : 0
  role       = local.role_name
  policy_arn = var.managed_policy_arns[count.index]
}

locals {
  policy_files = fileset("${path.module}/policies", "*.json")
  inline_policies = {
    for f in local.policy_files :
    f => file("${path.module}/policies/${f}")
  }
}

resource "aws_iam_role_policy" "custom" {
  # only populate when we're creating a new role
  for_each = var.already_existing_role == "" ? local.inline_policies : {}

  # each.key is e.g. "my-policy.json"
  name   = replace(each.key, ".json", "")
  policy = each.value
  role   = local.role_name
}


resource "aws_iam_instance_profile" "instance_profile" {
  for_each = var.instances

  name = "${each.key}-instance-profile"
  role = local.role_name
}
