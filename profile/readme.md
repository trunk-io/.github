<!-- trunk-ignore(markdownlint/MD041) -->
<p align="center">
  <a href="https://docs.trunk.io">
    <img src="https://github.com/trunk-io/.github/assets/1265982/5e630667-e3f3-43d7-b5db-b6eb40cff04c" />
  </a>
</p>
<p align="center">
  <a href="https://marketplace.visualstudio.com/items?itemName=Trunk.io">
    <img src="https://img.shields.io/visual-studio-marketplace/i/Trunk.io?logo=visualstudiocode"/>
  </a>
  <a href="https://slack.trunk.io">
    <img src="https://img.shields.io/badge/slack-slack.trunk.io-blue?logo=slack"/>
  </a>
  <a href="https://docs.trunk.io">
    <img src="https://img.shields.io/badge/docs.trunk.io-7f7fcc?label=docs&logo=readthedocs&labelColor=555555&logoColor=ffffff"/>
  </a>
</p>

## What is Trunk?

Trunk is a developer experience (DevEx) toolkit that enables you to ship code quickly while maintaining the guardrails necessary for a large team. Use Trunk for checking, testing, merging, and monitoring your code.

Check out:

- [Trunk Merge](https://docs.trunk.io/docs/merge): a merge queue to make merging code in GitHub safer and easier
- [Trunk Check](https://docs.trunk.io/docs/check): a universal metalinter to run industry leading OSS code quality and security tools in your terminal, IDE and in CI
- [Trunk CI Analytics](https://trunk.io/products/ci-analytics): live and trend data about the performance and flakiness of your GitHub Actions workflows, jobs, and steps

Use it via:

- [Trunk CLI](https://docs.trunk.io/docs/overview)
- [VSCode Extension](https://marketplace.visualstudio.com/items?itemName=trunk.io)
- [GitHub Action](https://github.com/marketplace/actions/trunk-check)
- [Web App (app.trunk.io)](https://app.trunk.io)

Trunk is entirely free for use in public repos.

## Get Started

### Step 1: Install Trunk

To use `trunk` locally, run:

```bash
curl https://get.trunk.io -fsSL | bash
```

For other installation options (`npm`, `brew`, direct download, etc) and details on exactly what we install or how to uninstall, see the [Install Trunk](https://docs.trunk.io/docs/install) doc.

### Step 2: Initialize Trunk in a git repo

From the root of a git repo, run:

```bash
trunk init
```

This will bring you into a flow to start getting results from [Trunk Check](https://docs.trunk.io/docs/check). For more details, see [here](https://docs.trunk.io/docs/initialize-trunk-in-a-git-repo).

### Step 3: Sign up for a Trunk account (optional)

[Sign up for a Trunk account](https://app.trunk.io/signup), then run:

```bash
trunk login
```
To use [Trunk Merge](https://docs.trunk.io/docs/merge) and certain other Trunk features, you'll need an account on [trunk.io](https://app.trunk.io), but [Trunk Check](https://docs.trunk.io/docs/check) and [Trunk Actions](https://docs.trunk.io/docs/actions) can be used entirely locally without depending on hosted services or having a Trunk account. 

## Help & Feedback

Join the [Trunk Slack Community](https://slack.trunk.io) for help and to give feedback ([more info](https://docs.trunk.io/docs/community)).
