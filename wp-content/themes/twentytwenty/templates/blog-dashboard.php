<?php
$args = array(
    'post_type' => 'post',          // Post type (change to your custom post type if necessary)
    'posts_per_page' => 6,         // Number of posts to retrieve
    'orderby' => 'date',           // Order by date
    'order' => 'DESC'              // Descending order (latest first)
);

$latest_posts = new WP_Query($args);

if ($latest_posts->have_posts()) {
    while ($latest_posts->have_posts()) {
        $latest_posts->the_post();
        // Your post content and HTML structure here
        // the_title();
        // the_content();
        echo '<div class="row gy-4 m-auto">
        <a href="'.get_admin_url().'edit.php?page=single&post_id='.get_the_ID().'">
        <div class="post-item d-flex align-items-stretch aos-init aos-animate" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box iconbox-blue">
                <div class="img">';
                if(has_post_thumbnail()){
                    the_post_thumbnail('medium');
                  } else{
                    echo '<img src="'.get_template_directory_uri().'/assets/images/placeholder.png">';
                  }
                    
                echo '</div>
                    <div class="content-blog">
                    <h2><a class="text-dark title-blog" href="'.get_admin_url().'/options-general.php?page=single&post_id='.get_the_ID().'">'.get_the_title().'</a></h2>
                    <span>'.get_the_author().'</span>
                    <p class="post-excerpt">'.get_the_excerpt().'</p>
                </div>
            </div>
            </div>
            </a>
    </div>';
    }
} else {
    // No posts found
}

wp_reset_postdata();