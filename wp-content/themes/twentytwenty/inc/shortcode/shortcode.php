<?php
add_shortcode('get_teacher_list', 'get_teacher_shortcode');

function get_teacher_shortcode($atts){
    global $wpdb;
    
    // Define the default attributes and their values
    $atts = shortcode_atts(array(
        'per_page' => 6,
    ), $atts);

    $per_page = intval($atts['per_page']);
    $table = $wpdb->prefix . 'teacher';

    // Query to retrieve teacher records
    $query = "SELECT * FROM $table LIMIT $per_page";

    $teachers = $wpdb->get_results($query, ARRAY_A);

    if ($teachers) {
        ob_start();
        echo '<div class="shortcode-teacher-list mt-5">';
        echo '<div id="teacher-list" class="container row">';
        foreach ($teachers as $teacher) {
            echo '<div class="card col-md-4">';
            if($teacher['image']){
                echo '<img class="image-teacher" src="'.$teacher['image'].'">';
            } else{
                echo '<img class="image-teacher card-img-top" data-src="holder.js/100px180/" alt="100%x180" style="border-radius: 5px; height: 180px; width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22286%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20286%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18b60b62a89%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18b60b62a89%22%3E%3Crect%20width%3D%22286%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22107.1953125%22%20y%3D%2296.3%22%3E286x180%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">';
            }
            echo '<div class="card-body border-top mt-2">
              <h3 class="card-title">'.$teacher['full_name'].'</h3>
              <p class="card-text">'.explode(' ',date("H:i d/m/Y", strtotime($teacher['date_of_birth'])))[1].'</p>
              <h4 class="position">'.$teacher['position'].'</h4>
              <p class="tieu_su">'.substr(wp_strip_all_tags($teacher['tieu_su']), 0, 70).' ...'.'</p>
              <a href="'.get_site_url(). '/giang-vien?id='.$teacher['id'].'" class="btn btn-primary" style="height: auto">Xem chi tiết</a>
            </div>
          </div>';
        }
        echo '</div>';
        echo '<div class="m-auto text-center"><button id="load-more-button" class="btn btn-primary pl-5 pr-5" data-offset="'.$per_page.'">Load More</button></div>';
        echo '</div>';
        return ob_get_clean();
    } else {
        return 'No teachers found.';
    }
}

add_shortcode('init_main_get_post', 'init_main_get_post_func');

function init_main_get_post_func($atts)
{
    $html = '';
    extract(shortcode_atts(array(
        'title'                 => '',
        'categories'            => '',
        'tag'                   => '',
        'post_per_page'         => '3',
        'columns'               => '1',
        'classes'               => 'style_2',
        'read_in_top'           => false,
        'read_more'             => false,
        'load_more'             => false,
        'slider'                => false,
        'view_all'              => false
    ), $atts));
    $category = get_term_by('name', $categories, 'category');

    ob_start();

    $html .=  '<div class="col-12 pl-0 pr-0 '.$atts['classes'].'">' . init_get_post($title, $categories, $tag, $post_per_page, $columns, $classes, $read_in_top, $read_more, $load_more, $slider, $view_all) . '</div>';
    return $html;
}

global $post;

function init_get_post($title, $categories, $tag, $post_per_page = 4, $columns = 4, $classes = '', $read_in_top = false, $read_more = true, $load_more = false, $slider = false, $view_all = false)
{
    global $post;
    $html = '';
    $sliders = '';
    if ($slider == true) {
        $sliders = 'owl-carousel mr-auto';
    }
    if($classes == 'style_2' && wp_is_mobile() && (is_singular('post') || is_category() || is_tag() || is_search()) ){
        $post_per_page = 3;
    }
    $args_query = array(
        'post_type'                => 'post',
        'post_status'            => 'publish',
        'ignore_sticky_posts'    => true,
        'posts_per_page'         => $post_per_page,
        'orderby'                 => 'date',
        'order'                 => 'desc',
        'tag' => $tag
    );
    $cate = str_replace(' ', '', $categories);
    if (strlen($cate) > 0) {
        $cate = explode(',', $cate);
    }
    if (is_array($cate) && count($cate) > 0) {
        $field_name = is_numeric($categories[0]) ? 'term_id' : 'slug';
        $args_query['tax_query'] = array(
            array(
                'taxonomy' => 'category',
                'terms' => $cate,
                'field' => $field_name,
                'include_children' => false
            )
        );
    }

    $atts = compact('title', 'categories', 'tag', 'post_per_page', 'columns', 'classes', 'read_in_top', 'read_more', 'load_more', 'slider', 'view_all');
    $posts = new WP_Query($args_query);
    if ($posts->have_posts()) {
        $html .= '<div class="d-flex post-list col-12 pl-0 pr-0 ' . esc_attr($sliders) . '">';
        while ($posts->have_posts()) {
            $posts->the_post();
                $html .= '<article class="post-item w-m-100 col-lg-' . esc_attr(12 / $columns) . ' col-xs-12 col-md-12">';

                $html .= '<header class="post-img position-relative">';
                $html .= '<a class="blog-image" href="' . get_the_permalink() . '">';


                if (has_post_thumbnail()) {
                    $html .= get_the_post_thumbnail(get_the_id(), 'full');
                } else {
                    // $html .= '<img src="' . get_template_directory_uri() . '/images/library/noimage-blog.jpg" />';
                    $html .= '<img src="https://via.placeholder.com/640x460/ebdede/" />';
                }

                $html .= '</a>';
                // $html .= '<span class="f-14 position-absolute c-fff">' . get_the_time(get_option('date_format')) . '</span>';
                $html .= '</header>';

                $html .= '<div class="post-info pa-30 pa-20-s0">';
                $html .=  get_the_tag_list(  '<p class="tags categories c-pri f-w-5 f-12-s1">' , ', ', '</p>' ) ;
                $html .= '<p class="categories c-fff d-none">' . get_the_category_list(', ') . '</p>';
                if (!empty($logo_link)) {
                    $html .= '<img src="' . esc_url($logo_link) . '" class="logo-customer-case" alt="logo-case" width="150" />';
                }

                $html .= '<div class="date-time mt-2">';
                $html .= '<i class="fa-solid fa-calendar-days pr-3"></i><span class="f-14" style="font-size: 12px !important">' . get_the_time(get_option('date_format')) . '</span>';
                $html .= '</div>';

                $html .= '<h4 class="entry-title f-25 pa-t-10 mr-b-5 lh-s1 pa-t-0-s1 w-400 w-m-100-s0 line-clamp mt-3">';
                $html .=   '<a class="post-title t-d-n c-fff f-16-s0" href="' . get_the_permalink() . '" title="'.get_the_title().'">' . get_the_title() . '</a>';
                $html .= '</h4>';
                if(has_excerpt() ){
                $html .= '<div class="entry-summary pa-t-10 mr-b-10 c-fff lh2 w-m-90 line-clamp d-none-s1">';
                $html .= get_the_excerpt();
                $html .= '</div>';
                }
                if ($read_more) {
                    $html .= '<a href="' . get_the_permalink() . '" class="button-readmore t-d-n b-r-5 pa-l-15 pa-r-15 inline-block mr-b-20 pa-t-5 pa-b-5 mr-t-20 hover_1">' . esc_html__('Read More', 'mobio') . '</a>';
                }
                
                $html .= '</div>';
                $html .= '</article>';
        }
        $html .= '</div>';
    }
    return $html;
}