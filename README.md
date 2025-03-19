# Libgen Seedtools Docker

A Docker Compose setup for managing and seeding Library Genesis content. Simple to deploy and operate.

## Overview

This project provides a containerized environment for running [libgen-seedtools](https://github.com/zrthstr/libgen-seedtools) with [Transmission](https://transmissionbt.com/). It identifies and fetches torrents most in need of additional seeders. This helps maintain availability of educational and scientific resources in the Library Genesis ecosystem.


## Requirements

### Required
- Docker
- Docker Compose
- Make (for running convenience commands)

### Recommended
- Linux operating system
- VPN for privacy and security when using torrents
- Forwarded port in your VPN-gateway/router/firewall (improves torrent connectivity and speeds but NOT necessary)

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/zrthstr/libgen-seedtools-docker.git
   cd libgen-seedtools-docker
   ```

2. Build the containers:
   ```bash
   make system-build
   ```

3. Start the services:
   ```bash
   make system-up
   ```

4. Fetch Library Genesis content:
   ```bash
   make libgen-seedtools-fetch
   ```

5. Check your active torrents:
   ```bash
   make transmission-count
   ```


## Configuration

### Libgen Seedtools
- Config file: `data/libgen-seedtools/config.json`
- Common settings to adjust: `max_disk_usage` (default: 100GB)

### Transmission
- Config file: `data/transmission/settings.json`
- **Important**: Transmission will overwrite config changes on exit. Either:
  - Stop the service before editing the config, or
  - After editing while running, apply changes with: `make transmission-reread-config`



## Directory Structure

- `./data` - Configuration and data files
- `./downloads` - Downloaded torrent files
- `./libgen-seedtools` - libgen-seedtools container files
- `./transmission` - Transmission container files



## Advanced Usage

For more control over the setup and configuration:

1. Generate a fresh configuration (if needed):
   ```bash
   make libgen-seedtools-generate-config
   ```

2. Patch the configuration for libgen-seedtools (if needed):
   ```bash
   sh helper/patch_config.sh
   ```

3. Start services in foreground to see logs in real-time:
   ```bash
   make system-up-foreground
   ```

4. Access container shells for manual operations:
   ```bash
   make libgen-seedtools-shell
   # or
   make transmission-shell
   ```

5. Perform specific operations:
   ```bash
   # Run tests to verify proper setup
   make test
   
   # Force Transmission to reload configuration
   make transmission-reread-config
   ```


## Running Without Make

If you prefer to use Docker Compose directly without Make, you can run the commands directly:

```bash
# Show all available commands
sh helper/gen_help.sh

# Build containers
docker compose build --no-cache

# Start services in background
docker compose up -d

# Fetch content
docker compose run --no-deps --rm --remove-orphans libgen-seedtools fetch

# Check torrents
docker compose exec transmission transmission-remote --list

# Access container shells
docker compose exec libgen-seedtools /bin/sh
docker compose exec transmission /bin/sh

# Stop services
docker compose down
```


## Available Commands

### System Commands

- `make system-up` - Start all services in detached mode
- `make system-up-foreground` - Start all services in foreground
- `make system-down` - Stop all services
- `make system-logs` - View logs from all services
- `make system-build` - Build all container images

### Libgen Seedtools Commands

- `make libgen-seedtools-fetch` - Fetch Library Genesis content
- `make libgen-seedtools-test` - Test libgen-seedtools installation
- `make libgen-seedtools-shell` - Open a shell in the libgen-seedtools container

### Transmission Commands

- `make transmission-test` - Test Transmission installation
- `make transmission-count` - List current torrents
- `make transmission-reread-config` - Force Transmission to reread its configuration
- `make transmission-shell` - Open a shell in the Transmission container

### Testing Commands

- `make test` - Run all tests



## Development

For development purposes, you can use the following commands:

```bash
# Test the installation
make test

# Open shells in the containers
make libgen-seedtools-shell
make transmission-shell
```

## Troubleshooting

If you encounter issues:

1. Check the logs:
   ```bash
   make system-logs
   ```

2. Verify containers are running:
   ```bash
   docker ps
   ```

3. Ensure Transmission is properly configured:
   ```bash
   make transmission-count
   ```

4. For Transmission configuration changes:
   - Stop Transmission before editing the config file, or 
   - After editing while running, use the HUP signal to reload:
   ```bash
   make transmission-reread-config
   ```
   Note: Transmission will rewrite its config file to the original state upon exit if you don't properly reload it.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT
