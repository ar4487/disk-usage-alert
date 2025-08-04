# Disk Usage Alert Script

Monitor disk usage in a Dockerized Linux environment and receive alerts when usage exceeds a safe threshold.

## Features

- Configurable disk usage threshold.
- Email notification when threshold is exceeded.
- Designed for Docker compatibility.
- Logs all events with timestamps.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
- [Setup](#setup)
- [Docker Usage](#docker-usage)
- [Contributing](#contributing)
- [License](#license)

## Usage

The default script monitors the root (`/`) partition and sends an alert email if disk usage goes above 80%. You can change this value by editing the `THRESHOLD` variable.

## Setup

1. **Copy the script** to your Linux server or Docker container in the `src/` directory.

2. **Edit variables** at the top of `disk_usage_alert.sh`:
   - Set `THRESHOLD` as your desired percentage.
   - Set `EMAIL` to your recipient address.

3. **Make executable**:

