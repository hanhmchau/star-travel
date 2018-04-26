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
    <title>Your Booking - Star Travel</title>

    <s:include value="/global/GlobalCSS.jsp"></s:include>
</head>


<body class="body-wrapper ">
<div class="main-wrapper">
    <s:include value="/global/Header.jsp"></s:include>

    <!-- DASHBOARD MENU  -->
    <s:include value="/global/ProfileDashboard.jsp"></s:include>

    <!-- WELCOME SECTION -->
    <section class="welcomeSection">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h2><s:property value="user.displayName" /></h2>
                    <p>Your settings.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="settingSection">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="settingContent bg-ash">
                        <h4>Account Settings</h4>
                        <div class="changePassword">
                            <p>Basic Information</p>
                            <div class="row">
                                <form id="basic" action="#" method="post">
                                    <div class="col-lg-12">
                                        <label>Display Name:</label>
                                        <input value="${user.displayName}" type="text" name="displayName" class="form-control" id="inputPassword3">
                                    </div>
                                    <div class="col-lg-12">
                                        <label>Phone:</label>
                                        <input value="${user.phone}" type="text" name="phone" class="form-control" id="inputPassword3">
                                    </div>
                                    <div class="col-lg-12">
                                        <label>Address:</label>
                                        <input value="${user.address}" type="text" name="address" class="form-control" id="inputPassword3">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <hr>

                        <!-- Change Password -->
                        <div class="changePassword">
                            <p>change Your Password</p>
                            <div class="row">
                                <form id="password" action="#" method="post">
                                    <div class="col-sm-12">
                                        <input type="password" name="oldPassword" class="form-control" id="inputPassword3" placeholder="Old Password">
                                    </div>
                                    <div class="col-sm-12">
                                        <input type="password" name="newPassword" class="form-control" id="inputPassword3" placeholder="New Password">
                                    </div>
                                    <div class="col-sm-12">
                                        <input type="password" name="confirmPassword" class="form-control" id="inputPassword3" placeholder="Confirm New Password">
                                    </div>
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn buttonTransparent">Update Password</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <hr>

                        <!-- Change Password -->
                        <div class="changeEmail">
                            <p>Change Your Email</p>
                            <div class="row">
                                <form id="email" action="#" method="post">
                                    <div class="col-sm-12">
                                        <input type="text" name="newEmail" class="form-control" id="inputPassword3" placeholder="New Email">
                                    </div>
                                    <div class="col-sm-12">
                                        <input type="password" name="confirmPassword" class="form-control" id="inputPassword3" placeholder="Confirm password">
                                    </div>
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn buttonTransparent">Update Email Address</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- RECENT OFFER SECTION -->
    <section class="recentOfferSection">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 ">
                    <div class="recentOfferContent bg-ash">
                        <div class="row">
                            <!-- Benifits Aria -->
                            <div class="col-xs-12 col-sm-4">
                                <div class="benefitsAria">
                                    <h4>Benefits</h4>
                                    <div class="benifitsContent">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-check-square" aria-hidden="true"></i>Some Benefit</a></li>
                                            <li><a href="#"><i class="fa fa-check-square" aria-hidden="true"></i>Some Benefit Should Be Here</a></li>
                                            <li><a href="#"><i class="fa fa-check-square" aria-hidden="true"></i>Some Benefit Here</a></li>
                                            <li><a href="#"><i class="fa fa-check-square" aria-hidden="true"></i>Some Benefit</a></li>
                                            <li><a href="#"><i class="fa fa-check-square" aria-hidden="true"></i>Some Benefit Here</a></li>
                                            <li><a href="#"><i class="fa fa-check-square" aria-hidden="true"></i>Some Benefit Should Be Here</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Recent Offer Aria -->
                            <div class="col-xs-12 col-sm-4">
                                <div class="recentOfferAria">
                                    <h4>Recent Offers</h4>
                                    <div class="offerContent">
                                        <div class="singleContent">
                                            <div class="media">
                                                <div class="media-left">
                                                    <a href="#">
                                                        <img class="media-object" src="img/dashboard/recent-offer-01.jpg" alt="Image">
                                                    </a>
                                                </div>
                                                <div class="media-body">
                                                    <a href="#">
                                                        <h4 class="media-heading">Totam Rem Aperiam Eaque.</h4>
                                                    </a>
                                                    <p><span>$25</span> Family Package</p>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="singleContent">
                                            <div class="media">
                                                <div class="media-left">
                                                    <a href="#">
                                                        <img class="media-object" src="img/dashboard/recent-offer-01.jpg" alt="Image">
                                                    </a>
                                                </div>
                                                <div class="media-body">
                                                    <a href="#">
                                                        <h4 class="media-heading">Totam Rem Aperiam Eaque.</h4>
                                                    </a>
                                                    <p><span>$25</span> Family Package</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- Need Help Aria -->
                            <div class="col-xs-12 col-sm-4">
                                <div class="needhelpAria">
                                    <h4>Need Help</h4>
                                    <div class="needHelpContent">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
                                        <a class="btn btn-default" href="#" role="button"><i class="fa fa-phone" aria-hidden="true"></i>+251-235-3256</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <s:include value="/global/Footer.jsp"></s:include>
</div>

<s:include value="/global/Modals.jsp"></s:include>
<s:include value="/global/GlobalJS.jsp"></s:include>
<script>
    $(document).ready(function(){
        $('.navbar-nav.dashboardNavLeft li').eq(3).find('a').addClass('active');
        jQuery.validator.addMethod("confirmPassword", function(value, element) {
            var a = $('input[name=newPassword]').val();
            var b = $('input[name=confirmPassword]').val();
            return this.optional(element) || a === b;
        }, "Confirmation must match password.");

        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-bottom-center",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };


        var basicInfoForm = $('#basic');
        var validator = basicInfoForm.validate({
            //== Validate only visible fields
            ignore: ":hidden",

            //== Validation rules
            rules: {
                //=== Client Information(step 1)
                //== Basic information
                displayName: {
                    required: true,
                    maxlength: 20,
                },
                phone: {
                    required: true,
                    digits: true,
                },
                address: {
                    required: true,
                    maxlength: 255,
                }
            },

            //== Validation messages
            messages: {
                'account_communication[]': {
                    required: 'You must select at least one communication option'
                },
                accept: {
                    required: "You must accept the Terms and Conditions agreement!"
                }
            },

            //== Display error
            invalidHandler: function(event, validator) {
                mApp.scrollTop();

                swal({
                    "title": "",
                    "text": "There are some errors in your submission. Please correct them.",
                    "type": "error",
                    "confirmButtonClass": "btn btn-secondary m-btn m-btn--wide"
                });
            },

            //== Submit valid form
            submitHandler: function (form) {
            }
        });
        var password = $('#password').validate({
            //== Validate only visible fields
            ignore: ":hidden",

            //== Validation rules
            rules: {
                //=== Client Information(step 1)
                //== Basic information
                oldPassword: {
                    required: true,
                },
                newPassword: {
                    required: true,
                    minlength: 8,
                    confirmPassword: true,
                },
                confirmPassword: {
                    required: true,
                    confirmPassword: true,
                }
            },

            //== Display error
            invalidHandler: function(event, validator) {
//                mApp.scrollTop();
//
                swal({
                    "title": "",
                    "text": "There are some errors in your submission. Please correct them.",
                    "type": "error",
                    "confirmButtonClass": "btn btn-secondary m-btn m-btn--wide"
                });
            },

            //== Submit valid form
            submitHandler: function (form, e) {
                e.preventDefault();
                $.ajax({
                    url: "<s:url value="/profile/UpdateUserPassword" />",
                    method: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        userId: "<s:property value="user.id" />",
                        oldPassword: $('input[name=oldPassword]').val(),
                        newPassword: $('input[name=newPassword]').val(),
                    }),
                    success: function(data) {
                        toastr.success("Successfully updated password.");
                    },
                    error: function() {
                        toastr.error("Cannot change password. Your old password might be incorrect");
                    }
                });
            }
        });
        var email = $('#email').validate({
            //== Validate only visible fields
            ignore: ":hidden",

            //== Validation rules
            rules: {
                //=== Client Information(step 1)
                //== Basic information
                newEmail: {
                    required: true,
                    email: true,
                },
                confirmPassword: {
                    required: true,
                }
            },

            //== Display error
            invalidHandler: function(event, validator) {
                swal({
                    "title": "",
                    "text": "There are some errors in your submission. Please correct them.",
                    "type": "error",
                    "confirmButtonClass": "btn btn-secondary m-btn m-btn--wide"
                });
            },

            //== Submit valid form
            submitHandler: function (form, e) {
                e.preventDefault();
                $.ajax({
                    url: "<s:url value="/profile/UpdateUserEmail" />",
                    method: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        userId: "<s:property value="user.id" />",
                        newEmail: $('input[name=newEmail]').val(),
                        confirmPassword: $('#email input[name=confirmPassword]').val(),
                    }),
                    success: function(data) {
                        toastr.success("Successfully updated email.");
                    },
                    error: function() {
                        toastr.error("Cannot change email. Your old password might be incorrect");
                    }
                });
            }
        });


        var sendSimpleAjaxUpdate = function(data, success, error) {
            data.userId = '${user.id}'
            $.ajax({
                url: "<s:url value="/profile/UpdateUserSettings" />",
                method: "POST",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function(data) {
                    if (success) {
                        success();
                    } else {
                        toastr.success("Successfully updated user settings.");
                    }
                },
                error: function() {
                    if (error) {
                        error();
                    } else {
                        toastr.error("Could not update. Please try again.");
                    }
                }
            });
        };

        $('#basic input').change(function(e){
            if ($(this).valid()) {
                sendSimpleAjaxUpdate({
                    [$(this).attr('name')]: $(this).val()
                })
            }
        });
    });
</script>
</body>


<!-- Mirrored from themes.iamabdus.com/star/1.3/single-package-right-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Feb 2018 09:09:54 GMT -->
</html>

