docker compose -f ./docker-compose.yml up -d

echo "Waiting for gluetun to respond as healthy"
until [ "`docker inspect -f {{.State.Health.Status}} nginx-proxy-manager`"=="healthy" ]; do
    sleep 0.1;
done;

docker compose -f ./nextcloud/docker-compose.yml up -d