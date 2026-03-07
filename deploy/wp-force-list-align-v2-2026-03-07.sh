#!/usr/bin/env bash
set -euo pipefail

# 终极兜底：禁用原生列表标记，改为自绘标记，彻底避免凸出
sudo tee /var/www/wordpress/wp-content/mu-plugins/force-list-align.php >/dev/null <<'PHP'
<?php
/**
 * Plugin Name: Force List Align
 */
if (!defined('ABSPATH')) exit;
add_action('wp_head', function(){
  echo '<style id="force-list-align-v2">\n'
    . 'main ul, main ol, article ul, article ol, .entry-content ul, .entry-content ol, .wp-block-post-content ul, .wp-block-post-content ol {margin:0 0 12px 0 !important; padding:0 !important; list-style:none !important;}\n'
    . 'main li, article li, .entry-content li, .wp-block-post-content li {position:relative !important; margin:8px 0 !important; padding:0 0 0 1.2em !important; text-indent:0 !important;}\n'
    . 'main ul li::before, article ul li::before, .entry-content ul li::before, .wp-block-post-content ul li::before {content:"•" !important; position:absolute !important; left:0 !important; top:0 !important; color:#64748b !important; font-weight:700 !important;}\n'
    . 'main ol, article ol, .entry-content ol, .wp-block-post-content ol {counter-reset: ocitem !important;}\n'
    . 'main ol li::before, article ol li::before, .entry-content ol li::before, .wp-block-post-content ol li::before {counter-increment: ocitem !important; content: counter(ocitem) "." !important; position:absolute !important; left:0 !important; top:0 !important; color:#64748b !important; font-weight:700 !important;}\n'
    . '</style>';
}, 9999);
PHP
