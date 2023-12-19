<?php

/**
 * Template Name: LOGIN Template
 * Template Post Type: page
 *
 */

wp_head();
?>

<main id="site-content">

    <?php

    if (is_user_logged_in()) {
        echo get_template_part('template-parts/sinhvien', null);
    }
     else {
    ?>

    <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form id="user-registration-form" class="form-signin">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text"  id="inputName" name="username" class="form-control" placeholder="Tên đăng nhập" required autofocus>
                <input type="email"  id="inputEmail" name="email"  class="form-control" placeholder="Địa chỉ Email" required autofocus>
                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Mật khẩu" required>
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button id="registration-result" class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
                <label class="notify-login"></label>
            </form><!-- /form -->
            <div class="row m-auto ">
            <a href="#" class="forgot-password">
                Forgot the password?
            </a>
            <a href="<?php echo get_site_url().'/sign-up' ?>" class="forgot-password ml-5">
                Đăng kí tài khoản
            </a>
            </div>
        </div><!-- /card-container -->
    </div><!-- /container -->
    <?php
     }
    ?>

</main><!-- #site-content -->

<?php wp_footer(); ?>