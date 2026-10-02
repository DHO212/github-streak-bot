# 🔥 GitHub Streak Bot

<p align="center">
  <img src="https://img.shields.io/badge/automation-github--actions-blue" alt="GitHub Actions">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="License">
  <img src="https://img.shields.io/badge/status-active-brightgreen" alt="Status">
</p>

<p align="center">
  <b>Automatically maintain your GitHub contribution streak with GitHub Actions</b>
</p>

---

## ⚠️ Important Disclaimer

**This tool is for educational purposes only.** Using automated commits to maintain a green contribution streak may violate [GitHub's Terms of Service](https://github.com/site/terms) and could result in account suspension.

**[Read the full disclaimer →](docs/DISCLAIMER.md)**

---

## 📊 Live Streak Stats

<!-- STATS_START -->
## 📊 Live Streak Stats

| Metric | Value |
|--------|-------|
| 🔥 Current Streak | **5 days** |
| 🏆 Longest Streak | **5 days** |
| 📝 Total Commits | **5** |
| 📅 Start Date | **2026-09-28** |
| 📅 Last Commit | **2026-10-02** |

### Streak Visualization
`🟩🟩🟩🟩🟩⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛`
`5/30 days this month`

<!-- STATS_END -->

---

## 🚀 Features

- ✅ **Daily Auto-Commits** - Automatically commits every day at midnight UTC
- ✅ **Random Quotes** - Each commit includes a motivational/tech quote
- ✅ **Streak Tracking** - Tracks current streak, longest streak, and total commits
- ✅ **Visual Stats** - Dynamic README with streak visualization
- ✅ **Easy Setup** - One-click fork to start
- ✅ **Customizable** - Change quotes, commit time, and messages

## 📁 Project Structure

```
github-streak-bot/
├── .github/
│   └── workflows/
│       ├── streak.yml           # Daily commit workflow
│       └── readme-updater.yml   # Stats update workflow
├── scripts/
│   ├── generate-commit.sh       # Generates commit with quote
│   └── update-readme.sh         # Updates README stats
├── data/
│   ├── quotes.json              # 100+ motivational quotes
│   └── stats.json               # Streak statistics
├── docs/
│   ├── SETUP.md                 # Setup guide
│   └── DISCLAIMER.md            # Terms of Service disclaimer
├── README.md
└── LICENSE
```

## ⚡ Quick Start

### Option 1: Fork This Repo (Easiest)

1. Click **Fork** at the top of this page
2. Go to **Settings** → **Actions** → **General**
3. Under "Workflow permissions", select **Read and write permissions**
4. The workflow starts automatically at midnight UTC!

### Option 2: Clone & Push

```bash
git clone https://github.com/DHO212/github-streak-bot.git
cd github-streak-bot
chmod +x scripts/*.sh
git add -A
git commit -m "🔥 Initialize streak bot"
git push
```

## 🔧 Customization

### Change Commit Time

Edit `.github/workflows/streak.yml`:

```yaml
schedule:
  - cron: '0 0 * * *'  # Change to your preferred time (UTC)
```

### Add Your Own Quotes

Edit `data/quotes.json`:

```json
[
  {
    "text": "Your awesome quote here",
    "author": "Author Name"
  }
]
```

### View Streak Stats

Check `data/stats.json` for detailed statistics:

```json
{
  "current_streak": 5,
  "longest_streak": 12,
  "total_commits": 47,
  "last_commit_date": "2026-09-27",
  "start_date": "2026-09-22"
}
```

## 📖 Documentation

- **[Setup Guide](docs/SETUP.md)** - Detailed installation and configuration
- **[Disclaimer](docs/DISCLAIMER.md)** - Important Terms of Service information

## 🛑 How to Stop

1. Go to **Actions** → **Daily Streak Commit**
2. Click **Disable workflow**

Or delete the repository.

## 📝 How It Works

1. **streak.yml** runs daily at midnight UTC
2. Selects a random quote from `quotes.json`
3. Updates `stats.json` with streak information
4. Creates a commit with the quote as the message
5. **readme-updater.yml** updates the README with live stats

## 🤝 Contributing

Contributions welcome! Feel free to open issues or submit PRs.

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

---

<p align="center">
  <b>⚠️ Use responsibly and at your own risk</b>
</p>

<p align="center">
  Made with ❤️ by <a href="https://github.com/DHO212">DHO212</a>
</p>

---

<!-- QUOTE_WEEKLY_START -->
## 💬 Quote of the Week

> "If life were predictable it would cease to be life and be without flavor."
> — **Eleanor Roosevelt**

_Updated: 

<!-- QUOTE_WEEKLY_END -->
