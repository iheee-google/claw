#!/usr/bin/env bash
set -euo pipefail

# 基于记忆批量生成“开发报错过程/复盘”系列内容
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
function ensure_cat($name,$slug){$t=get_term_by('slug',$slug,'category'); if($t) return (int)$t->term_id; $r=wp_insert_term($name,'category',['slug'=>$slug]); return is_wp_error($r)?1:(int)$r['term_id'];}
$retro=ensure_cat('项目复盘','project-retrospectives'); $study=ensure_cat('学习笔记','study-notes');
$items=[
 ['开发报错实录：重启句柄丢失时，如何快速止损并完成交付','restart-handle-lost-fast-fallback',[$retro],'<p>重启后句柄丢失时，应立即止损并切换校验路径。</p>'],
 ['Git 推送失败复盘：为什么“先说成功”是高风险动作','git-push-failure-postmortem',[$retro],'<p>未见 push 成功原始输出前，不应宣称已同步。</p>'],
 ['从空输出到可控输出：消息可靠性改造清单','empty-output-reliability-checklist',[$study],'<p>通过非空校验与占位回执，避免空输出导致体验异常。</p>']
];
foreach($items as $it){[$title,$slug,$cat,$content]=$it; $ex=get_page_by_path($slug,OBJECT,'post'); $arr=['post_title'=>$title,'post_name'=>$slug,'post_status'=>'publish','post_type'=>'post','post_content'=>$content,'post_category'=>$cat,'post_excerpt'=>wp_trim_words(wp_strip_all_tags($content),40,'…')]; if($ex){$arr['ID']=$ex->ID;wp_update_post($arr);} else {wp_insert_post($arr);} }
PHP
