<?php

FILE

/**
 * find plugin files in wp-content/plugins/<name>
 * - plugin should have <name>.php file (eg /wp-content/plugins/myplug/myplug.php)
 */

FILE HEADERS

/**
 * plugin file needs a comment at the top with some 'header' info that is provided to WordPress
 * 
 * Plugin Name: My Plug
 * Author: Plug My
 */

ACTIVATION / DEACTIVATION

// will call the specified function on plugin activation or deactivation
register_activation_hook(__FILE__, "do_some_thing");
register_deactivation_hook(__FILE__, "do_some_thing");

function do_some_activation_thing() {
  echo "hey"
}

ACTIONS

/**
 * add data or change how WordPress operates. pass a callback that is ran at a specific point
 * in time during the WordPress execution.
 */

// action name:         name of WordPress action
// callback_name:       name of your function
// priority:            priority of this callback with rest of callbacks
// num_args:            the number of args to accept from wordpress
add_action('action_name', 'callback_name', priority, num_args);

add_action('init', 'do_init'); // will call do_init function when the init action is ran
function do_init() { }

add_action('save_post', 'my_save_post', 10, 2);
function my_save_post($post_id, $post) { }

FILTERS

/**
 * filters are like hooks but they 'filter' data passed to the callback with intention to return
 * it back to WordPress. should not perform side-effects (use actions)
 */

MENUS

add_action('admin_menu', 'add_page')

function add_page() {
  add_menu_page(
    'Mux',                                                  // page title
    'Mux Test',                                             // menu item title
    'manage_options',                                       // required WordPress permission
    plugin_dir_path(__FILE__) . 'src/Admin/index.php',      // slug for page (file path)
    150                                                     // position in menu items
  )
}

SETTINGS