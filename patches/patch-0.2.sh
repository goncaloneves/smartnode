# Check smartcash is running every 5 minutes instead of 1 minute
crontab -l | sed 's/.*makerun.sh/\*\/5 \* \* \* \* ~\/smartnode\/makerun.sh/g' | crontab -

# Check if upgrade is available every two hours
crontab -l | sed 's/.*upgrade.sh/0 *\/2 \* \* \* ~\/smartnode\/upgrade.sh/g' | crontab -

# Add a cronjob to start smartcash after reboot
if ! crontab -l | grep "@reboot smartcashd"; then
  (crontab -l ; echo "@reboot smartcashd") | crontab -
fi

# Update the makerun.sh and upgrade.sh shell scripts
cd ~/smartnode
wget https://raw.githubusercontent.com/SmartCash/smartnode/master/makerun.sh -O makerun.sh
wget https://raw.githubusercontent.com/SmartCash/smartnode/master/upgrade.sh -O upgrade.sh
