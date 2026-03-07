#!/usr/bin/env bash
set -euo pipefail

# 修复文章页列表项目缩进“凸出来”问题
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$base = function_exists('wp_get_custom_css') ? wp_get_custom_css() : '';
$patch = <<<CSS
/* List indent alignment fix */
.single .wp-block-post-content ul,.single .wp-block-post-content ol{padding-left:1.1em!important;margin-left:0!important;list-style-position:outside!important;}
.single .wp-block-post-content li{padding-left:0!important;text-indent:0!important;}
.single .wp-block-post-content li::marker{font-size:.95em;color:#64748b;}
CSS;
if(strpos($base,'List indent alignment fix')===false){$new=rtrim($base)."\n".$patch."\n";} else {$new=$base;}
if(function_exists('wp_update_custom_css_post')) wp_update_custom_css_post($new);
echo "OK\n";
PHP
