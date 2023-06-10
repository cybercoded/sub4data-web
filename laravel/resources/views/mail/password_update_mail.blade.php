<h1 style="color: green;">
    {{ $body['title']}}
</h1>
<div style="margin-bottom: 50;">
    Dear {{ $body['name'] }},<br/>
    The following action was made on your account
</div>

<div style="border: 1px solid gray; padding: 20px;">
    <h3 style="border-bottom: 1px solid gray; padding-bottom: 20px;">
        Change of Password and account recovery
    </h3>
    <div>
        {{ $body['otp'] }} OTP was used to recovery your account
    </div>
</div>

<p>
    <h3>
        If this was not initiated by not you, please contact us at: <br/>
        <a href="mailto:{{ env('MAIL_USERNAME') }}">{{ env('MAIL_USERNAME') }}</a>
    </h3>
</p>