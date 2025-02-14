# Mono DevOps Assessment

## Setup

1. **Prerequisites**:

   - DigitalOcean Account
   - Terraform >= 1.5.0
   - `doctl` CLI configured

2. **Secrets**:

```bash
   # Add to GitHub Secrets:
   DO_TOKEN: DigitalOcean API token (Kubernetes+Spaces access)
   DOCR_TOKEN: Registry write token
```

3. **Deploy**:

```bash
   cd terraform
   terraform init
   terraform apply -var="do_token=<YOUR_DO_TOKEN>"
```

4. **Workflows**

   - CI: Builds/pushes image on every push (Git SHA tag)
   - Deploy: Manually triggered with workflow_call

5. **Helm Chart**

```bash
   helm upgrade --install nginx-app ./helm/nginx-app \
   --set image.tag=$GITHUB_SHA
```