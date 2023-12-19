<?php

/**
 * Template Name: Template TEACHER
 * Template Post type: page
 */
get_header();
?>
<div class="row container m-auto">
<?php
$data = get_list_teacher(0, false);
if(isset($_GET['id'])){
    $id = $_GET['id'];
    require THEME_DIR . '/templates/details_teacher.php';
}
else{
echo do_shortcode('[get_teacher_list per_page="6"]');
}
?>
</div>
<?php
get_footer();
