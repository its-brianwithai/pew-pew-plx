# Open Source GitHub Repository Pre-Launch Checklist

## Introduction

This checklist serves as a guide for preparing your GitHub repository before launching it as an open-source project. Based on the experience of [Binbash Leverage](https://www.binbash.com.ar) with dozens of open-source projects, it covers essential steps to ensure your repository is secure, well-documented, and ready for community contributions.

## Benefits of Open Source

- **Collaboration:** Open source projects can accept changes from anybody in the world.
- **Adoption and remixing:** Open source projects can be used by anyone for nearly any purpose, even as building blocks for other projects.
- **Transparency:** Anyone can inspect an open source project for errors or inconsistencies, which is particularly important for governments, regulated industries, and security software.

## Pre-Launch Checklist

### 1. Use a credential manager to protect your access credentials

Secure your credentials with tools such as:
- LastPass
- Hashicorp Vault

### 2. Configure two-factor authentication (2FA)

Activate GitHub MFA for enhanced account security.

### 3. Enforce signed commits

Git makes it easy to spoof commits, allowing attackers to make their code look like yours. GitHub supports cryptographic protection against such attacks through commit signing.

### 4. Protect the release branch

Configure `master` branch protection when making the repository public.

### 5. Require pull request reviews and approvals

Set up PR merge policies for the `master` branch when making the repository public.

### 6. Scan source code for sensitive data leaks

Tools to detect leaked credentials in your repository:
- [GitHub Secret Scanning](https://docs.github.com/en/developers/overview/secret-scanning)
- [Geekflare GitHub Credentials Scanner](https://geekflare.com/github-credentials-scanner/)
- [git-all-secrets](https://github.com/anshumanbh/git-all-secrets)
- [truffleHog](https://github.com/trufflesecurity/truffleHog)
- [GitGuardian](https://www.gitguardian.com/)

### 7. Scrub leaked secrets from git history

If sensitive data is leaked, contain the damage by rewriting git history to remove the sensitive data.

### 8. Essential documentation for all projects

Every project should include the following documentation:

- **Open source license**
- **README** ([makeareadme.com](https://www.makeareadme.com/) can help)
- **Contributing guidelines** that include:
  - How to file bug reports (using issue and pull request templates)
  - How to suggest new features
  - How to set up environments and run tests
  - Types of contributions you're looking for
  - Your roadmap or vision for the project
  - How contributors should contact you
- **Code of conduct** that sets ground rules for behavior (example: [Kubernetes Code of Conduct](https://github.com/kubernetes/community/blob/master/code-of-conduct.md))

> **Note:** As a maintainer, these components help communicate expectations, manage contributions, and protect everyone's legal rights. If your project is on GitHub, placing these files in your root directory with recommended filenames helps GitHub recognize and automatically surface them to your readers.

### 9. README content guidelines

Your README should answer these questions:
- What does this project do?
- Why is this project useful?
- How do I get started?
- Where can I get more help, if I need it?
- How do I contribute?
- Under which open source license is the project being developed?

### 10. Only use trusted GitHub Actions

Ensure you only run Actions you trust to avoid executing malicious or poorly written code in your build pipeline.

### 11. Protect the secrets used by GitHub Actions

Properly secure any credentials required by GitHub Actions for software releases and deployments.

### 12. Review project vulnerabilities

- Review project dependencies for vulnerabilities
- Patch dependencies with known vulnerabilities
- Scan project source code for vulnerabilities
- Consider tools like [Snyk](https://snyk.io/) or [Dependabot](https://dependabot.com/)

### 13. Publish a security policy

Make it easy for people to report security flaws and clearly communicate how you'll handle these reports.

Examples:
- [Airbnb Security](https://www.airbnb.com/security)
- [Apple Security Support](https://www.apple.com/support/security/)

### 14. Collaborate on fixes for security vulnerabilities in private forks

Use private forks to collaborate on security vulnerability fixes without exposing the issue publicly before it's resolved.

### 15. Publish maintainer advisories for security fixes

When security vulnerabilities are fixed, publish advisories that will be incorporated into security scanning tools your users rely on.

## Final Pre-launch Checklist

### Documentation
- ☑️ Project has a LICENSE file with an open source license
- ☑️ Project has basic documentation (README, CONTRIBUTING, CODE_OF_CONDUCT)
- ☑️ The name is easy to remember, gives some idea of what the project does, and doesn't conflict with existing projects or trademarks
- ☑️ The issue queue is up-to-date, with issues clearly organized and labeled

### Code
- ☑️ Project uses consistent code conventions and clear function/method/variable names
- ☑️ The code is clearly commented, documenting intentions and edge cases
- ☑️ There are no sensitive materials in the revision history, issues, or pull requests

### People
If you're an individual:
- ☑️ You've talked to the legal department and/or understand the IP and open source policies of your company (if you're an employee)

If you're a company or organization:
- ☑️ You've talked to your legal department
- ☑️ You have a marketing plan for announcing and promoting the project
- ☑️ Someone is committed to managing community interactions
- ☑️ At least two people have administrative access to the project

## Reference Articles
- [Securing Your GitHub Project](https://marcinhoppe.com/securing-your-github-project/)
- [Starting an Open Source Project](https://opensource.guide/starting-a-project/)
- [The Legal Side of Open Source](https://opensource.guide/legal/)
- [Code of Conduct Guide](https://opensource.guide/code-of-conduct/)

---

*This document is based on an article by Exequiel Barrirero, Co-Founder & Director of Engineering @ binbash.* 