#!/usr/bin/env bash
set -euo pipefail

# 使用 mu-plugin 强制覆盖列表样式，解决主题优先级导致的“未生效”问题
sudo tee /var/www/wordpress/wp-content/mu-plugins/force-list-align.php >/dev/null <<'PHP'
<?php
/**
 * Plugin Name: Force List Align
 */
if (!defined('ABSPATH')) exit;
add_action('wp_head', function(){
  echo '<style id="force-list-align">\n'
    . 'main ul, main ol, article ul, article ol, .entry-content ul, .entry-content ol, .wp-block-post-content ul, .wp-block-post-content ol {list-style-position:inside !important; margin-left:0 !important; padding-left:0 !important;}\n'
    . 'main li, article li, .entry-content li, .wp-block-post-content li {margin-left:0 !important; padding-left:0 !important; text-indent:0 !important;}\n'
    . '.wp-block-list {padding-left:0 !important; margin-left:0 !important;}\n'
    . '</style>';
}, 9999);
PHP
