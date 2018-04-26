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
    <section class="pageTitle" style="background-image:url(img/pages/page-title-bg7.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="titleTable">
                        <div class="titleTableInner">
                            <div class="pageTitleInfo">
                                <h1>Confirming Information</h1>
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

                <div class="col-sm-6 col-xs-12 progress-wizard-step active">
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a class="progress-wizard-dot">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        Confirming Info
                    </a>
                </div>
                <div class="col-sm-6 col-xs-12 progress-wizard-step disabled">
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a class="progress-wizard-dot">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Invoice
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="infoTitle">
                    <h2>Booking Details</h2>
                </div>
                <div class="col-xs-12">
                    <s:if test="%{removal>0}">
                        <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">Dismiss</span></button>
                            <strong><s:property value="%{removal}" /> </strong>tour<s:if test="%{removal>1}">s</s:if> had been automatically removed.
                            These order items might have expired, been removed or hidden. Outdated items had been removed from your cart.
                        </div>
                    </s:if>
                </div>
                <s:if test="%{#session.CART.contents.isEmpty()}">
                    <div class="alert alert-warning alert-dismissible" role="alert">
                        There is no eligible item in your cart. <a href="<s:url value="/" />">Return to homepage.</a>
                    </div>
                </s:if>
                <s:else>
                    <s:iterator value="%{#session.CART.contents}">
                        <div class="col-sm-4 col-xs-12">
                            <div class="bookDetailsInfo">
                                <div class="infoArea">
                                    <h3><s:property value="tourDateDTO.tour.title"/></h3>
                                    <ul class="list-unstyled">
                                        <li><i class="fa fa-calendar" aria-hidden="true"></i>
                                            Date:  <span><s:date format="dd MMM, yyyy" name="tourDateDTO.date"></s:date></span></li>
                                        <li><i class="fa fa-user" aria-hidden="true"></i></i>
                                            Guests:  <span><s:property value="adultSeat"></s:property> <s:if test="adultSeat > 1">adults</s:if><s:else>adult</s:else>
                                            <s:if test="childSeat > 0">, <s:property value="childSeat"></s:property> <s:if test="childSeat > 1">children</s:if><s:else>child</s:else></s:if></span></li>
                                    </ul>
                                    <div class="priceTotal">
                                        <h2>Total: <span>$<s:property value="getText('{0,number,#,##0.00}',{temporaryTotal})"></s:property></span></h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </s:iterator>
                </s:else>
            </div>
            <div class="row" style="margin-top: 30px;">
                <div class="infoTitle" style="text-align: right">
                    <h2>Total: <span style="color: orangered; font-weight: bold;">$<s:property value="getText('{0,number,#,##0.00}',{#session.CART.total})"></s:property></span></h2>
                </div>
            </div>
            <s:if test="%{!#session.CART.contents.isEmpty()}">
                <div class="row" style="margin-top: 30px">
                    <div class="col-12">
                        <div class="infoTitle">
                            <h2>Important Information</h2>
                        </div>
                        <div class="bookingForm">
                            <form id="m_form" action="<s:url value="/checkout/invoice" />" method="POST" role="form" class="form" theme="simple">
                                <div class="row">
                                    <div class="form-group col-sm-6 col-xs-12">
                                        <label>Address</label>
                                        <br>
                                        <span><em>You can choose another address or leave this as the default.</em></span>
                                        <s:textfield theme="simple" name="address" cssStyle="color: darkslategray; font-size: 16px;" type="text" cssClass="form-control" value="%{address}" />
                                    </div>
                                    <div class="form-group col-sm-6 col-xs-12">
                                        <label>Phone</label>
                                        <br>
                                        <span><em>You can choose another address or leave this as the default.</em></span>
                                        <s:textfield theme="simple" name="phone" cssStyle="color: darkslategray; font-size: 16px;" type="text" class="form-control" value="%{phone}" />
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="buttonArea galleryBtnArea">
                                        <ul class="list-inline">
                                            <li class="pull-right">
                                                <s:submit theme="simple" cssClass="btn buttonCustomPrimary" value="Check Out"></s:submit>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </s:if>
        </div>
    </section>

    <s:include value="/global/Footer.jsp"></s:include>
</div>

<s:include value="/global/Modals.jsp"></s:include>
<s:include value="/global/GlobalJS.jsp"></s:include>
<script>
    $(document).ready(function(){
        var formEl = $('#m_form');
        var validator = formEl.validate({
            //== Validate only visible fields
            ignore: ":hidden",

            //== Validation rules
            rules: {
                //=== Personal info
                address: {
                    required: true,
                },
                phone: {
                    required: true,
                    digits: true,
                }
            },
        });
    });
</script>
</body>


<!-- Mirrored from themes.iamabdus.com/star/1.3/single-package-right-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Feb 2018 09:09:54 GMT -->
</html>

