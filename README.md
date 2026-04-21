# ☁️ Mac Free Cloud Drive Automator (100GB+ for Free)

As a developer with a 250GB Mac, storage runs out fast. Instead of paying for expensive cloud subscriptions or external SSDs, I built a system to combine multiple free 15GB Google Drive accounts into a **single, massive virtual hard drive** directly mounted on macOS Finder.

This project uses **Rclone** and macOS's native **WebDAV** to create a seamless cloud storage experience.

## 🚀 Features
- **Zero Cost**: Combines multiple free cloud accounts (Google Drive, Mega, etc.) into one.
- **Native Finder Integration**: Acts just like a plugged-in USB drive.
- **1-Click Start**: Includes a bash script to automatically start the background server and mount the drive.
- **Smart Routing**: Automatically uploads files to the drive with the most free space.

## 🛠️ Prerequisites
- macOS (Works flawlessly on M-series Apple Silicon)
- Homebrew installed (`brew`)
- A few free Gmail accounts (e.g., 5 accounts = 75GB)

## 💻 Installation & Setup

### 1. Install Rclone
Open your terminal and run:
```bash
brew install rclone
```

### 2. Configure Your Cloud Accounts
Run the Rclone config tool:
```bash
rclone config
```
- Select `n` for new remote.
- Name it (e.g., `gdrive1`), select `drive` as storage, and follow the browser prompts to log in.
- Repeat this for as many accounts as you have (`gdrive2`, `gdrive3`, etc.).

### 3. Create the "Union" (Super Drive)
- Run `rclone config` again and create a new remote.
- Name it `MyCloud`.
- Select `union` as the storage type.
- In `upstreams`, list your drives: `gdrive1: gdrive2: gdrive3:`
- Set action/create policies to `epmfs` (uses the drive with the most free space).

### 4. 1-Click Automation
You don't want to use the terminal every time you need your files. Just run the provided `start_cloud.sh` script:
```bash
./start_cloud.sh
```
This script starts the Rclone server in the background and automatically opens it in your Mac's Finder!

## 📝 Blog Post
I have documented the complete thought process and detailed steps in my Medium blog post: [Link to be added]




Last updated: 2026-04-21 *