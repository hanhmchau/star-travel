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

        <%--<s:include value="LeftAside.jsp"></s:include>--%>

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
                <div class="m-portlet">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
						<span class="m-portlet__head-icon m--hide">
						<i class="la la-gear"></i>
						</span>
                                <h3 class="m-portlet__head-text">
                                    <s:property value="tourDTO.title" />
                                </h3>
                            </div>
                        </div>
                    </div>
                    <!--begin::Form-->
                    <form id="m_form" class="m-form m-form--fit m-form--label-align-right m-form--group-seperator-dashed">
                        <div class="m-portlet__body">
                            <div class="form-group m-form__group row">
                                <label class="col-xl-3 col-lg-3 col-form-label">* Name:</label>
                                <div class="col-xl-6 col-lg-6">
                                    <input type="text" name="name" autocomplete="off" class="form-control m-input simple"
                                           value="<s:property value="locationDTO.name" />">
                                    <%--<span class="m-form__help">The name should be at most 80 characters.</span>--%>
                                </div>
                            </div>
                            <%--<div class="form-group m-form__group row">--%>
                                <%--<div class="col-12">--%>
                                    <%--<div class="form-group m-form__group">--%>
                                        <%--<label class="col-lg-3 col-form-label">Parent location: </label>--%>
                                        <%--<select class="col-lg-6 form-control m-select2" id="parentLocation" name="parentLocation">--%>
                                            <%--<option selected="selected" value="locationDTO.parent.id">--%>
                                                <%--<s:property value="locationDTO.parent.name"></s:property>--%>
                                            <%--</option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <div class="form-group m-form__group row">
                                <div class="col-lg-12">
                                    <div class="form-group m-form__group">
                                        <label class="col-lg-3 col-form-label">Description: </label>
                                        <div class="col-lg-6 offset-3">
                                            <div class="summernote" id="description"><s:property escapeHtml="false" value="locationDTO.description"></s:property></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-form-label col-lg-3 col-sm-12">The location's images:</label>
                            <div class="col-lg-6 col-md-9 col-sm-12">
                                <div class="m-dropzone dropzone m-dropzone--success" id="m-dropzone-three">
                                    <div class="m-dropzone__msg dz-message needsclick">
                                        <h3 class="m-dropzone__msg-title">Drop files here or click to upload.</h3>
                                        <span class="m-dropzone__msg-desc">Only image, pdf and psd files are allowed for upload</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <div id="image-zone" class="col-12 col-lg-6 offset-lg-3 row">
                                <s:iterator value="locationDTO.images">
                                    <div class="tour-image col-12 col-lg-3 position-relative" data-id="<s:property value="key" />" >
                                        <img class="w-100 h-100" src="<s:url value="%{value}" />" />
                                        <a href="#" class="remove-image btn btn-outline-danger m-btn m-btn--icon m-btn--icon-only m-btn--pill m-btn--air position-absolute"
                                           style="top: 0; right: 0;">
                                            <i class="la la-remove"></i>
                                        </a>
                                    </div>
                                </s:iterator>
                            </div>
                        </div>
                    </form>
                </div>

                <!--end::Form-->
            </div>

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
    <script src="/AdminPages/assets/vendors/custom/jquery-ui/jquery-ui.bundle.js" type="text/javascript"></script>
    <!--end::Page Resources -->

    <script>
        $(document).ready(function(e){
            $('.m-stack__item.m-brand').hide();
            $('footer').css('margin-left', '0');
        });

        Dropzone.autoDiscover = false;
        jQuery(document).ready(function() {
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

            var locationId = "<s:property value="locationDTO.id" />";
            var formEl = $('#m_form');
            var validator = formEl.validate({
                //== Validate only visible fields
                ignore: ":hidden",

                //== Validation rules
                rules: {
                    //=== Client Information(step 1)
                    //== Basic information
                    name: {
                        required: true,
                        maxlength: 60,
                    },
                    parentLocation: {
                        required: true,
                    },
                    description: {
                        required: true,
                        minlength: 10,
                        maxlength: 200,
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

            var sendSimpleAjaxUpdate = function(data, success, error) {
                data.id = locationId;
                $.ajax({
                    url: "<s:url value="/administrator/EditLocationAction" />",
                    method: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    success: function(data) {
                        if (success) {
                            success();
                        } else {
                            toastr.success("Successfully updated location.");
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

            $('#m_form input.m-input.simple').change(function(e){
                if ($(this).valid()) {
                    sendSimpleAjaxUpdate({
                        [$(this).attr('name')]: $(this).val()
                    })
                }
            });

            $('.summernote').on('summernote.blur',function(we, contents, $editable){
                sendSimpleAjaxUpdate({
                    [$(this).attr('id')]: $(this).summernote('code'),
                })
            });

            $('.summernote').summernote({
                height: 150
            });

            // file type validation
            Dropzone.options.mDropzoneThree = {
                url: '<s:url value="/administrator/ProcessLocationImagesAction" />',
                autoProcessQueue: true,
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
//                        e.preventDefault();
//                        e.stopPropagation();
//                        myDropzone.processQueue();
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
                        for (let key in response.addedFiles) {
                            let value = response.addedFiles[key];
                            var contextPath = "${pageContext.request.contextPath}"
                            $('#image-zone').prepend('<div class="tour-image col-12 col-lg-3 position-relative" data-id="'+key+'" >\
                        <img class="w-100 h-100" src="'+contextPath+value+'" />\
                            <a href="#" class="remove-image btn btn-outline-danger m-btn m-btn--icon m-btn--icon-only m-btn--pill m-btn--air position-absolute"\
                        style="top: 0; right: 0;">\
                                <i class="la la-remove"></i>\
                            </a>\
                        </div>');
                        }
                        toastr.success("Successfully added images to location.");
                    });
                    this.on("errormultiple", function(files, response) {
                        // Gets triggered when there was an error sending the files.
                        // Maybe show form again, and notify user of error
                        toastr.error("Could not upload images. Please try again.");
                    });
                    this.on("completemultiple", function(files){
                        myDropzone.removeAllFiles();
                    });
                }
            };
            $('.dropzone').dropzone(Dropzone.options.mDropzoneThree);

            $('body').on('click', '.remove-image', function(e){
                e.preventDefault();
                let id = $(this).closest('.tour-image').attr('data-id');
                $.ajax({
                    url: "<s:url value="/administrator/RemoveImageFromLocationAction" />",
                    method: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        id
                    }),
                    success: function(data) {
                        toastr.success("Successfully removed image.");
                        $(e.target).closest('.tour-image').remove();
                    },
                    error: function() {
                        toastr.error("Could not remove image. Please try again.");
                    },
                });
            });

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


            $("#parentLocation").select2({
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
            }).on('select2:select', function(e){
                console.log(e);
                $.ajax({
                    url: "<s:url value="/administrator/EditLocationAction" />",
                    method: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        id: locationId,
                        parentId: e.params.data.id,
                    }),
                    success: function(data) {
                        toastr.success("Successfully updated location.");
                    },
                    error: function() {
                        toastr.error("Could not update. Please try again.");
                    }
                });
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
            function formatRepoSelection(repo) {
                return repo.name || repo.text;
            }
        });

    </script>


    </body>
    <!-- end::Body -->

    <!-- Mirrored from keenthemes.com/metronic/preview/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 22 Feb 2018 11:55:21 GMT -->
</html>