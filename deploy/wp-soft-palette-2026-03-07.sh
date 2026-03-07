#!/usr/bin/env bash
set -euo pipefail

# 整体配色降亮度：柔和灰蓝底 + 米白卡片，减少刺眼感
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$css = <<<CSS
:root{--bg:#eef2f7;--bg-2:#e8edf4;--panel:#f8fafc;--panel-2:#f3f6fb;--text:#243247;--muted:#5b6c84;--line:#d8e0ec;--primary:#3b5ccc;--accent:#6b5bbf;}
html,body{background:linear-gradient(180deg,var(--bg),var(--bg-2))!important;color:var(--text)!important;}
a{color:var(--primary)!important;} a:hover{color:var(--accent)!important;}
header.wp-block-template-part,main>.wp-block-group,main>article,.wp-block-post,.wp-block-group,.recent-updates-wrap,.featured-notes-wrap,.fun-note-wrap{background:linear-gradient(180deg,var(--panel),var(--panel-2))!important;border:1px solid var(--line)!important;box-shadow:0 4px 14px rgba(40,56,88,.06)!important;}
p,li{color:var(--muted)!important;}
CSS;
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($css);
PHP
