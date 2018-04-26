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
                            Create New Tour
                            <small>Form Wizard</small>
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
                <!--begin: Form Wizard Head -->
                <div class="m-wizard__head m-portlet__padding-x">
                    <!--begin: Form Wizard Progress -->
                    <div class="m-wizard__progress">
                        <div class="progress">
                            <div class="progress-bar" role="progressbar"  aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <!--end: Form Wizard Progress -->
                    <!--begin: Form Wizard Nav -->
                    <div class="m-wizard__nav">
                        <div class="m-wizard__steps">
                            <div class="m-wizard__step m-wizard__step--current"  data-wizard-target="#m_wizard_form_step_1">
                                <a href="#"  class="m-wizard__step-number">
                                    <span><i class="fa  flaticon-placeholder"></i></span>
                                </a>
                                <div class="m-wizard__step-info">
                                    <div class="m-wizard__step-title">
                                        1. Basic Information
                                    </div>
                                    <div class="m-wizard__step-desc">
                                        The most basic information<br>
                                        for your tour
                                    </div>
                                </div>
                            </div>
                            <div class="m-wizard__step" data-wizard-target="#m_wizard_form_step_2">
                                <a href="#" class="m-wizard__step-number">
                                    <span><i class="fa  flaticon-layers"></i></span>
                                </a>
                                <div class="m-wizard__step-info">
                                    <div class="m-wizard__step-title">
                                        2. Dates and Prices
                                    </div>
                                    <div class="m-wizard__step-desc">
                                        How much a seat will cost<br>
                                        When the tour will take place
                                    </div>
                                </div>
                            </div>
                            <div class="m-wizard__step" data-wizard-target="#m_wizard_form_step_3">
                                <a href="#" class="m-wizard__step-number">
                                    <span><i class="fa  flaticon-layers"></i></span>
                                </a>
                                <div class="m-wizard__step-info">
                                    <div class="m-wizard__step-title">
                                        3. Details
                                    </div>
                                    <div class="m-wizard__step-desc">
                                        Detailed descriptions<br>
                                        about the tour
                                    </div>
                                </div>
                            </div>
                            <div class="m-wizard__step" data-wizard-target="#m_wizard_form_step_4">
                                <a href="#" class="m-wizard__step-number">
                                    <span><i class="fa  flaticon-layers"></i></span>
                                </a>
                                <div class="m-wizard__step-info">
                                    <div class="m-wizard__step-title">
                                        4. Itinerary
                                    </div>
                                    <div class="m-wizard__step-desc">
                                        The day by day<br>
                                        events of your tour
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end: Form Wizard Nav -->
                </div>
                <!--end: Form Wizard Head -->
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
                                                <h3 class="m-form__heading-title">Title</h3>
                                            </div>
                                            <div class="form-group m-form__group row">
                                                <label class="col-xl-3 col-lg-3 col-form-label">* Title:</label>
                                                <div class="col-xl-9 col-lg-9">
                                                    <input type="text" name="title" class="form-control m-input"
                                                           autocomplete="off">
                                                    <span class="m-form__help">The title should be from 10 to 80 characters.</span>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group row">
                                                <label class="col-form-label col-lg-3 col-sm-12">* Categories</label>
                                                <div class="col-lg-9 col-md-9 col-sm-12">
                                                    <select autocomplete="off" class="form-control m-select2"
                                                            id="categories" name="categories" multiple="multiple" value="">
                                                        <s:iterator value="categories">
                                                            <option value="<s:property value="id" />"><s:property value="name" /></option>
                                                        </s:iterator>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group row">
                                                <label class="col-form-label col-lg-3 col-sm-12">Locations</label>
                                                <div class="col-lg-9 col-md-9 col-sm-12">
                                                    <select class="form-control m-select2" id="locations" name="locations" multiple="multiple">
                                                        <option></option>
                                                    </select>
                                                    <span class="m-form__help">Las Vegas, Rome, Paris, Seoul, etc.</span>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group row">
                                                <div class="col-12 col-lg-6">
                                                    <div class="form-group m-form__group">
                                                        <label>Number of days</label>
                                                        <div class="input-group">
                                                            <input type="number" name="day" class="form-control m-input" min="1" max="100"
                                                                   placeholder="" aria-describedby="basic-addon2">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-lg-6">
                                                    <div class="form-group m-form__group">
                                                        <label>Number of nights</label>
                                                        <div class="input-group">
                                                            <input type="number" name="night" class="form-control m-input" min="0" max="100"
                                                                   placeholder="" aria-describedby="basic-addon2">
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
                            <!--begin: Form Wizard Step 2-->
                            <div class="m-wizard__form-step" id="m_wizard_form_step_2">
                                <div class="row">
                                    <div class="col-xl-8 offset-xl-2">
                                        <div class="m-form__section m-form__section--first">
                                            <div class="m-form__heading">
                                                <h3 class="m-form__heading-title">Dates and Prices</h3>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-lg-6">
                                                    <div class="form-group m-form__group">
                                                        <label>Adult price</label>
                                                        <div class="input-group">
                                                            <input type="text" name="adultPrice" class="form-control m-input" placeholder="" aria-describedby="basic-addon2">
                                                            <div class="input-group-append"><span class="input-group-text">$</span></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-lg-6">
                                                    <div class="form-group m-form__group">
                                                        <label>Child price</label>
                                                        <div class="input-group">
                                                            <input type="text" name="childPrice" class="form-control m-input" placeholder="" aria-describedby="basic-addon2">
                                                            <div class="input-group-append"><span class="input-group-text">$</span></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-12">
                                                    <label>*Number of seats a tour:</label>
                                                    <div>
                                                        <input required name="seat" class="form-control m-input" value="20" max="200" min="20" type="number">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end: Form Wizard Step 2-->
                            <!--begin: Form Wizard Step 3-->
                            <div class="m-wizard__form-step" id="m_wizard_form_step_3">
                                <div class="row">
                                    <div class="col-xl-8 offset-xl-2">
                                        <!--begin::Section-->
                                        <div class="m-form__section m-form__section--first">
                                            <div class="m-form__heading">
                                                <h3 class="m-form__heading-title">Gallery</h3>
                                            </div>
                                            <div class="form-group m-form__group row">
                                                <label class="col-form-label col-lg-3 col-sm-12">The tour's images:</label>
                                                <div class="col-lg-4 col-md-9 col-sm-12">
                                                    <div class="m-dropzone dropzone m-dropzone--success" id="m-dropzone-three">
                                                        <div class="m-dropzone__msg dz-message needsclick">
                                                            <h3 class="m-dropzone__msg-title">Drop files here or click to upload.</h3>
                                                            <span class="m-dropzone__msg-desc">Only image, pdf and psd files are allowed for upload</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--begin::Section-->
                                        <div class="m-form__section m-form__section--first">
                                            <div class="m-form__heading">
                                                <h3 class="m-form__heading-title">Details</h3>
                                            </div>
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-12">
                                                    <label>Highlights:</label>
                                                    <span class="m-form__help">The best that the tour will offer.</span>
                                                    <div class="summernote" id="highlights"></div>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-12">
                                                    <label>What to expect:</label>
                                                    <span class="m-form__help">Help your tourists prepare for the tour.</span>
                                                    <div class="summernote" id="what-to-expect"></div>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-12">
                                                    <label>Inclusions:</label>
                                                    <span class="m-form__help">Specify what this tour will <em>and</em> will not provide.</span>
                                                    <div class="summernote" id="inclusions"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end: Form Wizard Step 3-->

                            <!--begin: Form Wizard Step 4-->
                            <div class="m-wizard__form-step" id="m_wizard_form_step_4">
                                <div class="row">
                                    <div class="col-xl-8 offset-xl-2">
                                        <!--begin::Section-->
                                        <div class="m-form__section m-form__section--first">
                                            <div class="m-form__heading">
                                                <h3 class="m-form__heading-title">Itinerary</h3>
                                            </div>
                                            <div id="m_repeater_1">
                                                <div class="form-group  m-form__group row" id="m_repeater_1">
                                                    <div data-repeater-list="" class="col-lg-12">
                                                        <div data-repeater-item class="itinerary form-group draggable m-form__group row align-items-center">
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
                                                                                <a data-portlet-tool="remove" data-repeater-delete="" class="m-portlet__nav-link m-portlet__nav-link--icon"><i class="la la-close"></i></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="m-portlet__body">
                                                                    <label for="textarea">Description:</label>
                                                                    <textarea id="textarea" required
                                                                              minlength="10" maxlength="400"  name="itineraryContent" class="form-control m-input" rows="3"
                                                                              placeholder="We’ll meet at 4 p.m. at our hotel in Luzern..."></textarea>
                                                                    <%--<div data-repeater-delete="" class="my-3 float-right btn-sm btn btn-danger m-btn m-btn--icon m-btn--pill">--%>
                                                                            <%--<span>--%>
                                                                                <%--<i class="la la-trash-o"></i>--%>
                                                                                <%--<span>Delete</span>--%>
                                                                            <%--</span>--%>
                                                                    <%--</div>--%>
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
                            </div>
                            <!--end: Form Wizard Step 4-->
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
                                        <a href="#" class="btn-submit-tour btn btn-primary m-btn m-btn--custom m-btn--icon" data-wizard-action="submit">
                                <span>
                                <i class="la la-check"></i>&nbsp;&nbsp;
                                <span>Submit</span>
                                </span>
                                        </a>
                                        <a href="#" class="btn btn-warning m-btn m-btn--custom m-btn--icon" data-wizard-action="next">
                                <span>
                                <span>Continue</span>&nbsp;&nbsp;
                                <i class="la la-arrow-right"></i>
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

    <script src="/AdminPages/assets/vendors/custom/jquery-ui/jquery-ui.bundle.js" type="text/javascript"></script>
<!--end::Page Resources -->
<script>
    $(document).ready(function(e){
        $('#categories').select2();
    });

    jQuery.validator.addMethod("dayAndNight", function(value, element) {
        var day = parseInt($('input[name=day]').val());
        var night = parseInt($('input[name=night]').val());
        return this.optional(element) || Math.abs(day-night) <=1;
    }, "* Number of days and nights must be at most 1 apart.");

    var tourId;
    var titleUrl;

    //== Class definition
    var NewTourWizard = function () {
        //== Base elements
        var wizardEl = $('#m_wizard');
        var formEl = $('#m_form');
        var validator;
        var wizard;

        //== Private functions
        var initWizard = function () {
            //== Initialize form wizard
            wizard = wizardEl.mWizard({
                startStep: 1
            });

            //== Validation before going to next page
            wizard.on('beforeNext', function(wizard) {
                if (validator.form() !== true) {
                    return false;  // don't go to the next step
                }
            })

            //== Change event
            wizard.on('change', function(wizard) {
                mApp.scrollTop();
            });
        };

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
                        minlength: 10,
                        maxlength: 80,
                    },
                    categories: {
                        required: true,
                    },
                    locations: {
                        required: true,
                    },
                    day: {
                        required: true,
                        min: 1,
                        max: 100,
                        digits: true,
                        dayAndNight: true,
                    },
                    night: {
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
                        min: 20,
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
        }

        var initSubmit = function() {
            var btn = formEl.find('[data-wizard-action="submit"]');

            btn.on('click', function(e) {
                e.preventDefault();

                if (validator.form()) {
                    //== See: src\js\framework\base\app.js
                    mApp.progress(btn);
                    //mApp.block(formEl);

                    var title = $('input[name=title]').val();
                    var categories = $('#categories').select2('val');
                    var locations = $('#locations').select2('val');
                    var day = $('input[name=day]').val();
                    var night = $('input[name=night]').val();
                    var adultPrice = $('input[name=adultPrice]').val();
                    var childPrice = $('input[name=childPrice]').val();
                    var seatTotal = $('input[name=seat]').val();
                    var startDates = $('#start-dates').datepicker('getDates');
                    var highlights = $('#highlights').summernote('code');
                    var whatYouCanExpect = $('#what-to-expect').summernote('code');
                    var inclusions = $('#inclusions').summernote('code');
                    var description = $('#description').summernote('code');
                    var itinerary = [];
                    $('.itinerary').each((i, el) => {
                        var title = $(el).find('input[type=text]').val();
                        var content = $(el).find('textarea').val();

                        itinerary.push({
                            title,
                            content,
                            order: i
                        });
                    });

                    $.ajax({
                       method: 'POST',
                       url: '<s:url value="CreateNewTour" />',
                        dataType: 'json',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            title,
                            categories,
                            locations,
                            numberOfDays: day,
                            numberOfNights: night,
                            adultPrice,
                            childPrice,
                            seatTotal,
                            startDates,
                            highlights,
                            whatYouCanExpect,
                            inclusions,
                            description,
                            itinerary
                        }),
                        success: function(data) {
                            mApp.unprogress(btn);
                            //mApp.unblock(formEl);

                            tourId = data.id;
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
                wizardEl = $('#m_wizard');
                formEl = $('#m_form');

                initWizard();
                initValidation();
                initSubmit();
            }
        };
    }();

    Dropzone.autoDiscover = false;
    jQuery(document).ready(function() {
        NewTourWizard.init();

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
            url: '<s:url value="ProcessTourImagesAction" />',
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
                    $('.btn-submit-tour').hide();
                    swal({
                        "title": "",
                        "text": "Successfully created tour. Redirecting you to its dashboard...",
                        "type": "success",
                        "confirmButtonClass": "btn btn-secondary m-btn m-btn--wide",
                    });
                    setTimeout(function(){
                        var contextPath = "${pageContext.request.contextPath}"
                        window.location = contextPath + '/administrator/edit-tour/'+titleUrl;
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
            placeholder: function() {
                return 'Location';
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
//            if (item.parent) {
//                markup += "<div class='select2-result-repository__description'><i class='fa fa-flash'></i> &nbsp;" + item.parent.name + "</div>";
//            }
            markup += "</div></div>";
            return markup;
        }

        function formatRepoSelection(item) {
            return item.name || item.text;
        }


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
    });

</script>


</body>
<!-- end::Body -->

<!-- Mirrored from keenthemes.com/metronic/preview/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 22 Feb 2018 11:55:21 GMT -->
</html>