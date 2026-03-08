# VitePress 迁移说明（可回滚）

## 已执行要点
- 先备份 WordPress 文件、数据库、Nginx 配置
- 再部署 VitePress 并切换 Nginx
- 保留秒级回滚命令

## 回滚
```bash
ln -sfn /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/wordpress
rm -f /etc/nginx/sites-enabled/vitepress
/usr/sbin/nginx -t && systemctl reload nginx
```

必要时恢复数据库：
```bash
mysql -u<db_user> -p'<db_pass>' <db_name> < /var/backups/site-migration-YYYY-MM-DD-HHMMSS/wordpress-db.sql
```
