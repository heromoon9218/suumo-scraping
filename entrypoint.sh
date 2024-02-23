#!/bin/bash
set -e

rm -f /suumo-scraping/tmp/pids/server.pid

exec "$@"