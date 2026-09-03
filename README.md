# Azure SSP Infrastructure

Phase 0 reference infrastructure for the Azure Self-Service Portal.

## Structure

- `.github/workflows` - GitHub Actions workflows
- `terraform/environments/nonprod` - non-production environment configuration
- `terraform/modules` - reusable Terraform modules

## Current Phase 0 assumptions

- Azure
- Terraform
- GitHub Actions
- Private-by-default networking
- Non-prod environment
- Azure AI Foundry as the initial workload
- Linux VM, Storage, Key Vault and Monitoring as supporting infrastructure

Client-specific values will be introduced through configuration and variables as they are confirmed.
