#!/usr/bin/env bash
set -euo pipefail

# 批量新增笔记内容 + 首页推荐阅读 + 颜色层次增强
php <<'PHP'
<?php
require '/var/www/wordpress/wp-load.php';
function ensure_cat($name,$slug){$t=get_term_by('slug',$slug,'category'); if($t) return (int)$t->term_id; $r=wp_insert_term($name,'category',['slug'=>$slug]); return is_wp_error($r)?1:(int)$r['term_id'];}
$tool=ensure_cat('工具教程','tool-guides'); $retro=ensure_cat('项目复盘','project-retrospectives');
$items=[
 ['OpenClaw + WordPress：把“能跑”变成“稳跑”的备份实践','openclaw-wordpress-backup-practice',[$tool],'<p>这篇记录我在云服务器上为 WordPress 做自动备份的完整实践：不仅要“备份成功”，还要“可恢复、可追踪、可持续”。</p><h2>目标</h2><ul><li>每天自动备份数据库和 uploads</li><li>保留 14 天，自动清理过期</li><li>有日志可查，出问题能排查</li></ul>'],
 ['一次真实复盘：为什么长任务必须分阶段汇报','why-long-tasks-need-progress-updates',[$retro],'<p>这篇是对近期搭站过程的真实复盘。技术问题并不可怕，可怕的是执行过程“静默”。</p><h2>关键改进</h2><ul><li>先回执</li><li>分段汇报</li><li>异常降级</li></ul>']
];
foreach($items as $it){[$title,$slug,$cat,$content]=$it; $ex=get_page_by_path($slug,OBJECT,'post'); $a=['post_title'=>$title,'post_name'=>$slug,'post_status'=>'publish','post_type'=>'post','post_content'=>$content,'post_category'=>$cat,'post_excerpt'=>wp_trim_words(wp_strip_all_tags($content),40,'…')]; if($ex){$a['ID']=$ex->ID;wp_update_post($a);}else{wp_insert_post($a);} }
$home=get_page_by_path('home',OBJECT,'page'); if($home && strpos($home->post_content,'featured-notes-wrap')===false){$home->post_content .= "\n<!-- wp:group {\"className\":\"featured-notes-wrap\"} --><div class=\"wp-block-group featured-notes-wrap\"><!-- wp:heading {\"level\":3} --><h3 class=\"wp-block-heading\">推荐阅读</h3><!-- /wp:heading --><!-- wp:latest-posts {\"postsToShow\":3,\"displayPostDate\":true,\"displayExcerpt\":true,\"excerptLength\":22} /--></div><!-- /wp:group -->"; wp_update_post(['ID'=>$home->ID,'post_content'=>$home->post_content]);}
PHP
