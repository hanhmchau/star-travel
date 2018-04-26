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
                            <h3 class="m-portlet__head-text">
                                <s:property value="tourDTO.title" />
                            </h3>
                            &nbsp;
                            &nbsp;
                            <span class="m-portlet__head-icon">
                                <a href="<s:url value="/tour/%{tourDTO.titleUrl}" />"><i class="la la-mail-forward"></i></a>
                            </span>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <form id="m_form" class="m-form m-form--fit m-form--label-align-right m-form--group-seperator-dashed">
                    <div class="m-portlet__body">
                        <div class="form-group m-form__group row">
                            <label class="col-xl-3 col-lg-3 col-form-label">* Title:</label>
                            <div class="col-xl-6 col-lg-6">
                                <input type="text" name="title" autocomplete="off" class="form-control m-input simple"
                                       value="<s:property value="tourDTO.title" />">
                                <span class="m-form__help">The title should be from 10 to 80 characters.</span>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-form-label col-lg-3 col-sm-12">* Categories</label>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <select autocomplete="off" class="form-control m-select2"
                                        id="categories" name="categories" multiple="multiple" value="">
                                    <s:property value="categories"></s:property>
                                    <s:iterator var="cat" value="categories">
                                        <option <s:if test="%{id in categoryIds}">
                                                    selected="selected"
                                                </s:if>
                                                value="<s:property value="id" />"><s:property value="name" /></option>
                                    </s:iterator>
                                </select>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <div class="col-12">
                                <div class="form-group m-form__group">
                                    <label class="col-form-label">Locations</label>
                                    <select class="form-control m-select2" id="locations" name="locations" multiple="multiple">
                                        <s:iterator value="tourDTO.locations">
                                            <option selected="selected" value="<s:property value="id" />">
                                                <s:property value="name" />
                                            </option>
                                        </s:iterator>
                                    </select>
                                    <span class="m-form__help">Las Vegas, Rome, Paris, Seoul, etc.</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <div class="col-12 col-lg-6">
                                <div class="form-group m-form__group">
                                    <label>Number of days</label>
                                    <div class="input-group">
                                        <input type="number" name="numberOfDays" autocomplete="off" class="form-control m-input simple" min="1" max="100"
                                               placeholder="" aria-describedby="basic-addon2" value="<s:property value="tourDTO.numberOfDays" />">
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-group m-form__group">
                                    <label>Number of nights</label>
                                    <div class="input-group">
                                        <input type="number" name="numberOfNights" autocomplete="off" class="form-control m-input simple" min="0" max="100"
                                               placeholder="" aria-describedby="basic-addon2" value="<s:property value="tourDTO.numberOfNights" />">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <div class="col-12 col-lg-6">
                                <div class="form-group m-form__group">
                                    <label>Adult price</label>
                                    <div class="input-group">
                                        <input type="text" name="adultPrice" autocomplete="off" class="form-control m-input simple"
                                               placeholder="" aria-describedby="basic-addon2"
                                               value="<s:property value="getText('{0,number,#,##0.00}',{tourDTO.adultPrice})" />" >
                                        <div class="input-group-append"><span class="input-group-text">$</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-group m-form__group">
                                    <label>Child price</label>
                                    <div class="input-group">
                                        <input type="text" name="childPrice" autocomplete="off" class="form-control m-input simple"
                                               placeholder="" aria-describedby="basic-addon2"
                                               value="<s:property value="getText('{0,number,#,##0.00}',{tourDTO.childPrice})" />" >
                                        <div class="input-group-append"><span class="input-group-text">$</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <div class="col-12 col-lg-6 offset-lg-3">
                                <div class="form-group m-form__group">
                                    <label>*Number of seats a tour:</label>
                                    <div>
                                        <input required name="seatTotal" class="form-control m-input simple" value="20" max="200" min="10" type="number">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <div class="col-12 col-lg-6">
                                <div class="form-group m-form__group">
                                    <label>Description:</label>
                                    <div class="summernote" id="description"><s:property escapeHtml="false" value="tourDTO.description" /></div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-group m-form__group">
                                    <label>Highlights:</label>
                                    <div class="summernote" id="highlights"><s:property escapeHtml="false" value="tourDTO.highlights" /></div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-group m-form__group">
                                    <label>What to expect:</label>
                                    <div class="summernote" id="what-to-expect"><s:property escapeHtml="false" value="tourDTO.whatYouCanExpect" /></div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-group m-form__group">
                                    <label>Inclusions:</label>
                                    <span class="m-form__help">Specify what this tour will <em>and</em> will not provide.</span>
                                    <div class="summernote" id="inclusions"><s:property escapeHtml="false" value="tourDTO.inclusions" /></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group m-form__group row">
                        <label class="col-form-label col-lg-3 col-sm-12">*Start dates:</label>
                        <div class="input-group date col-lg-6">
                            <input class="form-control m-input" readonly="" placeholder="Select date"
                                   id="start-dates" name="startDates" type="text">
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <i class="la la-calendar-check-o"></i>
                                    </span>
                                </div>
                        </div>
                    </div>
                    <div class="form-group m-form__group row">
                        <div class="date-zone input-group row col-lg-6 offset-lg-3">
                            <s:set var="today" value="%{today}"/>
                            <s:iterator var="date" value="%{tourDTO.startDates}">
                                <s:set var="tourDate" value="value" />
                                    <s:if test="#today.before(#tourDate)">
                                        <div class="col-lg-4 p-3">
                                            <div data-value="<s:property value="value" />" data-id="<s:property value="key" />"
                                                 class="alert alert-brand alert-dismissible fade show
                                            m-alert m-alert--air" role="alert">
                                                <button type="button" class="close remove-day" aria-label="Close">
                                                    <i class="la la-remove"></i>
                                                </button>
                                                <s:date name="value" format="dd - MM - yyyy" />
                                            </div>
                                        </div>
                                    </s:if>
                            </s:iterator>
                            <s:iterator var="date" value="%{tourDTO.startDates}">
                                <s:set var="tourDate" value="value" />
                                    <s:if test="#today.after(#tourDate)">
                                        <div class="col-lg-4 p-3">
                                            <div class="alert alert-metal alert-dismissible fade show
                                         m-alert m-alert--air m-alert--outline m-alert--outline-2x w-100" role="alert"
                                                 data-container="body" data-toggle="m-tooltip" data-placement="bottom"
                                                 title="" data-original-title="Dates in the past">
                                                <s:date name="value" format="dd - MM - yyyy" />
                                            </div>
                                        </div>
                                    </s:if>
                            </s:iterator>
                        </div>
                    </div>
                    <div class="form-group m-form__group row">
                        <label class="col-form-label col-lg-3 col-sm-12">The tour's images:</label>
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
                            <s:iterator value="tourDTO.images">
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
                    <div class="m-form m-form__group row">
                        <div class="col-xl-8 offset-xl-2">
                            <!--begin::Section-->
                            <div class="m-form__section m-form__section--first">
                                <div class="m-form__heading">
                                    <h3 class="m-form__heading-title">Itinerary</h3>
                                </div>
                                <div id="m_repeater_1">
                                    <div class="row" id="m_repeater_1">
                                        <div data-repeater-list="" class="col-lg-12">
                                            <s:iterator value="tourDTO.itinerary">
                                                <div data-id="<s:property value="id" />"
                                                     data-repeater-item class="itinerary form-group draggable m-form__group row align-items-center">
                                                    <div class="m-portlet m-portlet--mobile col-md-12" data-portlet="true">
                                                        <div class="m-portlet__head">
                                                            <div class="m-portlet__head-caption">
                                                                <div class="m-portlet__head-title">
                                                                    <h3 class="m-portlet__head-text">
                                                                        Title
                                                                    </h3>
                                                                    <input style="margin: 15px 0px 0px 15px;" type="text" class="form-control m-input"
                                                                           name="itineraryTitle" required value="<s:property value="title" />"
                                                                           minlength="10" maxlength="50" placeholder="Day 1: Arrive in Zurich...">
                                                                </div>
                                                            </div>
                                                            <div class="m-portlet__head-tools">
                                                                <ul class="m-portlet__nav">
                                                                    <li class="m-portlet__nav-item">
                                                                        <a data-portlet-tool="toggle" class="m-portlet__nav-link m-portlet__nav-link--icon"><i class="la la-angle-down"></i></a>
                                                                    </li>
                                                                    <li class="m-portlet__nav-item">
                                                                        <a data-portlet-tool="save" class="m-portlet__nav-link m-portlet__nav-link--icon"><i class="la la-check-circle-o"></i></a>
                                                                    </li>
                                                                    <li class="m-portlet__nav-item">
                                                                        <a data-portlet-tool="delete" data-repeater-delete="" class="m-portlet__nav-link m-portlet__nav-link--icon"><i class="la la-close"></i></a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="m-portlet__body" style="padding: 2.2rem;">
                                                            <label>Description:</label>
                                                            <textarea required
                                                                      minlength="10" maxlength="400"  name="itineraryContent" class="form-control m-input" rows="3"
                                                                      placeholder="We’ll meet at 4 p.m. at our hotel in Luzern..."><s:property value="content" /></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                    </div>
                                                </div>
                                            </s:iterator>
                                            <div data-id=""
                                                 data-repeater-item class="itinerary form-group draggable m-form__group row align-items-center">
                                                <div class="m-portlet m-portlet--mobile col-md-12" data-portlet="true">
                                                    <div class="m-portlet__head">
                                                        <div class="m-portlet__head-caption">
                                                            <div class="m-portlet__head-title">
                                                                <h3 class="m-portlet__head-text">
                                                                    Title
                                                                </h3>
                                                                <input style="margin: 15px 0px 0px 15px;" type="text" class="form-control m-input"
                                                                       name="itineraryTitle" required
                                                                       minlength="10" maxlength="50" placeholder="Day 1: Arrive in Zurich...">
                                                            </div>
                                                        </div>
                                                        <div class="m-portlet__head-tools">
                                                            <ul class="m-portlet__nav">
                                                                <li class="m-portlet__nav-item">
                                                                    <a data-portlet-tool="toggle" class="m-portlet__nav-link m-portlet__nav-link--icon"><i class="la la-angle-down"></i></a>
                                                                </li>
                                                                <li class="m-portlet__nav-item">
                                                                    <a data-portlet-tool="save" class="m-portlet__nav-link m-portlet__nav-link--icon"><i class="la la-check-circle-o"></i></a>
                                                                </li>
                                                                <li class="m-portlet__nav-item">
                                                                    <a data-portlet-tool="delete" data-repeater-delete="" class="m-portlet__nav-link m-portlet__nav-link--icon"><i class="la la-close"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="m-portlet__body" style="padding: 2.2rem;">
                                                        <label>Description:</label>
                                                        <textarea required
                                                                  minlength="10" maxlength="400"  name="itineraryContent" class="form-control m-input" rows="3"
                                                                  placeholder="We’ll meet at 4 p.m. at our hotel in Luzern..."></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="m-form__group form-group row">
                                        <div class="col-lg-4">
                                            <div data-repeater-create="" class="btn btn btn-sm btn-brand m-btn m-btn--icon m-btn--pill m-btn--wide">
                                                            <span>
                                                                <i class="la la-plus"></i>
                                                                <span>Add</span>
                                                            </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
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

    jQuery.validator.addMethod("dayAndNight", function(value, element) {
        var day = parseInt($('input[name=numberOfDays]').val());
        var night = parseInt($('input[name=numberOfNights]').val());
        return this.optional(element) || Math.abs(day-night) <=1;
    }, "* Number of days and nights must be at most 1 apart.");

    var tourId = '<s:property value="tourDTO.id" />';

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

        var id = '<s:property value="tourDTO.id" />';
        var formEl = $('#m_form');
        var validator = formEl.validate({
            //== Validate only visible fields
            ignore: ":hidden",

            //== Validation rules
            rules: {
                //=== Client Information(step 1)
                //== Basic information
                title: {
                    required: true,
                    minlength: 10,
                    maxlength: 60,
                },
                categories: {
                    required: true,
                },
                locations: {
                    required: true,
                },
                numberOfDays: {
                    required: true,
                    min: 1,
                    max: 100,
                    digits: true,
                    dayAndNight: true,
                },
                numberOfNights: {
                    required: true,
                    min: 0,
                    max: 100,
                    digits: true,
                    dayAndNight: true,
                },
                description: {
                    required: true,
                    minlength: 10,
                    maxlength: 200,
                },

                //=== Dates and Prices(step 2)
                //== Account Details
                adultPrice: {
                    required: true,
                    min: 0,
                },
                childPrice: {
                    required: true,
                    min: 0,
                },
                startDates: {
                    required: true,
                },
                seat: {
                    required: true,
                    min: 10,
                    max: 200,
                    digits: true,
                },



                //=== Itinerary (step 4)
                itineraryTitle: {
                    required: true,
                    minLength: 10,
                    maxLength: 50
                },
                itineraryContent: {
                    required: true,
                    minLength: 10,
                    maxLength: 300
                },
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
            data.id = tourId;
            $.ajax({
                url: "<s:url value="/administrator/EditTourAction" />",
                method: "POST",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function(data) {
                    if (success) {
                        success();
                    } else {
                        toastr.success("Successfully updated tour.");
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


        $('#categories')
            .select2()
            .on('select2:select', function(e){
                $.ajax({
                    url: "<s:url value="/administrator/AddCategoriesToTourAction" />",
                    method: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        tourId: tourId,
                        categoryId: $(e.params.data.element).attr('value'),
                    }),
                    success: function(data) {
                        toastr.success("Successfully updated tour.");
                    },
                    error: function() {
                        toastr.error("Could not update. Please try again.");
                    }
                });
        }).on('select2:unselect', function(e){
            $.ajax({
                url: "<s:url value="/administrator/RemoveCategoriesFromTourAction" />",
                method: "POST",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify({
                    tourId: tourId,
                    categoryId: $(e.params.data.element).attr('value'),
                }),
                success: function(data) {
                    toastr.success("Successfully updated tour.");
                },
                error: function() {
                    toastr.error("Could not update. Please try again.");
                }
            });
        });

        let procChangeEvent = true;
        $('#start-dates').datepicker({
            autoclose: true,
            todayHighlight: true,
            multidate: false,
            orientation: "bottom left",
            templates: {
                leftArrow: '<i class="la la-angle-left"></i>',
                rightArrow: '<i class="la la-angle-right"></i>'
            },
            beforeShowDay: (date) => date > new Date(),
        }).on('changeDate', function(e){
            let chosenDate = $(this).datepicker('getUTCDate');
            if (!chosenDate) {
                return;
            }
            chosenDate.setTime(chosenDate.getTime() - chosenDate.getTimezoneOffset()*60*1000);
            let that = this; //closure
            $.ajax({
                url: "<s:url value="/administrator/AddDateToTourAction" />",
                method: "POST",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify({
                    tourId,
                    date: chosenDate,
                }),
                success: function(data) {
                    let addedDate = data.formattedDate;
                    $('.date-zone').prepend(`<div class="col-lg-4 p-3">\
                        <div data-value="3/13/18" data-id="5" class="alert alert-brand alert-dismissible fade show\
                            m-alert m-alert--air" role="alert">\
                            <button type="button" class="close remove-day" aria-label="Close">\
                                <i class="la la-remove"></i>\
                            </button>` +
                            data.formattedDate
                            + `</div>\
                        </div>`);
                    toastr.success("Successfully updated tour.");
                },
                error: function() {
                    toastr.error("Could not update. Please try again.");
                },
                complete: function() {
                    $(that).datepicker('clearDates');
                    procChangeEvent = false;
                }
            });
        });

        $('body').on('click', '.remove-day', function(e){
            $.ajax({
                url: "<s:url value="/administrator/RemoveDateFromTourAction" />",
                method: "POST",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify({
                    tourDateId: $(e.target).closest('div.alert').attr('data-id'),
                }),
                success: function(data) {
                    toastr.success("Successfully updated tour.");
                    $(e.target).closest('div.alert').remove();
                },
                error: function() {
                    toastr.error("Could not update. Please try again.");
                },
            });
        });


        $('.summernote').summernote({
            height: 150
        });

        // file type validation
        Dropzone.options.mDropzoneThree = {
            url: '<s:url value="/administrator/ProcessTourImagesAction" />',
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
                    e.preventDefault();
                    e.stopPropagation();
                    myDropzone.processQueue();
                });

                // Listen to the sendingmultiple event. In this case, it's the sendingmultiple event instead
                // of the sending event because uploadMultiple is set to true.
                this.on("sendingmultiple", function(file, xhr, formData) {
                    // Gets triggered when the form is actually being sent.
                    // Hide the success button or the complete form.
                    formData.append('tourId', tourId);
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
                    toastr.success("Successfully added images to tour.");
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
                url: "<s:url value="/administrator/RemoveImageFromTourAction" />",
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

        $('body').on('click', '.m-portlet__nav-link[data-portlet-tool=save]', function(e){
            let $itinerary = $(this).closest('.itinerary');
            if ($itinerary.find('input[type=text]').valid() && $itinerary.find('textarea').valid()) {
                let id = $itinerary.attr('data-id');
                let title = $itinerary.find('input[type=text]').val().trim();
                let content = $itinerary.find('textarea').val().trim();
                $.ajax({
                    url: "<s:url value="/administrator/EditTourItineraryAction" />",
                    method: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        id,
                        title,
                        content,
                        tourId
                    }),
                    success: function(data) {
                        toastr.success("Successfully updated tour.");
                        $(e.target).closest('div.alert').remove();
                    },
                    error: function() {
                        toastr.error("Could not update. Please try again.");
                    },
                });
            }
        });

        $('body').on('click', '.m-portlet__nav-link[data-portlet-tool=delete]', function(e){
            let $itinerary = $(this).closest('.itinerary');
            let id = $itinerary.attr('data-id');
            if (id) {
                $.ajax({
                    url: "<s:url value="/administrator/RemoveItineraryFromTourAction" />",
                    method: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        id,
                    }),
                    success: function(data) {
                        toastr.success("Successfully removed itinerary item from tour.");
                        $(e.target).closest('.itinerary').remove();
                    },
                    error: function() {
                        toastr.error("Could not remove. Please try again.");
                    },
                });
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
            cancel: ".m-portlet--sortable-empty, input, .m-portlet__head-tools", // cancel dragging if portlet is in fullscreen mode
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
                cache: true,
            },
            escapeMarkup: function(markup) {
                return markup;
            }, // let our custom formatter work
            minimumInputLength: 1,
            templateResult: formatItem, // omitted for brevity, see the source of this page
            templateSelection: formatRepoSelection,
        }).on('select2:select', function(e){
            let locationId = e.params.data.id;
            $.ajax({
                url: "<s:url value="/administrator/AddTourLocationAction" />",
                method: "POST",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify({
                    tourId,
                    locationId,
                }),
                success: function(data) {
                    toastr.success("Successfully updated tour.");
                },
                error: function() {
                    toastr.error("Could not update. Please try again.");
                }
            });
        }).on('select2:unselect', function(e){
            let locationId = e.params.data.id;
            $.ajax({
                url: "<s:url value="/administrator/RemoveTourLocationAction" />",
                method: "POST",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify({
                    tourId,
                    locationId,
                }),
                success: function(data) {
                    toastr.success("Successfully updated tour.");
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
//            if (item.parent) {
//                markup += "<div class='select2-result-repository__description'><i class='fa fa-flash'></i> &nbsp;" + item.parent.name + "</div>";
//            }
            markup += "</div></div>";
            return markup;
        }
        function formatRepoSelection(repo) {
            return repo.name || repo.text;
        }

        function formatRepo(repo) {
            if (repo.loading) return repo.text;
            var markup = "<div class='select2-result-repository clearfix'>" +
                "<div class='select2-result-repository__meta'>" +
                "<div class='select2-result-repository__title'>" + repo.full_name + "</div>";
            if (repo.description) {
                markup += "<div class='select2-result-repository__description'>" + repo.description + "</div>";
            }
            markup += "<div class='select2-result-repository__statistics'>" +
                "<div class='select2-result-repository__forks'><i class='fa fa-flash'></i> " + repo.forks_count + " Forks</div>" +
                "<div class='select2-result-repository__stargazers'><i class='fa fa-star'></i> " + repo.stargazers_count + " Stars</div>" +
                "<div class='select2-result-repository__watchers'><i class='fa fa-eye'></i> " + repo.watchers_count + " Watchers</div>" +
                "</div>" +
                "</div></div>";
            return markup;
        }

    });

</script>


</body>
<!-- end::Body -->

<!-- Mirrored from keenthemes.com/metronic/preview/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 22 Feb 2018 11:55:21 GMT -->
</html>