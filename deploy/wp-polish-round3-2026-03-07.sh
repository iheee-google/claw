#!/usr/bin/env bash
set -euo pipefail

# Round3：压缩顶部白块 + 收紧留白 + 首页层次优化
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$css = <<<CSS
.wp-site-blocks{max-width:1080px!important;padding:0 16px!important;}
header.wp-block-template-part,header.wp-block-template-part .wp-block-group{padding-top:14px!important;padding-bottom:14px!important;min-height:unset!important;border-radius:14px!important;}
header .wp-block-site-title{font-size:28px!important;} header .wp-block-navigation-item__content{font-size:14px!important;}
main{margin-top:18px!important;} main>.wp-block-group, main>article, .wp-block-post{padding:26px 28px!important;border-radius:16px!important;}
.home .wp-block-post-title{display:none!important;} .home .wp-block-group{padding:34px 30px!important;}
CSS;
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($css);
echo "OK\n";
PHP
