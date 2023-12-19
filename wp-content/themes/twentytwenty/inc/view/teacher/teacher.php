<?php
global $current_user;
$role = $current_user->roles[0];
?>
<div class="container-xl">
	<div class="table-responsive teacher_list">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-8 row">
						<h2>Danh sách <b>Giảng viên</b></h2>
						<input type="text" class="ml-5" id="myInput" onkeyup="myFunction()" placeholder="Tìm kiếm theo tên...">
					</div>
					<div class="col-sm-4">
						<?php if($role === 'administrator'){ ?>
						<a href="#addViewModal" class="btn btn-success add_new_teacher_first" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm mới</span></a>
						<!-- <a href="#deleteViewModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						 -->
						<?php } ?>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover" id="table-content">
				<thead>
					<tr>
						<th>STT</th>
						<th>Họ và tên</th>
						<th>Ngày sinh</th>
						<th>Giới tính</th>
						<th>Địa chỉ</th>
						<th>Số điện thoại</th>
						<th>Chức danh</th>
						<?php if(is_admin_user()) echo '<th>Action</th>' ?>
					</tr>
				</thead>
				<tbody>
					<?php
					$data = get_list_teacher(0, false);
					foreach ($data as $key => $row) {
						echo '<tr>';
						echo '<td>' . ($key + 1) . '</td>';
						echo '<td>' . $row['full_name'] . '</td>';
						echo '<td data-date="' . $row['date_of_birth'] . '">' . date("d/m/Y", strtotime($row['date_of_birth'])) . '</td>';
						echo '<td>' . $row['sex'] . '</td>';
						echo '<td>' . $row['address'] . '</td>';
						echo '<td>' . $row['phone'] . '</td>';
						echo '<td>' . $row['position'] . '</td>';
						echo '<td class="d-none">' . sprintf($row['tieu_su']) . '</td>';
						echo '<td class="image-url-preview d-none">' . $row['image'] . '</td>';
						if(is_admin_user()) echo '<td>
                        <a href="#editViewModal" data-id="' . $row['id'] . '" class="edit_teacher" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                        <a href="#deleteViewModal" data-id="' . $row['id'] . '" data-email="' . $row['email'] . '" class="delete button-delete-form" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>';
						echo '</tr>';
					}
					?>


				</tbody>
			</table>
			<div class="clearfix">
				<div class="hint-text d-none">Showing <b>5</b> out of <b>25</b> entries</div>
				<?php
				$dataAll = get_list_teacher(0, true);
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
			<div class="col-md-12">
			<?php if($role === 'administrator'){ ?>
				<form action="" method="post" enctype="multipart/form-data" style="display: flex; width: 50%; gap: 20px;">
					<div class="custom-file position-relative">
						<input type="file" name="excel_file" class="custom-file-input" id="excel_file">
						<label class="custom-file-label" for="customFile">Choose file</label>
					</div>
					<input type="submit" class="btn btn-info" name="submit_excel" value="Import data">
				</form>
				<?php } ?>
				<p>
					<?php
					if (isset($_GET['mess'])) {
						echo '<p class="text-success">Quá trình nhập đã hoàn tất</p>';
					}
					?></p>
			</div>
		</div>
	</div>
</div>
<!-- add Modal HTML -->
<div id="addViewModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">
					<h4 class="modal-title">Thêm mới giảng viên</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Họ và tên</label>
						<input type="text" class="form-control full_name" required>
					</div>
					<div class="form-group">
						<label>Địa chỉ Email</label>
						<input type="email" class="form-control email" required>
					</div>
					<div class="form-group">
						<label>Ngày sinh</label>
						<input type="date" class="form-control date" required>
					</div>
					<div class="form-group">
						<label>Giới tính</label>
						<div class="form-check">
							<label class="form-check-label">
								<span>Nam</span><input type="radio" class="form-check-input" sex="Nam" checked name="optradio">
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label">
								<span>Nữ</span><input type="radio" class="form-check-input" sex="Nữ" name="optradio">
							</label>
						</div>
					</div>
					<div class="form-group">
						<label>Ảnh đại diện</label>
						<div class="d-flex align-items-center">
							<div class="image-view" style="max-width: 200px; margin-right: 30px;"></div>
							<div href="#" class="img-upload btn btn-primary">Thêm hình ảnh</div>
						</div>
					</div>
					<div class="form-group">
						<label>Địa chỉ</label>
						<textarea class="form-control address" required></textarea>
					</div>
					<div class="form-group">
						<label>Số điện thoại</label>
						<input type="text" class="form-control phone" required>
					</div>
					<div class="form-group">
						<label>Chức vụ</label>
						<input type="text" class="form-control position" required>
					</div>
					<div class="form-group">
						<label for="sel1">Lựa chọn Chuyên ngành</label>
						<select class="form-control" id="select_to_mon">
							<?php
							$data = get_list_to_mon();
							foreach ($data as $row)
								echo '<option value="' . $row['id'] . '">' . $row['ten_to_mon'] . '</option>'
							?>
						</select>
					</div>
					<div class="form-group">
						<label for="sel1">Tiểu sử công tác</label>
						<textarea class="editor_add"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
					<input type="submit" class="btn btn-success add_new_teacher" value="Thêm mới">
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
						<label>Họ và tên</label>
						<input type="text" class="form-control full_name" required>
					</div>
					<div class="form-group">
						<label>Ngày sinh</label>
						<input type="date" class="form-control date" required>
					</div>
					<div class="form-group">
						<label>Giới tính</label>
						<div class="form-check">
							<label class="form-check-label">
								<span>Nam</span><input type="radio" class="form-check-input" sex="Nam" checked name="optradio">
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label">
								<span>Nữ</span><input type="radio" class="form-check-input" sex="Nữ" name="optradio">
							</label>
						</div>
					</div>
					<div class="form-group">
						<label>Ảnh đại diện</label>
						<div class="d-flex align-items-center">
							<div class="image-view" style="max-width: 200px; margin-right: 30px;">
							</div>
							<div href="#" class="img-upload btn btn-primary">Thay đổi hình ảnh</div>
						</div>
					</div>
					<div class="form-group">
						<label>Địa chỉ</label>
						<textarea class="form-control address" required></textarea>
					</div>
					<div class="form-group">
						<label>Số điện thoại</label>
						<input type="text" class="form-control phone" required>
					</div>
					<div class="form-group">
						<label>Chức vụ</label>
						<input type="text" class="form-control position" required>
					</div>
					<div class="form-group">
						<label for="sel1">Lựa chọn Chuyên ngành</label>
						<select id="select_to_mon" data-live-search="true" data-live-search-style="startsWith" class="selectpicker w-100">
							<?php
							$data = get_list_to_mon();
							foreach ($data as $row)
								echo '<option value="' . $row['id'] . '">' . $row['ten_to_mon'] . '</option>'
							?>
						</select>
					</div>
					<div class="form-group">
						<label for="sel1">Tiểu sử công tác</label>
						<textarea class="editor"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy bỏ">
					<input type="submit" class="btn btn-info edit_teacher" value="Lưu">
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
					<input type="submit" class="btn btn-danger delete_teacher" value="Delete">
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

<script>
	// Add the following code if you want the name of the file appear on select
	jQuery(".custom-file-input").on("change", function() {
		var fileName = jQuery(this).val().split("\\").pop();
		jQuery(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
</script>

<?php
if (isset($_POST['submit_excel'])) {
	if (isset($_FILES['excel_file'])) {
		if (!$_FILES['excel_file']['tmp_name']) {
			return;
		}
		$excel_file = $_FILES['excel_file']['tmp_name'];

		// Include the PHPExcel library
		require_once get_parent_theme_file_path() . '/phpxcel/PHPExcel.php';

		$objPHPExcel = PHPExcel_IOFactory::load($excel_file);
		$worksheet = $objPHPExcel->getActiveSheet();
		$highestRow = $worksheet->getHighestRow();

		for ($row = 2; $row <= $highestRow; $row++) {
			$teacher_id = $worksheet->getCellByColumnAndRow(0, $row)->getValue();
			$full_name = $worksheet->getCellByColumnAndRow(1, $row)->getValue();
			$email = $worksheet->getCellByColumnAndRow(2, $row)->getValue();
			$date_of_birth = $worksheet->getCellByColumnAndRow(3, $row)->getValue();
			$sex = $worksheet->getCellByColumnAndRow(4, $row)->getValue();
			$address = $worksheet->getCellByColumnAndRow(5, $row)->getValue();
			$phone = $worksheet->getCellByColumnAndRow(6, $row)->getValue();
			$position = $worksheet->getCellByColumnAndRow(7, $row)->getValue();
			$img = $worksheet->getCellByColumnAndRow(8, $row)->getValue();
			$ma_to_mon = $worksheet->getCellByColumnAndRow(9, $row)->getValue();

			// Insert data into the teacher table
			global $wpdb;
			$table_name = $wpdb->prefix . 'teacher';
			$exists = email_exists(trim($email));
			if (!$exists) {
				$user_data = array(
					'user_login' =>  $email,
					'user_email' => $email,
					'user_pass'  =>  'teacher123', // When creating an user, `user_pass` is expected.
					'display_name' => $full_name,
					'user_nicename' => $full_name,
					'role' => 'teacher',
				);
				$user_id = wp_insert_user($user_data);
				$wpdb->insert(
					$table_name,
					array(
						'teacher_id' => $teacher_id,
						'full_name' => $full_name,
						'email' => $email,
						'date_of_birth' => $date_of_birth,
						'sex' => $sex,
						'address' => $address,
						'phone' => $phone,
						'position' => $position,
						'image' => $img,
						'ma_to_mon' => $ma_to_mon,
					)
				);
			}
		}
	}
}
?>