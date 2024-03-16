# Config
HOST=""
USER=""
PASSWORD="PASSWORD"
FOLDER="/media/backups"
WEBHOOK_URL="YOURWEBHOOK"

# Watch YouTube Tutorial so that you understand everything
timestamp=$(date +%Y-%m-%d)´
apt install zip unzip ftp
echo "Backuping..."
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] Backup Started.\"}" $WEBHOOK_URL
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] Stopping Services\"}" $WEBHOOK_URL
systemctl stop SERVICE
echo "Stopping SERVICE"
systemctl stop SERVICE
echo "Stopping SERVICE"
/home/SERVICE/stop.sh
echo "Stopping SERVICE"

curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] Stopped Services\"}" $WEBHOOK_URL
sleep 1
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] Zipping Services\"}" $WEBHOOK_URL
echo "Zipping SERVICE"
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] Zipping SERVICE\"}" $WEBHOOK_URL
zip -r SERVICE_$timestamp.zip /home/SERVICE
echo "SERVICE zipped"
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] SERVICE Zipped\"}" $WEBHOOK_URL
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] Zipping SERVICE\"}" $WEBHOOK_URL
zip -r SERVICE_$timestamp.zip /home/SERVICE/
echo "SERVICE Zipped"
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] MySQL Zipped\"}" $WEBHOOK_URL
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] Zipping SERVICE\"}" $WEBHOOK_URL
zip -r cloudmc_$timestamp.zip /home/SERVICE/
echo "SERVICE Zipped"
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] SERVICE Zipped\"}" $WEBHOOK_URL

curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] Zipping all Together\"}" $WEBHOOK_URL
zip -r services_backup_$timestamp.zip SERVICE_$timestamp.zip SERVICE_$timestamp.zip SERVICE_$timestamp.zip

curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] Connecting to FTP\"}" $WEBHOOK_URL
ftp -inv $HOST << EOF
user $USER $PASSWORD
cd $FOLDER
put services_backup_$timestamp.zip
bye
EOF
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] FTP Done\"}" $WEBHOOK_URL


rm services_backup_$timestamp
rm SERVICE_$timestamp.zip
rm SERVICE_$timestamp.zip
rm SERVICE_$timestamp.zip
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] Deleted Zips on Main-End\"}" $WEBHOOK_URL

systemctl start SERVICE
echo "Started SERVICE"
systemctl start SERVICE
echo "Started SERVICE"
/home/SERVICE/start.sh
echo "Started SERVICE"
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"[$timestamp] Started Services\"}" $WEBHOOK_URL
