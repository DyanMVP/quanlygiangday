<?php
function register_user() {
    // Handle the AJAX request, e.g., create the user and return a response

    // Get form data
    parse_str($_POST['formData'], $formData);

    $username = $formData['username'];
    $email = $formData['email'];
    $password = $formData['password'];

    // Check if the username and email are available
    if (username_exists($username) || email_exists($email)) {
        echo 'Username or email is already in use.';
        wp_die();
    }

    // Create a new user
    $user_id = wp_create_user($username, $password, $email);

    if (is_wp_error($user_id)) {
        echo 'Failed to create a new user.';
        wp_die();
    }

    // Automatically log the user in
    $user = get_user_by('ID', $user_id);
    wp_set_current_user($user_id, $user->user_login);
    wp_set_auth_cookie($user_id);
    do_action('wp_login', $user->user_login, $user);

    echo 'success';
    wp_die();
}

add_action('wp_ajax_register_user', 'register_user');
add_action('wp_ajax_nopriv_register_user', 'register_user'); // For non-logged-in users