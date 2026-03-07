#!/usr/bin/env bash
set -euo pipefail

# 按页面ID隐藏/home渲染出来的标题（不是正文块）
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$home=get_page_by_path('home',OBJECT,'page'); if(!$home) exit(1);
$id=intval($home->ID);
$css=function_exists('wp_get_custom_css')?wp_get_custom_css():'';
$marker='Hide rendered title on /home page by page id';
$rule="\n/* {$marker} */\n.page-id-{$id} .entry-title,.page-id-{$id} h1.wp-block-post-title,.page-id-{$id} h1.wp-block-heading.has-text-align-left{display:none!important;}\n";
if(strpos($css,$marker)===false){$css=rtrim($css)."\n".$rule."\n"; if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($css);} 
PHP
