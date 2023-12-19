<?php
if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

function get_list_mon_hoc($offset = 0, $isAll = true){
	global $wpdb;
    $table_name = $wpdb->prefix . 'mon_hoc'; // Replace 'your_custom_table' with your table name
    if(!$isAll){
        $query = "SELECT * FROM $table_name LIMIT 10 OFFSET $offset";
    } else{
    $query = "SELECT * FROM $table_name";
    }

    $results = $wpdb->get_results($query, ARRAY_A);

    return $results;
}

function get_name_teacher_by_id($id) {
    global $wpdb;
    $table_name = $wpdb->prefix . 'teacher'; // Replace 'your_custom_table' with your table name

    $query = $wpdb->prepare("SELECT * FROM $table_name WHERE id = %d", $id);
    $result = $wpdb->get_row($query, ARRAY_A);

    return $result['full_name'];
}


//add data
function insert_data_action_mon_hoc() {
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['ten_mon_hoc'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'mon_hoc';

        $data = array(
            'ten_mon_hoc' => $_POST['ten_mon_hoc'],
            'mo_ta' => $_POST['mo_ta'],
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

add_action('wp_ajax_insert_data_action_mon_hoc', 'insert_data_action_mon_hoc');
add_action('wp_ajax_nopriv_insert_data_action_mon_hoc', 'insert_data_action_mon_hoc');

//edit data
function edit_data_action_mon_hoc() {
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'mon_hoc'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        // Define the data to update
        $data = array(
            'ten_mon_hoc' => sanitize_text_field($_POST['ten_mon_hoc']),
            'mo_ta' => sanitize_text_field($_POST['mo_ta']),
        );

        $where = array('id' => $id);

        $wpdb->update($table_name, $data, $where);

        echo 'Data updated successfully.';
    }

    wp_die();
}

add_action('wp_ajax_edit_data_action_mon_hoc', 'edit_data_action_mon_hoc');
add_action('wp_ajax_nopriv_edit_data_action_mon_hoc', 'edit_data_action_mon_hoc');


//delete data
function delete_data_action_mon_hoc() {
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'mon_hoc'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        $where = array('id' => $id);

        $wpdb->delete($table_name, $where);

        echo 'Data deleted successfully.';
    }

    wp_die();
}

add_action('wp_ajax_delete_data_action_mon_hoc', 'delete_data_action_mon_hoc');
add_action('wp_ajax_nopriv_delete_data_action_mon_hoc', 'delete_data_action_mon_hoc');


add_action('wp_ajax_load_pagination_mon_hoc', 'load_pagination_mon_hoc');
add_action('wp_ajax_nopriv_load_pagination_mon_hoc', 'load_pagination_mon_hoc');

function load_pagination_mon_hoc() {
    global $wpdb;
    $per_page = 10;
    $table_name = $wpdb->prefix . 'mon_hoc';
    $offset = ($_POST['offset'] - 1) * 10;
    $results = $wpdb->get_results("SELECT * FROM $table_name LIMIT $per_page OFFSET $offset", ARRAY_A);

    // Loop through $results and echo the HTML for each teacher entry
    foreach ($results as $key => $row) {
        echo '<tr>';
        echo '<td>' . ($key + 1) . '</td>';
        echo '<td>' . $row['ten_mon_hoc'] . '</td>';
        echo '<td>' . $row['mo_ta'] . '</td>';
        if(is_admin_user()) echo '<td>
        <a href="#editViewModal" data-id="' . $row['id'] . '" class="edit_mon_hoc" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
        <a href="#deleteViewModal" data-id="' . $row['id'] . '" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
        </td>';
        echo '</tr>';
    }

    wp_die();
}