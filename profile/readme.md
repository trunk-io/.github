<!-- trunk-ignore(markdownlint/MD041) -->
<p align="center">
  <a href="https://docs.trunk.io">
    <img height="300" src="https://user-images.githubusercontent.com/3904462/199616921-7861e331-c774-43bf-8c17-1ecd27d0a750.png" />
  </a>
</p>
<h2 align="center">Trunk.io</h2>
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
- [Trunk Check](https://docs.trunk.io/docs/check): an extensible code quality and security checker and IDE and CI integrations
- [Trunk Actions](https://docs.trunk.io/docs/actions): workflow automation for software engineers

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

### Step 2: Initialize Trunk in a git repo

From the root of a git repo, run:

```bash
trunk init
```
