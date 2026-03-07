#!/usr/bin/env bash
set -euo pipefail

# WordPress 外观与内容优化脚本（2026-03-07）
# 作用：
# 1) 注入科技感主题 CSS
# 2) 更新首页内容块
# 3) 更新首篇复盘文章为细节版

php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';

$css = <<<CSS
:root{--bg:#070b14;--card:#0f172a;--text:#dbe7ff;--text-soft:#9fb3d9;--primary:#38bdf8;--secondary:#22d3ee;--accent:#8b5cf6;--line:#1f2a44;--radius:18px;}
html,body{background:radial-gradient(1200px 600px at 10% -10%, #16223d 0%, rgba(22,34,61,0) 45%),radial-gradient(1200px 700px at 110% -20%, #1b1f4a 0%, rgba(27,31,74,0) 50%),var(--bg)!important;color:var(--text)!important;}
body{line-height:1.9;}
a{color:var(--primary)!important;} a:hover{color:var(--secondary)!important;}
.wp-site-blocks{max-width:1220px;margin:0 auto;padding:0 18px;}
header.wp-block-template-part{background:rgba(8,12,24,.75)!important;border-bottom:1px solid var(--line);} 
.wp-block-post, article, .wp-block-query .wp-block-post-template>li, .wp-block-group{background:linear-gradient(180deg,#0f172a,#111a2f)!important;border:1px solid var(--line)!important;border-radius:var(--radius)!important;}
.single article{padding:34px 36px!important;margin-top:24px!important;}
h1,h2,h3{color:#eef4ff!important;line-height:1.35;} h1{font-size:clamp(30px,4.2vw,44px)!important;}
p{font-size:18px!important;color:var(--text-soft)!important;line-height:2.0!important;margin:14px 0!important;}
.single .wp-block-post-terms{display:block!important;font-size:20px!important;margin:8px 0 30px!important;}
.single .wp-block-post-date{display:block!important;margin-top:28px!important;font-size:14px!important;}
footer .wp-block-navigation a[href="#"]{display:none!important;}
@media (max-width: 768px){.single article{padding:22px 18px!important;}p{font-size:16px!important;line-height:1.9!important;}}
CSS;
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($css);

echo "UPDATED\n";
PHP
