# Warming up the credentials

Terraform and MFA do not play well. A tested workaround is using aws-vault: https://github.com/hashicorp/terraform-provider-aws/issues/10491

To renew the session before it expires at inconvenient times (eg, mid flight a terraform apply), run:

```bash
aws-vault clear default # voids the credentials
aws sts get-called-identity # or any awscli command; will prompt for a new MFA token

```