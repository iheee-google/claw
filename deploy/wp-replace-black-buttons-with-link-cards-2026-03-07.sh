#!/usr/bin/env bash
set -euo pipefail

# 彻底绕过按钮组件：替换为普通链接卡片，解决默认黑底
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$home=get_page_by_path('home',OBJECT,'page'); if(!$home) exit(1);
$c=$home->post_content;
$c=preg_replace('/<!-- wp:buttons \{\"className\":\"quick-entry-buttons\"\} -->[\s\S]*?<!-- \/wp:buttons -->/u','',$c);
if(strpos($c,'quick-entry-links')===false){$c .= "\n<!-- wp:group {\"className\":\"quick-entry-links\"} --><div class=\"wp-block-group quick-entry-links\"><p><a class=\"quick-link-card\" href=\"/quick-start/\">🚀 快速入口</a> <a class=\"quick-link-card\" href=\"/category/project-retrospectives/\">🧭 看复盘</a></p></div><!-- /wp:group -->";}
wp_update_post(['ID'=>$home->ID,'post_content'=>$c]);
$css=function_exists('wp_get_custom_css')?wp_get_custom_css():'';
$patch='\n/* Replace button block with link cards (avoid theme button black default) */\n.quick-entry-links p{display:flex;gap:10px;flex-wrap:wrap;margin:0;}\n.quick-link-card{display:inline-block;padding:8px 14px;border-radius:10px;background:#eaf0ff;color:#2d4eb3!important;border:1px solid #cfdcf8;text-decoration:none;}\n.quick-link-card:hover{background:#dde7ff;color:#1f3f9d!important;}\n';
if(strpos($css,'Replace button block with link cards')===false){$css=rtrim($css).$patch; if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($css);} 
PHP
