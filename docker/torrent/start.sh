docker compose -f ./gluetun/docker-compose.yml up -d

echo "Waiting for gluetun to respond as healthy"
until [ "`docker inspect -f {{.State.Health.Status}} gluetun`"=="healthy" ]; do
    sleep 0.1;
done;

docker compose -f ./qbittorrent/docker-compose.yml up -d
docker compose -f ./prowlarr/docker-compose.yml up -d
docker compose -f ./radarr/docker-compose.yml up -d
docker compose -f ./sonarr/docker-compose.yml up -d
docker compose -f ./lidarr/docker-compose.yml up -d