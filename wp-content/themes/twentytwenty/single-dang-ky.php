<?php
$dataRow = get_data_dang_ky_by_id($id);
if (!$dataRow) {
    return;
}
$teacher_id = $dataRow['teacher_id'];
$id_lop = $dataRow['id_lop'];
$id_mon = $dataRow['id_mon'];
$time_start = $dataRow['time_start'];
?>
<div id="content-details-lesson" class="">
    <div class="modal-dialogs" style="width: 96%; margin: auto">
        <div class="modal-content">
            <div>
                <div class="modal-header">
                    <h4 class="modal-title mr-3">Thông tin chi tiết tiết dạy</h4>
                    <div class="d-none">
                        <?php  echo get_status_lich_day(get_data_table_by_id($id, 'dang_ky', 'lesson'), get_data_table_by_id($id, 'dang_ky', 'time_start')); ?>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Giảng viên đứng lớp : </label>
                        <?php
                        echo '<span class="font-weight-bold">' . $teacher_name = get_data_table_by_id($teacher_id, 'teacher', 'full_name') . '</span>';
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="sel1">Lớp giảng dạy : </label>
                        <?php
                        echo '<span class="font-weight-bold">' . get_data_table_by_id($id_lop, 'classes', 'ten_lop') . '</span>';
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="sel1">Môn giảng dạy : </label>
                        <?php
                        echo '<span class="font-weight-bold">' . get_data_table_by_id($id_mon, 'mon_hoc', 'ten_mon_hoc') . '</span>';
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="sel1">Thời giảng dạy : </label>
                        <?php
                        echo '<span class="font-weight-bold">Thứ ' . get_data_table_by_id($id, 'dang_ky', 'weekdays') .' - '. '</span>';
                        echo '<span class="font-weight-bold">Học kì:  ' . get_data_table_by_id($id, 'dang_ky', 'hoc_ky'). '</span>';
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="sel1">Tiết học : </label>
                        <?php
                        echo get_html_lesson($dataRow['lesson']);
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="sel1">Link online : </label>
                        <?php
                        echo '<a href="'.get_data_table_by_id($id, 'dang_ky', 'link').'">' .  get_data_table_by_id($id, 'dang_ky', 'link') . '</a>';
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="sel1">Chi tiết các bài giảng : </label>
                        <?php
                        echo '<div class="w-100 detail-lesson-list" style="width: 60%;">';
                        // echo render_video_lesson(get_data_table_by_id($id, 'dang_ky', 'url_detail'));
                        $results = get_list_history_lesson($id, 0, true);
                        foreach($results as $row){
                            echo '<div class="featured-lesson d-flex align-items-center col-xl-12 col-md-12 pl-0 pr-0">
                            <a class="url_video_detail" href="#" data-url="'.$row['details'].'">'.$row['details'].'</a>
                            <div class="time-start ml-4">'.date("H:i d/m/Y", strtotime($row['time_created'])).'</div>
                            </div>';
                        }
                        echo '</div>';
                        ?>
                        <button href="#addViewModal" data-id="<?php echo $id ?>" class="btn btn-primary add_history_lesson" data-toggle="modal">Thêm mới record bài giảng</button>
                    </div>
                    <div class="form-group">
                        <label for="sel1">Ghi chú :</label>
                        <?php
                        echo '<p style="border: 1px solid #ebebeb; padding: 15px; border-radius: 4px;">' .  get_data_table_by_id($id, 'dang_ky', 'ghi_chu') . '</p>';
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="addViewModal" class="modal fade">
        <div class="modal-dialog" style="width: 700px">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <h4 class="modal-title">Thêm đường dẫn chi tiết tiết dạy</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="font-weight-bold" for="sel1">Nhập URL Youtube hoặc MP4</label>
                            <input type="text" class="form-control url_detail"></input>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold" for="sel1">Thời gian tiết học</label>
                            <input type="datetime-local" class="form-control time_created"></input>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold" for="sel1">Ghi chú</label>
                            <textarea type="text" class="form-control note"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                        <input type="submit" data-id="<?php echo $id ?>" class="btn btn-primary add_history_lesson" value="Xác nhận">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal-video d-none"></div>
<div class="modal-overlay-video d-none"></div>