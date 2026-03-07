#!/usr/bin/env bash
set -euo pipefail

# 修复按钮过黑 + 让 quick-start 与 archive 页面差异化
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$quick=get_page_by_path('quick-start',OBJECT,'page');
if($quick){wp_update_post(['ID'=>$quick->ID,'post_content'=>'<h2>快速入口</h2><p>第一次来本站，建议按下面顺序阅读：</p><div class="quick-cards"><p><strong>① 学习笔记</strong><br/>偏方法论与可执行步骤。<br/><a href="/category/study-notes/">立即查看</a></p><p><strong>② 项目复盘</strong><br/>偏决策过程、踩坑与修复。<br/><a href="/category/project-retrospectives/">查看复盘</a></p><p><strong>③ 工具教程</strong><br/>偏脚本、命令与配置。<br/><a href="/category/tool-guides/">查看教程</a></p></div><p class="quick-tip">建议从最近更新开始，按兴趣深入。</p>']);}
$archive=get_page_by_path('archive',OBJECT,'page');
if($archive){wp_update_post(['ID'=>$archive->ID,'post_content'=>'<h2>笔记归档</h2><p>按主题归档（长期维护）：</p><ul><li><a href="/category/study-notes/">学习笔记</a></li><li><a href="/category/project-retrospectives/">项目复盘</a></li><li><a href="/category/tool-guides/">工具教程</a></li></ul><h3>最近更新</h3><!-- wp:latest-posts {"postsToShow":8,"displayPostDate":true} /--><p class="archive-note">后续会补充按月份与关键词归档。</p>' ]);}
$base=function_exists('wp_get_custom_css')?wp_get_custom_css():'';
$patch='\n/* Fix black buttons + page differentiation */\n.quick-entry-buttons .wp-block-button__link{background:#edf2ff!important;color:#2e4db0!important;border:1px solid #d3def9!important;box-shadow:none!important;}\n.quick-entry-buttons .wp-block-button__link:hover{background:#e4edff!important;color:#233f96!important;}\n.page-slug-quick-start .quick-cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:12px;margin:12px 0 16px;}\n.page-slug-quick-start .quick-cards p{background:#f8faff;border:1px solid #dce6fb;border-radius:12px;padding:12px;line-height:1.6;margin:0;}\n.page-slug-archive h3{margin-top:18px;padding-top:8px;border-top:1px dashed #d6e0ee;}\n.page-slug-archive .wp-block-latest-posts li{padding:8px 0;border-bottom:1px dotted #e1e7f2;}\n';
if(strpos($base,'Fix black buttons + page differentiation')===false && function_exists('wp_update_custom_css_post')) wp_update_custom_css_post(rtrim($base).$patch);
PHP
