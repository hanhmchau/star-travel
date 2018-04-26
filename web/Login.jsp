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
    <title><s:property value="%{tourDTO.title}"></s:property>Sign In - Star Travel</title>

    <s:include value="/global/GlobalCSS.jsp"></s:include>
</head>


<body class="body-wrapper ">
<div class="main-wrapper">
    <s:include value="/global/Header.jsp"></s:include>

    <!-- Login Modal -->
    <div id="login" class="fade signupLoging" style="margin: 110px 0px 70px 0px; opacity: 1;" tabindex="-1" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content modalContentCustom">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <span class="modal-title" id="myModalLabel">Sign in</span>
                </div>
                <div class="modal-body">
                    <s:form id="loginForm" method="POST" action="Login" theme="simple" namespace="/">
                        <s:hidden name="url" value="%{#session.LAST_URL}"></s:hidden>
                        <div class="general-error message bg-warning"></div>
                        <div class="form-group">
                            <s:textfield cssClass="form-control email" type="email" name="email" placeholder="Email"></s:textfield>
                        </div>
                        <div class="form-group">
                            <s:textfield cssClass="form-control password" type="password" name="password" placeholder="Password"></s:textfield>
                        </div>
                        <s:checkbox cssClass="lightweight-label" name="rememberMe" theme="xhtml" label="Remember me"></s:checkbox>
                        <a class="forgotPass float-right">Forgot password?</a>
                        <s:submit class="btn btn-default" value="Sign In"></s:submit>
                    </s:form>
                </div>
                <div class="modal-footer">
                    <div class="dontHaveAccount">
                        <p>Don't have an Account? <a href="<s:url value="/signup" />">Sign up</a></p>
                    </div>
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

