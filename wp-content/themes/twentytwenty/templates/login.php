<?php

/**
 * Template Name: Template Login MAIN
 * Template Post type: page
 */
?>
<?php
$site_url = get_site_url();
?>
<html lang="vi"><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Đăng nhập</title>
	<meta name="robots" content="max-image-preview:large, noindex, noarchive">
<link rel="stylesheet" id="dashicons-css" href="<?php echo $site_url .'/wp-includes/css/dashicons.min.css?ver=6.3.2' ?>" media="all">
<link rel="stylesheet" id="buttons-css" href="<?php echo $site_url .'/wp-includes/css/buttons.min.css?ver=6.3.2 '?>" media="all">
<link rel="stylesheet" id="forms-css" href="<?php echo $site_url .'/wp-admin/css/forms.min.css?ver=6.3.2' ?>" media="all">
<link rel="stylesheet" id="l10n-css" href="<?php echo $site_url .'/wp-admin/css/l10n.min.css?ver=6.3.2' ?>" media="all">
<link rel="stylesheet" id="login-css" href="<?php echo $site_url .'/wp-admin/css/login.min.css?ver=6.3.2' ?>" media="all">
<style type="text/css">
	h1 a {
		background: none !important; margin:0 auto;
		pointer-events: none;
	}
	body {
		background-image: url(<?php echo $site_url .'/wp-content/uploads/2023/10/leadspace.png' ?>) !important;
		background-size: cover;
	}
	.login form {
    margin-top: 20px;
    margin-left: 0;
    padding: 40px 30px 40px;
    font-weight: 400;
    overflow: hidden;
    background: #0b253461;
    border: 1px solid #c3c4c7;
    box-shadow: 0 1px 3px rgba(0,0,0,.04);
    color: #fff !important;
    border-radius: 5px;
	}
	div#login a {
    color: #fff !important;
	}
	#login {
    width: 400px;
		max-width: 90%;
	}
	.login form .input {
    padding: 10px 15px;
    height: 32px;
    line-height: 32px;
    font-size: 16px;
	}
	</style>	<meta name="referrer" content="strict-origin-when-cross-origin">
		<meta name="viewport" content="width=device-width">
		</head>
	<body class="login js login-action-login wp-core-ui  locale-vi">
	<script src="<?php echo $site_url .'/wp-includes/js/zxcvbn.min.js' ?>" type="text/javascript" async=""></script><script type="text/javascript">
		document.body.className = document.body.className.replace("no-js","js") ;
	</script>
		<div id="login">
	
		<form name="loginform" id="loginform" action="<?php echo $site_url .'/wp-login.php' ?>" method="post">
			<p>
				<label for="user_login">Tên người dùng hoặc Địa chỉ Email</label>
				<input type="text" name="log" id="user_login" class="input" value="admin" size="20" autocapitalize="off" autocomplete="username" required="required">
			</p>

			<div class="user-pass-wrap">
				<label for="user_pass">Mật khẩu</label>
				<div class="wp-pwd">
					<input type="password" name="pwd" id="user_pass" class="input password-input" value="" size="20" autocomplete="current-password" spellcheck="false" required="required">
					<button type="button" class="button button-secondary wp-hide-pw hide-if-no-js" data-toggle="0" aria-label="Hiện mật khẩu">
						<span class="dashicons dashicons-visibility" aria-hidden="true"></span>
					</button>
				</div>
			</div>
						<p class="forgetmenot"><input name="rememberme" type="checkbox" id="rememberme" value="forever"> <label for="rememberme">Tự động đăng nhập</label></p>
			<p class="submit">
				<input type="submit" name="wp-submit" id="wp-submit" class="button button-primary button-large" value="Đăng nhập">
									<input type="hidden" name="redirect_to" value="<?php echo $site_url.'/wp-admin/themes.php' ?>">
									<input type="hidden" name="testcookie" value="1">
			</p>
		</form>

					<p id="nav">
				<a href="'. $site_url .'/wp-login.php?action=lostpassword">Bạn quên mật khẩu?</a>			</p>
					<script type="text/javascript">
			function wp_attempt_focus() {setTimeout( function() {try {d = document.getElementById( "user_pass" ); d.value = "";d.focus(); d.select();} catch( er ) {}}, 200);}
wp_attempt_focus();
if ( typeof wpOnload === "function" ) { wpOnload() }		</script>
				<p id="backtoblog">
			<a href="<?php echo $site_url ?>">← Quay lại Base Theme</a>		</p>
			</div>
				<div class="language-switcher">
				<form id="language-switcher" action="" method="get">

					<label for="language-switcher-locales">
						<span class="dashicons dashicons-translation" aria-hidden="true"></span>
						<span class="screen-reader-text">
							Ngôn ngữ						</span>
					</label>

					<select name="wp_lang" id="language-switcher-locales"><option value="en_US" lang="en" data-installed="1">English (United States)</option>
<option value="vi" lang="vi" selected="selected" data-installed="1">Tiếng Việt</option></select>
					
											<input type="hidden" name="redirect_to" value="'.site_url .'/wp-admin/themes.php">
					
					
						<input type="submit" class="button" value="Thay đổi">

					</form>
				</div>
				<script src="<?php echo $site_url .'/wp-includes/js/jquery/jquery.min.js?ver=3.7.0' ?>" id="jquery-core-js"></script>
<script src="<?php echo $site_url .'/wp-includes/js/jquery/jquery-migrate.min.js?ver=3.4.1' ?>" id="jquery-migrate-js"></script>
<script id="zxcvbn-async-js-extra">
var _zxcvbnSettings = {"src":"http:\/\/localhost\/wordpress\/wp-includes\/js\/zxcvbn.min.js"};
</script>
<script src="<?php echo $site_url .'/wp-includes/js/zxcvbn-async.min.js?ver=1.0 '?>" id="zxcvbn-async-js"></script>
<script src="<?php echo $site_url .'/wp-includes/js/dist/vendor/wp-polyfill-inert.min.js?ver=3.1.2 '?>" id="wp-polyfill-inert-js"></script>
<script src="<?php echo $site_url .'/wp-includes/js/dist/vendor/regenerator-runtime.min.js?ver=0.13.11' ?>" id="regenerator-runtime-js"></script>
<script src="<?php echo $site_url .'/wp-includes/js/dist/vendor/wp-polyfill.min.js?ver=3.15.0' ?>" id="wp-polyfill-js"></script>
<script src="<?php echo $site_url .'/wp-includes/js/dist/hooks.min.js?ver=c6aec9a8d4e5a5d543a1' ?>" id="wp-hooks-js"></script>
<script src="<?php echo $site_url .'/wp-includes/js/dist/i18n.min.js?ver=7701b0c3857f914212ef' ?>" id="wp-i18n-js"></script>
<script id="wp-i18n-js-after">
wp.i18n.setLocaleData( { "text direction\u0004ltr": [ "ltr" ] } );
</script>
<script id="password-strength-meter-js-extra">
var pwsL10n = {"unknown":"M\u1eadt kh\u1ea9u m\u1ea1nh kh\u00f4ng x\u00e1c \u0111\u1ecbnh","short":"R\u1ea5t y\u1ebfu","bad":"Y\u1ebfu","good":"Trung b\u00ecnh","strong":"M\u1ea1nh","mismatch":"M\u1eadt kh\u1ea9u kh\u00f4ng kh\u1edbp"};
</script>
<script id="password-strength-meter-js-translations">
( function( domain, translations ) {
	var localeData = translations.locale_data[ domain ] || translations.locale_data.messages;
	localeData[""].domain = domain;
	wp.i18n.setLocaleData( localeData, domain );
} )( "default", {"translation-revision-date":"2023-07-15 15:29:09+0000","generator":"GlotPress\/4.0.0-alpha.9","domain":"messages","locale_data":{"messages":{"":{"domain":"messages","plural-forms":"nplurals=1; plural=0;","lang":"vi_VN"},"%1$s is deprecated since version %2$s! Use %3$s instead. Please consider writing more inclusive code.":["%1$s \u0111\u00e3 ng\u1eebng ho\u1ea1t \u0111\u1ed9ng t\u1eeb phi\u00ean b\u1ea3n %2$s! S\u1eed d\u1ee5ng thay th\u1ebf b\u1eb1ng %3$s."]}},"comment":{"reference":"wp-admin\/js\/password-strength-meter.js"}} );
</script>
<script src="<?php echo $site_url .'/wp-admin/js/password-strength-meter.min.js?ver=6.3.2' ?>" id="password-strength-meter-js"></script>
<script src="<?php echo $site_url .'/wp-includes/js/underscore.min.js?ver=1.13.4' ?>" id="underscore-js"></script>
<script id="wp-util-js-extra">
var _wpUtilSettings = {"ajax":{"url":"\/wordpress\/wp-admin\/admin-ajax.php"}};
</script>
<script src="<?php echo $site_url .'/wp-includes/js/wp-util.min.js?ver=6.3.2' ?>" id="wp-util-js"></script>
<script id="user-profile-js-extra">
var userProfileL10n = {"user_id":"0","nonce":"c76539d3c4"};
</script>
<script id="user-profile-js-translations">
( function( domain, translations ) {
	var localeData = translations.locale_data[ domain ] || translations.locale_data.messages;
	localeData[""].domain = domain;
	wp.i18n.setLocaleData( localeData, domain );
} )( "default", {"translation-revision-date":"2023-07-15 15:29:09+0000","generator":"GlotPress\/4.0.0-alpha.9","domain":"messages","locale_data":{"messages":{"":{"domain":"messages","plural-forms":"nplurals=1; plural=0;","lang":"vi_VN"},"Your new password has not been saved.":["M\u1eadt kh\u1ea9u m\u1edbi c\u1ee7a b\u1ea1n ch\u01b0a \u0111\u01b0\u1ee3c l\u01b0u."],"Show":["Hi\u1ec3n th\u1ecb"],"Hide":["\u1ea8n \u0111i"],"Hide password":["\u1ea8n m\u1eadt kh\u1ea9u"],"Show password":["Hi\u1ec7n m\u1eadt kh\u1ea9u"],"Confirm use of weak password":["Ch\u1ea5p nh\u1eadn s\u1eed d\u1ee5ng m\u1eadt kh\u1ea9u y\u1ebfu."]}},"comment":{"reference":"wp-admin\/js\/user-profile.js"}} );
</script>
<script src="<?php echo $site_url .'/wp-admin/js/user-profile.min.js?ver=6.3.2' ?>" id="user-profile-js"></script
	<div class="clear"></div>
	
	
	</body></html>