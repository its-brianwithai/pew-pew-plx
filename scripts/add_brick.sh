#!/bin/bash

# Script to add a specific brick folder globally and locally
# Usage: 
#   1. Copy this script to the brick folder you want to add
#   2. Run ./add_brick.sh to add just that brick to mason
#   3. Run mason make <brick-name> to clone the brick

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

BRICK_NAME=${PWD##*/}

echo -e "${YELLOW}Adding brick globally: $BRICK_NAME${NC}"

mason add "$BRICK_NAME" --path . -g

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Successfully added brick globally${NC}"
else
    echo -e "${RED}Failed to add brick globally${NC}"
    exit 1
fi

mason add "$BRICK_NAME" --path .

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Successfully added brick${NC}"
else
    echo -e "${RED}Failed to add brick${NC}"
    exit 1
fi
