<?php

/**
 * The template for displaying the footer
 *
 * Contains the opening of the #site-footer div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package WordPress
 * @subpackage Twenty_Twenty
 * @since Twenty Twenty 1.0
 */

?>
<footer id="site-footer" class="header-footer-group">

	<div class="footer-inner">
		<div class="footer-center">
			<div class="container">
				<div class="row">
					<div class="footer-four col-lg-4 col-md-4 col-sm-12 col-xs-12 column">
						<div class="block block-block-content">
							<h2 class="block-title"><span>Trường Đại học Công nghệ GTVT</span></h2>
							<div class="content block-content">
								<div class="field">
									<div class="contact-info">
										<div>Số 54 Triều Khúc, Thanh Xuân, Hà Nội</div>
										<div>Điện thoại: 0243.854 4264</div>
										<div style="color:rgb(255, 126, 41);">Hotline tuyển sinh: <a style="color:rgb(255, 126, 41); " href="tel:02435526713">0243.552 6713</a></div>
										<div>Fax: 0243.854 7695</div>
										<div class="description">
											<a href="https://www.facebook.com/utt.vn" target="_blank">
												Fanpage
											</a> | <a href="https://goo.gl/maps/po5eREA291Hv9kvM8" target="_blank">Chỉ đường</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="footer-four col-lg-4 col-md-4 col-sm-12 col-xs-12 column">
						<div>
							<div class="block block-block-content">
								<h2 class="block-title"><span>Cơ sở Vĩnh Phúc</span></h2>
								<div class="content block-content">
									<div class="field">
										<div class="contact-info">
											<div>Số 278 Lam Sơn, Đồng Tâm, TP. Vĩnh Yên, Vĩnh Phúc</div>
											<div>Điện thoại: 0211.386.7405</div>
											<div>Fax: 0211.386.7391</div>
											<div class="description">
												<a href="https://www.facebook.com/uttvinhphuc" target="_blank">Fanpage</a> | <a href="https://www.google.com/maps/dir//%C4%91%E1%BA%A1i+h%E1%BB%8Dc+c%C3%B4ng+ngh%E1%BB%87+gtvt+v%C4%A9nh+ph%C3%BAc/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3134f00da3cb9321:0xc0f8f922d6230a80?sa=X&amp;ved=2ahUKEwiUq-2K4JnhAhWGbN4KHY89B5cQ9RcwFnoECAwQDg" target="_blank">Chỉ đường</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="footer-four col-lg-4 col-md-4 col-sm-12 col-xs-12 column">
						<div>
							<div class="block block-block-content">
								<h2 class="block-title"><span>Cơ sở Thái Nguyên</span></h2>
								<div class="content block-content">
									<div class="field">
										<div class="contact-info">
											<div>Phường Tân Thịnh, TP. Thái Nguyên, Thái Nguyên</div>
											<div>Điện thoại: 0208.385.6545</div>
											<div>Fax: 0208.374.6975</div>
											<div class="description"><a href="https://www.facebook.com/uttthainguyen" target="_blank">Fanpage</a> | <a href="https://www.google.com/maps/dir//%C4%91%E1%BA%A1i+h%E1%BB%8Dc+c%C3%B4ng+ngh%E1%BB%87+gtvt+th%C3%A1i+nguy%C3%AAn/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3135272eda758f99:0xf73f6015c74220a3?sa=X&amp;ved=2ahUKEwjQsZqC4ZnhAhWI7WEKHRLKBocQ9RcwC3oECA0QDg" target="_blank">Chỉ đường</a></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="copyright">
        <div class="container">
            <div class="block">
                <div class="content block-content">
                    <div class="field">
                        <div class="text-center">
                            Copyright © 2023 Đại học Công nghệ Giao thông vận tải
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<div class="overlay-full"></div>
	<div class="body-login d-none">
		<div class="login-form w-80 m-auto">
			<h1 class="pb-3">Đăng nhập</h1>
			<form method="post" action="<?php echo get_site_url() . '/wp-login.php' ?>">
				<input type="text" name="log" id="user_login" placeholder="Username" required="required" />
				<input type="password" name="pwd" id="user_pass" placeholder="Password" required="required" />
				<button type="submit" name="wp-submit" id="wp-submit" class="btn btn-primary btn-block btn-large">Đăng nhập</button>
			</form>
		</div>
	</div>
	<style>
		.body-login {
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			width: 400px;
			height: 250px;
			font-family: 'Open Sans', sans-serif;
			background: #092756;
			background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104, 128, 138, .4) 10%, rgba(138, 114, 76, 0) 40%), -moz-linear-gradient(top, rgba(57, 173, 219, .25) 0%, rgba(42, 60, 87, .4) 100%), -moz-linear-gradient(-45deg, #670d10 0%, #092756 100%);
			background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104, 128, 138, .4) 10%, rgba(138, 114, 76, 0) 40%), -webkit-linear-gradient(top, rgba(57, 173, 219, .25) 0%, rgba(42, 60, 87, .4) 100%), -webkit-linear-gradient(-45deg, #670d10 0%, #092756 100%);
			background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104, 128, 138, .4) 10%, rgba(138, 114, 76, 0) 40%), -o-linear-gradient(top, rgba(57, 173, 219, .25) 0%, rgba(42, 60, 87, .4) 100%), -o-linear-gradient(-45deg, #670d10 0%, #092756 100%);
			background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104, 128, 138, .4) 10%, rgba(138, 114, 76, 0) 40%), -ms-linear-gradient(top, rgba(57, 173, 219, .25) 0%, rgba(42, 60, 87, .4) 100%), -ms-linear-gradient(-45deg, #670d10 0%, #092756 100%);
			background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104, 128, 138, .4) 10%, rgba(138, 114, 76, 0) 40%), linear-gradient(to bottom, rgba(57, 173, 219, .25) 0%, rgba(42, 60, 87, .4) 100%), linear-gradient(135deg, #670d10 0%, #092756 100%);
			border-radius: 10px;
			z-index: 9999999;
			transition: 0.5 ease;
			animation: scale_skew 0.5s;
		}

		.login-form {
			width: 80%;
			padding-top: 30px;
		}

		.login-form h1 {
			color: #fff;
			text-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
			letter-spacing: 1px;
			text-align: center;
		}

		.login-form input {
			width: 100%;
			margin-bottom: 10px;
			background: rgba(0, 0, 0, 0.3);
			border: none;
			outline: none;
			padding: 10px;
			font-size: 13px;
			color: #fff;
			text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
			border: 1px solid rgba(0, 0, 0, 0.3);
			border-radius: 4px;
			box-shadow: inset 0 -5px 45px rgba(100, 100, 100, 0.2), 0 1px 1px rgba(255, 255, 255, 0.2);
			-webkit-transition: box-shadow .5s ease;
			-moz-transition: box-shadow .5s ease;
			-o-transition: box-shadow .5s ease;
			-ms-transition: box-shadow .5s ease;
			transition: box-shadow .5s ease;
		}

		.login-form input:focus {
			box-shadow: inset 0 -5px 45px rgba(100, 100, 100, 0.4), 0 1px 1px rgba(255, 255, 255, 0.2);
		}

		.overlay-full {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgb(51 51 51 / 52%);
			z-index: 99999;
			display: none;
		}

		@keyframes scale_skew {
			0% {
				width: 0;
				height: 0;
				opacity: 0;
				visibility: hidden;
			}

			100% {
				width: 400px;
				visibility: visible;
			}
		}
		</style>
<div class="modal-video d-none"></div>
<div class="modal-overlay-video d-none"></div>
</footer><!-- #site-footer -->

<?php wp_footer(); ?>

</body>

</html>