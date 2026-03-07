#!/usr/bin/env bash
set -euo pipefail

# 修复：首页一级标题、quick-start/archive 重复标题、about 文案冲突
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$css=function_exists('wp_get_custom_css')?wp_get_custom_css():'';
$patch='\n/* Fix duplicate/conflict headings on 2026-03-07 */\n.home .entry-title, .home h1.wp-block-post-title{display:none!important;}\n';
if(strpos($css,'Fix duplicate/conflict headings on 2026-03-07')===false && function_exists('wp_update_custom_css_post')) wp_update_custom_css_post(rtrim($css)."\n".$patch."\n");
$quick=get_page_by_path('quick-start',OBJECT,'page');
if($quick) wp_update_post(['ID'=>$quick->ID,'post_title'=>'快速入口','post_content'=>'<p>第一次来本站，建议按下面顺序阅读：</p><div class="quick-cards"><p><strong>① 学习笔记</strong><br/>偏方法论与可执行步骤。<br/><a href="/category/study-notes/">立即查看</a></p><p><strong>② 项目复盘</strong><br/>偏决策过程、踩坑与修复。<br/><a href="/category/project-retrospectives/">查看复盘</a></p><p><strong>③ 工具教程</strong><br/>偏脚本、命令与配置。<br/><a href="/category/tool-guides/">查看教程</a></p></div><p class="quick-tip">建议从最近更新开始，按兴趣深入。</p>']);
$archive=get_page_by_path('archive',OBJECT,'page');
if($archive) wp_update_post(['ID'=>$archive->ID,'post_title'=>'笔记归档','post_content'=>'<p>按主题归档（长期维护）：</p><ul><li><a href="/category/study-notes/">学习笔记</a></li><li><a href="/category/project-retrospectives/">项目复盘</a></li><li><a href="/category/tool-guides/">工具教程</a></li></ul><h3>最近更新</h3><!-- wp:latest-posts {"postsToShow":8,"displayPostDate":true} /--><p class="archive-note">后续会补充按月份与关键词归档。</p>']);
$about=get_page_by_path('about',OBJECT,'page');
if($about) wp_update_post(['ID'=>$about->ID,'post_title'=>'关于这个站','post_content'=>'<p>这是一个持续记录学习心得、项目复盘与工具实践的个人站点。</p><p>内容以真实过程为主：报错、修复、复盘与可复用方法。</p><p>欢迎通过文章评论交流。</p>']);
PHP
