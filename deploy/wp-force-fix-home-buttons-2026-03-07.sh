#!/usr/bin/env bash
set -euo pipefail

# 强制修复首页快捷按钮变黑问题（最高优先级覆盖）
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$css=function_exists('wp_get_custom_css')?wp_get_custom_css():'';
$patch=<<<CSS
/* Force fix: home quick buttons should never be black */
.home .quick-entry-buttons .wp-block-button .wp-block-button__link,
.home .quick-entry-buttons .wp-block-button a.wp-element-button,
.home .quick-entry-buttons .wp-block-button .wp-element-button,
.home .quick-entry-buttons .wp-block-button__link.wp-element-button{background:#eaf0ff!important;background-image:none!important;color:#2d4eb3!important;border:1px solid #cfdcf8!important;box-shadow:none!important;text-shadow:none!important;}
.home .quick-entry-buttons .wp-block-button .wp-block-button__link:hover,
.home .quick-entry-buttons .wp-block-button a.wp-element-button:hover,
.home .quick-entry-buttons .wp-block-button .wp-element-button:hover{background:#dde7ff!important;color:#1f3f9d!important;}
CSS;
if(strpos($css,'Force fix: home quick buttons should never be black')===false){$css=rtrim($css)."\n".$patch."\n";}
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($css);
PHP
