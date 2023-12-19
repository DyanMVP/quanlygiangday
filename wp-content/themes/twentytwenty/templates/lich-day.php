<?php

/**
 * Template Name: Template LỊCH DẠY
 * Template Post type: page
 */
get_header();
if(!is_user_logged_in()){
	echo '<div class="container">';
	echo '<img src="'.get_template_directory_uri().'/assets/images/note.png">';
	echo '</div>';
	get_footer();
	return;
}
if (isset($_GET['search'])) {
	require THEME_DIR . '/templates/search-by-classes.php';
} else {
?>
	<div class="row container-fluid m-auto pt-4">

		<div class="d-flex col-12 align-items-center justify-content-between">
			<div class="filter d-flex align-items-center">Filter:
				<div class="dropdown ml-3 d-none">
					<button class="btn border dropdown-toggle pl-4 pr-4" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Lọc theo trạng thái
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a data="all" class="dropdown-item" href="#">Tất cả</a>
						<a data="upcoming" class="dropdown-item" href="#">Sắp diễn ra</a>
						<a data="happenning" class="dropdown-item" href="#">Đang diễn ra</a>
						<a data="done" class="dropdown-item" href="#">Đã hoàn thành</a>
					</div>
				</div>
				<div class="dropdown ml-3 d-none">
					<!-- <div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
                    <i class="fa fa-calendar"></i>&nbsp;
                    <span></span> <i class="fa fa-caret-down"></i>
                </div> -->
					<input type="text" name="datefilter" value="" placeholder="Tìm kiếm theo khoảng thời gian" />
				</div>
				<div class="dropdown ml-3">
                <button class="btn border dropdown-toggle pl-4 pr-4" type="button" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Lọc theo thứ trong tuần
                </button>
                <div class="dropdown-menu dropdown-menu-weekdays" aria-labelledby="dropdownMenuButton2">
                    <?php
                    for($i=2; $i<8; $i++){
                        echo ' <a data="'.$i.'" class="dropdown-item" href="#">Thứ '.$i.'</a>';
                    }
                    ?>
                </div>
            </div>
						<div class="dropdown ml-3">
							<select class="form-control dropdown-menu-hoc_ky" aria-labelledby="dropdownMenuButton">
									<option value="" class="dropdown-item" >Lọc theo kì</option>
									<option value="1" class="dropdown-item">Học kì I</option>
									<option value="2" class="dropdown-item">Học kì II</option>
									<option value="3" class="dropdown-item">Học kì phụ</option>
                </select>
						</div>
						<!-- <div class="dropdown ml-3">
                <select class="form-control dropdown-menu-year" aria-labelledby="dropdownMenuButton">
								<option value="" class="dropdown-item" >Lọc theo năm</option>
									<option value="<?php echo date('Y') ?>" class="dropdown-item"><?php echo date('Y') ?></option>
									<option value="<?php echo date('Y') + 1 ?>" class="dropdown-item"><?php echo date('Y') + 1 ?></option>
                </select>
            </div> -->
			</div>
			<div class="search-by-classes">
				<label>Tìm kiếm theo</label>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="classes" checked>
					<label class="form-check-label" for="inlineRadio1">Lớp</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="subject">
					<label class="form-check-label" for="inlineRadio3">Môn học</label>
				</div>
				<input type="text" class="search-by-classes pt-2 pb-2" placeholder="Nhập từ khóa tìm kiếm...">
			</div>
		</div>
		<?php
		$results = get_list_dang_ky(0, false);
		echo '<div class="list-dang-ky-home col-xl-12 col-lg-12 position-relative">';
		echo '<h2 class="title mt-5 mb-4" style="text-transform: uppercase; font-size: 1.8rem; color: #e94b02;">Lịch giảng dạy</h2>';
		foreach ($results as $key => $row) {
			echo '<div class="col-lg-6 col-md-12 list list-dang-ky pl-0 d-inline-block">
    <div class="card d-flex flex-row mb-3">
        <div class="d-flex flex-grow-1 min-width-zero">
            <div class="card-body align-self-center d-flex flex-column flex-md-row justify-content-between min-width-zero align-items-md-center">
						<p class="mb-0 text-muted text-small w-15 w-xs-100">' . get_data_table_by_id($row['id_lop'], 'classes',  'ten_lop') . '</p>
            <a href="' . $row['link'] . '" target="__blank" class="list-item-heading mb-0 truncate w-40 w-xs-100">' . get_data_table_by_id($row['id_mon'], 'mon_hoc', 'ten_mon_hoc') . '</a>
						<p class="mb-0 text-muted text-small w-15 w-xs-100">' . get_html_hoc_ky($row['hoc_ky']).' ('.$row['year'].')'. '</p>
            <p class="mb-0 text-muted text-small w-15 w-xs-100">' . 'GV. ' . get_data_table_by_id($row['teacher_id'], 'teacher', 'full_name') . '</p>
            <div class="mb-0 text-muted text-small w-15 w-xs-100"><div class="text-lesson">' . get_html_lesson($row['lesson']) . '</div><div class="date-less">' .'Thứ '.$row['weekdays'] . '</div></div>';
			if ($row['url_detail']) {
				echo '<p class="mb-0 text-muted text-small d-none w-15 w-xs-100"><a href="' . $row['url_detail'] . '" target="__blank">Chi tiết</a></p>';
			}
		?>
			<div class="w-15 w-xs-100 d-none"><span class="badge badge-pill"><?php get_status_lich_day(get_data_table_by_id($row['id'], 'dang_ky', 'lesson'), get_data_table_by_id($row['id'], 'dang_ky', 'time_start')) ?></span></div>
		<?php
			echo '</div>
    </div>
    </div>
</div>';
		}
		echo '</div>';
		?>
		<div class="col-xl-3 col-lg-6 col-xs-12 mt-3 d-none">
			<h2 class="title mt-4 mb-4" style="text-transform: uppercase; font-size: 1.8rem; color: #e94b02;">Tin tức gần đây</h2>
			<?php echo do_shortcode('[init_main_get_post title="okela" categories="gioi-thieu" classes="style_1" posts_per_page="4"]') ?>
		</div>
	</div>
	<script>
		//     $(function() {

		// var start = moment().subtract(29, 'days');
		// var end = moment();

		// function cb(start, end) {
		//     $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
		// }

		// $('#reportrange').daterangepicker({
		//     startDate: start,
		//     endDate: end,
		//     ranges: {
		//        'Hôm nay': [moment(), moment()],
		//        'Hôm qua': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
		//        '7 ngày trước': [moment().subtract(6, 'days'), moment()],
		//        '30 ngày trước': [moment().subtract(29, 'days'), moment()],
		//        'Tháng này': [moment().startOf('month'), moment().endOf('month')],
		//        'Tháng trước': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		//     }
		// }, cb);

		// cb(start, end);

		// $('#reportrange').on('apply.daterangepicker', function(ev, picker) {
		//   console.log('ev===', ev, picker);
		// console.log( Date.parse(picker.startDate) /1000);
		// console.log(Date.parse(picker.endDate) / 1000);
		// });

		// });

		$(function() {

			$('input[name="datefilter"]').daterangepicker({
				autoUpdateInput: false,
				locale: {
					"format": 'YYYY-MM-DD',
					"separator": " - ",
					"cancelLabel": 'Clear',
				}
			});

			$('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
				$(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
			});

			$('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
				const status = $(".filter .dropdown-menu a.active").attr('data');
				$('.list-dang-ky-home').addClass('ajax-loading');
				$.ajax({
					url: custom_ajax.ajax_url, // WordPress AJAX handler URL
					type: "post",
					data: {
						action: "ajax_filter_dang_ky",
						status: 'all',
					},
					success: function(response) {
						console.log('response=', response);
						$('.list-dang-ky-home .list-dang-ky').remove();
						$('.list-dang-ky-home .result').remove();
						if (!response) {
							$('.list-dang-ky-home').append(`<div class="result text-center f-14 bg-dark pt-3 pb-3 mt-3 text-white">Không có kết quả</div>`)
							return;
						}
						$('.list-dang-ky-home').append(response);
						$('.list-dang-ky-home').removeClass('ajax-loading');
					}
				});
			});

			$('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
				const time_start = Date.parse(picker.startDate) / 1000;
				const time_end = Date.parse(picker.endDate) / 1000;
				const status = $(".filter .dropdown-menu a.active").attr('data');
				$('.list-dang-ky-home').addClass('ajax-loading');
				$.ajax({
					url: custom_ajax.ajax_url, // WordPress AJAX handler URL
					type: "post",
					data: {
						action: "ajax_filter_dang_ky",
						status: status || 'all',
						time_start: time_start,
						time_end: time_end
					},
					success: function(response) {
						console.log('response=', response);
						$('.list-dang-ky-home .list-dang-ky').remove();
						$('.list-dang-ky-home .result').remove();
						if (!response) {
							$('.list-dang-ky-home').append(`<div class="result text-center f-14 bg-dark pt-3 pb-3 mt-3 text-white">Không có kết quả</div>`)
							return;
						}
						$('.list-dang-ky-home').append(response);
						$('.list-dang-ky-home').removeClass('ajax-loading');
					}
				});
			});

		});
	</script>
<?php } ?>
<?php
get_footer();
