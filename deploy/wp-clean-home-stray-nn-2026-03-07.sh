#!/usr/bin/env bash
set -euo pipefail

# 清理首页内容中的孤立 nn 噪声字符
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$home=get_page_by_path('home',OBJECT,'page'); if(!$home) exit(1);
$c=$home->post_content;
$c=str_replace('<!-- /wp:heading -->nn','<!-- /wp:heading -->',$c);
$c=preg_replace('/-->\s*nn\s*\n/u','-->\n',$c);
$c=preg_replace('/(^|\n)\s*nn\s*(\n|$)/u','\n',$c);
wp_update_post(['ID'=>$home->ID,'post_content'=>$c]);
PHP
