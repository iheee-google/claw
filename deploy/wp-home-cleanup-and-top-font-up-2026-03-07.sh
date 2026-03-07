#!/usr/bin/env bash
set -euo pipefail

# 首页删“分类导航/最近更新/推荐阅读” + 顶部字体放大 + 内容上移
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$home=get_page_by_path('home',OBJECT,'page');
if($home){
  $c=$home->post_content;
  foreach([
    '/<h2[^>]*>\\s*分类导航\\s*<\\/h2>[\\s\\S]*$/u',
    '/<h3[^>]*>\\s*分类导航\\s*<\\/h3>[\\s\\S]*$/u',
    '/<h2[^>]*>\\s*最近更新\\s*<\\/h2>[\\s\\S]*$/u',
    '/<h3[^>]*>\\s*最近更新\\s*<\\/h3>[\\s\\S]*$/u',
    '/<h2[^>]*>\\s*推荐阅读\\s*<\\/h2>[\\s\\S]*$/u',
    '/<h3[^>]*>\\s*推荐阅读\\s*<\\/h3>[\\s\\S]*$/u',
  ] as $p){ $c=preg_replace($p,'',$c);} 
  $c=str_replace(['分类导航','最近更新','推荐阅读'],'',$c);
  wp_update_post(['ID'=>$home->ID,'post_content'=>$c]);
}
$css=function_exists('wp_get_custom_css')?wp_get_custom_css():'';
$marker='Top nav size up + home content pull up 2026-03-07';
$patch='\n/* Top nav size up + home content pull up 2026-03-07 */\nheader .wp-block-site-title a,header .wp-block-site-title{font-size:30px!important;font-weight:700!important;}\nheader .wp-block-navigation .wp-block-navigation-item__content{font-size:22px!important;font-weight:500!important;}\n.home main.wp-block-group{margin-top:18px!important;}\n.home .wp-site-blocks > main{margin-top:18px!important;}\n.home .wp-block-group.has-global-padding{padding-top:8px!important;}\n';
if(strpos($css,$marker)===false){$css=rtrim($css)."\n".$patch."\n"; if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($css);} 
PHP
