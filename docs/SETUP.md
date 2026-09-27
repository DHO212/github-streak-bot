# 🚀 Setup Guide

## Prerequisites

- GitHub account (DHO212)
- Repository with GitHub Actions enabled
- Fork this repo or create from template

## Quick Start

### Option 1: Fork the Repository

1. Click **Fork** at the top of this repository
2. The workflow will start automatically at midnight UTC

### Option 2: Manual Setup

1. Clone this repository:
```bash
git clone https://github.com/DHO212/github-streak-bot.git
cd github-streak-bot
```

2. Install jq (used for JSON processing):
```bash
# Ubuntu/Debian
sudo apt-get install jq

# macOS
brew install jq
```

3. Make scripts executable:
```bash
chmod +x scripts/*.sh
```

4. Initialize stats:
```bash
bash scripts/generate-commit.sh
```

## Customization

### Change Commit Time

Edit `.github/workflows/streak.yml`:
```yaml
schedule:
  - cron: '0 0 * * *'  # Change to your preferred time (UTC)
```

Common schedules:
- `0 0 * * *` - Midnight UTC
- `12 0 * * *` - Noon UTC
- `0 */6 * * *` - Every 6 hours

### Add Your Own Quotes

Edit `data/quotes.json`:
```json
[
  {
    "text": "Your quote here",
    "author": "Author Name"
  }
]
```

### Customize Commit Messages

Edit `scripts/generate-commit.sh` and modify the `COMMIT_MSG` variable.

## GitHub Actions Setup

1. Go to repository **Settings** → **Actions** → **General**
2. Under "Workflow permissions", select **Read and write permissions**
3. Check **Allow GitHub Actions to create and approve pull requests**

## Monitoring

### Check Workflow Status
- Go to **Actions** tab in your repository
- View run history and logs

### View Statistics
- Stats are stored in `data/stats.json`
- README displays live streak visualization

## Troubleshooting

### Workflow Not Running
- Check if Actions are enabled for your repo
- Verify the workflow file syntax
- Check the Actions tab for error logs

### Wrong Commit Time
- GitHub Actions schedules use UTC
- Adjust the cron expression in the workflow file

### Stats Not Updating
- Verify `jq` is available in the workflow
- Check script permissions (chmod +x)

## Advanced Configuration

### Multiple Repositories
You can fork this repo and configure it for different GitHub accounts by changing the git config in the workflow.

### Custom Git Identity
Edit the workflow to use your name:
```yaml
- name: Configure Git
  run: |
    git config user.name "Your Name"
    git config user.email "your-email@example.com"
```

## Uninstall

To stop the streak bot:
1. Go to **Actions** tab
2. Click on **Daily Streak Commit** workflow
3. Click **Disable workflow**

Or delete the repository entirely.
