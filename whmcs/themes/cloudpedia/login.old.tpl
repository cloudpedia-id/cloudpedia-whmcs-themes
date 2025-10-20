<div class="providerLinkingFeedback"></div>
{debug}

<section class="login-page">
    <div class="container-fluid">
        <div class="row">
            <!-- Left Section -->
            <div class="col-md-5 announcements">
                <img src="/templates/{$template}/images/eclipse.png" alt="eclipse" class="eclipse-img">
                <img src="images/logo.svg" class="logo" alt="logo" />
                <div class="announcement-box">
                    <h3>Latest Announcements</h3>
                    <h4>Exciting Update : <span>Free SSL on All Hosting plans!</span></h4>
                    <p class="date">20 March</p>
                    <p class="desc">
                        Security matters! That's why we're now offering FREE SSL certificates
                        on all our hosting plans. Keep your website secure, improve SEO rankings,
                        and build trust with your visitors at no extra cost.
                    </p>
                </div>
                <img src="images/server.png" class="server-img" alt="Server Illustration" />
            </div>

            <!-- Right Section -->
            <div class="col-md-7 login-form">
                <div class="form-box">
                    <h3 class="text-center">Client Login</h3>
                    <p class="text-center">Sign in to your account to continue.</p>
                    <form>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" placeholder="name@example.com" />
                        </div>
                        <div class="form-group">
                            <div class="clearfix">
                                <label class="pull-left">Password</label>
                                <a href="#" class="pull-right">Forget Password?</a>
                            </div>
                            <input type="password" class="form-control" placeholder="Password" />
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" style="margin-top: -2px;"> Remember Me
                            </label>
                        </div>
                    </form>
                    <p class="policy text-center">By continuing, you agree to Cloudpedia Terms of Use and Privacy
                        Policy.</p>
                    <p class="register text-center">
                        Don’t have an account? <a href="#">Create Account</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<form method="post" action="{routePath('login-validate')}" class="login-form" role="form">
    <div class="card mw-540 mb-md-4 mt-md-4">
        <div class="card-body px-sm-5 py-5">
            <div class="mb-4">
                <h6 class="h3">{lang key='loginbutton'}</h6>
                <p class="text-muted mb-0">{lang key='userLogin.signInToContinue'}</p>
            </div>
            {include file="$template/includes/flashmessage.tpl"}
            <div class="form-group">
                <label for="inputEmail" class="form-control-label">{lang key='clientareaemail'}</label>
                <div class="input-group input-group-merge">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="email" class="form-control" name="username" id="inputEmail"
                        placeholder="name@example.com" autofocus>
                </div>
            </div>
            <div class="form-group mb-4 focused">
                <div class="d-flex align-items-center justify-content-between">
                    <label for="inputPassword" class="form-control-label">{lang key='clientareapassword'}</label>
                    <div class="mb-2">
                        <a href="{routePath('password-reset-begin')}" class="small text-muted"
                            tabindex="-1">{lang key='forgotpw'}</a>
                    </div>
                </div>
                <div class="input-group input-group-merge">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" class="form-control pw-input" name="password" id="inputPassword"
                        placeholder="{lang key='clientareapassword'}" autocomplete="off">
                    <div class="input-group-append">
                        <button class="btn btn-default btn-reveal-pw" type="button" tabindex="-1">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
            </div>
            {if $captcha->isEnabled()}
                {include file="$template/includes/captcha.tpl"}
            {/if}
            <div class="float-left">
                <button id="login" type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}">
                    {lang key='loginbutton'}
                </button>
            </div>
            <div class="text-right">
                <label>
                    <input type="checkbox" class="form-check-input" name="rememberme" />
                    {lang key='loginrememberme'}
                </label>
            </div>
        </div>
        <div class="card-footer px-md-5">
            <small>{lang key='userLogin.notRegistered'}</small>
            <a href="{$WEB_ROOT}/register.php" class="small font-weight-bold">{lang key='userLogin.createAccount'}</a>
        </div>
    </div>
</form>

{include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}