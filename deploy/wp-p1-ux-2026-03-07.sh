#!/usr/bin/env bash
set -euo pipefail

# P1 体验优化：分类页摘要卡片 + 首页最近更新 + 设计令牌
sudo mkdir -p /var/www/wordpress/wp-content/mu-plugins
sudo tee /var/www/wordpress/wp-content/mu-plugins/site-ux-tweaks.php >/dev/null <<'PHP'
<?php
/**
 * Plugin Name: Site UX Tweaks
 */
if (!defined('ABSPATH')) exit;
add_filter('render_block', function($block_content, $block){
    if (is_admin()) return $block_content;
    if (!is_category() && !is_home() && !is_archive()) return $block_content;
    if (($block['blockName'] ?? '') !== 'core/post-content') return $block_content;
    global $post; if(!$post) return $block_content;
    $excerpt = has_excerpt($post) ? get_the_excerpt($post) : wp_trim_words(wp_strip_all_tags(get_the_content(null,false,$post)), 44, '…');
    $url = get_permalink($post);
    return '<div class="oc-excerpt-card"><p class="oc-excerpt-text">'.esc_html($excerpt).'</p><p class="oc-readmore-wrap"><a class="oc-readmore-btn" href="'.esc_url($url).'">阅读全文</a></p></div>';
}, 12, 2);
PHP
