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
    <title><s:property value="%{tourDTO.title}"></s:property> - Star Travel</title>

    <s:include value="/global/GlobalCSS.jsp"></s:include>
</head>


<body class="body-wrapper ">
<div class="main-wrapper">
    <s:include value="/global/Header.jsp"></s:include>

    <!-- PAGE TITLE -->
    <section class="pageTitle" style="background-image:url(<s:url value="/img/pages/page-title-bg13.jpg" />);">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="titleTable">
                        <div class="titleTableInner">
                            <div class="pageTitleInfo">
                                <span>
                                    <h1><s:property value="%{tourDTO.title}"/></h1>
                                </span>
                                <p>
                                    <s:property value="%{tourDTO.numberOfDays}" />
                                    <s:if test="tourDTO.numberOfDays > 1">days</s:if><s:else>day</s:else>
                                    <s:if test="tourDTO.numberOfNights > 0">
                                        <s:property value="%{tourDTO.numberOfNights}" />
                                        <s:if test="tourDTO.numberOfNights > 1">nights</s:if><s:else>night</s:else>
                                    </s:if>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- PAGE CONTENT -->
    <section class="mainContentSection singlePackage">
        <div class="container">
            <div class="row ">
                <div class="col-sm-8 col-xs-12">
                    <div class="row">
                        <div class="col-xs-12">
                            <s:if test="!tourDTO.images.isEmpty()">
                                <div id="package-carousel" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <s:iterator status="stat" value="tourDTO.images">
                                            <li data-target="#package-carousel" <s:if test="#stat.index == 0">class="active"</s:if>
                                                data-slide-to="<s:property value="#stat.index" />" class=""></li>
                                        </s:iterator>
                                    </ol>
                                    <div class="carousel-inner">
                                        <s:iterator status="stat" value="tourDTO.images">
                                            <div style="max-height: 450px; overflow-y: hidden;" class="item <s:if test="#stat.index == 0">active</s:if>">
                                                <img width="100%" src="<s:url value="%{value}" />">
                                            </div>
                                        </s:iterator>
                                    </div>
                                    <a class="left carousel-control" href="#package-carousel" data-slide="prev"><span class="glyphicon glyphicon-menu-left"></span></a>
                                    <a class="right carousel-control" href="#package-carousel" data-slide="next"><span class="glyphicon glyphicon-menu-right"></span></a>
                                </div>
                            </s:if>
                        </div>
                        <div class="col-xs-12">
                            <div class="category-chips">
                                <s:iterator var="cat" value="%{tourDTO.getCategories}">
                                    <a href="#"><span class="chip"><s:property value="#cat.name"></s:property></span></a>
                                </s:iterator>
                            </div>
                            <s:if test="%{#session.USER.role == @chau.consts.Consts$ROLE_STATUS@ADMIN.value}">
                                <div style="text-align: right;">
                                    <a style="font-size: 14px; text-decoration: underline;" target="_blank"
                                       href="<s:url value="/administrator/edit-tour/%{tourDTO.titleUrl}" />"><em>Edit this Tour</em></a>
                                </div>
                            </s:if>
                            <div>

                            </div>
                            <div class="description-aria">
                                <div class="sectionTitle2">
                                    <h2>Description</h2>
                                    <p>
                                        <s:property escapeHtml="false" value="%{tourDTO.description}" />
                                    </p>
                                </div>
                                <div class="sectionTitle2">
                                    <h2>Highlights</h2>
                                    <p>
                                        <s:property escapeHtml="false" value="%{tourDTO.highlights}" />
                                    </p>
                                </div>
                                <div class="sectionTitle2">
                                    <h2>What you can expect</h2>
                                    <p>
                                        <s:property escapeHtml="false" value="%{tourDTO.whatYouCanExpect}" />
                                    </p>
                                </div>
                                <div class="sectionTitle2">
                                    <h2>Inclusions</h2>
                                    <p>
                                        <s:property escapeHtml="false" value="%{tourDTO.inclusions}" />
                                    </p>
                                </div>
                                <div class="information-aria">
                                    <h3>Itinerary</h3>
                                    <s:iterator status="stat" value="tourDTO.itinerary">
                                        <div class="singleContent">
                                            <div class="media">
                                                <div class="media-body">
                                                    <h4 class="media-heading"><s:property value="title" /></h4>
                                                    <p>
                                                        <s:property value="content" />
                                                    </p>
                                                </div>
                                                <div class="media-right">
                                                    <div class="days"><s:property value="#stat.count" /></div>
                                                </div>
                                            </div>
                                        </div>
                                    </s:iterator>
                                </div>
                            </div>
                            <%--<div class="location-aria">--%>
                                <%--<div class="sectionTitle2">--%>
                                    <%--<h2>Location</h2>--%>
                                    <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>--%>
                                <%--</div>--%>
                                <%--<div class="google-maps">--%>
                                    <%--<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12097.002861286059!2d-74.01154310416635!3d40.71249695811257!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY!5e0!3m2!1sen!2s!4v1502716241862" width="100%" height="400px" scrolling="no" frameborder="0" style="border:0" allowfullscreen></iframe>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <div class="review-aria">
                                <div class="sectionTitle2">
                                    <h2>Reviews</h2>
                                    <p>What others thought about this tour.</p>
                                </div>
                                <div class="reviewContent">
                                    <h3 class="reviewTitle">
                                        Reviews - <span class="review-count"><s:property value="%{tourDTO.reviews.size()}" /></span>
                                        <span>
                                            <select id="average-rating" value="0" autocomplete="off">
                                                  <option value=""></option>
                                                  <option value="1">1</option>
                                                  <option value="2">2</option>
                                                  <option value="3">3</option>
                                                  <option value="4">4</option>
                                                  <option value="5">5</option>
                                            </select>
                                        </span>
                                    </h3>
                                    <select style="display: none;" class="hide">
                                    </select>
                                    <div class="reviewMedia">
                                        <ul class="media-list">
                                            <s:iterator value="%{tourDTO.reviews}">
                                                <li data-id="<s:property value="%{id}" />" class="media" style="position: relative;">
                                                    <div class="media-left">
                                                        <a href="#">
                                                            <img class="media-object" src="<s:url value="/img/blog/defaultcomment.png" />" alt="Image">
                                                        </a>
                                                    </div>
                                                    <s:if test="%{#session.USER.role == @chau.consts.Consts$ROLE_STATUS@ADMIN.value ||
                                                    #session.USER.id == user.id}">
                                                        <div class="media-right" style="position: absolute; right: 0; top: 0;">
                                                            <span style="cursor: pointer" class="edit-comment"><i class="fa fa-edit"></i></span>
                                                            &nbsp;
                                                            <span style="cursor: pointer" class="remove-comment"><i class="fa fa-close"></i></span>
                                                        </div>
                                                    </s:if>
                                                    <div class="media-body">
                                                        <h5 class="media-heading"><s:property value="user.displayName" /></h5>
                                                        <select autocomplete="off" class="user-rating" value="<s:property value="%{rating}" />">
                                                            <s:iterator status="i" begin="1" end="5">
                                                                <option <s:if test="%{rating == #i.count}">selected="selected"</s:if> value="<s:property value="%{#i.count}" />" >
                                                                    <s:property value="%{#i.count}" />
                                                                </option>
                                                            </s:iterator>
                                                        </select>
                                                        <div class="comment-content"><s:property value="comment" /></div>
                                                    </div>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                    </div>
                                    <s:if test="%{userCanComment}">
                                        <form id="review-form">
                                            <h3 class="reviewTitle">Leave your review</h3>
                                            <p>Rate it:
                                                <select required name="rating" id="review-rating" autocomplete="off">
                                                    <option value=""></option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                </select>
                                            </p>
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div class="form-group">
                                                        <textarea required name="comment" class="form-control" rows="3" placeholder="Comment"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <button class="btn-submit-review btn buttonCustomPrimary">submit</button>
                                        </form>
                                    </s:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <aside class="col-sm-4 col-xs-12">
                    <div class="singleCartSidebar">
                        <div class="panel panel-default">
                            <div class="panel-heading">Booking</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <s:form method="POST" action="AddToCartAction" theme="simple" class="form-horizontal">
                                            <s:hidden name="tourId" value="%{tourDTO.id}"></s:hidden>
                                            <s:hidden name="id" value=""></s:hidden>
                                            <div class="form-group">
                                                <label class="control-label col-md-4 col-sm-12 col-xs-4">Select a date:</label>
                                                <div class="col-md-8 col-sm-12 col-xs-8 datepickerWrap">
                                                    <div class="input-group date ed-datepicker filterDate" data-provide="datepicker">
                                                        <s:textfield name="date" cssClass="form-control tour-date" placeholder="MM/DD/YYYY" value=""
                                                        autocomplete="off" />
                                                        <div class="input-group-addon">
                                                            <span class="fa fa-calendar"></span>
                                                        </div>
                                                    </div>
                                                    <div class="hide total-seat-left" style="text-align: left; padding-top: 10px;">
                                                        <span class="total-seat-left-count">40</span> <span class="seat-word">seats</span> left.
                                                    </div>
                                                    <div class="hide no-tour-this-day" style="text-align: left; padding-top: 10px;">
                                                        No tour this day.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4 col-sm-12 col-xs-4">Adults:</label>
                                                <div class="col-md-5 col-sm-12 col-xs-8 datepickerWrap">
                                                    <div class="count-input">
                                                        <a class="incr-btn" data-action="decrease" href="#">-</a>
                                                        <s:textfield name="adultCount" cssClass="adult-count quantity" type="text" value="1" />
                                                        <a class="incr-btn" data-action="increase" href="#">+</a>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                    <p class="price">
                                                        $<s:property value="getText('{0,number,#,##0.00}',{tourDTO.adultPrice})"></s:property>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4 col-sm-12 col-xs-4" for="inputSuccess3">Children:</label>
                                                <div class="col-md-5 col-sm-12 col-xs-8 datepickerWrap">
                                                    <div class="count-input">
                                                        <a class="incr-btn" data-action="decrease" href="#">-</a>
                                                        <s:textfield name="childCount" cssClass="child-count quantity" type="text" value="1" />
                                                        <a class="incr-btn" data-action="increase" href="#">+</a>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                    <p class="price">
                                                        $<s:property value="getText('{0,number,#,##0.00}',{tourDTO.childPrice})"></s:property>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="totalCost">
                                                <div class="col-xs-8 totalCostLeft">
                                                    <p>Total Cost</p>
                                                </div>
                                                <div class="col-xs-4 totalCostRight">
                                                    $<span class="total">
                                                    <s:property value="getText('{0,number,#,##0.00}',{tourDTO.adultPrice})"></s:property>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 general-add-errors">
                                                <ul>
                                                </ul>
                                            </div>
                                            <div class="col-sm-12">
                                                <s:submit cssClass="btn btn-add-cart btn-block btn-disabled
                                                 buttonCustomPrimary hover-black" disabled="true" value="Add to cart">Add to cart</s:submit>
                                            </div>
                                            <div class="col-sm-12">
                                                <a href="#" class="btn btn-wishlist btn-block buttonBordered" style="margin-top: 15px">Add to wishlist<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                            </div>
                                        </s:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </section>
    <s:if test="%{#session.USER != null}">
        <section class="mainContentSection">
            <div class="container">
                <div class="row">
                    <div class="sectionTitle2">
                        <h2>Inquiry</h2>
                        <p>Send your questions about this tour.</p>
                    </div>
                    <div class="col-sm-6 col-md-7 col-xs-12 col-lg-8">
                        <div class="contactForm">
                            <form id="inquiry" method="POST" role="form" class="form">
                                <div class="form-group">
                                    <input name="title" type="text" class="form-control" placeholder="Title">
                                </div>
                                <div class="form-group">
                                    <textarea name="content" class="form-control" placeholder="Your Message"></textarea>
                                </div>
                                <button type="submit" class="btn-send-message btn buttonCustomPrimary">send message</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </s:if>
    <section class="relatedSection">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="sectionTitle2">
                        <h2>you may also like</h2>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 col-xs-12">
                    <div class="thumbnail deals">
                        <img src="img/home/deal/deal-01.jpg" alt="deal-image">
                        <a href="single-package-right-sidebar.html" class="pageLink"></a>
                        <div class="discountInfo discountCol-3">
                            <div class="discountOffer">
                                <h4>
                                    45% <span>OFF</span>
                                </h4>
                            </div>
                            <ul class="list-inline rating homePage">
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>
                            <ul class="list-inline duration">
                                <li>7 days</li>
                                <li>15 hrs</li>
                                <li>15 min</li>
                            </ul>
                        </div>
                        <div class="caption">
                            <h4><a href="single-package-right-sidebar.html" class="captionTitle">France / europe</a></h4>
                            <p>Integer purus ex, dictum nec elementum eu, tristique vel lectus. Donec rutrum lectus et pharetra egestas.</p>
                            <div class="detailsInfo">
                                <h5>
                                    <span>Start From</span>
                                    $299
                                </h5>
                                <ul class="list-inline detailsBtn">
                                    <li><a href="single-package-fullwidth.html" class="btn buttonTransparent">Details</a></li>
                                    <li><a href="#" class="btn buttonTransparent"><i class="fa fa-map-marker" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 col-xs-12">
                    <div class="thumbnail deals">
                        <img src="img/home/deal/deal-02.jpg" alt="deal-image">
                        <a href="single-package-right-sidebar.html" class="pageLink"></a>
                        <div class="discountInfo discountCol-3">
                            <div class="discountOffer">
                                <h4>
                                    45% <span>OFF</span>
                                </h4>
                            </div>
                            <ul class="list-inline rating homePage">
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>
                            <ul class="list-inline duration">
                                <li>7 days</li>
                                <li>15 hrs</li>
                                <li>15 min</li>
                            </ul>
                        </div>
                        <div class="caption">
                            <h4><a href="single-package-right-sidebar.html" class="captionTitle">France / europe</a></h4>
                            <p>Integer purus ex, dictum nec elementum eu, tristique vel lectus. Donec rutrum lectus et pharetra egestas.</p>
                            <div class="detailsInfo">
                                <h5>
                                    <span>Start From</span>
                                    $299
                                </h5>
                                <ul class="list-inline detailsBtn">
                                    <li><a href="single-package-fullwidth.html" class="btn buttonTransparent">Details</a></li>
                                    <li><a href="#" class="btn buttonTransparent"><i class="fa fa-map-marker" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 col-xs-12">
                    <div class="thumbnail deals">
                        <img src="img/home/deal/deal-03.jpg" alt="deal-image">
                        <a href="single-package-right-sidebar.html" class="pageLink"></a>
                        <div class="discountInfo discountCol-3">
                            <div class="discountOffer">
                                <h4>
                                    45% <span>OFF</span>
                                </h4>
                            </div>
                            <ul class="list-inline rating homePage">
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>
                            <ul class="list-inline duration">
                                <li>7 days</li>
                                <li>15 hrs</li>
                                <li>15 min</li>
                            </ul>
                        </div>
                        <div class="caption">
                            <h4><a href="single-package-right-sidebar.html" class="captionTitle">France / europe</a></h4>
                            <p>Integer purus ex, dictum nec elementum eu, tristique vel lectus. Donec rutrum lectus et pharetra egestas.</p>
                            <div class="detailsInfo">
                                <h5>
                                    <span>Start From</span>
                                    $299
                                </h5>
                                <ul class="list-inline detailsBtn">
                                    <li><a href="single-package-fullwidth.html" class="btn buttonTransparent">Details</a></li>
                                    <li><a href="#" class="btn buttonTransparent"><i class="fa fa-map-marker" aria-hidden="true"></i></a></li>
                                </ul>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){
        var availableDates = [];
        var tourId = '<s:property value="%{tourDTO.id}"></s:property>';
        var adultPrice = <s:property value="%{tourDTO.adultPrice}"></s:property>;
        var childPrice = <s:property value="%{tourDTO.childPrice}"></s:property>;
        var thisDate;


        <s:iterator var="date" value="%{tourDTO.startDates}">
            <s:set var="today" value="%{today}"/>
            <s:set var="tourDate" value="value" />
            <s:if test="#today.before(#tourDate)">
                thisDate = new Date("<s:property value="value" />");
                thisDate.setTime(thisDate.getTime() - thisDate.getTimezoneOffset()*60*1000);
                availableDates.push({
                    id: '<s:property value="key" />',
                    date: thisDate,
                });
            </s:if>
        </s:iterator>

        var getIdFromDate = function(date) {
            availableDates.forEach((i, el) =>   {
                console.log(i,el);
            });
            return availableDates.filter((item) => item.date.getTime() === date.getTime())[0].id;
        };

        $('input[type="text"]').prop('autocomplete','off');
        $('.adult-count.quantity').val(1);
        $('.child-count.quantity').val(0);

        var validate = function() {
            var adultQty = parseInt($('.adult-count.quantity').val());
            var childQty = parseInt($('.child-count.quantity').val());
            var date = $('.ed-datepicker').datepicker('getDate');
            var total = parseInt($('.total-seat-left-count').html());
            var errs = [];
            if (!availableDay) {
                errs.push('Please select an available date.');
            }
            if (adultQty == 0) {
                errs.push('Must have at least one adult passenger.');
            }
            if (adultQty < childQty) {
                errs.push('Must have at least one adult per child.');
            }

            if (adultQty + childQty > total) {
                errs.push('There\'s not enough seat left!');
            }

            $('.general-add-errors ul').html('');
            errs.forEach(function(el, i){
                var $span = $('<li class="square">');
                $span.html(el);
                $('.general-add-errors ul').append($span);
            });

            $('.btn-add-cart').prop('disabled', errs.length).toggleClass('btn-disabled', errs.length > 0);
        };

        var availableDay = false;

        $(".ed-datepicker").datepicker({
            format: "dd/mm/yyyy",
            autoclose: true,
            orientation: "top auto",
            todayBtn: true,
            todayHighlight: false,
            weekStart: 1,
            beforeShowDay: function(date) {
                var enabled = availableDates.map(d => d.date.getTime()).includes(date.getTime() - date.getTimezoneOffset()*60*1000);
                return {
                    enabled: enabled,
                    classes: enabled ? 'enabled' : '',
                    tooltip: enabled ? '' : 'No tour this day',
                };
            }
        }).on('hide', function(e){
        }).on('changeMonth', function(e){
        }).on('show', function(e){
        }).on('clearDate', function(e){
        }).on('changeDate', function(e){
            if (e.date) {
                var date = e.date;
                date.setTime(date.getTime() - date.getTimezoneOffset()*60*1000);
                if (availableDates.map(item => item.date.getTime()).includes(date.getTime())) {
                    var tourDateId = availableDates.filter(item => item.date.getTime() === date.getTime())[0].id;
                } else {
                    return;
                }
                $.ajax({
                    method: "POST",
                    url: '<s:url value="/GetSeatCountAction" />',
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify({
//                        date,
//                        tourId,
                        tourDateId,
                    }),
                    success: function(data) {
                        var count = data.seatCount;
                        availableDay = count > 0;
                        if (count > -1) {
                            $('.total-seat-left').removeClass('hide');
                            $('.no-tour-this-day').addClass('hide');
                            if (count == 0 || count == 1) {
                                $('.total-seat-left').find('.seat-word').html('seat');
                            } else {
                                $('.total-seat-left').find('.seat-word').html('seats');
                            }
                            $('.total-seat-left-count').html(count);
                        } else {
                            $('.no-tour-this-day').removeClass('hide');
                            $('.total-seat-left').addClass('hide');
                        }
                        $('input[name=id]').val(getIdFromDate(date));
                        validate();
                    },
                    error: function(data) {
                        $('.total-seat-left').addClass('hide');
                        availableDay = false;
                        validate();
                    },
                    complete: function() {
                        $('.notFoundContent').hide();
                    }
                });
            } else {
                availableDay = false;
            }
        });

        var calculatePrice = function() {
            var adultQty = $('.adult-count.quantity').val();
            var childQty = $('.child-count.quantity').val();
            $('.totalCost .total').html((adultQty * adultPrice + childQty * childPrice).toFixed(2));
        };

        $('.incr-btn').on('click', function(e){
            calculatePrice();
            validate();
        });
        $('.adult-count, .child-count, .tour-date').on('change', function(e){
            calculatePrice();
            validate();
        });

        $('.adult-count, .child-count').on('keypress', function(e){
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

        var compareCartItem = function(item1, item2) {
            return item1.tourId == item2.tourId && item1.date.getTime() == item2.date.getTime();
        };

        var currentRating = 3;

        var avg = "<s:property value="%{tourDTO.averageRating}" />";
        if (!avg) {
            avg = "0";
        }

        $('#average-rating').barrating({
            theme: 'fontawesome-stars-o',
            showSelectedRating: true,
            readonly: true,
            allowEmpty: true,
            initialRating: parseFloat(avg),
        });

        $('#review-rating').barrating({
            theme: 'fontawesome-stars-o',
            showSelectedRating: false,
            initialRating: 3,
            onSelect:function(value, text, event) {
                currentRating = value;
            }
        });

        $('.user-rating').barrating({
            theme: 'fontawesome-stars-o',
            showSelectedRating: false,
            readonly: true,
            initialRating: null,
        });

        $('#review-form').validate({
            rating: {
                required: true,
            },
            comment: {
                required: true,
                minlength: 10,
            },
            submitHandler: function(form) {
                var comment = $('textarea[name=comment]').val();
                $.ajax({
                    url: '<s:url value="/AddTourReview" />',
                    dataType: 'json',
                    contentType: 'application/json',
                    method: 'POST',
                    data: JSON.stringify({
                        tourId,
                        rating: currentRating,
                        comment,
                    }),
                    success: function(data) {
                        var $holder = $('.reviewMedia .media-list');
                        $holder.append(createComment(data.commentId, currentRating, comment));
                        $('#review-form').remove();
                        var count = parseInt($('.review-count').html());
                        var newAverage = (parseFloat(avg) * count * 1.0 + currentRating) / (count + 1);
                        $('.review-count').html(count+1);
                        $('#average-rating').barrating('set', newAverage);
                        $('.user-rating').barrating({
                            theme: 'fontawesome-stars-o',
                            showSelectedRating: false,
                            readonly: true,
                        });
                    },
                    error: function(data) {
                        toastr.error('An error occurred. Please try again.')
                    }
                });
            },
        });

        var createSelectOption = function(selectedIndex) {
            var markup = '';
            for (var i = 1; i <= 5; i++) {
                markup += '<option value="'+i+'" '+ (i == selectedIndex ? 'selected="selected"' : '') +' >'+i+'</option>';
            }
            return markup;
        };

        var createComment = function(id, rating, comment) {
            var displayName = "<s:property value="#session.USER.displayName" />";
            var contextPath = "${pageContext.request.contextPath}";
            var markup = '<li data-id="'+id+'" class="media" style="position: relative;">\
                              <div class="media-left">\
                                <a href="#">\
                                    <img class="media-object" src="'+contextPath+'/img/blog/defaultcomment.png" />\
                                </a>\
                              </div>\
                              <div class="media-right" style="position: absolute; right: 0; top: 0;">\
                                    <span style="cursor: pointer" class="edit-comment"><i class="fa fa-edit"></i></span>\
                                    &nbsp;\
                                    <span style="cursor: pointer" class="remove-comment"><i class="fa fa-close"></i></span>\
                              </div>\
                              <div class="media-body">\
                                    <h5 class="media-heading">'+displayName+'</h5>\
                                    <select class="user-rating">'
                                        + createSelectOption(rating) +
                                    '</select>\
                                    <div class="comment-content">'+comment+'</div>\
                               </div>\
                            </li>';
            return markup;
        }

        $(document).on('click','.edit-comment', function(e){
            var $review = $(this).closest('li.media');
            var id = $review.attr('data-id');
            var $comment = $review.find('.comment-content');
            var $rating = $review.find('select');
            $rating.barrating('readonly', false);
            $comment
                .prop('contenteditable', 'true')
                .css({
                    width: "100%",
                    border: "1px solid lightgray",
                    padding: "10px",
            });
            setCaret($comment[0]);
        });

        $(document).on('blur', '.comment-content[contenteditable=true]', function(e){
            var target = e.relatedTarget;
            if ($(target).closest('.br-wrapper').length === 0) {
                var $review = $(this).closest('li.media');
                var id = $review.attr('data-id');
                var rating = $review.find('.br-current').index() + 1;
                var comment = $(this)[0].innerText;
                $.ajax({
                    url: '<s:url value="/EditTourReview" />',
                    dataType: 'json',
                    contentType: 'application/json',
                    method: 'POST',
                    data: JSON.stringify({
                        id,
                        tourId,
                        rating,
                        comment,
                    }),
                    success: function(data) {
                        var $comment = $review.find('.comment-content');
                        var $rating = $review.find('select');
                        $rating.barrating('readonly', true);
                        $comment
                            .prop('contenteditable', 'false')
                            .css({
                                width: "100%",
                                border: "none",
                                padding: "0",
                            });
                        toastr.success('Successfully updated review.');
                        $('#average-rating').barrating('destroy');
                        $('#average-rating').barrating({
                            theme: 'fontawesome-stars-o',
                            showSelectedRating: true,
                            readonly: true,
                            allowEmpty: true,
                            initialRating: data.average,
                        });
                    },
                    error: function(data) {
                        toastr.error('An error occurred. Please try again.')
                    }
                });
            }
        });

        $(document).on('click', '.remove-comment', function(e){
            var $review = $(this).closest('li.media');
            var id = $review.attr('data-id');
            $.ajax({
                url: '<s:url value="/RemoveTourReview" />',
                dataType: 'json',
                contentType: 'application/json',
                method: 'POST',
                data: JSON.stringify({
                    id,
                    tourId,
                }),
                success: function(data) {
                    $review.remove();
                    toastr.success('Successfully removed review.');
                    $('#average-rating').barrating('destroy');
                    $('#average-rating').barrating({
                        theme: 'fontawesome-stars-o',
                        showSelectedRating: true,
                        readonly: true,
                        allowEmpty: true,
                        initialRating: data.average,
                    });
                    var count = parseInt($('.review-count').html());
                    $('.review-count').html(count-1);
                },
                error: function(data) {
                    toastr.error('An error occurred. Please try again.')
                }
            });
        });

        var setCaret = function(el) {
            var range = document.createRange();
            var sel = window.getSelection();
            range.setStart(el.childNodes[0], $(el).html().length);
            range.collapse(true);
            sel.removeAllRanges();
            sel.addRange(range);
        };

        var inquiryValidator = $('#inquiry').validate({
            //== Validate only visible fields
            ignore: ":hidden",

            //== Validation rules
            rules: {
                //=== Client Information(step 1)
                //== Basic information
                title: {
                    required: true
                },
                content: {
                    required: true
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
                var $inquiry = $('#inquiry');
                var title = $inquiry.find('input[name=title]').val();
                var content = $inquiry.find('textarea[name=content]').val();
                $.ajax({
                    url: '<s:url value="/SendFirstMessage" />',
                    dataType: 'json',
                    contentType: 'application/json',
                    method: 'POST',
                    data: JSON.stringify({
                        tourId,
                        title,
                        content,
                    }),
                    success: function(data) {
                        $inquiry.find('input[name=title]').val('');
                        $inquiry.find('textarea[name=content]').val('');
                        toastr.success('Successfully sent message.');
                    },
                    error: function(data) {
                        toastr.error('An error occurred. Please try again.')
                    }
                });
            }
        });
    });
</script>
</body>


<!-- Mirrored from themes.iamabdus.com/star/1.3/single-package-right-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Feb 2018 09:09:54 GMT -->
</html>

