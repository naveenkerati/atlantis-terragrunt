# atlantis-tf-playground
RunAtlantis is an open-source tool that automates Terraform execution using Git-based workflows. It enables teams to apply Terraform changes directly via pull requests (PRs), ensuring safe collaboration.
Works with 
* GitHub
* GitLab
* and Bitbucket.

# How it works
* Developer opens a pull request with Terraform changes.
* RunAtlantis automatically runs terraform plan and comments on the PR.
The team reviews and approves the plan.
* A team member runs `atlantis apply` from the PR comment to execute `terraform apply`.
* RunAtlantis applies the changes and updates the PR.

# Prerequisites
* [Github Token](./how-to-create-github-token.md) | BITBUCKET | GITLAB Personal Access Token(PAT)
* terraform
* terragrunt
* `yq`, `jq`

# Installation
## Using Docker
```
docker run -d --name=atlantis \
  -p 4141:4141 \
  -v $HOME/.atlantis:/root/.atlantis \
  runatlantis/atlantis server \
  --gh-user=<your-github-username> \
  --gh-token=<your-github-token> \
  --repo-allowlist=<your-repo-url>
```
## Linux 
```
curl -Lo atlantis https://github.com/runatlantis/atlantis/releases/latest/download/atlantis-linux-amd64
chmod +x atlantis
mv atlantis /usr/local/bin/
```
