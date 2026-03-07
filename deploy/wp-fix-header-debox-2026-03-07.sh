#!/usr/bin/env bash
set -euo pipefail

# 去掉顶部多层边框，仅保留一层
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$base = function_exists('wp_get_custom_css') ? wp_get_custom_css() : '';
$patch = <<<CSS
/* Header de-box patch */
header.wp-block-template-part{border:1px solid #d6e0f5!important;border-radius:14px!important;background:rgba(255,255,255,.92)!important;padding:10px 14px!important;}
header.wp-block-template-part *{box-shadow:none!important;}
header.wp-block-template-part .wp-block-group,header.wp-block-template-part .wp-block-columns,header.wp-block-template-part .wp-block-column,header.wp-block-template-part nav,header.wp-block-template-part .wp-block-navigation,header.wp-block-template-part .wp-block-navigation__container,header.wp-block-template-part .wp-block-navigation-item,header.wp-block-template-part .wp-block-site-title{border:none!important;outline:none!important;background:transparent!important;border-radius:0!important;padding-top:0!important;padding-bottom:0!important;margin-top:0!important;margin-bottom:0!important;}
CSS;
if(strpos($base,'Header de-box patch')===false){$new=rtrim($base)."\n".$patch."\n";} else {$new=$base;}
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($new);
echo "OK\n";
PHP
