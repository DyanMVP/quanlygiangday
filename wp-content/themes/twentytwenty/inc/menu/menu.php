<?php
if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}
?>
<?php
add_action('admin_menu', 'init_admin_main_menu', 10);

function callback_view()
{
    require_once THEME_LIB . '/view/teacher/teacher.php';
}

function teacher_view()
{
    require_once THEME_LIB . '/view/teacher/teacher.php';
}

function group_view()
{
    require_once THEME_LIB . '/view/to_mon/to_mon.php';
}

function mon_hoc_view(){
    require_once THEME_LIB . '/view/mon_hoc/mon_hoc.php';
}

function khoa_dh_view(){
    require_once THEME_LIB . '/view/khoa/khoa.php';
}

function class_view(){
    require_once THEME_LIB . '/view/classes/classes.php';
}

function dang_ki_mo_lop(){
    require_once THEME_LIB . '/view/dang-ky/dang-ky.php';
}

function init_admin_main_menu()
{
    $menuSlug = 'dan_admin_menu';
    //create new top-level menu
    add_menu_page(
        'Quản lý chung',
        'Quản lý chung',
        'administrator',
        $menuSlug,
        'callback_view',
        'dashicons-admin-settings',
        '40'
    );

    add_menu_page(
        'Giảng viên',
        'Giảng viên',
        'quanlygiangday',
        'teacher.php',
        'teacher_view',
        'dashicons-admin-users',
        '41'
    );

    add_menu_page(
        'Chuyên ngành',
        'Chuyên ngành',
        'quanlygiangday',
        'group.php',
        'group_view',
        'dashicons-format-aside',
        '42'
    );

    add_menu_page(
        'Môn học',
        'Môn học',
        'quanlygiangday',
        'mon_hoc',
        'mon_hoc_view',
        'dashicons-clipboard',
        '43'
    );
    add_menu_page(
        'Khóa ĐH',
        'Khóa ĐH',
        'quanlygiangday',
        'khoa_dh',
        'khoa_dh_view',
        'dashicons-schedule',
        '44'
    );

    add_menu_page(
        'Danh sách lớp',
        'Danh sách lớp',
        'quanlygiangday',
        'classes',
        'class_view',
        'dashicons-list-view',
        '45'
    );

    add_menu_page(
        'Thời khóa biểu',
        'Thời khóa biểu',
        'quanlygiangday',
        'dang-ki-mo-lop',
        'dang_ki_mo_lop',
        'dashicons-feedback',
        '45'
    );
}