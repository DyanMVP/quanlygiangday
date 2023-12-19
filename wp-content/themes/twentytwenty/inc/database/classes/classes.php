<?php
if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}

function get_list_classes($offset = 0, $isAll = true)
{
    global $wpdb;
    $table_name = $wpdb->prefix . 'classes'; // Replace 'your_custom_table' with your table name
    if(!$isAll){
        $query = "SELECT * FROM $table_name LIMIT 10 OFFSET $offset";
    } else{
    $query = "SELECT * FROM $table_name";
    }

    $results = $wpdb->get_results($query, ARRAY_A);

    return $results;
}

function get_data_table_by_id($id, $table, $field) {
    global $wpdb;
    $table_name = $wpdb->prefix . $table; // Replace 'your_custom_table' with your table name

    $query = $wpdb->prepare("SELECT * FROM $table_name WHERE id = %d", $id);
    $result = $wpdb->get_row($query, ARRAY_A);

    return $result[$field];
}

function get_name_khoa_by_id($id) {
    global $wpdb;
    $table_name = $wpdb->prefix . 'khoa'; // Replace 'your_custom_table' with your table name

    $query = $wpdb->prepare("SELECT * FROM $table_name WHERE id = %d", $id);
    $result = $wpdb->get_row($query, ARRAY_A);

    return $result['ten_khoa'];
}


//add data
function insert_data_action_classes()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['ten_lop'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'classes';

        $data = array(
            'ten_lop' => $_POST['ten_lop'],
            'ma_khoa' => $_POST['ma_khoa'],
            'id_khoa' => $_POST['id_khoa'],
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

add_action('wp_ajax_insert_data_action_classes', 'insert_data_action_classes');
add_action('wp_ajax_nopriv_insert_data_action_classes', 'insert_data_action_classes');

//edit data
function edit_data_action_classes()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'classes'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        // Define the data to update
        $data = array(
            'ten_lop' => sanitize_text_field($_POST['ten_lop']),
            'ma_khoa' => 'CNTT',
            'id_khoa' => sanitize_text_field($_POST['id_khoa']),
            // Assuming this is an integer
        );

        $where = array('id' => $id);

        $wpdb->update($table_name, $data, $where);

        echo 'Data updated successfully.';
    }

    wp_die();
}

add_action('wp_ajax_edit_data_action_classes', 'edit_data_action_classes');
add_action('wp_ajax_nopriv_edit_data_action_classes', 'edit_data_action_classes');


//delete data
function delete_data_action_classes()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'classes'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        $where = array('id' => $id);

        $wpdb->delete($table_name, $where);

        echo 'Data deleted successfully.';
    }

    wp_die();
}

add_action('wp_ajax_delete_data_action_classes', 'delete_data_action_classes');
add_action('wp_ajax_nopriv_delete_data_action_classes', 'delete_data_action_classes');


add_action('wp_ajax_load_pagination_classes', 'load_pagination_classes');
add_action('wp_ajax_nopriv_load_pagination_classes', 'load_pagination_classes');

function load_pagination_classes() {
    global $wpdb;
    $per_page = 10;
    $table_name = $wpdb->prefix . 'classes';
    $offset = ($_POST['offset'] - 1) * 10;
    $results = $wpdb->get_results("SELECT * FROM $table_name LIMIT $per_page OFFSET $offset", ARRAY_A);

    // Loop through $results and echo the HTML for each teacher entry
    foreach ($results as $key => $row) {
        echo '<tr>';
        echo '<td>' . ($key + 1) . '</td>';
        echo '<td>' . $row['ten_lop'] . '</td>';
        echo '<td>' . 'CNTT' . '</td>';
        echo '<td>' . get_name_khoa_by_id($row['id_khoa']) . '</td>';
        if(is_admin_user()) {echo '<td>
        <a href="#editViewModal" data-id="' . $row['id'] . '" class="edit_classes" data-id_khoa="'.$row['id_khoa'].'" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
        <a href="#deleteViewModal" data-id="' . $row['id'] . '" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
        </td>';
        }
        echo '</tr>';
    }

    wp_die();
}