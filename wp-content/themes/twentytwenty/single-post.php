<?php
// echo var_dump($post);
$date = $post->post_date;
$date = explode(' ', $date)[0];
$date = explode('-', $date)[2];
?>
<?php 
if(!is_admin()){
  get_header();
  echo '<div class="container m-auto">';
} 
?>
<div class="single-post py-4">
  <article class="post-full post-title-simple post-2634 post type-post status-publish format-standard has-post-thumbnail hentry category-cosmetic">

    <div class="post-image single" style="max-width: 90%; width: max-content;">
      <?php 
      if(has_post_thumbnail()){
        echo get_the_post_thumbnail('large');
      } else{
        echo '<img src="'.get_template_directory_uri().'/assets/images/placeholder.png">';
      }
       ?>
      <!-- <img src="https://media.architecturaldigest.com/photos/57c7003fdc03716f7c8289dd/16:9/w_1280,c_limit/IMG%20Worlds%20of%20Adventure%20-%201.jpg"> -->
    </div>

    <div class="post-date">
      <span class="day"><?php echo $date ?></span><span class="month"><?php echo get_the_date('m', $post->ID); ?></span>
    </div>

    <div class="post-content">
      <h2 class="entry-title"><?php echo $post->post_title ?></h2>
      <span class="vcard" style="display: none;"><span class="fn"><?php echo get_author_name($post->post_author) ?></span></span>
      <div class="post-meta">
        <span class="meta-author"><i class="far fa-user"></i> By <a href="#" title="Posts by admin" rel="author"><?php echo get_the_author_meta('nicename', $post->post_author); ?></a></span> <span class="meta-cats"><i class="far fa-folder"></i> <a href="#" rel="category"></a></span>
        <span class="meta-comments"><i class="far fa-comments"></i> <a href="#" class="hash-scroll"><?php echo $post->comment_count ?> Comments</a></span>

      </div>

      <div class="entry-content">
        <?php echo $post->post_content ?>
      </div>

    </div>

    <div class="post-gap"></div>

    <div class="post-share post-block">
      <h3>Share this post</h3>
      <div class="share-links"><a href="https://www.facebook.com/sharer.php?u=<?php echo get_the_permalink()  ?>" target="_blank" rel="nofollow" data-tooltip="" data-placement="bottom" title="" class="share-facebook" data-original-title="Facebook">Facebook</a>
        <a href="https://twitter.com/intent/tweet?text=Lorem+Ipsum+is+simply&amp;url=<?php echo get_the_permalink() ?>" target="_blank" rel="nofollow" data-tooltip="" data-placement="bottom" title="" class="share-twitter fas fa-twitter" data-original-title="Twitter">Twitter</a>
        <a href="https://www.linkedin.com/shareArticle?mini=true&amp;url=<?php echo get_the_permalink() ?>&amp;title=Lorem+Ipsum+is+simply" target="_blank" rel="nofollow" data-tooltip="" data-placement="bottom" title="" class="share-linkedin fas fa-linkedin" data-original-title="LinkedIn">LinkedIn</a>
        <a href="https://plus.google.com/share?url=<?php echo get_the_permalink() ?>" target="_blank" rel="nofollow" data-tooltip="" data-placement="bottom" title="" class="share-googleplus fas fa-google" data-original-title="Google +">Google +</a>
        <a href="mailto:?subject=Lorem+Ipsum+is+simply&amp;body=<?php echo get_the_permalink() ?>" target="_blank" rel="nofollow" data-tooltip="" data-placement="bottom" title="" class="share-email fas fa-envelope" data-original-title="Email">Email</a>
      </div>
    </div>


    <div class="post-block post-author clearfix" style="display: none">
      <h3>Author</h3>
      <div class="img-thumbnail">
        <img alt="" src="http://0.gravatar.com/avatar/f0a5d5ed1fb8d1692efd09399bdf00ae?s=80&amp;d=mm&amp;r=g" srcset="http://0.gravatar.com/avatar/f0a5d5ed1fb8d1692efd09399bdf00ae?s=160&amp;d=mm&amp;r=g 2x" class="avatar avatar-80 photo" height="80" width="80" loading="lazy" decoding="async">
      </div>
      <p><strong class="name"><a href="#" title="Posts by admin" rel="author"><?php echo get_the_author_meta('nicename', $post->post_author); ?></a></strong></p>
      <p></p>
    </div>

    <div class="post-gap-small"></div>

    <?php
    // echo comment_form();
    ?>

  </article>
</div>
<?php
if(!is_admin()){
  echo '</div>';
  get_footer();
} 
?>
<style>
  .single-post .entry-title {
    color: #0088cc;
  }

  .single-post .post-meta {
    margin: 0;
  }

  article.post .post-date .month {
    background-color: #0088cc;
  }

  .single-post .post-content {
    margin-top: 20px;
  }

  article.post-full .entry-title {
    margin-top: 0;
  }

  article.post .post-date,
  .post-item .post-date {
    float: left;
    margin-right: 20px;
    text-align: center;
    width: 40px;
    margin-top: 20px;
  }

  .post-gap {
    height: 20px;
  }

  .post-block {
    margin-bottom: 3rem;
  }

  article .comment-respond {
    margin-top: 3rem;
    padding-bottom: 0;
  }

  article.post .post-date .day,
  .post-item .post-date .day,
  ul.comments .comment-block {
    background: #f4f4f4;
  }

  article.post .post-date .day,
  .post-item .post-date .day {
    display: block;
    font-size: 16px;
    font-weight: 500;
    font-weight: bold;
    padding: 10px 0;
  }

  article.post .post-date .month,
  .post-item .post-date .month {
    box-shadow: 0 -1px 0 0 rgba(0, 0, 0, 0.07) inset;
    color: #FFF;
    font-size: 0.9em;
    padding: 0 0 2px;
    display: block;
  }

  article.post-full .entry-title,
  article.post-large .entry-title {
    margin-bottom: 5px;
  }

  body.single-post article.post .post-meta {
    margin-bottom: 20px;
  }

  article.post .post-meta>span,
  article.post .post-meta>.post-views {
    display: inline-block;
    padding-right: 8px;
  }

  .entry-content {
    margin: 20px 0 30px;
  }

  .share-links a {
    font-size: .8rem;
    color: #fff;
    text-indent: -9999em;
    text-align: center;
    width: 2.2857em;
    height: 2.2857em;
    display: inline-block;
    margin: 0.2857em 0.5714em 0.2857em 0;
    position: relative;
    text-decoration: none;
    vertical-align: middle;
    transition: .25s;
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
  }

  .share-links .share-facebook:before {
    content: "";
  }

  .share-links a:before {
    font-family: 'Font Awesome 5 Brands';
    text-indent: 0;
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    line-height: 23px;
    height: 22px;
    margin: auto;
    z-index: 2;
  }

  .share-links .share-facebook {
    background: #3b5a9a;
  }

  .share-links .share-twitter {
    background: #1aa9e1;
  }

  .share-links .share-linkedin {
    background: #0073b2;
  }

  .share-links .share-googleplus {
    background: #dd4b39;
  }

  .share-links .share-email {
    background: #dd4b39;
  }

  .post-author .img-thumbnail {
    float: left;
    margin-right: 20px;
  }

  .img-thumbnail {
    position: relative;
  }

  .img-thumbnail {
    padding: 0;
    background-color: #fff;
    border: 0 solid transparent;
    border-radius: 0;
    max-width: 100%;
    height: auto;
  }
</style>