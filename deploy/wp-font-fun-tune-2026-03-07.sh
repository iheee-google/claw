#!/usr/bin/env bash
set -euo pipefail

# 字体质感 + 轻趣味模块
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$css = <<<CSS
body{font-family:"Inter","PingFang SC","Noto Sans SC","Microsoft YaHei",system-ui,sans-serif!important;line-height:1.78;letter-spacing:.12px;}
h1,h2,h3,.wp-block-site-title{font-family:"Inter","PingFang SC","Noto Sans SC",sans-serif!important;}
a{color:#2563eb;transition:all .18s ease;}a:hover{color:#7c3aed;text-decoration:underline;text-underline-offset:3px;}
.wp-block-post,article,.wp-block-group{border-radius:14px;transition:transform .18s ease,box-shadow .18s ease;}
.wp-block-post:hover,article:hover{transform:translateY(-2px);box-shadow:0 8px 20px rgba(37,99,235,.08);}
main h2{position:relative;padding-bottom:6px;}main h2::after{content:"";position:absolute;left:0;bottom:0;width:56px;height:3px;border-radius:999px;background:linear-gradient(90deg,#2563eb,#7c3aed);}
.fun-note-wrap{margin-top:20px;padding:16px 18px;border:1px solid #dbe7ff;border-radius:12px;background:linear-gradient(180deg,#f8fbff,#fff);}
CSS;
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($css);
$home=get_page_by_path('home',OBJECT,'page');
if($home && strpos($home->post_content,'fun-note-wrap')===false){$home->post_content .= "\n<!-- wp:group {\"className\":\"fun-note-wrap\"} --><div class=\"wp-block-group fun-note-wrap\"><!-- wp:paragraph --><p>✨ <strong>今日一句：</strong>持续更新，比一次完美更厉害。</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>☕ 如果你今天只做一件事，那就写下一段真实复盘。</p><!-- /wp:paragraph --></div><!-- /wp:group -->"; wp_update_post(['ID'=>$home->ID,'post_content'=>$home->post_content]);}
PHP
