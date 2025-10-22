<div class="providerLinkingFeedback"></div>

<section class="flex h-screen">
  <!-- Left Section -->
  <div class="relative w-5/12 bg-[#08005E] flex flex-col items-start p-10 text-white">
    <img src="{$WEB_ROOT}/templates/{$template}/images/eclipse.png" alt="eclipse" class="absolute top-0 right-0 opacity-80">

    <img src="{$WEB_ROOT}/templates/{$template}/images/logo.svg" class="w-32 relative z-10" alt="logo" />

    <div class="announcement-box relative my-auto bg-white/5 backdrop-blur-xl rounded-2xl p-5 z-10">
      <h3 class="text-2xl font-bold">Latest Announcements</h3>
      <h4 class="text-lg font-semibold text-[#ffc107]">
        Exciting Update : <span>Free SSL on All Hosting plans!</span>
      </h4>
      <p class="text-xs font-normal my-2">20 March</p>
      <p class="text-sm font-normal transition-all duration-500">Security matters! That's why we're now offering FREE SSL certificates on all our hosting plans. Keep your website secure, improve SEO rankings, and build trust with your visitors at no extra cost.</p>

      <!-- Dots -->
      <div class="flex space-x-2 my-5">
        <button class="w-4 h-2 rounded-full bg-[#F7B548]"></button>
        <button class="w-2 h-2 rounded-full bg-white"></button>
        <button class="w-2 h-2 rounded-full bg-white"></button>
      </div>

    </div>
    <img src="{$WEB_ROOT}/templates/{$template}/images/server.png" class="absolute bottom-0 left-0 w-[270px] z-0" alt="Server Illustration" />
  </div>

  <!-- Right Section -->
  <div class="w-7/12 flex items-center justify-center bg-white">
    <div class="bg-[#08005E] text-white rounded-2xl p-10 w-[346px] flex flex-col justify-between">
      <h3 class="text-2xl font-bold text-[#ffc107] text-center mb-2">{lang key='loginbutton'}</h3>
      {include file="$template/includes/flashmessage.tpl"}
      <p class="text-center text-sm font-medium mb-5">{lang key='userLogin.signInToContinue'}</p>

      <form method="post" action="{routePath('login-validate')}" class="login-form" role="form">
        <div class="flex flex-col">
          <label for="inputEmail" class="text-sm font-medium mb-1">{lang key="clientareaemail"}</label>
          <input type="email" name="username" placeholder="name@example.com" id="inputEmail" class="h-10 px-3 rounded-md bg-[#1D1484] border border-white text-white text-sm font-medium placeholder:text-[#8E7DF8] focus:outline-none focus:border-[#8E7DF8] focus:shadow-[0_0_10px_rgba(142,125,248,0.6)] hover:shadow-[0_0_8px_rgba(142,125,248,0.8)] transition-all duration-300" autofocus />
        </div>
        <div class="flex flex-col">
          <div class="flex justify-between mb-1">
            <label for="inputPassword" class="text-sm font-medium">{lang key="clientareapassword"}</label>
            <a href="{routePath('password-reset-begin')}" class="text-sm font-medium text-[#8E7DF8] hover:text-[#C0BFF6] transition-colors duration-200 focus:outline-none" tabindex="-1">{lang key='forgotpw'}</a>
          </div>
          <input type="password" name="password" placeholder="{lang key='clientareapassword'}" id="inputPassword" class="h-10 px-3 rounded-md bg-[#1D1484] border border-white text-white text-sm font-medium placeholder:text-[#8E7DF8] focus:outline-none focus:border-[#8E7DF8] focus:shadow-[0_0_10px_rgba(142,125,248,0.6)] hover:shadow-[0_0_8px_rgba(142,125,248,0.8)] transition-all duration-300" autocomplete="off" />
        </div>
        {if $captcha->isEnabled()}
          {include file="$template/includes/captcha.tpl"}
        {/if}
        <button id="login" type="submit" class="w-full h-10 mt-2 bg-gradient-to-r from-[#8E7DF8] to-[#C0BFF6] text-white font-semibold text-sm rounded-md shadow-md hover:from-[#A89BFF] hover:to-[#D2CEFF] focus:outline-none focus:ring-2 focus:ring-[#C0BFF6] transition-all duration-300">
          {lang key="loginbutton"}
        </button>
        <div class="flex items-center">
          <input type="checkbox" name="rememberme" id="remember" class="mr-2 accent-[#8E7DF8]">
          <label for="remember" class="text-sm font-medium text-[#8E7DF8] hover:text-[#C0BFF6] transition-colors duration-200 cursor-pointer">{lang key='loginrememberme'}</label>
        </div>
      </form>

      <div class="text-center space-y-3">
        <p class="text-sm font-normal text-white">By continuing, you agree to Cloudpedia Terms of Use and Privacy Policy.</p>
        <p class="text-sm font-normal">
          {lang key='userLogin.notRegistered'}
          <a href="{$WEB_ROOT}/register.php" class="font-semibold text-[#C0BFF6] underline hover:text-[#8E7DF8] transition-colors duration-200">{lang key='userLogin.createAccount'}</a>
        </p>
      </div>
    </div>
  </div>
</section>


{*

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

*}

{include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}

