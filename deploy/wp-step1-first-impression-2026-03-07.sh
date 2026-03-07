#!/usr/bin/env bash
set -euo pipefail

# Step1: 首访5秒可理解（首页文案 + 新访客入口）
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$home=get_page_by_path('home',OBJECT,'page'); if(!$home){exit(1);} $c=$home->post_content;
$c=preg_replace('/iheee 的成长笔记/u','工程实践与复盘笔记',$c,1);
$c=preg_replace('/记录学习心得、项目复盘与工具实践。慢慢写，持续进步。/u','这里记录真实开发过程：报错、修复、复盘与可复用方法。',$c,1);
if(strpos($c,'new-visitor-wrap')===false){$c.="\n<!-- wp:group {\"className\":\"new-visitor-wrap\"} --><div class=\"wp-block-group new-visitor-wrap\"><!-- wp:heading {\"level\":3} --><h3 class=\"wp-block-heading\">新访客从这里开始</h3><!-- /wp:heading --><!-- wp:list --><ul><li><a href=\"/category/study-notes/\">先看：学习笔记（方法与实践）</a></li><li><a href=\"/category/project-retrospectives/\">再看：项目复盘（问题与决策）</a></li><li><a href=\"/category/tool-guides/\">最后看：工具教程（可直接复用）</a></li></ul><!-- /wp:list --></div><!-- /wp:group -->";}
wp_update_post(['ID'=>$home->ID,'post_content'=>$c]);
PHP
