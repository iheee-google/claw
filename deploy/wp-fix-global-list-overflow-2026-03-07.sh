#!/usr/bin/env bash
set -euo pipefail

# 全站列表缩进收口，避免“凸出来”
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$base = function_exists('wp_get_custom_css') ? wp_get_custom_css() : '';
$patch = <<<CSS
/* Global list overflow alignment fix */
.wp-block-post-content ul,.wp-block-post-content ol,.entry-content ul,.entry-content ol,main .wp-block-group ul,main .wp-block-group ol,main article ul,main article ol{list-style-position:inside!important;margin-left:0!important;padding-left:0!important;}
.wp-block-post-content li,.entry-content li,main .wp-block-group li,main article li{margin-left:0!important;padding-left:0!important;text-indent:0!important;}
CSS;
if(strpos($base,'Global list overflow alignment fix')===false){$new=rtrim($base)."\n".$patch."\n";} else {$new=$base;}
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($new);
echo "OK\n";
PHP
