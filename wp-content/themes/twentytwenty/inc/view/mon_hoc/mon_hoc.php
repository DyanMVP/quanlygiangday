<div class="container-xl">
    <div class="table-responsive mon_hoc_list">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8 row">
                        <h2>Danh sách <b>Môn học</b></h2>
                        <input type="text" class="ml-5" id="myInput" onkeyup="myFunction()" placeholder="Tìm kiếm theo tên...">
                    </div>
                    <div class="col-sm-4">
                        <?php if(is_admin_user())
                        echo '<a href="#addViewModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm mới</span></a>'
                        ?>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover" id="table-content">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên môn học</th>
                        <th>Mã học phần</th>  
                        <?php if(is_admin_user()) echo '<th>Action</th>' ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $data = get_list_mon_hoc(0, false);
                    foreach ($data as $key => $row) {
                        echo '<tr>';
                        echo '<td>' . ($key + 1) . '</td>';
                        echo '<td>' . $row['ten_mon_hoc'] . '</td>';
                        echo '<td>' . $row['mo_ta'] . '</td>';
                        if(is_admin_user()) echo '<td>
                        <a href="#editViewModal" data-id="' . $row['id'] . '" class="edit_mon_hoc" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
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
				$dataAll = get_list_mon_hoc(0, true);
				$pages = ceil(count($dataAll) / 10);
				echo '<ul class="pagination">';
				echo '  <li class="page-item disabled prev"><a href="#">Previous</a></li>';
				for ($i = 1; $i <= $pages; $i++) {
				?>
					<li class="page-item pagination-item <?php if ($i == 1) {echo 'active';} ?>" data-offset="<?php echo $i ?>"><a href="#" class="page-link"><?php echo $i ?></a></li>
				<?php
				}
				echo '<li class="page-item disabled next"><a href="#">Next</a></li>';
				echo '</ul>';
				?>
			</div>
        </div>
    </div>
</div>
<!-- add Modal HTML -->
<div id="addViewModal" class="modal fade">
    <div class="modal-dialog" style="max-width: 600px;">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Thêm mới môn học</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên môn học</label>
                        <input type="text" class="form-control full_name" required>
                    </div>
                    <div class="form-group">
                        <label>Mã học phần</label>
                        <textarea class="form-control description" required></textarea>
                    </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                        <input type="submit" class="btn btn-success add_new_mon_hoc" value="Thêm mới">
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
                            <label>Tên môn học</label>
                            <input type="text" class="form-control full_name" required>
                        </div>
                        <div class="form-group">
                            <label>Mã học phần</label>
                            <textarea class="form-control mo_ta" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                        <input type="submit" class="btn btn-info edit_mon_hoc" value="Lưu">
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
                        <h4 class="modal-title">Xóa môn học</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có chắc chắc muốn xóa </p>
                        <p class="text-warning"><small>Thao tác này không thể hoàn tác.</small></p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                        <input type="submit" class="btn btn-danger delete_mon_hoc" value="Delete">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
			function myFunction() {
			// Declare variables
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("table-content");
			tr = table.getElementsByTagName("tr");

			// Loop through all table rows, and hide those who don't match the search query
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
      <script>
          tinymce.init({
            selector: 'textarea#editor',
          });
        </script>