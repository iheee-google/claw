#!/usr/bin/env bash
set -euo pipefail
# Step3 可读性优化
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$css=function_exists('wp_get_custom_css')?wp_get_custom_css():'';
$marker='Step3 readability polish 2026-03-07';
$patch='\n/* Step3 readability polish 2026-03-07 */\n.wp-site-blocks .wp-block-post-content,.wp-site-blocks .entry-content{max-width:760px;margin-left:auto;margin-right:auto;line-height:1.82;font-size:18px;letter-spacing:0.2px;}\n.wp-site-blocks .wp-block-post-content h2,.wp-site-blocks .entry-content h2{margin-top:1.8em;margin-bottom:0.7em;font-size:1.48em;line-height:1.35;}\n.wp-site-blocks .wp-block-post-content h3,.wp-site-blocks .entry-content h3{margin-top:1.4em;margin-bottom:0.6em;font-size:1.22em;line-height:1.4;}\n.wp-site-blocks .wp-block-post-content p,.wp-site-blocks .entry-content p{margin-bottom:1.05em;}\n.home .wp-block-heading.has-text-align-center{line-height:1.25;}\n.home .wp-block-group.has-white-color p.has-text-align-center{line-height:1.7;}\n';
if(strpos($css,$marker)===false && function_exists('wp_update_custom_css_post')) wp_update_custom_css_post(rtrim($css)."\n".$patch."\n");
PHP
