<?php
if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

function get_list_teacher($offset = 0, $isAll = true){
	global $wpdb;
    $table_name = $wpdb->prefix . 'teacher'; // Replace 'your_custom_table' with your table name
    if(!$isAll){
        $query = "SELECT * FROM $table_name LIMIT 10 OFFSET $offset";
    } else{
        $query = "SELECT * FROM $table_name";
    }

    $results = $wpdb->get_results($query, ARRAY_A);

    return $results;
}

function get_data_teacher_row_by_email($email, $field){
    global $wpdb;
    $table_name = $wpdb->prefix . 'teacher'; // Replace 'your_custom_table' with your table name

    $query = $wpdb->prepare("SELECT * FROM $table_name WHERE email = %s", $email);
    $result = $wpdb->get_row($query, ARRAY_A);

    return $result[$field];
}

function get_data_teacher_by_id($id) {
    global $wpdb;
    $table_name = $wpdb->prefix . 'teacher'; // Replace 'your_custom_table' with your table name

    $query = $wpdb->prepare("SELECT * FROM $table_name WHERE id = %d", $id);
    $result = $wpdb->get_row($query, ARRAY_A);

    return $result;
}

function delete_user_by_email($email) {
    $user = get_user_by('email', $email);

    if ($user) {
        $user_id = $user->ID;

        if (wp_delete_user($user_id)) {
            echo "User with email $email has been deleted.";
        } else {
            echo "Failed to delete user with email $email.";
        }
    } else {
        echo "User with email $email not found.";
    }
}

//add data
function insert_data_action() {
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['teacher_id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'teacher';

        $data = array(
            'teacher_id' => $_POST['teacher_id'],
            'full_name' => $_POST['full_name'],
            'email' => $_POST['email'],
            'date_of_birth' => $_POST['date_of_birth'],
            'sex' => $_POST['sex'],
            'address' => $_POST['address'],
            'phone' => $_POST['phone'],
            'position' => $_POST['position'],
            'image' => $_POST['image'],
            'ma_to_mon' => $_POST['ma_to_mon'],
            'tieu_su' => $_POST['tieu_su']
        );

        $format = array(
            '%s',
            '%s',
            '%s',
            '%s',
            '%s',
            '%s',
            '%s',
            '%s',
            '%s',
            '%d',
            ''
        );
        $email = $_POST['email'];
        $exists = email_exists( $email );
        if($exists){
            echo 'exits';
        } else{
            $user_data = array(
                'user_login' =>  $email,
                'user_email' => $email,
                'user_pass'  =>  'teacher123', // When creating an user, `user_pass` is expected.
                'display_name' => $_POST['full_name'],
                'user_nicename' => $_POST['full_name'],
                'role' => 'teacher',
            );
            $user_id = wp_insert_user( $user_data ) ;
            $wpdb->insert($table_name, $data, $format);
            echo 'Data inserted successfully.';
        }
    }

    wp_die();
}

add_action('wp_ajax_insert_data_action', 'insert_data_action');
add_action('wp_ajax_nopriv_insert_data_action', 'insert_data_action');

//edit data
function edit_data_action() {
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'teacher'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        // Define the data to update
        $data = array(
            'teacher_id' => sanitize_text_field($_POST['teacher_id']),
            'full_name' => sanitize_text_field($_POST['full_name']),
            'date_of_birth' => sanitize_text_field($_POST['date_of_birth']),
            'sex' => sanitize_text_field($_POST['sex']),
            'address' => sanitize_text_field($_POST['address']),
            'phone' => sanitize_text_field($_POST['phone']),
            'position' => sanitize_text_field($_POST['position']),
            'image' => sanitize_text_field($_POST['image']),
            'ma_to_mon' => intval($_POST['ma_to_mon']), // Assuming this is an integer
            'tieu_su' => $_POST['tieu_su'],
        );

        $where = array('id' => $id);

        $wpdb->update($table_name, $data, $where);

        echo 'Data updated successfully.';
    }

    wp_die();
}

add_action('wp_ajax_edit_data_action', 'edit_data_action');
add_action('wp_ajax_nopriv_edit_data_action', 'edit_data_action');


//delete data
function delete_data_action() {
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'teacher'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        $where = array('id' => $id);
        $email = sanitize_text_field($_POST['email']);
        delete_user_by_email($email);
        $wpdb->delete($table_name, $where);

        echo 'Data deleted successfully.';
    }

    wp_die();
}

add_action('wp_ajax_delete_data_action', 'delete_data_action');
add_action('wp_ajax_nopriv_delete_data_action', 'delete_data_action');

add_action('wp_ajax_load_pagination_teachers', 'load_pagination_teachers');
add_action('wp_ajax_nopriv_load_pagination_teachers', 'load_pagination_teachers');

function load_pagination_teachers() {
    global $wpdb;
    $per_page = 10;
    $table_name = $wpdb->prefix . 'teacher';
    $offset = ($_POST['offset'] - 1) * 10;
    $results = $wpdb->get_results("SELECT * FROM $table_name LIMIT $per_page OFFSET $offset", ARRAY_A);

    // Loop through $results and echo the HTML for each teacher entry
    foreach ($results as $key => $row) {
        echo '<tr>';
        echo '<td>' . ($key + 1) . '</td>';
        echo '<td>' . $row['full_name'] . '</td>';
        echo '<td data-date="' . $row['date_of_birth'] . '">' . date("d/m/Y", strtotime($row['date_of_birth'])) . '</td>';
        echo '<td>' . $row['sex'] . '</td>';
        echo '<td>' . $row['address'] . '</td>';
        echo '<td>' . $row['phone'] . '</td>';
        echo '<td>' . $row['position'] . '</td>';
        echo '<td class="d-none">' . $row['tieu_su'] . '</td>';
        echo '<td class="image-url-preview d-none">' . $row['image'] . '</td>';
        if(is_admin_user()) echo '<td>
        <a href="#editViewModal" data-id="' . $row['id'] . '" class="edit_teacher" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
        <a href="#deleteViewModal" data-id="' . $row['id'] . '" data-email="' . $row['email'] . '" class="delete button-delete-form" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
        </td>';
        echo '</tr>';
    }

    wp_die();
}


add_action('wp_ajax_load_more_teachers', 'load_more_teachers');
add_action('wp_ajax_nopriv_load_more_teachers', 'load_more_teachers');

function load_more_teachers() {
    global $wpdb;
    $per_page = $_POST['offset'];
    $table_name = $wpdb->prefix . 'teacher';
    $offset = $_POST['offset'];
    $results = $wpdb->get_results("SELECT * FROM $table_name LIMIT $per_page OFFSET $offset", ARRAY_A);

    // Loop through $results and echo the HTML for each teacher entry
    foreach ($results as $teacher) {
        echo '<div class="card col-md-4">';
        if($teacher['image']){
            echo '<img class="image-teacher" src="'.$teacher['image'].'">';
        } else{
            echo '<img class="image-teacher card-img-top" data-src="holder.js/100px180/" alt="100%x180" style="border-radius: 5px; height: 180px; width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22286%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20286%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18b60b62a89%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18b60b62a89%22%3E%3Crect%20width%3D%22286%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22107.1953125%22%20y%3D%2296.3%22%3E286x180%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">';
        }
        echo '<div class="card-body border-top mt-2">
          <h3 class="card-title">'.$teacher['full_name'].'</h3>
          <p class="card-text">'.explode(' ',date("H:i d/m/Y", strtotime($teacher['date_of_birth'])))[1].'</p>
          <h4 class="position">'.$teacher['position'].'</h4>
          <p class="tieu_su">'.substr(wp_strip_all_tags($teacher['tieu_su']), 0, 70).' ...'.'</p>
          <a href="'.get_site_url(). '/giang-vien?id='.$teacher['id'].'" class="btn btn-primary" style="height: auto">Xem chi tiết</a>
        </div>
      </div>';
    }

    wp_die();
}

// ajax search

add_action('wp_ajax_search_teachers_home', 'search_teachers_home');
add_action('wp_ajax_nopriv_search_teachers_home', 'search_teachers_home');

function search_teachers_home(){
    $search = $_POST['value'];
    global $wpdb;
    $table_name = $wpdb->prefix . 'teacher'; // Replace with your table name

    $query = $wpdb->prepare("SELECT * FROM $table_name WHERE full_name LIKE %s OR tieu_su LIKE %s", '%' . $search . '%', '%' . $search . '%');
    $results = $wpdb->get_results($query, ARRAY_A);

    echo json_encode($results);
    wp_die();
}

function is_teacher(){
    global $current_user;
    $role = $current_user->roles[0];
    if($role == 'teacher'){
        return true;
    }
    return false;
}

function is_admin_user(){
    global $current_user;
    $role = $current_user->roles[0];
    if($role == 'administrator'){
        return true;
    }
    return false;
}

function count_total_teacher(){
    return count(get_list_teacher());
}
function count_total_mon_hoc(){
    return count(get_list_mon_hoc());
}