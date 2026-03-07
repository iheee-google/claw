#!/usr/bin/env bash
set -euo pipefail
# Step5 细节一致性收口
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$css=function_exists('wp_get_custom_css')?wp_get_custom_css():'';
$marker='Step5 visual consistency polish 2026-03-07';
$patch='\n/* Step5 visual consistency polish 2026-03-07 */\n:root{--site-soft-blue:#edf3ff;--site-soft-border:#d5e0f6;--site-text-main:#2f4368;}\n.wp-block-button__link,.quick-link-card{border-radius:10px!important;}\n.home .wp-block-group,.page .wp-block-group{border-radius:12px;}\n.home .wp-block-group,.page .wp-block-group,.single .wp-block-group{color:var(--site-text-main);}\n.home .wp-block-group + .wp-block-group{margin-top:16px!important;}\n.home a,.page a,.single a{color:#2e4ea8;}\n.home a:hover,.page a:hover,.single a:hover{color:#1f3f92;}\n';
if(strpos($css,$marker)===false && function_exists('wp_update_custom_css_post')) wp_update_custom_css_post(rtrim($css)."\n".$patch."\n");
PHP
