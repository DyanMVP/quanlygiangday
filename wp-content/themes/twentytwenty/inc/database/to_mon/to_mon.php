<?php
if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}

function get_list_to_mon($offset = 0, $isAll = true)
{
    global $wpdb;
    $table_name = $wpdb->prefix . 'to_mon'; // Replace 'your_custom_table' with your table name
    if(!$isAll){
        $query = "SELECT * FROM $table_name LIMIT 10 OFFSET $offset";
    } else{
    $query = "SELECT * FROM $table_name";
    }

    $results = $wpdb->get_results($query, ARRAY_A);

    return $results;
}


//add data
function insert_data_action_to_mon()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['ten_to_mon'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'to_mon';

        $data = array(
            'ten_to_mon' => $_POST['ten_to_mon'],
            'so_giang_vien' => $_POST['so_giang_vien'],
            'ma_khoa' => $_POST['ma_khoa'],

        );

        $format = array(
            '%s',
            '%s',
            '%s',

        );

        $wpdb->insert($table_name, $data, $format);
        echo 'Data inserted successfully.';
    }

    wp_die();
}

add_action('wp_ajax_insert_data_action_to_mon', 'insert_data_action_to_mon');
add_action('wp_ajax_nopriv_insert_data_action_to_mon', 'insert_data_action_to_mon');

//edit data
function edit_data_action_to_mon()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'to_mon'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        // Define the data to update
        $data = array(
            'id' => sanitize_text_field($_POST['id']),
            'ten_to_mon' => sanitize_text_field($_POST['ten_to_mon']),
            // Assuming this is an integer
        );

        $where = array('id' => $id);

        $wpdb->update($table_name, $data, $where);

        echo 'Data updated successfully.';
    }

    wp_die();
}

add_action('wp_ajax_edit_data_action_to_mon', 'edit_data_action_to_mon');
add_action('wp_ajax_nopriv_edit_data_action_to_mon', 'edit_data_action_to_mon');


//delete data
function delete_data_action_to_mon()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'to_mon'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        $where = array('id' => $id);

        $wpdb->delete($table_name, $where);

        echo 'Data deleted successfully.';
    }

    wp_die();
}

add_action('wp_ajax_delete_data_action_to_mon', 'delete_data_action_to_mon');
add_action('wp_ajax_nopriv_delete_data_action_to_mon', 'delete_data_action_to_mon');