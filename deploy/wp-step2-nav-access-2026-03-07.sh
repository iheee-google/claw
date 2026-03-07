#!/usr/bin/env bash
set -euo pipefail

# Step2: 导航可达性优化（快速入口页 + 首页快捷按钮）
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$slug='quick-start'; $exist=get_page_by_path($slug,OBJECT,'page');
$content='<h2>快速入口</h2><ol><li><a href="/category/study-notes/">学习笔记</a></li><li><a href="/category/project-retrospectives/">项目复盘</a></li><li><a href="/category/tool-guides/">工具教程</a></li></ol>';
$arr=['post_title'=>'快速入口','post_name'=>$slug,'post_status'=>'publish','post_type'=>'page','post_content'=>$content];
if($exist){$arr['ID']=$exist->ID;wp_update_post($arr);}else{wp_insert_post($arr);} 
$home=get_page_by_path('home',OBJECT,'page');
if($home && strpos($home->post_content,'quick-entry-buttons')===false){$home->post_content .= "\n<!-- wp:buttons {\"className\":\"quick-entry-buttons\"} --><div class=\"wp-block-buttons quick-entry-buttons\"><!-- wp:button --><div class=\"wp-block-button\"><a class=\"wp-block-button__link wp-element-button\" href=\"/quick-start/\">快速入口</a></div><!-- /wp:button --><!-- wp:button --><div class=\"wp-block-button\"><a class=\"wp-block-button__link wp-element-button\" href=\"/category/project-retrospectives/\">看复盘</a></div><!-- /wp:button --></div><!-- /wp:buttons -->"; wp_update_post(['ID'=>$home->ID,'post_content'=>$home->post_content]);}
PHP
