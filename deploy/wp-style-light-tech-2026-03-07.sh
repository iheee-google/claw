#!/usr/bin/env bash
set -euo pipefail

# WordPress：科技感浅色方案 + 取消粘性头部
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$css = <<<CSS
header.wp-block-template-part{position:static!important;top:auto!important;z-index:auto!important;background:rgba(255,255,255,.92)!important;border-bottom:1px solid #d7e3ff!important;}
html,body{background:#eef4ff!important;color:#1d2a44!important;}
a{color:#2563eb!important;} a:hover{color:#0ea5e9!important;}
.wp-block-post, article, .wp-block-group{background:#fff!important;border:1px solid #d7e3ff!important;border-radius:18px!important;box-shadow:0 8px 22px rgba(37,99,235,.08)!important;}
p{line-height:2!important;font-size:18px!important;color:#3e4f72!important;}
CSS;
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($css);
echo "OK\n";
PHP
