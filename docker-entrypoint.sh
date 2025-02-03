#!/bin/sh
set -e  # Exit immediately if a command exits with a non-zero status

# Optional: Debug mode
if [ "$DEBUG" = "true" ]; then
  set -x
fi

# Graceful shutdown handling (important!)
trap "cleanup" INT TERM

cleanup() {
  echo "Shutting down gracefully..."
  # Add any cleanup commands here, e.g., stopping services
  # ...
  exit 0  # Exit with success after cleanup
}

# Check for specific commands (e.g., migrations)
echo "Starting the application..."
exec python /app/server.py --listen "$@" #"$@" passes any arguments from docker run command to server.py
