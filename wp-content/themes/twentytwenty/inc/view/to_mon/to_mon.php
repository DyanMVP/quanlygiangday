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
                        <h2>Quản lí <b>chuyên ngành</b></h2>
                    </div>
                    <div class="col-sm-6">
                    <?php if($role === 'administrator'){ ?>
                        <a href="#addViewModal" class="btn btn-success" data-toggle="modal"><i
                                class="material-icons">&#xE147;</i> <span>Thêm mới</span></a>
                       <?php } ?>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên Chuyên ngành</th>
                        <th>Số Giảng Viên</th>
                        <th>Mã Khoa</th>
                        <?php if(is_admin_user()) echo '<th>Action</th>' ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $data = get_list_to_mon();
                    foreach ($data as $key => $row) {
                        echo '<tr>';
                        echo '<td>' . ($key + 1) . '</td>';
                        echo '<td>' . $row['ten_to_mon'] . '</td>';
                        echo '<td>' . $row['so_giang_vien'] . '</td>';
                        echo '<td>' . $row['ma_khoa'] . '</td>';
                        if( is_admin_user()) echo '<td>
                        <a href="#editViewModal" data-id="' . $row['id'] . '" class="edit_to_mon" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                        <a href="#deleteViewModal" data-id="' . $row['id'] . '" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>';
                        echo '</tr>';
                    }
                    ?>


                </tbody>
            </table>
            <div class="clearfix">
				<div class="hint-text d-none">Showing <b>5</b> out of <b>25</b> entries</div>
				<?php
				$dataAll = get_list_to_mon(0, true);
				$pages = ceil(count($dataAll) / 10); 
				echo '<ul class="pagination">';
				echo '  <li class="page-item disabled prev"><a href="#">Previous</a></li>';
				for($i = 1; $i<= $pages; $i++){
					?>
					<li class="page-item pagination-item <?php if($i == 1){ echo 'active'; } ?>" data-offset="<?php echo $i ?>"><a href="#" class="page-link"><?php echo $i ?></a></li>
					<?php
				}
				echo '<li class="page-item disabled next"><a href="#">Next</a></li>';
				echo '</ul>';
				?>
			</div>
        </div>
    </div>
</div>
<!-- Edit Modal HTML -->
<div id="addViewModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Thêm mới Chuyên ngành</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên Chuyên ngành</label>
                        <input type="text" class="form-control full_name" required>
                    </div>
                    <div class="form-group">
                        <label>Số giảng viên</label>
                        <input type="number" class="form-control so_giang_vien" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                    <input type="submit" class="btn btn-success add_new_to_mon" value="Thêm mới">
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
                        <label>Tên tô môn</label>
                        <input type="text" class="form-control full_name" required>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                        <input type="submit" class="btn btn-info edit_to_mon" value="Lưu">
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
                        <input type="submit" class="btn btn-danger delete_to_mon" value="Delete">
                    </div>
                </form>
            </div>
        </div>
    </div>