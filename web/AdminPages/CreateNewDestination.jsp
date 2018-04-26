<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 23-Feb-18
  Time: 10:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="utf-8" />
    <title>Admin | Star Travel</title>

<s:include value="AdminHeader.jsp" />

<!-- begin::Body -->
<div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

    <s:include value="LeftAside.jsp"></s:include>

    <div class="m-grid__item m-grid__item--fluid m-wrapper">

        <!-- BEGIN: Subheader -->
        <div class="m-subheader ">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="m-subheader__title m-subheader__title--separator">Administrator</h3>
                    <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                        <li class="m-nav__item m-nav__item--home">
                            <a href="<s:url value="/administrator" />" class="m-nav__link m-nav__link--icon">
                                <i class="m-nav__link-icon la la-home"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- END: Subheader -->
        <div class="m-content">
        <!--Begin::Main Portlet-->
        <div class="m-portlet m-portlet--full-height">
            <!--begin: Portlet Head-->
            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <div class="m-portlet__head-title">
                        <h3 class="m-portlet__head-text">
                            Create New Location
                            <small>Where people go to</small>
                        </h3>
                    </div>
                </div>
                <div class="m-portlet__head-tools">
                    <ul class="m-portlet__nav">
                        <li class="m-portlet__nav-item">
                            <a href="#" data-toggle="m-tooltip" class="m-portlet__nav-link m-portlet__nav-link--icon" data-direction="left" data-width="auto" title="Get help with filling up this form">
                                <i class="flaticon-info m--icon-font-size-lg3"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!--end: Portlet Head-->
            <!--begin: Form Wizard-->

            <div class="m-wizard m-wizard--2 m-wizard--success" id="m_wizard">
                <!--begin: Message container -->
                <div class="m-portlet__padding-x">
                    <!-- Here you can put a message or alert -->
                </div>
                <!--end: Message container -->

                <!--begin: Form Wizard Form-->
                <div class="m-wizard__form">
                    <!--
                        1) Use m-form--label-align-left class to alight the form input lables to the right
                        2) Use m-form--state class to highlight input control borders on form validation
                        -->
                    <form class="m-form m-form--label-align-left- m-form--state-" id="m_form">
                        <!--begin: Form Body -->
                        <div class="m-portlet__body">
                            <!--begin: Form Wizard Step 1-->
                            <div class="m-wizard__form-step m-wizard__form-step--current" id="m_wizard_form_step_1">
                                <div class="row">
                                    <div class="col-xl-8 offset-xl-2">
                                        <div class="m-form__section m-form__section--first">
                                            <div class="m-form__heading">
                                                <h3 class="m-form__heading-title"></h3>
                                            </div>
                                            <div class="form-group m-form__group row">
                                                <label class="col-xl-3 col-lg-3 col-form-label">* Name:</label>
                                                <div class="col-xl-9 col-lg-9">
                                                    <input type="text" name="title" class="form-control m-input"
                                                           autocomplete="off">
                                                    <span class="m-form__help">The name should be at most 60 characters.</span>
                                                </div>
                                            </div>
                                            <%--<div class="form-group m-form__group row">--%>
                                                <%--<label class="col-form-label col-lg-3 col-sm-12">* Where is this location:</label>--%>
                                                <%--<div class="col-lg-9 col-md-9 col-sm-12">--%>
                                                    <%--<select class="form-control m-select2" id="locations" name="parentLocation">--%>
                                                        <%--<option></option>--%>
                                                    <%--</select>--%>
                                                    <%--<span class="m-form__help">Choose the most specific option possible.</span>--%>
                                                <%--</div>--%>
                                            <%--</div>--%>
                                            <div class="form-group m-form__group row">
                                                <label class="col-form-label col-lg-3 col-sm-12">The location's images:</label>
                                                <div class="col-lg-9 col-md-9 col-sm-12">
                                                    <div class="m-dropzone dropzone m-dropzone--success" id="m-dropzone-three">
                                                        <div class="m-dropzone__msg dz-message needsclick">
                                                            <h3 class="m-dropzone__msg-title">Drop files here or click to upload.</h3>
                                                            <span class="m-dropzone__msg-desc">Only image, pdf and psd files are allowed for upload</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-12">
                                                    <label>Description:</label>
                                                    <div class="summernote" id="description"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end: Form Wizard Step 1-->
                        </div>
                        <!--end: Form Body -->
                        <!--begin: Form Actions -->
                        <div class="m-portlet__foot m-portlet__foot--fit m--margin-top-40">
                            <div class="m-form__actions">
                                <div class="row">
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-4 m--align-left">
                                        <a href="#" class="btn btn-secondary m-btn m-btn--custom m-btn--icon" data-wizard-action="prev">
                                            <span>
                                                <i class="la la-arrow-left"></i>&nbsp;&nbsp;
                                                <span>Back</span>
                                            </span>
                                        </a>
                                    </div>
                                    <div class="col-lg-4 m--align-right">
                                        <a href="#" class="btn btn-submit-destination btn-primary m-btn m-btn--custom m-btn--icon">
                                            <span>
                                                <i class="la la-check"></i>&nbsp;&nbsp;
                                                <span>Submit</span>
                                            </span>
                                        </a>
                                    </div>
                                    <div class="col-lg-2"></div>
                                </div>
                            </div>
                        </div>
                        <!--end: Form Actions -->
                    </form>
                </div>
                <!--end: Form Wizard Form-->
            </div>
            <!--end: Form Wizard-->
        </div>
        <!--End::Main Portlet-->
    </div>
    </div>


</div>
<button class="hide send-images"></button>

<!-- end:: Body -->

<!-- end:: Page -->
<!-- begin::Quick Nav -->
<s:include value="AdminFooter.jsp"/>
<%--<script src="/AdminPages/assets/demo/default/custom/components/forms/wizard/wizard.js" type="text/javascript"></script>--%>
<!--begin::Page Resources -->
<%--<script src="/AdminPages/assets/demo/default/custom/components/forms/widgets/select2.js" type="text/javascript"></script>--%>

    <!--end::Page Resources -->
<script>
    $(document).ready(function(e){
        $('#categories').select2();
    });

    var locationId;
    var titleUrl;

    //== Class definition
    var NewCreateLocation = function () {
        //== Base elements
        var formEl = $('#m_form');
        var validator;

        var initValidation = function() {
            validator = formEl.validate({
                //== Validate only visible fields
                ignore: ":hidden",

                //== Validation rules
                rules: {
                    //=== Client Information(step 1)
                    //== Basic information
                    title: {
                        required: true,
                        maxlength: 60,
                    },
                    parentLocation: {
                        required: true,
                    },
                    isLocation: {
                        required: true,
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
        }

        var initSubmit = function() {
            var btn = formEl.find('.btn-submit-destination');

            btn.on('click', function(e) {
                e.preventDefault();
                if (validator.form()) {
                    //== See: src\js\framework\base\app.js
                    mApp.progress(btn);
                    //mApp.block(formEl);

                    var title = $('input[name=title]').val();
                    var parentLocation = $('#locations').select2('val');
                    var description = $('#description').summernote('code');

                    $.ajax({
                       method: 'POST',
                       url: '<s:url value="CreateNewDestination" />',
                        dataType: 'json',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            name: title,
                            parentLocation,
                            description
                        }),
                        success: function(data) {
                            mApp.unprogress(btn);
                            //mApp.unblock(formEl);

                            locationId = data.id;
                            titleUrl = data.titleUrl;
                            $('.send-images').click();
                        },
                        error: function(e) {
                            mApp.unprogress(btn);
                            swal({
                                "title": "",
                                "text": "Something wrong happened. Please try again.",
                                "type": "error",
                                "confirmButtonClass": "btn btn-secondary m-btn m-btn--wide"
                            });
                        }
                    });

                    //== See: http://malsup.com/jquery/form/#ajaxSubmit
//                    formEl.ajaxSubmit({
//                        success: function() {
//                        }
//                    });
                }
            });
        };

        return {
            // public functions
            init: function() {
                formEl = $('#m_form');

                initValidation();
                initSubmit();
            }
        };
    }();

    Dropzone.autoDiscover = false;
    jQuery(document).ready(function() {
        NewCreateLocation.init();

        $('#start-dates').datepicker({
            todayHighlight: true,
            orientation: "bottom left",
            templates: {
                leftArrow: '<i class="la la-angle-left"></i>',
                rightArrow: '<i class="la la-angle-right"></i>'
            },
            multidate: true,
            beforeShowDay: (date) => date > new Date(),
        });

        $('.summernote').summernote({
            height: 150
        });

        // file type validation
        Dropzone.options.mDropzoneThree = {
            url: '<s:url value="/administrator/ProcessLocationImagesAction" />',
            autoProcessQueue: false,
            uploadMultiple: true,
            parallelUploads: 100,
            paramName: "file", // The name that will be used to transfer the file
            maxFilesize: 10, // MB
            addRemoveLinks: true,
            acceptedFiles: "image/*",
            accept: function(file, done) {
                done();
            },
            // The setting up of the dropzone
            init: function() {
                var myDropzone = this; //closure

                // First change the button to actually tell Dropzone to process the queue.
                $(".send-images").on("click", function(e) {
                    // Make sure that the form isn't actually being sent.
                    e.preventDefault();
                    e.stopPropagation();
                    if (locationId) {
                        myDropzone.processQueue();
                    }
                });

                // Listen to the sendingmultiple event. In this case, it's the sendingmultiple event instead
                // of the sending event because uploadMultiple is set to true.
                this.on("sendingmultiple", function(file, xhr, formData) {
                    // Gets triggered when the form is actually being sent.
                    // Hide the success button or the complete form.
                    formData.append('locationId', locationId);
                });
                this.on("successmultiple", function(files, response) {
                    // Gets triggered when the files have successfully been sent.
                    // Redirect user or notify of success.
                    $('.btn-submit-tour').hide();
                    swal({
                        "title": "",
                        "text": "Successfully created location. Redirecting you to its dashboard...",
                        "type": "success",
                        "confirmButtonClass": "btn btn-secondary m-btn m-btn--wide",
                    });
//                    return; //
                    setTimeout(function(){
                        var contextPath = "${pageContext.request.contextPath}"
                        window.location = contextPath + '/administrator/edit-location/'+titleUrl;
                    }, 1500);
                });
                this.on("errormultiple", function(files, response) {
                    // Gets triggered when there was an error sending the files.
                    // Maybe show form again, and notify user of error
                });
            }
        };
        $('.dropzone').dropzone(Dropzone.options.mDropzoneThree);

        $('#m_repeater_1').repeater({
            initEmpty: false,

            defaultValues: {
                'text-input': 'foo'
            },

            show: function () {
                $(this).slideDown();
                mApp.initPortlets();
            },

            hide: function (deleteElement) {
                $(this).slideUp(deleteElement);
            }
        });

        $("#m_repeater_1").sortable({
            connectWith: ".m-portlet__head",
            items: ".form-group.draggable",
            opacity: 0.8,
            handle : '.m-portlet__head',
            coneHelperSize: true,
            placeholder: 'm-portlet--sortable-placeholder',
            tolerance: "pointer",
            forcePlaceholderSize: !0,
            helper: "clone",
            cancel: ".m-portlet--sortable-empty, input", // cancel dragging if portlet is in fullscreen mode
            revert: 250, // animation in milliseconds
            update: function(b, c) {
                if (c.item.prev().hasClass("m-portlet--sortable-empty")) {
                    c.item.prev().before(c.item);
                }
            }
        });

        $("#locations").select2({
            allowClear: true,
            ajax: {
                url: "<s:url value="/FindLocationsByName" />",
                dataType: 'json',
                delay: 250,
                data: function(params) {
                    return {
                        search: params.term, // search term
                        page: params.page
                    };
                },
                processResults: function(data, params) {
                    // parse the results into the format expected by Select2
                    // since we are using custom formatting functions we do not need to
                    // alter the remote JSON data, except to indicate that infinite
                    // scrolling can be used
                    params.page = params.page || 1;
                    return {
                        results: data.results.slice(0,5),
                        pagination: {
                            more: (params.page * 30) < data.results.length
                        }
                    };
                },
                cache: true
            },
            escapeMarkup: function(markup) {
                return markup;
            }, // let our custom formatter work
            minimumInputLength: 1,
            templateResult: formatItem, // omitted for brevity, see the source of this page
            templateSelection: formatRepoSelection,
        });

        function formatItem(item) {
            if (item.loading) return item.text;
            var markup = "<div class='select2-result-repository clearfix'>" +
                "<div class='select2-result-repository__meta'>" +
                "<div class='select2-result-repository__title'>" + item.name + "</div>";
            if (item.parent) {
                markup += "<div class='select2-result-repository__description'><i class='fa fa-flash'></i> &nbsp;" + item.parent.name + "</div>";
            }
            markup += "</div></div>";
            return markup;
        }

        function formatRepoSelection(item) {
            return item.name || item.text;
        }
    });

</script>


</body>
<!-- end::Body -->

<!-- Mirrored from keenthemes.com/metronic/preview/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 22 Feb 2018 11:55:21 GMT -->
</html>