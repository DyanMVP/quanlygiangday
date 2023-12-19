<?php
global $current_user;
$role = $current_user->roles[0];
?>
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Danh dách các <b>khóa</b></h2>
                    </div>
                    <div class="col-sm-6">
                    <?php if($role === 'administrator'){ ?>
                        <a href="#addViewModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm mới</span></a>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên Khóa ĐH</th>
                        <th>Mô tả ngắn</th>
                        <th>Năm bắt đầu</th>
                        <?php  if(is_admin_user()) echo '<th>Action</th>' ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $data = get_list_khoa();
                    foreach ($data as $key => $row) {
                        echo '<tr>';
                        echo '<td>' . ($key + 1) . '</td>';
                        echo '<td>' . $row['ten_khoa'] . '</td>';
                        echo '<td>' . $row['mo_ta'] . '</td>';
                        echo '<td>' . $row['start_year'] . '</td>';
                        if(is_admin_user()) echo '<td>
                        <a href="#editViewModal" data-id="' . $row['id'] . '" class="edit_khoa" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                        <a href="#deleteViewModal" data-id="' . $row['id'] . '" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>';
                        echo '</tr>';
                    }
                    ?>


                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Edit Modal HTML -->
<div id="addViewModal" class="modal fade">
    <div class="modal-dialog" style="max-width: 600px;">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Thêm mới khóa</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên khóa</label>
                        <input type="text" class="form-control full_name" required>
                    </div>
                    <div class="form-group">
                        <label>Mô tả chi tiết</label>
                        <textarea class="form-control description" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Năm bắt đầu</label>
                        <!-- <input type="date" class="form-control date" required> -->
                        <select name="select" class="form-control" id="dropdownYear"></select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                    <input type="submit" class="btn btn-success add_new_khoa" value="Thêm mới">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Edit Modal HTML -->
<div id="editViewModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Chỉnh sửa thông tin</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên khóa</label>
                        <input type="text" class="form-control full_name" required>
                    </div>
                    <div class="form-group">
                        <label>Mô tả chi tiết</label>
                        <textarea class="form-control description" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Năm bắt đầu</label>
                        <!-- <input type="date" class="form-control date" required> -->
                        <select name="select" class="form-control" id="dropdownYear"></select>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                        <input type="submit" class="btn btn-info edit_khoa" value="Lưu">
                    </div>
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
                    <input type="submit" class="btn btn-danger delete_khoa" value="Delete">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    const selects = document.querySelectorAll('#dropdownYear');
    var currentYear = (new Date()).getFullYear();
    selects.forEach(item => {
        for (var i = 2100; i > 1969; i--) {
            if(i === currentYear){
                item.insertAdjacentHTML( 'afterbegin',`<option selected value="${i}">${i}</option>`);
            } else{
                item.insertAdjacentHTML( 'afterbegin',`<option value="${i}">${i}</option>`);
            }
        }  
    });
</script>