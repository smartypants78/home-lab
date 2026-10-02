# Home Lab Docker Repository

This repository contains docker-compose configurations for a home lab infrastructure. The structure consists of multiple services organized under `/docker/` directories.

## Key Facts for Working here

- Each service is in its own directory under `docker/`
- Most services are standard docker-compose setups with typical volume mappings
- Services include: nginx-proxy-manager, immich, jellyfin, portainer, seerr, audiobookshelf, mysterium, heimdall, pihole, netdata, and various torrent-related tools (sonarr, radarr, qbittorrent, prowlarr, lidarr)
- Some services require specific volumes to be created beforehand:
  - `/srv/nginx-proxy-manager/data`
  - `/srv/nginx-proxy-manager/letsencrypt`  
  - `/srv/jellyfin/config`, `/srv/jellyfin/cache`
  - Database volumes for immich and other services
- Many services use environment variables defined in `.env` files
- Services typically expose ports to the host (e.g., 8096 for Jellyfin, 80/443 for nginx-proxy-manager)
- All compose files are in standard docker-compose format
- Some services have automation scripts: `start.sh`, `stop.sh`, and `start-pull.sh` for deployment orchestration

## How to Work with This

### Starting Services
```bash
cd docker/<service-name>
docker-compose up -d
```

### Stopping Services  
```bash
cd docker/<service-name>
docker-compose down
```

### Useful Commands
- `docker-compose ps` - Check service status
- `docker-compose logs <service>` - View service logs
- `docker-compose pull` - Update containers to latest versions

### Important Directories
- `/srv/` - Mount point for persistent volumes (create these before starting services)
- `/home/ubuntu/projects/home-lab/docker/` - Root of the docker configurations

## Special Notes
- The repository contains both standalone services and torrent toolchain (sonarr, radarr, qbittorrent, prowlarr, lidarr) that are typically used together for media management
- Immich has machine learning components that can utilize hardware acceleration (openvino by default)
- Services that require specific device access (like Jellyfin with GPU acceleration) have device mappings in their compose files