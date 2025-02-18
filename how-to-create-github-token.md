To create a **GitHub Personal Access Token (PAT)** for **Atlantis**, follow these steps:

### **Step 1: Navigate to GitHub Tokens**
1. Go to **GitHub** and log in to your account.
2. Click on your profile picture (top-right corner) and select **Settings**.
3. In the left sidebar, scroll down and click **Developer settings**.
4. Click **Personal access tokens** > **Tokens (classic)**.
5. Click **Generate new token (classic)**.

### **Step 2: Configure the Token**
1. **Note the Expiration**: Set an appropriate expiration date (or select "No expiration" if allowed).
2. **Select Scopes**:
   - ✅ `repo` (Full control of private repositories - required if Atlantis needs access to private repos)
   - ✅ `admin:repo_hook` (Full control of repository hooks - required for webhooks)
   - ✅ `workflow` (If using GitHub Actions)
   - ✅ `read:org` (Read organization permissions if using Atlantis with an organization)
   - ✅ `write:packages` (If your Atlantis workflow interacts with GitHub Packages)

### **Step 3: Generate and Store the Token**
1. Click **Generate token**.
2. **Copy the token** (you won’t be able to see it again).
3. Store it securely (e.g., in **GitHub Secrets**, AWS SSM Parameter Store, or a Vault).

### **Step 4: Use the Token in Atlantis**
Set the token as an environment variable when running Atlantis:

```bash
export ATLANTIS_GH_TOKEN="your_generated_token"
```

Alternatively, if running Atlantis in **Docker or Kubernetes**, pass it as a secret:

```yaml
env:
  - name: ATLANTIS_GH_TOKEN
    valueFrom:
      secretKeyRef:
        name: atlantis-secrets
        key: github-token
```

Let me know if you need help integrating it into your workflow! 🚀