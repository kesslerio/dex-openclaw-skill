#!/bin/bash
# Daily Oura Health Report - Hybrid Format
# Triggered by cron at 8:00 AM PT

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load environment variables from .env if present
if [ -f "$SCRIPT_DIR/../.env" ]; then
    source "$SCRIPT_DIR/../.env"
fi

# Set PYTHONPATH to include oura-analytics scripts
export PYTHONPATH="/home/art/niemand/skills/oura-analytics/scripts:$PYTHONPATH"

# Run the report
python3 "$SCRIPT_DIR/daily-oura-report-hybrid.py" "$@"
