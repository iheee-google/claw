#!/usr/bin/env bash
set -euo pipefail

# 删除默认文章 + 根据 memory 补充经验笔记
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
function ensure_cat($name,$slug){$t=get_term_by('slug',$slug,'category'); if($t) return (int)$t->term_id; $r=wp_insert_term($name,'category',['slug'=>$slug]); return is_wp_error($r)?1:(int)$r['term_id'];}
$study=ensure_cat('学习笔记','study-notes'); $retro=ensure_cat('项目复盘','project-retrospectives'); $tool=ensure_cat('工具教程','tool-guides');
$hello=get_page_by_path('hello-world',OBJECT,'post'); if($hello){wp_delete_post($hello->ID,true);} 
$items=[
 ['子 Agent 暂缓决策：在低配额下为什么串行更稳','subagent-paused-under-low-rpm',[$retro],'<p>在请求配额偏低（每分钟4次）阶段，子Agent并发不一定更快，反而可能放大超时与排队。</p>'],
 ['一次教训：长任务静默比报错更伤体验','long-task-silence-is-worse-than-errors',[$study],'<p>长任务中间没反馈，用户焦虑会持续上升，先回执与分段汇报非常关键。</p>'],
 ['Hooks 治理复盘：为什么要优先用官方内置能力','hooks-governance-official-first',[$tool],'<p>优先官方内置 hooks，可降低维护成本并提升排障效率。</p>']
];
foreach($items as $it){[$title,$slug,$cat,$content]=$it; $ex=get_page_by_path($slug,OBJECT,'post'); $arr=['post_title'=>$title,'post_name'=>$slug,'post_status'=>'publish','post_type'=>'post','post_content'=>$content,'post_category'=>$cat,'post_excerpt'=>wp_trim_words(wp_strip_all_tags($content),40,'…')]; if($ex){$arr['ID']=$ex->ID;wp_update_post($arr);} else {wp_insert_post($arr);} }
PHP
