#!/bin/bash

# Find the path to the Newsboat executable
NEWSBOAT_BIN=$(command -v newsboat)

# Check if Newsboat is installed
if [ -x "$NEWSBOAT_BIN" ]; then
    # Reload all feeds
    "$NEWSBOAT_BIN" -r
else
    echo "Error: Newsboat not found or executable." >&2
    exit 1
fi
