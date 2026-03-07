#!/usr/bin/env bash
set -euo pipefail

# 回退UI到稳定默认状态，保留内容
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post('');
foreach([
  '/var/www/wordpress/wp-content/mu-plugins/force-list-align.php',
  '/var/www/wordpress/wp-content/mu-plugins/site-ux-tweaks.php'
] as $p){ if(file_exists($p)) @unlink($p); }
update_option('show_on_front','posts');
update_option('page_on_front',0);
echo "ROLLBACK_OK\n";
PHP
