We can make a robust setup where your bun index.js runs inside tmux, auto-restarts if it crashes, and starts automatically after reboot. Here's the full, copy-paste ready instructions:

# 1️⃣ Create a startup script

Create a script start_tmux.sh in your bot folder:

`nano ~/bot/start_tmux.sh`

Paste this:
```sh
#!/bin/bash
SESSION="b"
COMMAND="/home/ubuntu/.bun/bin/bun index.js"
cd /home/ubuntu/bot

# Check if the session exists
tmux has-session -t $SESSION 2>/dev/null
if [ $? != 0 ]; then
  # Create a new session
  tmux new-session -d -s $SESSION
fi
# Run the command in the first window and restart if it crashes
tmux send-keys -t $SESSION "while true; do $COMMAND; sleep 2; done" C-m
```


Make it executable:

`chmod +x ~/bot/start_tmux.sh`


✅ Explanation:

while true; do ...; done ensures bun index.js restarts automatically if it crashes.

sleep 2 adds a small delay before restarting to prevent rapid crash loops.

2️⃣ Create a systemd service

Create the service file:

`sudo nano /etc/systemd/system/tmux-bot.service`


Paste this:
```sh
[Unit]
Description=Tmux session for Bun bot
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/home/ubuntu/bot
ExecStart=/home/ubuntu/bot/start_tmux.sh
Restart=always
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

Replace ubuntu with your actual username if different.

3️⃣ Reload and enable systemd
```sh
sudo systemctl daemon-reload
sudo systemctl restart tmux-bot
sudo systemctl enable tmux-bot
```
4️⃣ Check status
`sudo systemctl status tmux-bot`


You should see:

Active: active (running)

5️⃣ Verify tmux session
tmux ls


You should see your session b running.
Attach to it with:

`tmux attach -t b`


Now bun index.js will:
Start automatically after reboot
Auto-restart if it crashes
