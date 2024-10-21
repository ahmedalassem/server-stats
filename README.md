# Server Stats Script

## Overview
This repository contains a Bash script (`server-stats.sh`) that provides basic server performance statistics. It can be run on any Linux server and is intended to give an easy overview of important system metrics, such as CPU usage, memory usage, disk usage, and more.

## Features
The script provides the following information:

- **Total CPU Usage**: Displays the overall CPU usage percentage.
- **Total Memory Usage**: Shows the total, used, and free memory, along with the percentage of memory used.
- **Total Disk Usage**: Displays total, used, and free disk space along with the percentage of used space.
- **Top 5 Processes by CPU Usage**: Lists the top 5 processes consuming the most CPU.
- **Top 5 Processes by Memory Usage**: Lists the top 5 processes consuming the most memory.
- **OS Version**: Displays the version of the operating system.
- **Uptime**: Shows how long the server has been running.
- **Load Average**: Provides the system load average.
- **Logged In Users**: Lists the users currently logged into the system.
- **Failed Login Attempts**: Counts the number of failed login attempts.

## Prerequisites
- The script should be run with root privileges for accurate results:
  ```bash
  sudo ./server-stats.sh
  ```

- The script requires `bash`, and it is compatible with most Linux distributions.

## Usage
1. Clone this repository to your Linux server:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the directory:
   ```bash
   cd <repository-directory>
   ```
3. Make the script executable:
   ```bash
   chmod +x server-stats.sh
   ```
4. Run the script with root privileges:
   ```bash
   sudo ./server-stats.sh
   ```

## Example Output
The output of the script includes emojis to make it more visually appealing and easy to interpret. For example:

```
=== 📊 Total CPU Usage ===
🔥 Total CPU Usage: 12.3%

=== 💾 Total Memory Usage ===
🗄️ Total Memory: 8192 MB
📈 Used Memory: 4096 MB
🟢 Free Memory: 4096 MB
📊 Percentage Used: 50.00%

=== 💿 Total Disk Usage ===
💽 Total Disk: 100G
📊 Used Disk: 60G
🟢 Free Disk: 40G
📈 Percentage Used: 60%
```
## Idea
- Idea was inspired by [Roadmap.sh's Project-based learning.. P.S: It is Awesome! ](https://roadmap.sh/projects/server-stats)
## Notes
- The script uses emojis to make the output more readable and user-friendly.
- The script assumes the `/var/log/auth.log` file contains authentication logs, which may vary between different Linux distributions. Adjust the path as needed.

## License
This project is licensed under the MIT License. Feel free to modify and use it for your needs.

## Contributions
Contributions are welcome! If you would like to add more features or improve existing ones, feel free to submit a pull request.

## Disclaimer
This script is provided as-is without any warranty. Use it at your own risk.

---
Thank you for using the Server Stats Script! 😊

