<?php

if (!function_exists('format_date')) {
    /**
     * Format a given date.
     *
     * @param  string  $date
     * @param  string  $format
     * @return string
     */
    function format_date($date, $format = 'Y-m-d H:i:s')
    {
        return \Carbon\Carbon::parse($date)->format($format);
    }
}

if (!function_exists('generate_slug')) {
    /**
     * Generate a URL-friendly "slug" from a given string.
     *
     * @param  string  $string
     * @return string
     */
    function generate_slug($string)
    {
        return \Illuminate\Support\Str::slug($string);
    }
}

if (!function_exists('app_url')) {
    /**
     * Get the base URL of the application.
     *
     * @return string
     */
    function app_url()
    {
        return config('app.url');
    }
}


if (!function_exists('send_email')) {
    /**
     * Send a mail to user.
     *
     * @param  string  $mail_function
     * @param  string|null  $otp
     * @param  string  $email
     * @param  string  $email_title
     * @param  array  $email_message
     * @param  string  $jsonRespMessage
     * @return string 
     */
    function send_email($mail_function, $otp = null, $email, $email_title, $email_message, $jsonRespMessage) 
    {
        // Send the email
        $function_call = "App\\Mail\\$mail_function";

        try {
            // Send the email
            Mail::to($email)->send(new $function_call($email_title, $email_message));
            
            // Check if the email was sent successfully
            if(count(Mail::failures()) > 0) {
                // Handle failure, log errors, or perform any necessary action
                Log::error('Failed to send email to: ' . $email);
                return response()->json([
                    'status' => 419,
                    'errors' => "Mail could not be sent to ". $email,
                ]);
            } else {
                // Email sent successfully
                return response()->json([
                    'status' => 200,
                    'message' => "Verification code sent to $email",
                ]);
            }
        } catch (\Exception $e) {
            // Handle exceptions, which could include cases like no internet connection
            Log::error('Error sending email: ' . $e->getMessage());
            return response()->json([
                'status' => 200,
                'message' => $jsonRespMessage,
                'log' => $e->getMessage(),
                'otp' => config('app.env') === 'local' ? $otp : null,
                'local' => config('app.env') === 'local' ? true : false,
            ]);
        }
    }
}
