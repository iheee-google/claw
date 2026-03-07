#!/usr/bin/env bash
set -euo pipefail

# Round2：去掉示例页面 + 视觉比例精修
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$sample = get_page_by_path('sample-page', OBJECT, 'page');
if($sample){ wp_delete_post($sample->ID, true); }
$css = <<<CSS
header.wp-block-template-part{position:static!important;background:rgba(255,255,255,.9)!important;border-bottom:1px solid #d6e0f5!important;}
.wp-site-blocks{max-width:1120px!important;padding:0 22px!important;}
.single article{padding:36px 42px!important;}
h1{font-size:clamp(34px,4.2vw,48px)!important;} h2{font-size:30px!important;} p{font-size:19px!important;line-height:2.02!important;}
.home .wp-block-group{padding:56px 48px!important;border-radius:22px!important;}
CSS;
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($css);
echo "OK\n";
PHP
