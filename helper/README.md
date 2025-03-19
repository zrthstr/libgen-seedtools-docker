## Helper Scripts

The `helper` directory contains two utility scripts:

- `gen_help.sh` - Shows available commands for when not using the Makefile
- `patch_config.sh` - Patches libgen_seedtool configuration files

These scripts are used during development and building, not needed for normal operation.

Scripts expect to be run from the repository root directory:
```bash
cd libgen-seedtools-docker
./helper/script_name.sh

