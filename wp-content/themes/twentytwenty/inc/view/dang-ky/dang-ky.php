<?php
if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    require get_template_directory() . '/single-dang-ky.php';
} else {
    global $current_user;
    $role = $current_user->roles[0];
    $email_user = $current_user->user_login;
?>
    <section class="vh-100" style="background-color: #eee;">
        <div class="container-fluid py-3 h-100">
            <div class="row d-flex justify-content-center align-items-center">
                <div class="col-md-12 col-xl-12">
                       
                    <div class="card col-md-12 admin-control list_dang_ky">
                        <div class="card-header p-3 d-flex align-items-center justify-content-between position-relative">
                            <h5 class="mb-0"><i class="fas fa-tasks me-2 mr-3"></i>Thời khóa biểu các lớp Online <?php if($role != 'administrator') echo 'của bạn'  ?></h5>
                            <div class="card-footer text-end text-right p-3">
                            <a target="__blank" href="https://fit.utt.edu.vn/vi/thong-bao-thoi-khoa-bieu-va-dang-ky-hoc-ky-chinh-1-nam-hoc-2023-2024.html" class="me-2 btn btn-link">Xem chi tiết thời khóa biểu</a>
                            <button href="#addViewModal" class="btn btn-primary" data-toggle="modal">Thêm mới thời khóa biểu</button>
                        </div>
                            <input type="text" class="ml-5" id="search_teacher" placeholder="Tìm kiếm...">
                            <div class="search-result bg-white"></div>
                        </div>
                        <div class="card-body overflow-auto" data-mdb-perfect-scrollbar="true" style="position: relative">

                            <table class="table mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col">STT</th>
                                        <th scope="col">Giảng viên</th>
                                        <th scope="col">Lớp</th>
                                        <th scope="col">Môn</th>
                                        <th scope="col">HK</th>
                                        <th scope="col">Thời gian học
                                            <div class="position-relative d-inline-block details-less">
                                                <i class="fa-solid fa-circle-info text-success me-3"></i>
                                                <div class="position-absolute details_lesson">
                                                    <ul class="list-lesson">
                                                        <?php for ($i = 0; $i < 10; $i++) {
                                                            echo '<li>Tiết ' . ($i + 1) . ' (Bắt đầu từ ' . ($i > 4 ? 8 + $i : 7 + $i) . 'h)</li>';
                                                        } ?>
                                                    </ul>
                                                </div>
                                            </div>
                                        </th>
                                        <th scope="col">Link học</th>
                                        <th scope="col" class="d-none">Trạng thái</th>
                                        <th scope="col" style="width: 110px;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $data = get_list_dang_ky(0, false);
                                    foreach ($data as $key => $row) {
                                        echo '<tr class="fw-normal">';
                                        echo '<td>' . ($key + 1) . '</td>';
                                        echo '<td data-id="' . $row['teacher_id'] . '">' . get_data_table_by_id($row['teacher_id'], 'teacher', 'full_name') . '</td>';
                                        echo '<td data-id="' . $row['id_lop'] . '"><a href="' . admin_url() . '?page=classes&student=' . $row['id_lop'] . '">' .' '. get_data_table_by_id($row['id_lop'], 'classes',  'ten_lop') . '</a></td>';
                                        echo '<td data-id="' . $row['id_mon'] . '">' . get_data_table_by_id($row['id_mon'], 'mon_hoc', 'ten_mon_hoc') .'</td>';
                                        echo '<td data-id="' . $row['id_mon'] . '">'. get_html_hoc_ky($row['hoc_ky']).' ('.$row['year'].')'.'</td>';

                                        // echo '<td>' . date("H:i d/m/Y", strtotime($row['time_start'])). ' - ' . date("H:i d/m/Y", strtotime($row['time_end'])). '</td>';
                                        echo '<td class="text-center"><div class="text-lesson">' . get_html_lesson($row['lesson']) . '</div><div class="date-less">' .'Thứ '.$row['weekdays'] . '</div></td>';
                                        echo '<td class="td-link"><a href="' . $row['link'] . '" target="__blank">' . $row['link'] . '</a></td>'; ?>
                                        <td class="position-relative d-none"><?php get_status_lich_day(get_data_table_by_id($row['id'], 'dang_ky', 'lesson'), get_data_table_by_id($row['id'], 'dang_ky', 'time_start')) ?>
                                            <?php if ($row['url_detail']) {
                                                echo '<i class="has-details fa fa-link position-absolute"></i>';
                                            } ?>
                                        </td>
                                    <?php
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
                                    ?>
                                </tbody>
                            </table>
                            <div class="clearfix mt-5">
                                <div class="hint-text d-none">Showing <b>5</b> out of <b>25</b> entries</div>
                                <?php
                                $dataAll = get_list_dang_ky(0, true);
                                $pages = ceil(count($dataAll) / 10);
                                echo '<ul class="pagination">';
                                echo '  <li class="page-item disabled prev"><a href="#">Previous</a></li>';
                                for ($i = 1; $i <= $pages; $i++) {
                                ?>
                                    <li class="page-item pagination-item <?php if ($i == 1) {
                                                                                echo 'active';
                                                                            } ?>" data-offset="<?php echo $i ?>"><a href="#" class="page-link"><?php echo $i ?></a></li>
                                <?php
                                }
                                echo '<li class="page-item disabled next"><a href="#">Next</a></li>';
                                echo '</ul>';
                                ?>
                            </div>
                        </div>
                       
                    </div>

                </div>
            </div>
        </div>
    </section>

    <div id="addViewModal" class="modal fade">
        <div class="modal-dialog" style="width: 700px">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <h4 class="modal-title">Thông tin lịch dạy</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="font-weight-bold">Chọn giảng viên đứng lớp</label>
                            <select id="select_teacher" data-live-search="true" data-live-search-style="startsWith" class="selectpicker w-100">
                                <?php
                                global $current_user;
                                $role = $current_user->roles[0];
                                $data = [];
                                if ($role === 'administrator') {
                                    $data = get_list_teacher();
                                    foreach ($data as $row) {
                                        echo '<option value="' . $row['id'] . '">' . $row['full_name'] . '</option>';
                                    }
                                }
                                if ($role === 'teacher') {
                                    $email = $current_user->user_login;
                                    // var_dump ($current_user);
                                    $id = get_data_teacher_row_by_email($email, 'id');
                                    $name = get_data_teacher_row_by_email($email, 'full_name');
                                    echo '<option value="' . $id . '">' . $name . '</option>';
                                }

                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold" for="sel1">Chọn lớp giảng dạy</label>
                            <select id="select_classes" data-live-search="true" data-live-search-style="startsWith" class="selectpicker w-100">
                                <?php
                                $data = get_list_classes();
                                foreach ($data as $row)
                                    echo '<option value="' . $row['id'] . '">' . $row['ten_lop'] . '</option>'
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold" for="sel1">Chọn môn giảng dạy</label>
                            <select id="select_mon_hoc" data-live-search="true" data-live-search-style="startsWith" class="selectpicker w-100">
                                <?php
                                $data = get_list_mon_hoc();
                                foreach ($data as $row)
                                    echo '<option value="' . $row['id'] . '">' . $row['ten_mon_hoc'] . '</option>'
                                ?>
                            </select>
                        </div>
                        <div class="form-group col-5 pl-0 d-inline-block">
                            <label class="font-weight-bold w-100" for="sel1">Kì học</label>
                            <select id="select_ky_hoc" class="w-100">
                                <option value="1">Học kì I</option>
                                <option value="2">Học kì II</option>
                                <option value="3">Học kì phụ</option>
                            </select>
                        </div>
                        <div class="form-group col-6 pl-0 d-inline-block">
                            <label class="font-weight-bold w-100" for="sel1">Năm học</label>
                            <select id="select_year" class="w-100">
                                <option value="<?php echo date('Y') ?>"><?php echo date('Y') ?></option>
                                <option value="<?php echo date('Y') + 1 ?>"><?php echo date('Y') + 1 ?></option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold w-100" for="sel1">Thời gian dạy học</label>
                            <!-- <input type="date" class="form-control" id="time_start" name="time_start"> -->
                            <select id="select_weekdays" class="w-100">
                                <?php
                                for($i=2; $i<8; $i++){
                                    echo '<option value="'.$i.'">Thứ '.$i.'</option>';
                                }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold w-100" for="sel1">Chọn tiết</label>
                            <select class="form-select select-lesson-start" aria-label="Default select example">
                                <option value="" selected>Tiết bắt đầu</option>
                                <?php for ($i = 0; $i < 10; $i++) {
                                    echo '<option value="' . ($i + 1) . '">Tiết ' . ($i + 1) . ' (Bắt đầu từ ' . ($i > 4 ? 8 + $i : 7 + $i) . 'h)</option>';
                                } ?>

                            </select>
                            <select class="form-select select-lesson-end ml-3" aria-label="Default select example">
                                <option  value="" selected>Tiết kết thúc</option>
                                <?php for ($i = 0; $i < 10; $i++) {
                                    echo '<option value="' . ($i + 1) . '">Tiết ' . ($i + 1) . ' (Kết thúc lúc ' . ($i > 4 ? 9 + $i : 8 + $i) . 'h)</option>';
                                } ?>

                            </select>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold" for="sel1">Link online</label>
                            <input class="form-control link"></input>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold" for="sel1">Ghi chú</label>
                            <textarea class="form-control note"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                        <input type="submit" class="btn btn-primary add_dang_ky" value="Xác nhận">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div id="editViewModal" class="modal fade">
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
                            <label class="font-weight-bold" for="sel1">Nhập URL Youtube hoặc MP4</label>
                            <input type="datetime-local" class="form-control time_created"></input>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                        <input type="submit" class="btn btn-primary edit_dang_ky" value="Xác nhận">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Delete Modal HTML -->
    <div id="deleteViewModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <h4 class="modal-title">Xóa giảng viên</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có chắc chắc muốn xóa </p>
                        <p class="text-warning"><small>Thao tác này không thể hoàn tác.</small></p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                        <input type="submit" class="btn btn-danger delete_dang_ky" value="Delete">
                    </div>
                </form>
            </div>
        </div>
    </div>

<?php } ?>