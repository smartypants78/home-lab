docker compose -f ./gluetun/docker-compose.yml up -d

echo "waiting for gluetun"
sleep 5

docker compose -f ./qbittorrent/docker-compose.yml up -d
docker compose -f ./prowlarr/docker-compose.yml up -d
docker compose -f ./radarr/docker-compose.yml up -d
docker compose -f ./sonarr/docker-compose.yml up -d