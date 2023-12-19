<?php
if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

function create_table_teacher() {
    global $wpdb;
    $table_name = $wpdb->prefix . 'teacher';
    $table_exists = $wpdb->get_var("SHOW TABLES LIKE '$table_name'");
    if($table_exists == $table_name){
        return;
    }
    $charset_collate = $wpdb->get_charset_collate();

    $sql = "CREATE TABLE $table_name (
        id INT NOT NULL AUTO_INCREMENT,
        teacher_id VARCHAR(255),
        full_name VARCHAR(255),
        email VARCHAR(255),
        date_of_birth DATETIME,
        sex VARCHAR(255),
        address VARCHAR(255),
        phone VARCHAR(255),
        position VARCHAR(255),
        image VARCHAR(255),
        ma_to_mon INT,
        tieu_su VARCHAR(5000),
        FOREIGN KEY (ma_to_mon) REFERENCES {$wpdb->prefix}to_mon(id),
        created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
    ) $charset_collate;";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);
}

function create_table_tomon(){
    global $wpdb;
    $table_name = $wpdb->prefix . 'to_mon';
    $table_exists = $wpdb->get_var("SHOW TABLES LIKE '$table_name'");
    if($table_exists == $table_name){
        return;
    }
    $charset_collate = $wpdb->get_charset_collate();

    $sql = "CREATE TABLE $table_name (
        id INT NOT NULL AUTO_INCREMENT,
        ten_to_mon VARCHAR(255),
        so_giang_vien VARCHAR(255),
        ma_khoa VARCHAR(255),
        created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
    ) $charset_collate;";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);
}

function create_table_mon_hoc(){
    global $wpdb;
    $table_name = $wpdb->prefix . 'mon_hoc';
    $table_exists = $wpdb->get_var("SHOW TABLES LIKE '$table_name'");
    if($table_exists == $table_name){
        return;
    }
    $charset_collate = $wpdb->get_charset_collate();

    $sql = "CREATE TABLE $table_name (
        id INT NOT NULL AUTO_INCREMENT,
        ten_mon_hoc VARCHAR(255),
        mo_ta VARCHAR(1000),
        created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
    ) $charset_collate;";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);
}

function create_table_classes(){
    global $wpdb;
    $table_name = $wpdb->prefix . 'classes';
    $table_exists = $wpdb->get_var("SHOW TABLES LIKE '$table_name'");
    if($table_exists == $table_name){
        return;
    }
    $charset_collate = $wpdb->get_charset_collate();

    $sql = "CREATE TABLE $table_name (
        id INT NOT NULL AUTO_INCREMENT,
        ten_lop VARCHAR(255),
        ma_khoa VARCHAR(255),
        id_khoa INT,
        FOREIGN KEY (id_khoa) REFERENCES {$wpdb->prefix}khoa(id),
        created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
    ) $charset_collate;";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);
}

function create_table_khoa(){
    global $wpdb;
    $table_name = $wpdb->prefix . 'khoa';
    $table_exists = $wpdb->get_var("SHOW TABLES LIKE '$table_name'");
    if($table_exists == $table_name){
        return;
    }
    $charset_collate = $wpdb->get_charset_collate();

    $sql = "CREATE TABLE $table_name (
        id INT NOT NULL AUTO_INCREMENT,
        ten_khoa VARCHAR(255),
        mo_ta VARCHAR(255),
        start_year YEAR,
        created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
    ) $charset_collate;";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);
}

function check_exist_in_weekdays($teacher_id, $weekdays){
    global $wpdb;
    $table_name = $wpdb->prefix . 'dang_ky'; // replace 'your_table_name' with the actual name of your table

    $teacher_id = $teacher_id;
    $desired_weekday = $weekdays;

    $query = $wpdb->prepare(
    "SELECT lesson FROM $table_name WHERE weekdays = %s AND teacher_id = %s ORDER BY lesson DESC",
    $desired_weekday,
    $teacher_id
    );

    $results = $wpdb->get_results($query);
    if(!$results){
        return false;
    }
    $max = 0;
    foreach($results as $row){
        $arr = json_decode($row->lesson);
        $lesson = $arr[1];
        if($lesson > $max){
            $max = $lesson;
        }
    }
    return $max;
}

function create_table_dang_ky(){
    global $wpdb;
    $table_name = $wpdb->prefix . 'dang_ky';
    $table_exists = $wpdb->get_var("SHOW TABLES LIKE '$table_name'");
    if($table_exists == $table_name){
        return;
    }
    $charset_collate = $wpdb->get_charset_collate();

    $sql = "CREATE TABLE $table_name (
        id INT NOT NULL AUTO_INCREMENT,
        teacher_id INT,
        id_lop INT,
        id_mon INT,
        hoc_ky INT,
        ghi_chu VARCHAR(1000),
        user_created VARCHAR(255),
        time_start DATETIME,
        lesson VARCHAR(255),
        link VARCHAR(255),
        url_detail NULL VARCHAR(255),
        weekdays VARCHAR(10),
        year INT,
        FOREIGN KEY (teacher_id) REFERENCES {$wpdb->prefix}teacher(id),
        created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
    ) $charset_collate;";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);
}

function create_history_lesson(){
    global $wpdb;
    $table_name = $wpdb->prefix . 'history_lesson';
    $table_exists = $wpdb->get_var("SHOW TABLES LIKE '$table_name'");
    if($table_exists == $table_name){
        return;
    }
    $charset_collate = $wpdb->get_charset_collate();

    $sql = "CREATE TABLE $table_name (
        id INT NOT NULL AUTO_INCREMENT,
        id_dang_ky INT,
        details VARCHAR(10000),
        time_created DATETIME,
        note VARCHAR(1000),
        FOREIGN KEY (id_dang_ky) REFERENCES {$wpdb->prefix}dang_ky(id),
        created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
    ) $charset_collate;";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);
}

add_action('init', 'create_table_teacher', 2);
add_action('init', 'create_table_tomon');
add_action('init', 'create_table_mon_hoc');
add_action('init', 'create_table_classes');
add_action('init', 'create_table_khoa');
add_action('init', 'create_table_dang_ky');
add_action('init', 'create_history_lesson');