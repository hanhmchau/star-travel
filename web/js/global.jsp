<%@taglib prefix="s" uri="/struts-tags" %>
<script>
    jQuery(document).ready(function(){
    "use strict";

    $('.btn-u.btn-block.active-switcher-btn.fixed-header-light').click();

    function isEmail(email) {
        let regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
    }

    function isPhone(phone) {
        let regex = /^\d{8,15}$/;
        return regex.test(phone);
    }

    let validateEnableSignupButton = function() {
        let $errMessage = $('#btn-signup').siblings('.server-error');
        $errMessage.hide();
        let displayName= $('#signup input.displayName').val();
        let password = $('#signup input.password').val();
        let email = $('#signup input.email').val();
        let address= $('#signup input.address').val();
        let phone= $('#signup input.phone').val();
        let checked = !!$('#signup input[type="checkbox"]').prop('checked');

        let invalid = (displayName.length <= 0 || displayName.length > 20 || password.length < 8 || email.length <= 0 || !isEmail(email) || !checked
        || !isPhone(phone) || address.length <= 0);
        $('#btn-signup').prop('disabled', invalid).toggleClass('btn-disabled', invalid);
    };

    $('#signup input[type="checkbox"]').on('change', function(e){
        validateEnableSignupButton();
    });

    $("#signup input.displayName").on('keyup', function(e){
        let displayName= $('#signup input.displayName').val();
        $('#signup .displayName-message').toggle(displayName.length <= 0 || displayName.length > 20);
        validateEnableSignupButton();
    });

    $("#signup input.password").on('keyup', function(e){
        var password= $('#signup input.password').val();
        $('#signup .password-message').toggle(password.length < 8);
        validateEnableSignupButton();
    });

    $("#signup input.email").on('keyup', function(e){
        let email= $('#signup input.email').val();
        $('#signup .email-message').toggle(email.length <= 0 || !isEmail(email));
        validateEnableSignupButton();
    });

    $("#signup input.address").on('keyup', function(e){
        let address= $('#signup input.address').val();
        $('#signup .address-message').toggle(address.length <= 0);
        validateEnableSignupButton();
    });

    $("#signup input.phone").on('keyup', function(e){
        let phone= $('#signup input.phone').val();
        $('#signup .phone-message').toggle(!isPhone(phone));
        validateEnableSignupButton();
    });

    $('#btn-signup').click(function(e){
        let displayName= $('#signup input.displayName').val();
        let password = $('#signup input.password').val();
        let email = $('#signup input.email').val();
        let address= $('#signup input.address').val();
        let phone= $('#signup input.phone').val();
        let $errMessage = $('#btn-signup').siblings('.general-error');
        console.log($('#signup').find('input[name=url]'));
        $.ajax({
            method: 'POST',
            url: "<s:url value="/SignUp" />",
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({
                displayName,
                password,
                email,
                address,
                phone,
                url: $('#signup').find('input[name=url]').val(),
            }),
            success: function(response) {
                $errMessage.hide();
                window.location.href = response.url;
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.responseText.includes("UNIQUE KEY")) {
                    $errMessage.html('This email has already been used.');
                } else {
                    $errMessage.html('Something went wrong. Please try again.');
                }
                $errMessage.show();
            }
        });
    });

    $('#loginForm').submit(function(e){
        let email = $('#login input.email').val();
        let password = $('#login input.password').val();

        if (!email || !password) {
            $('#login .general-error').html('Please fill out all fields.').show();
            return false; //stop submitting the form if a field is left empty
        }

        $.ajax({
            method: "POST",
            url: "<s:url value="/Login" />",
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify({
                email,
                password,
                url: $('#loginForm').find('input[name=url]').val(),
            }),
            success: function(response) {
                window.location = response.url;
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 500) {
                    $('#login .general-error').html('The username or password you have entered is invalid.').show();
                } else {
                    $('#login .general-error').html('Your account has been banned.').show();
                }
            }
        });

        return false; //cancel regardless
    });

    $('[data-toggle="modal"]').on('click', function(e){
        $($(this).attr('data-target')).find('.message').hide();
    });

    $('input.quantity').on('keypress', function(e){
        var key = e.which;
        if (!(key === 8 || key >=48 && key <= 57)) {
            e.preventDefault();
            return;
        }
        var val = $(this).val();
        if (key === 8) {
            if (val.length == 1) {
                e.preventDefault();
                $(this).val('0');
                return;
            }
        }

        if (val.length > 0 && val.startsWith('0')) {
            $(this).val(val.substr(1));
        }
    });



    toastr.options = {
        "closeButton": false,
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
});
</script>