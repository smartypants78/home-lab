docker compose -f ./docker-compose.yml up -d

echo "Waiting for nginx-proxy-manager"
sleep 1.0;

docker compose -f ./nextcloud/docker-compose.yml up -d