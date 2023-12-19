<?php
if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}

function get_list_khoa($offset = 0, $isAll = true)
{
    global $wpdb;
    $table_name = $wpdb->prefix . 'khoa'; // Replace 'your_custom_table' with your table name
    if(!$isAll){
        $query = "SELECT * FROM $table_name LIMIT 10 OFFSET $offset";
    } else{
    $query = "SELECT * FROM $table_name";
    }

    $results = $wpdb->get_results($query, ARRAY_A);

    return $results;
}

function get_data_khoa_by_id($id, $field) {
    global $wpdb;
    $table_name = $wpdb->prefix . 'khoa'; // Replace 'your_custom_table' with your table name

    $query = $wpdb->prepare("SELECT * FROM $table_name WHERE id = %d", $id);
    $result = $wpdb->get_row($query, ARRAY_A);

    return $result[$field];
}


//add data
function insert_data_action_khoa()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['ten_khoa'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'khoa';

        $data = array(
            'ten_khoa' => $_POST['ten_khoa'],
            'mo_ta' => $_POST['mo_ta'],
            'start_year' => $_POST['start_year'],
        );

        $format = array(
            '%s',
            '%s',

        );

        $wpdb->insert($table_name, $data, $format);
        echo 'Data inserted successfully.';
    }

    wp_die();
}

add_action('wp_ajax_insert_data_action_khoa', 'insert_data_action_khoa');
add_action('wp_ajax_nopriv_insert_data_action_khoa', 'insert_data_action_khoa');

//edit data
function edit_data_action_khoa()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'khoa'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        // Define the data to update
        $data = array(
            'ten_khoa' => sanitize_text_field($_POST['ten_khoa']),
            'mo_ta' => sanitize_text_field($_POST['mo_ta']),
            'start_year' => sanitize_text_field($_POST['start_year']),
            // Assuming this is an integer
        );

        $where = array('id' => $id);

        $wpdb->update($table_name, $data, $where);

        echo 'Data updated successfully.';
    }

    wp_die();
}

add_action('wp_ajax_edit_data_action_khoa', 'edit_data_action_khoa');
add_action('wp_ajax_nopriv_edit_data_action_khoa', 'edit_data_action_khoa');


//delete data
function delete_data_action_khoa()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'khoa'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        $where = array('id' => $id);

        $wpdb->delete($table_name, $where);

        echo 'Data deleted successfully.';
    }

    wp_die();
}

add_action('wp_ajax_delete_data_action_khoa', 'delete_data_action_khoa');
add_action('wp_ajax_nopriv_delete_data_action_khoa', 'delete_data_action_khoa');