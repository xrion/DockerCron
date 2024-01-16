#!/bin/bash
# script.sh
# This script visits a URL specified in an environment variable

# Default URL if not specified
URL=${TARGET_URL:-"https://syndico-flasks-devis4.app.newstack.be/increment"}

# Use curl to visit the URL
curl ${URL}
