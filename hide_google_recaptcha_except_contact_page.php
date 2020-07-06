<?php 

/* CONTACT FORM 7 */ 

// This code enables to disable contact form 7 from loading on every page except the contact page

// This form also disables the Google recaptcha from loading on every page

// add the following in your functions.php

// to hide the captcha badge using CSS method check out the following link : 

// https://developers.google.com/recaptcha/docs/faq#id-like-to-hide-the-recaptcha-badge.-what-is-allowed


// Stop the CF7 CSS & JS FROM LOADING ON EVERY PAGE
add_filter( 'wpcf7_load_js', '__return_false' );
add_filter( 'wpcf7_load_css', '__return_false' );


function disable_google_recaptcha_except_contact()
{
    //Remove the captcha scripts if its not on the contact form
    if (!is_page(array( 'contact')) ) : 
        wp_dequeue_script('wpcf7-recaptcha');
        wp_dequeue_script('google-recaptcha');
    else : 

        // else if it is the contact form enqueue all the scripts related to CF7
        if (function_exists('wpcf7_enqueue_scripts')) {

            wpcf7_enqueue_scripts();
        }

        if (function_exists('wpcf7_enqueue_styles')) {
            wpcf7_enqueue_styles();
        }
  endif;

}

add_action('wp_enqueue_scripts', 'disable_google_recaptcha_except_contact');