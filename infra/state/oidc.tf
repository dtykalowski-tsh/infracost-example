module "aws_oidc_bitbucket" {
  source = "github.com/terraform-modules.git//aws_oidc_bitbucket?ref=main"

  identity_provider_url = ""
  audience              = ""
  thumbprints           = [""]

  repositories = [
    {
      name = ""
      uuid = ""

      iam_role_additional_policy_arns = [
        "arn:aws:iam::aws:policy/AdministratorAccess"
      ]
    },
  ]
}
