<h1 style="color: green;">
    {{ $body['title']}}
</h1>
<div style="margin-bottom: 50;">
    Dear {{ $body['name'] }},<br/>
    The following action was made on your account
</div>

<div style="border: 1px solid gray; padding: 20px;">
    <h3 style="border-bottom: 1px solid gray; padding-bottom: 20px;">
        Verification of OTP for PIn or password recovery
    </h3>
    <div>
        Use this one time code to verify your account.
        <h1>{{ $body['otp'] }}</h1>
        This code will expire in 30 Minutes
    </div>
</div>

<p>
    <h3>
        If this was not initiated by not you, please contact us at: <br/>
        <a href="mailto:{{ env('MAIL_USERNAME') }}">{{ env('MAIL_USERNAME') }}</a>
    </h3>
</p>