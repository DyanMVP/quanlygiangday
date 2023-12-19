<?php
global $wpdb;

$table_name = $wpdb->prefix . 'dang_ky'; // Get the table name with proper prefix

$query = "SELECT * FROM $table_name ORDER BY created_time DESC LIMIT 3";

$results = $wpdb->get_results($query);

if ($results) {
    echo '<div>';
    foreach ($results as $row) {
        echo '<div class="col-md-12 card row-hover pos-relative py-3 px-3 mb-3 border-warning border-top-0 border-right-0 border-bottom-0 rounded-4 bg-dark text-white">
        <div class="row align-items-center">
            <div class="col-md-8 mb-3 mb-sm-0">
                <h5>' . get_data_table_by_id($row->id_mon, 'mon_hoc', 'ten_mon_hoc') . '<span class="h6 ml-3">' . date("d/m/Y", strtotime($row->time_start)) . '</span>' . ' - ' . get_data_table_by_id($row->teacher_id, 'teacher', 'full_name') . '</h5>
                <p class="text-sm">By</span> <a class="text-black" href="#">' . $row->user_created . '</a></p>
            </div>
            <div class="col-md-4 op-7">
                <div class="row text-center op-7">
                    <div class="col px-1"> <i class="ion-connection-bars icon-1x"></i> <span class="d-block text-sm">... Votes</span></div>
                    <div class="col px-1"> <i class="ion-ios-chatboxes-outline icon-1x"></i> <span class="d-block text-sm">... Replys</span></div>
                    <div class="col px-1"> <i class="ion-ios-eye-outline icon-1x"></i> <span class="d-block text-sm">... Views</span></div>
                </div>
            </div>
        </div>
    </div>';
    }
    echo '</div>';
} else {
    echo 'No results found.';
}
