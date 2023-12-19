<?php
if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

function get_list_history_lesson($id = '', $offset = 0, $isAll = true){
    if(!$id){
        return;
    }
	global $wpdb;
    $table_name = $wpdb->prefix . 'history_lesson'; // Replace 'your_custom_table' with your table name
    if(!$isAll){
        $query = "SELECT * FROM $table_name LIMIT 10 OFFSET $offset";
    } else{
    $query = "SELECT * FROM $table_name";
    }

    $results = $wpdb->get_results($query, ARRAY_A);

    return $results;
}



//add data
function insert_data_action_history_lesson() {
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['url'])) {
        global $wpdb;
        $id = $_POST['id'];
        $url = $_POST['url'];
        $table_name = $wpdb->prefix . 'history_lesson';

        $data = array(
            'id_dang_ky' => $id,
            'details' => $url,
            'time_created' => $_POST['time_created'],
            'note' => $_POST['note'],
        );

        $format = array(
            '%d',
            '%s',
            '%s',
            '%s',
        );

        $wpdb->insert($table_name, $data, $format);
        echo 'Data inserted successfully.';
    }

    wp_die();
}

add_action('wp_ajax_insert_data_action_history_lesson', 'insert_data_action_history_lesson');
add_action('wp_ajax_nopriv_insert_data_action_history_lesson', 'insert_data_action_history_lesson');

//edit data
function edit_data_action_history_lesson() {
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'history_lesson'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        // Define the data to update
        $data = array(
            'ten_history_lesson' => sanitize_text_field($_POST['ten_history_lesson']),
            'mo_ta' => sanitize_text_field($_POST['mo_ta']),
        );

        $where = array('id' => $id);

        $wpdb->update($table_name, $data, $where);

        echo 'Data updated successfully.';
    }

    wp_die();
}

add_action('wp_ajax_edit_data_action_history_lesson', 'edit_data_action_history_lesson');
add_action('wp_ajax_nopriv_edit_data_action_history_lesson', 'edit_data_action_history_lesson');


//delete data
function delete_data_action_history_lesson() {
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'history_lesson'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        $where = array('id' => $id);

        $wpdb->delete($table_name, $where);

        echo 'Data deleted successfully.';
    }

    wp_die();
}

add_action('wp_ajax_delete_data_action_history_lesson', 'delete_data_action_history_lesson');
add_action('wp_ajax_nopriv_delete_data_action_history_lesson', 'delete_data_action_history_lesson');