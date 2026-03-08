#!/usr/bin/env bash
set -euo pipefail

# WordPress -> VitePress migration with rollback safety
# Target: Ubuntu + Nginx + MariaDB

IP_ADDR="43.143.240.242"
WP_DIR="/var/www/wordpress"
VP_DIR="/var/www/vitepress-site"
TS="$(date +%F-%H%M%S)"
BACKUP_DIR="/var/backups/site-migration-$TS"

mkdir -p "$BACKUP_DIR"

DB_NAME=$(sed -n "s/define( *'DB_NAME', *'\(.*\)' *);/\1/p" "$WP_DIR/wp-config.php" | tr -d '\r')
DB_USER=$(sed -n "s/define( *'DB_USER', *'\(.*\)' *);/\1/p" "$WP_DIR/wp-config.php" | tr -d '\r')
DB_PASS=$(sed -n "s/define( *'DB_PASSWORD', *'\(.*\)' *);/\1/p" "$WP_DIR/wp-config.php" | tr -d '\r')

cp -a /etc/nginx/sites-available/wordpress "$BACKUP_DIR/nginx-wordpress.conf"
cp -a "$WP_DIR" "$BACKUP_DIR/wordpress-files"
mysqldump -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/wordpress-db.sql"

mkdir -p "$VP_DIR/docs/.vitepress" "$VP_DIR/docs/guide"
cat > "$VP_DIR/package.json" <<'JSON'
{
  "name": "site-vitepress",
  "private": true,
  "type": "module",
  "scripts": {
    "docs:dev": "vitepress dev docs --host 0.0.0.0 --port 5173",
    "docs:build": "vitepress build docs",
    "docs:preview": "vitepress preview docs --host 0.0.0.0 --port 4173"
  },
  "devDependencies": {
    "vitepress": "^1.6.4"
  }
}
JSON

cat > "$VP_DIR/docs/.vitepress/config.mjs" <<'JS'
export default {
  title: 'Notes',
  description: 'Built with VitePress',
  lastUpdated: true,
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/getting-started' }
    ]
  }
}
JS

cat > "$VP_DIR/docs/index.md" <<'MD'
---
layout: home
hero:
  name: "Notes"
  text: "A clean site rebuilt with VitePress"
  tagline: "Fast, simple, and easy to maintain"
---
MD

cat > "$VP_DIR/docs/guide/getting-started.md" <<'MD'
# Getting Started

Migrated from WordPress with rollback safety.
MD

cd "$VP_DIR"
npm install
npm run docs:build

cat > /etc/nginx/sites-available/vitepress <<NGINX
server {
    listen 80;
    listen [::]:80;
    server_name $IP_ADDR _;

    root $VP_DIR/docs/.vitepress/dist;
    index index.html;

    location / {
        try_files \$uri \$uri.html \$uri/ /index.html;
    }
}
NGINX

ln -sfn /etc/nginx/sites-available/vitepress /etc/nginx/sites-enabled/vitepress
rm -f /etc/nginx/sites-enabled/wordpress
/usr/sbin/nginx -t
systemctl reload nginx

echo "Migration done. Backup: $BACKUP_DIR"
