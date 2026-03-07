#!/usr/bin/env bash
set -euo pipefail
# Step4 首页信任模块
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
$home=get_page_by_path('home',OBJECT,'page'); if(!$home) exit(1);
$c=$home->post_content;
$c=preg_replace('/<!-- wp:group \{\"className\":\"trust-module\"\} -->[\s\S]*?<!-- \/wp:group -->\s*/u','',$c);
$c .= '\n<!-- wp:group {"className":"trust-module"} --><div class="wp-block-group trust-module"><h2>站点说明</h2><p>这里长期记录真实开发过程：问题、修复、复盘与可复用方法。</p><h3>更新节奏</h3><p>工作日不定期更新，重点沉淀近期踩坑与改进。</p><h3>最近复盘</h3><ul><li><a href="/category/project-retrospectives/">查看项目复盘</a></li><li><a href="/archive/">查看笔记归档</a></li></ul></div><!-- /wp:group -->\n';
wp_update_post(['ID'=>$home->ID,'post_content'=>$c]);
$css=function_exists('wp_get_custom_css')?wp_get_custom_css():'';
$marker='Step4 trust module style 2026-03-07';
$patch='\n/* Step4 trust module style 2026-03-07 */\n.home .trust-module{max-width:780px;margin:26px auto 0;padding:16px 18px;border:1px solid #dbe4f3;border-radius:14px;background:#f8fbff;}\n.home .trust-module h2{font-size:1.3em;margin:0 0 .5em;}\n.home .trust-module h3{font-size:1.05em;margin:1em 0 .45em;color:#334a73;}\n.home .trust-module p,.home .trust-module li{line-height:1.75;color:#3e4f6d;}\n';
if(strpos($css,$marker)===false && function_exists('wp_update_custom_css_post')) wp_update_custom_css_post(rtrim($css)."\n".$patch."\n");
PHP
