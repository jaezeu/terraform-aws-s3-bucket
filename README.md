# terraform-aws-s3-bucket

Sample Terraform module to create an AWS S3 bucket with optional versioning and tags.

## Features

- Creates an S3 bucket
- Configures bucket versioning (`Enabled` or `Suspended`)
- Applies default module tags and merges custom tags

## Usage

```hcl
module "sample_s3_bucket" {
	source = "<ORG>/s3-bucket/aws"

	bucket_name = "my-unique-sample-bucket-12345"
	versioning  = true

	tags = {
		Environment = "dev"
		Project     = "sample"
	}
}
```

## Examples

- Basic example: [examples/basic](examples/basic)

Quick start:

```bash
cd examples/basic
terraform init
terraform plan
```

### Minimal Example

```hcl
module "sample_s3_bucket" {
	source = "<ORG>/s3-bucket/aws"

	bucket_name = "my-unique-sample-bucket-12345"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.14.0 |
| aws | >= 6.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 6.0 |

## Resources

| Name | Type |
|------|------|
| aws_s3_bucket.this | resource |
| aws_s3_bucket_versioning.this | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket_name | Globally-unique S3 bucket name | `string` | n/a | yes |
| versioning | Enable S3 bucket versioning | `bool` | `true` | no |
| tags | Additional tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_name | S3 bucket name |
| bucket_arn | S3 bucket ARN |

## Notes

- S3 bucket names must be globally unique across AWS.
- The module always applies these default tags:
	- `ManagedBy = terraform`
	- `Module = terraform-aws-s3-bucket`
- If the same tag keys are provided in `tags`, your values override defaults.

## Publishing to HCP Terraform Registry

To publish this module, ensure:

1. The repository name follows registry conventions (for example: `terraform-aws-s3-bucket`).
2. A semver tag is created (for example: `v1.0.0`).
3. Your VCS provider is connected to HCP Terraform.
4. The module source in consumers uses:

```hcl
source = "<ORG>/s3-bucket/aws"
```

Replace `<ORG>` with your HCP Terraform organization name.