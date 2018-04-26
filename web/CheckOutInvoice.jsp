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


    <!-- PAGE TITLE -->
    <section class="pageTitle" style="background-image:url(<s:url value="/img/pages/page-title-bg7.jpg" />);">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="titleTable">
                        <div class="titleTableInner">
                            <div class="pageTitleInfo">
                                <h1>Invoice</h1>
                                <div class="under-border"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- WHITE SECTION FILTER-->
    <section class="mainContentSection">
        <div class="container">
            <div class="row progress-wizard" style="border-bottom:0;">

                <div class="col-sm-6 col-xs-12 progress-wizard-step complete">
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a href="booking-1.html" class="progress-wizard-dot">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        1. personal info
                    </a>
                </div>

                <div class="col-sm-6 col-xs-12 progress-wizard-step active">
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a class="progress-wizard-dot">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        3. Confirmation
                    </a>
                </div>
            </div>
            <div class="row bookingConfirmed">
                <div class="col-xs-12">
                    <div class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">Dismiss</span></button>
                        Thank you! Your booking is confirmed. Invoice Sent in your email address. <a href="<s:url value="/" />">Return to homepage.</a>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="infoTitle">
                        <h2>Booking Details</h2>
                        <div class="row" style="margin-left: 10px;">
                            <div class="col-lg-4" style="margin-bottom: 15px;">
                                <strong><i class="fa fa-map-marker" aria-hidden="true"></i> Name:</strong>
                                <span><s:property value="%{#session.USER.displayName}"></s:property></span>
                            </div>
                            <div class="col-lg-4" style="margin-bottom: 15px;">
                                <strong><i class="fa fa-map-marker" aria-hidden="true"></i> Address:</strong>
                                <span><s:property value="%{address}"></s:property></span>
                            </div>
                            <div class="col-lg-4" style="margin-bottom: 15px;">
                                <strong><i class="fa fa-map-marker" aria-hidden="true"></i> Phone:</strong>
                                <span><s:property value="%{phone}"></s:property></span>
                            </div>
                        </div>
                    </div>
                    <div class="confirmDetilas">
                        <s:iterator value="%{invoicedCart.contents}">
                            <div class="confirmInfo">
                                <div class="infoTitle">
                                    <h2><i class="fa fa-map-o"></i> &nbsp; <s:property value="tourDateDTO.tour.title" /></h2>
                                </div>
                                <div class="row" style="border-bottom: 1px dashed darkgray; padding-bottom: 20px;">
                                    <div class="col-sm-4 col-xs-12">
                                        <dl class="dl-horizontal">
                                            <dl class="dl-horizontal">
                                                <dt><i class="fa fa-calendar" aria-hidden="true"></i> Date:</dt>
                                                <dd><s:date format="d MMM, yyyy" name="tourDateDTO.date"></s:date></dd>
                                            </dl>
                                            <dl class="dl-horizontal">
                                                <dt><i class="fa fa-calendar" aria-hidden="true"></i> Duration:</dt>
                                                <dd>
                                                    <s:property value="tourDateDTO.tour.numberOfDays" />
                                                    <s:if test="tourDateDTO.tour.numberOfDays > 1">days</s:if><s:else>day</s:else>
                                                    <s:property value="tourDateDTO.tour.numberOfNights" />
                                                    <s:if test="tourDateDTO.tour.numberOfNights > 1">nights</s:if><s:else>night</s:else>
                                                </dd>
                                            </dl>
                                        </dl>
                                    </div>
                                    <div class="col-sm-4 col-xs-12">
                                        <dl class="dl-horizontal">
                                            <dt><i class="fa fa-user" aria-hidden="true"></i> Guests:</dt>
                                            <dd><s:property value="adultSeat" /> <s:if test="adultSeat > 1">adults</s:if><s:else>adult</s:else>
                                                <s:if test="childSeat > 0">
                                                    , <s:property value="childSeat" /> <s:if test="childSeat > 1">children</s:if><s:else>child</s:else>
                                                </s:if>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="col-sm-4 col-xs-12 priceTotal">
                                        <h2>Total: <span>$<s:property value="getText('{0,number,#,##0.00}',{temporaryTotal})"></s:property></span></h2>
                                    </div>
                                </div>
                            </div>
                        </s:iterator>
                        <div class="row">
                            <div class="col-lg-4 col-lg-offset-8" style="margin-top: 20px">
                                <span class="priceTotal">
                                    <h2>Total:
                                        <span style="font-weight: bold; color: orangered;">$<s:property value="getText('{0,number,#,##0.00}',{invoicedCart.total})" /></span>
                                    </h2>
                                </span>
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
    });
</script>
</body>


<!-- Mirrored from themes.iamabdus.com/star/1.3/single-package-right-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Feb 2018 09:09:54 GMT -->
</html>

