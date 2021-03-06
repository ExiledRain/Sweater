<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">UserName: </label>
            <div class="col-sm-7">
                <input type="text" value="<#if user??>${user.username}</#if>" name="username" class="form-control ${(usernameError??)?string('is-invalid','')}" placeholder="User name"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password: </label>
            <div class="col-sm-7">
                <input type="password" name="password" class="form-control  ${(passwordError??)?string('is-invalid','')}" placeholder="Password"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Repeat Password: </label>
                <div class="col-sm-7">
                    <input type="password" name="password2" class="form-control  ${(password2Error??)?string('is-invalid','')}" placeholder="Repeat Password"/>
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email: </label>
            <div class="col-sm-7">
                <input type="email" value="<#if $user??>${user.email}</#if>" name="email" class="form-control ${(emailError??)?string('is-invalid','')}" placeholder="Email"/>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </div>
            <div class="col-sm-7">
                <div class="g-recaptcha" data-sitekey="6LebOk4aAAAAAPvKwP7i917BKDdl9vigdawQJOer"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm>
            <a href="/registration">Register</a>
        </#if>
        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign in</#if></button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary">Sign out</button>
    </form>
</#macro>