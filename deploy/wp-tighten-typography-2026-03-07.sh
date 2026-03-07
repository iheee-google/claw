#!/usr/bin/env bash
set -euo pipefail

# 收紧正文与标题间距，提升阅读密度
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$base = function_exists('wp_get_custom_css') ? wp_get_custom_css() : '';
$patch = <<<CSS
/* Typography tighten patch */
main > .wp-block-group, main > article, .wp-block-post{padding:20px 24px!important;}
p, li{font-size:16px!important;line-height:1.72!important;letter-spacing:0!important;}
h2{font-size:24px!important;margin:18px 0 8px!important;} h3{font-size:20px!important;margin:14px 0 6px!important;}
.single .wp-block-post-content > *{margin-top:8px!important;margin-bottom:8px!important;}
CSS;
if(strpos($base,'Typography tighten patch')===false){$new=rtrim($base)."\n".$patch."\n";} else {$new=$base;}
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($new);
echo "OK\n";
PHP
