#!/usr/bin/env bash
set -euo pipefail

# 每日 WordPress 备份（数据库 + uploads），保留14天
WP_PATH="/var/www/wordpress"
BACKUP_ROOT="/var/backups/wordpress"
RETENTION_DAYS="14"
NOW="$(date +%F_%H%M%S)"
TODAY_DIR="$BACKUP_ROOT/$NOW"

mkdir -p "$TODAY_DIR"
DB_NAME=$(php -r "include '$WP_PATH/wp-config.php'; echo DB_NAME;" 2>/dev/null)
DB_USER=$(php -r "include '$WP_PATH/wp-config.php'; echo DB_USER;" 2>/dev/null)
DB_PASS=$(php -r "include '$WP_PATH/wp-config.php'; echo DB_PASSWORD;" 2>/dev/null)
DB_HOST=$(php -r "include '$WP_PATH/wp-config.php'; echo DB_HOST;" 2>/dev/null)
MYSQL_PWD="$DB_PASS" mysqldump -h "$DB_HOST" -u "$DB_USER" "$DB_NAME" | gzip > "$TODAY_DIR/db.sql.gz"
tar -czf "$TODAY_DIR/uploads.tar.gz" -C "$WP_PATH/wp-content" uploads
find "$BACKUP_ROOT" -mindepth 1 -maxdepth 1 -type d -mtime +$RETENTION_DAYS -exec rm -rf {} +
ln -sfn "$TODAY_DIR" "$BACKUP_ROOT/latest"
echo "BACKUP_OK:$TODAY_DIR"
