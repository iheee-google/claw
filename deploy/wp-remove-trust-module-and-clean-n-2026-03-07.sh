#!/usr/bin/env bash
set -euo pipefail

# 首页移除 trust-module，并清理孤立 n/nn 字符
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$home=get_page_by_path('home',OBJECT,'page'); if(!$home) exit(1);
$c=$home->post_content;
$c=preg_replace('/<!-- wp:group \{\"className\":\"trust-module\"\} -->[\s\S]*?<!-- \/wp:group -->\s*/u','',$c);
$c=str_replace(['<!-- /wp:heading -->nn','<!-- /wp:heading -->n'],['<!-- /wp:heading -->','<!-- /wp:heading -->'],$c);
$c=preg_replace('/(^|\n)\s*n{1,2}\s*(\n|$)/u','\n',$c);
$c=preg_replace('/<p>\s*n{1,2}\s*<\/p>\s*/u','',$c);
wp_update_post(['ID'=>$home->ID,'post_content'=>$c]);
PHP
