# Home Lab Docker Compose Repository

This repository contains Docker Compose configurations for a home lab infrastructure. It provides a structured approach to deploying and managing multiple services using Docker containers.

## Overview

This repository organizes various home lab services into individual directories under `/docker/` with each directory containing the necessary docker-compose files and supporting configurations. The setup includes:

- Web proxy management (nginx-proxy-manager)
- Media servers (Jellyfin, Immich)
- Container management (Portainer)
- Torrent tools (Sonarr, Radarr, QBittorrent, etc.)
- Various utilities (Audiobookshelf, Seerr, Mysterium, Heimdall, Pi-hole, Netdata)

## Repository Structure

```
/home/ubuntu/projects/home-lab/
├── docker/                    # Main directory containing all service configurations
│   ├── nginx-proxy-manager/   # Web proxy and SSL termination
│   ├── jellyfin/              # Media server
│   ├── immich/                # Photo and video management
│   ├── portainer/             # Container management UI
│   ├── torrent/               # Torrent toolchain (Sonarr, Radarr, QBittorrent, etc.)
│   ├── audiobookshelf/        # Audiobooks management
│   ├── seerr/                 # Request management for media tools
│   ├── mysterium/             # Privacy network
│   ├── heimdall/              # Dashboard for your services
│   ├── pihole/                # Network-level ad blocking
│   └── netdata/               # System monitoring
├── AGENTS.md                  # Documentation for working with this repo
└── IMPROVEMENT_SUGGESTIONS.md # Suggestions for repository improvements
```

## Prerequisites

1. Docker and Docker Compose installed on your system
2. Sufficient disk space for all services (varies by service)
3. Required volume directories created in `/srv/` (see below)

## Setup Instructions

### 1. Create Required Volumes

Before starting any services, create the necessary `/srv/` directories:

```bash
sudo mkdir -p /srv/nginx-proxy-manager/data
sudo mkdir -p /srv/nginx-proxy-manager/letsencrypt
sudo mkdir -p /srv/jellyfin/config
sudo mkdir -p /srv/jellyfin/cache
```

Some additional volumes may be required depending on the services you plan to use.

### 2. Environment Variables

Many services require environment variables defined in `.env` files within each service directory. Check individual service directories for required configuration.

### 3. Starting Services

Each service can be started individually using the provided automation scripts:

```bash
# Navigate to a specific service directory
cd docker/nginx-proxy-manager

# Start with pull and update
./start-pull.sh

# Or start normally  
./start.sh

# Stop the service
./stop.sh
```

## Service Groups

### Web Proxy & SSL
- **nginx-proxy-manager**: Reverse proxy with automatic SSL certificate management

### Media Servers
- **jellyfin**: Media server for video content
- **immich**: Self-hosted photo and video management
- **audiobookshelf**: Audiobooks management system  

### Torrent Toolchain
- **torrent/** directory contains Sonarr, Radarr, QBittorrent, Prowlarr, Lidarr, and Readmeabook
- These work together to manage media downloading and organization

### Utilities & Monitoring
- **portainer**: Web-based container management UI
- **heimdall**: Dashboard to organize all your services
- **pihole**: Network-level ad blocking
- **netdata**: System monitoring and performance tracking
- **seerr**: Request management for media tools
- **mysterium**: Privacy network

## Important Notes

1. **Volume Persistence**: All data is persisted in `/srv/` directories - ensure these are mounted properly
2. **Port Conflicts**: Services may use common ports (80, 443, 8096, etc.) - make sure they don't conflict with existing installations
3. **Hardware Requirements**: Some services require specific hardware capabilities (GPU acceleration for Immich, etc.)
4. **Security**: All services should be secured appropriately, especially when exposed to the internet

## Automation Scripts

Each service directory includes automation scripts:
- `start.sh`: Start the service(s)
- `stop.sh`: Stop the service(s) 
- `start-pull.sh`: Pull latest images and start the service(s)

These scripts are particularly useful for multi-container setups that have dependencies.

## Troubleshooting

### Common Issues
1. **Volume permissions**: Ensure proper ownership of `/srv/` directories
2. **Port conflicts**: Check if ports are already in use by other services  
3. **Network issues**: Some services need internet access for initial setup
4. **Health checks**: Services may take time to start and pass health checks

### Logs
Check service logs with:
```bash
cd docker/<service-name>
docker-compose logs <service>
```

## Contributing

This repository is managed as a home lab setup with Docker Compose configurations. Contributions can include:
- Improving documentation
- Adding new services  
- Fixing issues with existing configurations
- Adding security enhancements

---

*This repository was created to provide a self-contained, easy-to-deploy solution for managing a home lab with Docker containers.*