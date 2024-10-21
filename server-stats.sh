#!/bin/bash

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then 
  echo "❌ Please run as root"
  exit
fi

# Total CPU Usage
echo "=== 📊 Total CPU Usage ==="
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
echo "🔥 Total CPU Usage: $CPU_USAGE"

# Total Memory Usage (Free vs Used including percentage)
echo "=== 💾 Total Memory Usage ==="
MEMORY=$(free -m)
TOTAL_MEM=$(echo "$MEMORY" | awk 'NR==2{print $2}')
USED_MEM=$(echo "$MEMORY" | awk 'NR==2{print $3}')
FREE_MEM=$(echo "$MEMORY" | awk 'NR==2{print $4}')
PERCENT_USED=$(awk "BEGIN {print ($USED_MEM/$TOTAL_MEM)*100}" | xargs printf "%.2f%%")
echo "🗄️ Total Memory: $TOTAL_MEM MB"
echo "📈 Used Memory: $USED_MEM MB"
echo "🟢 Free Memory: $FREE_MEM MB"
echo "📊 Percentage Used: $PERCENT_USED"

# Total Disk Usage (Free vs Used including percentage)
echo "=== 💿 Total Disk Usage ==="
DISK_USAGE=$(df -h / | awk 'NR==2')
TOTAL_DISK=$(echo "$DISK_USAGE" | awk '{print $2}')
USED_DISK=$(echo "$DISK_USAGE" | awk '{print $3}')
FREE_DISK=$(echo "$DISK_USAGE" | awk '{print $4}')
PERCENT_DISK=$(echo "$DISK_USAGE" | awk '{print $5}')
echo "💽 Total Disk: $TOTAL_DISK"
echo "📊 Used Disk: $USED_DISK"
echo "🟢 Free Disk: $FREE_DISK"
echo "📈 Percentage Used: $PERCENT_DISK"

# Top 5 Processes by CPU Usage
echo "=== 🔝 Top 5 Processes by CPU Usage ==="
top -b -o +%CPU -n 1 | head -n 12 | tail -n 5

# Top 5 Processes by Memory Usage
echo "=== 🔝 Top 5 Processes by Memory Usage ==="
top -b -o +%MEM -n 1 | head -n 12 | tail -n 5

# OS Version
echo "=== 🖥️ OS Version ==="
OS_VERSION=$(cat /etc/os-release | grep -w "PRETTY_NAME" | cut -d '"' -f 2)
echo "🖥️ OS Version: $OS_VERSION"

# Uptime
echo "=== ⏳ Uptime ==="
UPTIME=$(uptime -p)
echo "⏱️ Uptime: $UPTIME"

# Load Average
echo "=== 📊 Load Average ==="
LOAD_AVERAGE=$(uptime | awk -F'load average:' '{ print $2 }')
echo "📊 Load Average: $LOAD_AVERAGE"

# Logged In Users
echo "=== 👥 Logged In Users ==="
w

# Failed Login Attempts
echo "=== ❌ Failed Login Attempts ==="
FAILED_LOGINS=$(grep "Failed password" /var/log/auth.log | wc -l)
echo "❌ Failed Login Attempts: $FAILED_LOGINS"
