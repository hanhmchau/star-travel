<%@ taglib prefix = "s" uri = "/struts-tags"%>

<!-- Signup Modal -->
<div class="modal fade signupLoging" id="signup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content modalContentCustom">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <span class="modal-title" id="myModalLabel">Create your account</span>
            </div>
            <div class="modal-body">
                <div class="general-error message bg-warning"></div>
                <div class="form-group">
                    <s:textfield theme="simple" cssClass = "form-control displayName" name="displayName" placeholder="Full name"></s:textfield>
                    <div class="displayName-message gray message">Display name must be from 1 to 20 characters.</div>
                </div>
                <div class="form-group">
                    <s:password theme="simple" cssClass = "form-control password" name="password" placeholder="Password"></s:password>
                    <div class="password-message gray message">Password must have at least 8 characters.</div>
                </div>
                <div class="form-group">
                    <s:textfield theme="simple" cssClass = "form-control email" name="email" placeholder="Email"></s:textfield>
                    <div class="email-message gray message">Must be a valid email.</div>
                </div>
                <div class="form-group">
                    <s:textfield theme="simple" cssClass="form-control address" name="address" placeholder="Address"></s:textfield>
                    <div class="address-message gray message">This field is required.</div>
                </div>
                <div class="form-group">
                    <s:textfield theme="simple" cssClass="form-control phone" type="phone" name="phone" placeholder="Phone"></s:textfield>
                    <div class="phone-message gray message">Must be a valid phone number.</div>
                </div>
                <div class="checkbox">
                    <s:checkbox name="agree" label="I agree to the terms of use and privacy."></s:checkbox>
                </div>
                <button disabled id="btn-signup" class="btn btn-default btn-disabled">Sign Up</button>
            </div>
            <div class="modal-footer">
                <div>Already had an account? <a class="open-login-modal" data-dismiss="modal" data-toggle="modal" data-target="#login">Sign in</a></div>
            </div>
        </div>
    </div>
</div>

<!-- Login Modal -->
<div class="modal fade signupLoging" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content modalContentCustom">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <span class="modal-title" id="myModalLabel">Sign in</span>
            </div>
            <div class="modal-body">
                <s:form id="loginForm" method="POST" action="Login" theme="simple">
                    <div class="general-error message bg-warning"></div>
                    <div class="form-group">
                        <s:textfield theme="simple" cssClass="form-control email" type="email" name="email" placeholder="Email"></s:textfield>
                    </div>
                    <div class="form-group">
                        <s:textfield theme="simple" cssClass="form-control password" type="password" name="password" placeholder="Password"></s:textfield>
                    </div>
                    <s:checkbox cssClass="lightweight-label" name="rememberMe" theme="xhtml" label="Remember me"></s:checkbox>
                    <a class="forgotPass float-right">Forgot password?</a>
                    <s:submit class="btn btn-default" value="Sign In"></s:submit>
                </s:form>
            </div>
            <div class="modal-footer">
                <div class="dontHaveAccount">
                    <p>Don't have an Account? <a href="/signup">Sign up</a></p>
                </div>
            </div>
        </div>
    </div>
</div>