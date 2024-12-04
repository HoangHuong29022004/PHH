# Auto-run main.sh when entering mybash directory
if [ "$PWD" = "$HOME/PHH/mybash" ]; then
    echo -e "\033[1;34m=== Welcome to MyBash ===\033[0;39m"
    bash main.sh
fi 