<%@ taglib prefix = "s" uri = "/struts-tags"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from themes.iamabdus.com/star/1.3/single-package-right-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Feb 2018 09:09:54 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><s:property value="%{tourDTO.title}"></s:property>Sign Up - Star Travel</title>

    <s:include value="/global/GlobalCSS.jsp"></s:include>
</head>


<body class="body-wrapper ">
<div class="main-wrapper">
    <s:include value="/global/Header.jsp"></s:include>

    <!-- Signup Modal -->
    <div class="fade signupLoging" id="signup" style="margin: 110px 0px 70px 0px; opacity: 1;" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content modalContentCustom">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <span class="modal-title" id="myModalLabel">Create your account</span>
                </div>
                <s:hidden name="url" value="%{#session.LAST_URL}"></s:hidden>
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
                        <s:textfield theme="simple" cssClass="form-control address" name="address"placeholder="Address"></s:textfield>
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
    <div>Already had an account? <a href="<s:url value="/login" />">Sign in</a></div>
</div>
</div>
</div>
</div>
<s:include value="/global/Footer.jsp"></s:include>
</div>
<s:include value="/global/GlobalJS.jsp"></s:include>
<script>
    $('.navbar-user').hide();
</script>
</body>


<!-- Mirrored from themes.iamabdus.com/star/1.3/single-package-right-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Feb 2018 09:09:54 GMT -->
</html>

