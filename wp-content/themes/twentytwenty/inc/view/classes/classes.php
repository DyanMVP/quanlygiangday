<?php
global $current_user;
$role = $current_user->roles[0];
if(isset($_GET['student'])){
    require THEME_LIB.'/view/classes/student.php';
}
else {
?>
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper list_classes">
            <div class="table-title">
                <div class="row">
                    <div class="d-flex align-items-center col-sm-6">
                        <h2>Danh dách <b>lớp học</b></h2>
                        <input type="text" class="ml-5" id="myInput" onkeyup="myFunction()" placeholder="Tìm kiếm theo tên...">
                    </div>
                    <div class="col-sm-6">
                    <?php if($role === 'administrator'){ ?>
                        <a href="#addViewModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm mới</span></a>
                    <?php } ?>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover" id="table-content">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên lớp </th>
                        <th>Khoa</th>
                        <th>Khóa học</th>
                        <?php if(is_admin_user()) echo '<th>Action</th>' ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $data = get_list_classes(0, false);
                    foreach ($data as $key => $row) {
                        echo '<tr>';
                        echo '<td>' . ($key + 1) . '</td>';
                        echo '<td><a href="' . admin_url() . '?page=classes&student=' . $row['id'] . '">' . $row['ten_lop'] . '</a></td>';
                        echo '<td>' . 'CNTT' . '</td>';
                        echo '<td>' . get_name_khoa_by_id($row['id_khoa']) . '</td>';
                        if(is_admin_user()) echo '<td>
                        <a href="#editViewModal" data-id="' . $row['id'] . '" class="edit_classes" data-id_khoa="'.$row['id_khoa'].'" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
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
				$dataAll = get_list_classes(0, true);
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
<!-- Edit Modal HTML -->
<div id="addViewModal" class="modal fade">
    <div class="modal-dialog" style="max-width: 600px;">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Thêm mới lớp học</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên lớp</label>
                        <input type="text" class="form-control full_name" required>
                    </div>
                    <div class="form-group">
                            <label for="sel1">Khóa học</label>
                            <select id="select_classes" data-live-search="true" data-live-search-style="startsWith" class="selectpicker w-100">
                                <?php
                            $data = get_list_khoa(); 
                            foreach ($data as $row)
                                echo '<option value="' . $row['id'] . '">' . $row['ten_khoa'] . '</option>'
                                    ?>
                            </select>
                        </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                    <input type="submit" class="btn btn-success add_new_classes" value="Thêm mới">
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
                        <label>Tên lớp</label>
                        <input type="text" class="form-control full_name" required>
                    </div>
                    <div class="form-group">
                            <label for="sel1">Khóa học</label>
                            <select class="form-control" id="select_classes">
                                <?php
                            $data = get_list_khoa(); 
                            foreach ($data as $row)
                                echo '<option value="' . $row['id'] . '">' . $row['ten_khoa'] . '</option>'
                                    ?>
                            </select>
                        </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
                    <input type="submit" class="btn btn-info edit_classes" value="Lưu">
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
                    <input type="submit" class="btn btn-danger delete_classes" value="Delete">
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
<script>
	function myFunction() {
		// Declare variables
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("myInput");
		filter = toNonAccentVietnamese(input.value.toUpperCase());
		table = document.getElementById("table-content");
		tr = table.getElementsByTagName("tr");

		// Loop through all table rows, and hide those who don't match the search query
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			if (td) {
				txtValue = toNonAccentVietnamese(td.textContent) || toNonAccentVietnamese(td.innerText);
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}

	function toNonAccentVietnamese(str) {
		str = str.replace(/A|Á|À|Ã|Ạ|Â|Ấ|Ầ|Ẫ|Ậ|Ă|Ắ|Ằ|Ẵ|Ặ/g, "A");
		str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
		str = str.replace(/E|É|È|Ẽ|Ẹ|Ê|Ế|Ề|Ễ|Ệ/, "E");
		str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
		str = str.replace(/I|Í|Ì|Ĩ|Ị/g, "I");
		str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
		str = str.replace(/O|Ó|Ò|Õ|Ọ|Ô|Ố|Ồ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ỡ|Ợ/g, "O");
		str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
		str = str.replace(/U|Ú|Ù|Ũ|Ụ|Ư|Ứ|Ừ|Ữ|Ự/g, "U");
		str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
		str = str.replace(/Y|Ý|Ỳ|Ỹ|Ỵ/g, "Y");
		str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
		str = str.replace(/Đ/g, "D");
		str = str.replace(/đ/g, "d");
		// Some system encode vietnamese combining accent as individual utf-8 characters
		str = str.replace(/\u0300|\u0301|\u0303|\u0309|\u0323/g, ""); // Huyền sắc hỏi ngã nặng 
		str = str.replace(/\u02C6|\u0306|\u031B/g, ""); // Â, Ê, Ă, Ơ, Ư
		return str;
	}
</script>
<?php }?>