<?php

/**
 * Template Name: Template GIỚI THIỆU
 * Template Post type: page
 */
get_header();
?>
<div class="row container m-auto pt-4">
<?php echo do_shortcode('[init_main_get_post title="okela" categories="gioi-thieu" classes="style_2" posts_per_page="4" slider="1"]') ?>
</div>
<section class="funface-number mt-30" style="background-color: #f57234">
    <div class="container">
        <div class="section-content">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-3">
                    <div class="funfact text-center">
                        <h2 data-animation-duration="2000" data-value="5100" class="animate-number text-white">10.000+</h2>
                        <h3 class="text-white">Hơn 10.000 sinh viên đang theo học</h3>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-3">
                    <div class="funfact text-center">
                        <h2 data-animation-duration="2000" data-value="200" class="animate-number text-white">98%</h2>
                        <h3 class="text-white">Giảng viên có trình độ Tiến sĩ, Thạc sĩ</h3>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-3">
                    <div class="funfact text-center">
                        <h2 data-animation-duration="2000" data-value="20" class="animate-number text-white">28</h2>
                        <h3 class="text-white">Chương trình đào tạo đại học chính quy</h3>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-3">
                    <div class="funfact text-center">
                        <h2 data-animation-duration="2000" data-value="600" class="animate-number text-white">95%</h2>
                        <h3 class="text-white">Sinh viên ra trường có việc làm</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="row container m-auto pt-4">
    <div class="col-xl-7 col-md-12 mt-30">
    <?php echo do_shortcode('[init_main_get_post title="okela" columns="2" categories="news" classes="style_1" post_per_page="2"]') ?>
    </div>
    <div class="col-xl-5 col-md-12 mt-30">
    <?php echo do_shortcode('[init_main_get_post title="okela" columns="1" categories="news" classes="style_3" post_per_page="4"]') ?>
    </div>
</div>

<div class="row container m-auto pt-4">
<h2 class="title mt-5 mb-4 w-100" style="text-transform: uppercase; font-size: 1.8rem; color: #e94b02;">Một số tiết học tiêu biểu</h2>
   <?php 
   $data_details = get_lesson_has_url_details();
   foreach ($data_details as $key => $row) {
    echo '<div class="featured-lesson d-flex align-items-center col-xl-12 col-md-12 pl-0 pr-0">';
    echo '<a class="url_video_detail" href="#" data-url="'.$row['url_detail'].'">' . get_data_table_by_id($row['id_mon'], 'mon_hoc', 'ten_mon_hoc') . '</a>';
   echo '<div class="text-lessons" style="padding-left: 10px;">' . get_html_lesson($row['lesson']) . '</div>'.' / '.'<div class="date-less1">' .'Thứ '.$row['weekdays'] . ' - '.date('d/m/Y', strtotime($row['time_start'])). '</div>';
    echo '</div>';
    }
   ?>
</div>
<?php
get_footer();