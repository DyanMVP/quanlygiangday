<?php

use function Sodium\compare;

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}

function get_list_dang_ky($offset = 0, $isAll = true, $queryAdd = '')
{
    global $wpdb, $current_user;
    $email_user = $current_user->user_login;
    if(is_user_logged_in()){
        $role = $current_user->roles[0];
    } else{
        $role = 'administrator';
    }
    $table_name = $wpdb->prefix . 'dang_ky'; // Replace 'your_custom_table' with your table name
    $queryAdded = '';
    if($queryAdd){
        $queryAddNew = preg_replace('/\bAND\b/', '', $queryAdd, 1);
        $queryAdded = "WHERE $queryAddNew";
    }
    if($role == 'administrator'){
        if (!$isAll) {
            $query = "SELECT * FROM $table_name ORDER BY weekdays ASC LIMIT 10 OFFSET $offset";
        } else {
            $query = "SELECT * FROM $table_name $queryAdded ORDER BY weekdays ASC";
        }
        $results = $wpdb->get_results($query, ARRAY_A);
        return $results;
    }
    else{
        if (!$isAll) {
            $query = "SELECT * FROM $table_name WHERE user_created = '$email_user' $queryAdd ORDER BY weekdays ASC LIMIT 10 OFFSET $offset";
        } else {
            $query = "SELECT * FROM $table_name WHERE user_created = '$email_user' $queryAdd ORDER BY weekdays ASC";
        }

        $results = $wpdb->get_results($query, ARRAY_A);
        return $results;
    }
}

function get_data_dang_ky_by_id($id)
{
    global $wpdb;
    $table_name = $wpdb->prefix . 'dang_ky'; // Replace 'your_custom_table' with your table name

    $query = $wpdb->prepare("SELECT * FROM $table_name WHERE id = %d", $id);
    $result = $wpdb->get_row($query, ARRAY_A);

    return $result;
}

//add data
function insert_data_action_dang_ky()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['teacher_id'])) {
        global $wpdb, $current_user;
        $table_name = $wpdb->prefix . 'dang_ky';
        $time_start = date('Y-m-d H:i:s', strtotime($_POST['time_start']));
        $data = array(
            'teacher_id' => $_POST['teacher_id'],
            'id_lop' => $_POST['id_lop'],
            'id_mon' => $_POST['id_mon'],
            'hoc_ky' => $_POST['hoc_ky'],
            'ghi_chu' => $_POST['ghi_chu'],
            'user_created' => $current_user->user_login,
            'time_start' => $time_start,
            'lesson' => $_POST['lesson'],
            'link' => $_POST['link'],
            'url_detail' => '',
            'weekdays' => $_POST['weekdays'],
            'year' => $_POST['year']
        );

        $check_exits = check_exist_in_weekdays($_POST['teacher_id'], $_POST['weekdays']);
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
                '%s',
                '%s',
                '%d',
            );
        if(!$check_exits){
            $wpdb->insert($table_name, $data, $format);
            echo var_dump($data);
        } else{
            $less_start = intval($_POST['lesson_start']);
            if($less_start <= $check_exits){
                echo 'error';
                wp_die();
                return;
            }
            $wpdb->insert($table_name, $data, $format);
            echo var_dump($data);
        }
    }

    wp_die();
}

add_action('wp_ajax_insert_data_action_dang_ky', 'insert_data_action_dang_ky');
add_action('wp_ajax_nopriv_insert_data_action_dang_ky', 'insert_data_action_dang_ky');

//edit data
function edit_data_action_dang_ky()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb, $current_user;
        $table_name = $wpdb->prefix . 'dang_ky'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        // Define the data to update
        $data = array(
            'url_detail' => sanitize_text_field($_POST['url_detail']),
        );

        $where = array('id' => $id);

        $wpdb->update($table_name, $data, $where);

        echo 'Data updated successfully.';
    }

    wp_die();
}

add_action('wp_ajax_edit_data_action_dang_ky', 'edit_data_action_dang_ky');
add_action('wp_ajax_nopriv_edit_data_action_dang_ky', 'edit_data_action_dang_ky');


//delete data
function delete_data_action_dang_ky()
{
    check_ajax_referer('custom-ajax-nonce', 'nonce');

    if (isset($_POST['id'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'dang_ky'; // Replace 'your_custom_table' with your table name

        $id = intval($_POST['id']); // Ensure the ID is an integer

        $where = array('id' => $id);
        $wpdb->delete($table_name, $where);

        echo 'Data deleted successfully.';
    }

    wp_die();
}

add_action('wp_ajax_delete_data_action_dang_ky', 'delete_data_action_dang_ky');
add_action('wp_ajax_nopriv_delete_data_action_dang_ky', 'delete_data_action_dang_ky');


function get_status_lich_day($lesson, $time_start)
{

    $newArr = json_decode($lesson, true);
	$lesson_start =  intval($newArr[0]);
	$lesson_end =  intval($newArr[1]);
    $time_st = convert_lesson_to_time($lesson_start, false);
    $time_en = convert_lesson_to_time($lesson_end, true);

    $_time_start = strtotime($time_start.' '.$time_st);
    $_time_end =  strtotime($time_start.' '.$time_en);
    $nowTs = current_time('timestamp');
    $compare =  $_time_start - $nowTs;
    if($nowTs > $_time_end){
        echo '<span class="expired d-none" style="font-size: 12px; padding: 4px 15px; background-color: #ebebeb; border-radius: 20px; text-wrap: nowrap;">Đã hoàn thành</span>';
        return;
    }
    if($_time_end > $nowTs && $nowTs > $_time_start){
        echo '<span class="coming d-none" style="font-size: 12px; padding: 4px 15px; background-color: #80c747; border-radius: 20px; color: #fff; text-wrap: nowrap;">Đang diễn ra</span>';
        return;
    }
    $days = floor($compare / (24 * 3600)) > 0 ? floor($compare / (24 * 3600)).' ngày ' : '';
    $remainingSeconds = $compare % (24 * 3600);
    $hours = floor($remainingSeconds / 3600) > 0 ? floor($remainingSeconds / 3600).' tiếng ' : '';
    $remainingSeconds %= 3600;
    $minutes = floor($remainingSeconds / 60) > 0 ? floor($remainingSeconds / 60).' phút ' : '';
    echo '<span class="coming d-none" style="font-size: 12px; padding: 4px 15px; background-color: #ccbf3b; border-radius: 20px; color: #fff; text-wrap: nowrap;">Còn: '.$days. $hours.$minutes.'</span>';
    return;
    
}

function convert_lesson_to_time($lesson, $isEnd){
    $out = '';
    switch($lesson){
        case 1:
            $out = $isEnd ? '08:00:00' : '07:00:00';
            break;
        case 2:
            $out = $isEnd ? '09:00:00' : '08:00:00';
            break;
        case 3:
            $out = $isEnd ? '10:00:00' : '09:00:00';
            break;
        case 4:
            $out = $isEnd ? '11:00:00' : '10:00:00';
            break;
        case 5:
            $out = $isEnd ? '12:00:00' : '11:00:00';
            break;
        case 6:
            $out = $isEnd ? '14:00:00' : '13:00:00';
            break;
        case 7:
            $out = $isEnd ? '15:00:00' : '14:00:00';
            break;
        case 8:
            $out = $isEnd ? '16:00:00': '15:00:00';
            break;
        case 9:
            $out = $isEnd ? '17:00:00' : '16:00:00';
            break;
        case 10:
            $out = $isEnd ? '18:00:00' : '17:00:00';
            break;
        case 11:
            $out = '18:00:00';
            break;
        default: break;
    }
    return $out;
}

function get_html_lesson($lesson){
    $newArr = json_decode($lesson, true);
	$lesson_start =  intval($newArr[0]);
	$lesson_end =  intval($newArr[1]);
    return 'Tiết '.$lesson_start.' - '.'Tiết '.$lesson_end;
}

function get_status_code_lich_day($lesson, $time_start)
{
    $newArr = json_decode($lesson, true);
	$lesson_start =  intval($newArr[0]);
	$lesson_end =  intval($newArr[1]);
    $time_st = convert_lesson_to_time($lesson_start, false);
    $time_en = convert_lesson_to_time($lesson_end, true);

    $_time_start = strtotime($time_start.' '.$time_st);
    $_time_end =  strtotime($time_start.' '.$time_en);
    $nowTs = current_time('timestamp');

    $compare =  $_time_start - $nowTs;
    if($nowTs > $_time_end){
        return 'done';
    }
    if($_time_end > $nowTs && $nowTs > $_time_start){
        return 'happenning';
    }
    return 'upcoming';
}

add_action('wp_ajax_load_pagination_dang_ky', 'load_pagination_dang_ky');
add_action('wp_ajax_nopriv_load_pagination_dang_ky', 'load_pagination_dang_ky');

function load_pagination_dang_ky()
{
    global $wpdb;
    $per_page = 10;
    $table_name = $wpdb->prefix . 'dang_ky';
    $offset = ($_POST['offset'] - 1) * 10;
    $results = get_list_dang_ky($offset, false);

    // Loop through $results and echo the HTML for each teacher entry
    foreach ($results as $key => $row) {
        echo '<tr class="fw-normal">';
        echo '<td>' . ($key + 1) . '</td>';
        echo '<td data-id="' . $row['teacher_id'] . '">' . get_data_table_by_id($row['teacher_id'], 'teacher', 'full_name') . '</td>';
        echo '<td data-id="' . $row['id_lop'] . '">' . get_data_table_by_id($row['id_lop'], 'classes',  'ten_lop') . '</td>';
        echo '<td data-id="' . $row['id_mon'] . '">' . get_data_table_by_id($row['id_mon'], 'mon_hoc', 'ten_mon_hoc') . '</td>';
        echo '<td data-id="' . $row['id_mon'] . '">'. get_html_hoc_ky($row['hoc_ky']).' ('.$row['year'].')'.'</td>';
        echo '<td class="text-center"><div class="text-lesson">' . get_html_lesson($row['lesson']) . '</div><div class="date-less">' .'Thứ '.$row['weekdays'] . '</div></td>';
        echo '<td><a href="'.$row['link'].'">' . $row['link'] . '</a></td>'; ?>
        <td class="d-none"><?php get_status_lich_day(get_data_table_by_id($row['id'], 'dang_ky', 'lesson'), get_data_table_by_id($row['id'], 'dang_ky', 'time_start')) ?></td>
<?php
global $current_user;
          echo '<td class="align-middle"> 
          
          <a href="' . admin_url() . 'admin.php?page=dang-ki-mo-lop&id=' . $row['id'] . '" class="details_dang_ky" data-id="' . $row['id'] . '" data-mdb-toggle="tooltip" title="Details"><i class="details fa-solid fa-circle-info text-success me-3"></i></a>';
                          $email_user = $current_user->user_login;
                          $user_created = $row['user_created'];
                          global $current_user;
                          $role = $current_user->roles[0];
                          if ($email_user == $user_created || $role == 'administrator') {
                              echo '<a href="#editViewModal" class="edit_dang_ky" data-id="' . $row['id'] . '" data-url="' . $row['url_detail'] . '" data-toggle="modal" title="Edit"><i class="edit_dang_ky fas fa-edit text-success me-3"></i></a>';
                          }

                          echo '<a href="#deleteViewModal" class="delete" data-id="' . $row['id'] . '" data-toggle="modal" data-mdb-toggle="tooltip" title="Remove"><i class="remove_dang_ky fas fa-trash-alt text-danger"></i></a>
          </td>';
        echo '</tr>';
    }

    wp_die();
}

// ajax search

add_action('wp_ajax_search_dang_ky', 'search_dang_ky');
add_action('wp_ajax_nopriv_search_dang_ky', 'search_dang_ky');

function search_dang_ky(){
    $search = $_POST['value'];
    global $wpdb;
    $table_name = $wpdb->prefix . 'mon_hoc'; // Replace with your table name

    $query = $wpdb->prepare("SELECT * FROM $table_name WHERE ten_mon_hoc LIKE %s", '%' . $search . '%');
    $results = $wpdb->get_results($query, ARRAY_A);

    echo json_encode($results);
    wp_die();
}


add_action('wp_ajax_search_dang_ky_last', 'search_dang_ky_last');
add_action('wp_ajax_nopriv_search_dang_ky_last', 'search_dang_ky_last');

function search_dang_ky_last(){
    $ids = $_POST['ids'];
    global $wpdb, $current_user;
    $email_user = $current_user->user_login;
    $role = $current_user->roles[0];
    $id_mon_values = array($ids);
    $placeholders = array_fill(0, count($id_mon_values), '%d');

    // Prepare the placeholders for use in the SQL query
    $placeholders_str = implode(', ', $placeholders);

    // Prepare the SQL query using $wpdb->prepare to avoid SQL injection
    if($role == 'administrator'){
        $query = $wpdb->prepare(
            "SELECT * FROM {$wpdb->prefix}dang_ky
            WHERE id_mon IN ({$placeholders_str})",
            $id_mon_values
        );
    } else{
        $query = $wpdb->prepare(
            "SELECT * FROM {$wpdb->prefix}dang_ky
            WHERE id_mon IN ({$placeholders_str}) AND user_created = '$email_user'",
            $id_mon_values
        );
    }

    $results = $wpdb->get_results($query);
    foreach($results as $row){
        echo '<div class="all-result pl-3 pb-3">';
        echo '<div class="d-flex justify-content-between"><div class="mr-3" data-id="'.$row->teacher_id.'">' . get_data_table_by_id($row->teacher_id, 'teacher', 'full_name') . '</div>';
        get_status_lich_day(get_data_table_by_id($row->id, 'dang_ky', 'lesson'), get_data_table_by_id($row->id, 'dang_ky', 'time_start'));
        echo '</div>';
        echo '<div data-id="'.$row->id_lop.'">' . get_data_table_by_id($row->id_lop, 'classes',  'ten_lop') .' '. get_html_hoc_ky($row->hoc_ky).' ('.$row->year.')'.'</div>';
        echo '<div data-id="'.$row->id_mon.'">' . get_data_table_by_id($row->id_mon, 'mon_hoc', 'ten_mon_hoc') . '</div>';
        echo '<div class="text-white bg-dark pl-2"><span style="color: #ea9785">'.'Thứ '. $row->weekdays.'</span>'.' - '.get_html_lesson($row->lesson).'</div>';
        // echo '<div>' . date("d/m/Y", strtotime($row->time_start)).'</div>';
        echo '<div class="td-link"><a href="'.$row->link.'" target="__blank">' . $row->link . '</a></div>';
        echo '</div>';
    }
    // echo json_encode($results);
    wp_die();
}


//ajax filter in home
add_action('wp_ajax_ajax_filter_dang_ky', 'ajax_filter_dang_ky');
add_action('wp_ajax_nopriv_ajax_filter_dang_ky', 'ajax_filter_dang_ky');
function ajax_filter_dang_ky(){
    $status = trim($_POST['status']);
    $time_start = $_POST['time_start'];
    $time_end = $_POST['time_end'];
    $results = get_list_dang_ky(0, true);
    foreach ($results as $key => $row) {
        $currentStatus = get_status_code_lich_day(get_data_table_by_id($row['id'], 'dang_ky', 'lesson'), get_data_table_by_id($row['id'], 'dang_ky', 'time_start'));
        if(trim($currentStatus) != $status && $status != 'all'){
            echo '';
        } else {
            if($time_start){
                $time_current  = strtotime($row['time_start']);
                if($time_start < $time_current && $time_current < $time_end){
                    echo '<div class="col-12 list list-dang-ky">
                    <div class="card d-flex flex-row mb-3">
                        <div class="d-flex flex-grow-1 min-width-zero">
                            <div class="card-body align-self-center d-flex flex-column flex-md-row justify-content-between min-width-zero align-items-md-center">
                            <p class="mb-0 text-muted text-small w-15 w-xs-100">'.get_data_table_by_id($row['id_lop'], 'classes',  'ten_lop').'</p>
                            <a href="'.$row['link'].'" target="__blank" class="list-item-heading mb-0 truncate w-40 w-xs-100">'.get_data_table_by_id($row['id_mon'], 'mon_hoc', 'ten_mon_hoc') .'</a>
                            <p class="mb-0 text-muted text-small w-15 w-xs-100">'. get_html_hoc_ky($row['hoc_ky']).' ('.$row['year'].')'.'</p>
                            <p class="mb-0 text-muted text-small w-15 w-xs-100">'.get_data_table_by_id($row['teacher_id'], 'teacher', 'full_name').'</p>
                            <div class="mb-0 text-muted text-small w-15 w-xs-100"><div class="text-lesson">' . get_html_lesson($row['lesson']) . '</div><div class="date-less">' .'Thứ '.$row['weekdays'] . '</div></div>';
                            ?>
                            <div class="w-15 w-xs-100 d-none"><span class="badge badge-pill"><?php get_status_lich_day(get_data_table_by_id($row['id'], 'dang_ky', 'lesson'), get_data_table_by_id($row['id'], 'dang_ky', 'time_start'))?></span></div>
                            <?php
                        echo '</div>
                        </div>
                        </div>
                    </div>';
                } else{
                    echo ''; 
                }
                
            } else{
                echo '<div class="col-12 list list-dang-ky">
                <div class="card d-flex flex-row mb-3">
                    <div class="d-flex flex-grow-1 min-width-zero">
                        <div class="card-body align-self-center d-flex flex-column flex-md-row justify-content-between min-width-zero align-items-md-center">
                        <p class="mb-0 text-muted text-small w-15 w-xs-100">'.get_data_table_by_id($row['id_lop'], 'classes',  'ten_lop').'</p>
                        <a href="'.$row['link'].'" target="__blank" class="list-item-heading mb-0 truncate w-40 w-xs-100">'.get_data_table_by_id($row['id_mon'], 'mon_hoc', 'ten_mon_hoc') .'</a>
                        <p class="mb-0 text-muted text-small w-15 w-xs-100">'. get_html_hoc_ky($row['hoc_ky']).' ('.$row['year'].')'.'</p>
                        <p class="mb-0 text-muted text-small w-15 w-xs-100">'.get_data_table_by_id($row['teacher_id'], 'teacher', 'full_name').'</p>
                        <div class="mb-0 text-muted text-small w-15 w-xs-100"><div class="text-lesson">' . get_html_lesson($row['lesson']) . '</div><div class="date-less">' .'Thứ '.$row['weekdays'] . '</div></div>';
                        ?>
                        <div class="w-15 w-xs-100 d-none"><span class="badge badge-pill"><?php get_status_lich_day(get_data_table_by_id($row['id'], 'dang_ky', 'lesson'), get_data_table_by_id($row['id'], 'dang_ky', 'time_start'))?></span></div>
                        <?php
                    echo '</div>
                    </div>
                    </div>
                </div>';
            }
        }
    }
    wp_die();
}

//ajax filter in home
add_action('wp_ajax_ajax_filter_dang_ky_by_weekdays', 'ajax_filter_dang_ky_by_weekdays');
add_action('wp_ajax_nopriv_ajax_filter_dang_ky_by_weekdays', 'ajax_filter_dang_ky_by_weekdays');
function ajax_filter_dang_ky_by_weekdays(){
    global $wpdb;
    $weekdays = trim($_POST['weekdays']);
    $hoc_ky = $_POST['hoc_ky'];
    $query = '';
    if($weekdays){
        $query .= "AND weekdays = '$weekdays'";
    }
    if($hoc_ky){
        $query .= "AND hoc_ky = '$hoc_ky'";
    }
    $results = get_list_dang_ky(0, true , $query);
    foreach ($results as $key => $row) {
        echo '<div class="col-lg-6 col-md-12 list list-dang-ky d-inline-block">
        <div class="card d-flex flex-row mb-3">
            <div class="d-flex flex-grow-1 min-width-zero">
                <div class="card-body align-self-center d-flex flex-column flex-md-row justify-content-between min-width-zero align-items-md-center">
                <p class="mb-0 text-muted text-small w-15 w-xs-100">'.get_data_table_by_id($row['id_lop'], 'classes',  'ten_lop').'</p>
                <a href="'.$row['link'].'" target="__blank" class="list-item-heading mb-0 truncate w-40 w-xs-100">'.get_data_table_by_id($row['id_mon'], 'mon_hoc', 'ten_mon_hoc') .'</a>
                <p class="mb-0 text-muted text-small w-15 w-xs-100">'. get_html_hoc_ky($row['hoc_ky']).' ('.$row['year'].')'.'</p>
                <p class="mb-0 text-muted text-small w-15 w-xs-100">'.get_data_table_by_id($row['teacher_id'], 'teacher', 'full_name').'</p>
                <div class="mb-0 text-muted text-small w-15 w-xs-100"><div class="text-lesson">' . get_html_lesson($row['lesson']) . '</div><div class="date-less">' .'Thứ '.$row['weekdays'] . '</div></div>';
                ?>
                <div class="w-15 w-xs-100 d-none"><span class="badge badge-pill"><?php get_status_lich_day(get_data_table_by_id($row['id'], 'dang_ky', 'lesson'), get_data_table_by_id($row['id'], 'dang_ky', 'time_start'))?></span></div>
                <?php
            echo '</div>
            </div>
            </div>
        </div>';
    }
    wp_die();
}

function render_video_lesson($url){
    if(validate_url_youtube($url)){
        if(preg_match('/[?&]v=([a-zA-Z0-9_-]+)/', $url, $matches)){
            $videoId = $matches[1];
        }
        return $iframe = '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/' . $videoId . '" frameborder="0" allowfullscreen></iframe>';
    }

    if(validate_url_mp4($url)){
        return `<video width="600" height="330" controls>
        <source src="'.$url.'" type="video/mp4">
      </video>`;
    }

}

function validate_url_youtube($url){
 // Define a regular expression pattern for a YouTube URL
    $pattern = "/^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.be)\/watch\?v=[A-Za-z0-9_\-]+/";
    if (preg_match($pattern, $url)) {
        return true; // Valid YouTube URL
    } else {
        return false; // Invalid YouTube URL
    }
}

function validate_url_mp4($url){
    $pattern = "/\.(mp4)$/i";
    // Use preg_match to check if the URL matches the pattern
    if (preg_match($pattern, $url)) {
        return true; // Valid MP4 URL
    } else {
        return false; // Invalid MP4 URL
    }
}

function get_lesson_has_url_details(){
    global $wpdb;
    $table_name = $wpdb->prefix . 'dang_ky'; // Replace 'your_custom_table' with your table name
    $query = "SELECT * FROM $table_name WHERE url_detail <> '' ORDER BY ID DESC LIMIT 6 OFFSET 0;";
    $results = $wpdb->get_results($query, ARRAY_A);

    return $results;
}

function convertTime($date){
    setlocale(LC_TIME, 'vi_VN');
    $dateString = $date;
    $timestamp = strtotime($dateString);

    // Format the date with the Vietnamese day of the week
    $dayOfWeek = strftime('%A', $timestamp);
    $dayOfWeekInVietnamese = '';

    // Map English day of the week to Vietnamese
    $dayOfWeekMappings = [
        'Monday' => 'Thứ 2',
        'Tuesday' => 'Thứ 3',
        'Wednesday' => 'Thứ 4',
        'Thursday' => 'Thứ 5',
        'Friday' => 'Thứ 6',
        'Saturday' => 'Thứ 7',
        'Sunday' => 'CN',
    ];

    if (array_key_exists($dayOfWeek, $dayOfWeekMappings)) {
        $dayOfWeekInVietnamese = $dayOfWeekMappings[$dayOfWeek];
    }

    $formattedDate = $dayOfWeekInVietnamese . strftime(', %d - %m - %Y', $timestamp);
    return $formattedDate;
}

function get_html_hoc_ky($hoc_ky){
    $text = '';
    switch($hoc_ky){
        case '1':
            $text = 'HK I (20/09 - 25/12)';
            break;
        case '2':
            $text = 'HK II';
            break;
        case '3':
            $text = 'HK phụ';
            break;
        default:
        $text = 'Đang cập nhật';
            break;
    }
    return $text;
}



add_action('wp_ajax_push_notify_lesson', 'push_notify_lesson');
add_action('wp_ajax_nopriv_push_notify_lesson', 'push_notify_lesson');

function push_notify_lesson() {
   $results =  get_list_dang_ky(0, true);
   foreach($results as $row){
    $newArr = json_decode($row['lesson'], true);
	$lesson_start =  intval($newArr[0]);
	$lesson_end =  intval($newArr[1]);
    $time_st = convert_lesson_to_time($lesson_start, false);
    $time_en = convert_lesson_to_time($lesson_end, true);

    $_time_start = strtotime($row['time_start'].' '.$time_st);
    $currentDate = new DateTime('now', new DateTimeZone('UTC'));
    $currentDate_last = new DateTime('now', new DateTimeZone('UTC'));
    // Set the time to 00:00:00
    $currentDate->setTime(0, 0, 0);
    $currentDate_last->setTime(23, 59, 59);
    // Get the timestamp for 00:00:00 of the current day
    $timestamp = $currentDate->getTimestamp();
    $timestamp_last = $currentDate_last->getTimestamp();
    if($row['weekdays'] == date('w') + 1){
           echo '<div class="d-flex flex-column position-relative">
           <p class="mb-0 text-muted text-small w-15 w-xs-100">'.get_data_table_by_id($row['id_lop'], 'classes',  'ten_lop').'</p>
           <a href="'.$row['link'].'" target="__blank" class="list-item-heading mb-0 truncate w-40 w-xs-100">'.get_data_table_by_id($row['id_mon'], 'mon_hoc', 'ten_mon_hoc') .'</a>
           <p class="mb-0 text-muted text-small w-15 w-xs-100">'. get_html_hoc_ky($row['hoc_ky']).' ('.$row['year'].')'.'</p>
           <p class="mb-0 text-muted text-small w-15 w-xs-100">'.get_data_table_by_id($row['teacher_id'], 'teacher', 'full_name').'</p>
           <div class="mb-0 text-muted text-small w-15 w-xs-100"><div class="text-lesson">' . get_html_lesson($row['lesson']) . '</div><div class="date-less">' .'Thứ '.$row['weekdays'] . '</div></div>';
           ?>
           <div class="w-15 w-xs-100 d-none"><span class="badge badge-pill"><?php get_status_lich_day(get_data_table_by_id($row['id'], 'dang_ky', 'lesson'), get_data_table_by_id($row['id'], 'dang_ky', 'time_start'))?></span></div>
           <?php
       echo '</div>';
    }
   }


    wp_die();
}

add_action('admin_footer', 'create_wrapper_notify');
function create_wrapper_notify(){
    echo '<div id="notify-lesson"></div>';
}