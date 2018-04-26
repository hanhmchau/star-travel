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
                    <p>Your past invoices.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- BLOCK SECTION -->
    <section class="blockSection">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="content-block">
                        <div class="media bg-blue-c">
                            <div class="media-body ">
                                <h4 class="media-heading"><s:property value="orders.size()" /></h4>
                                <p>Orders made</p>
                            </div>
                            <div class="media-right ">
                                <div class="icon bg-blue-b">
                                    <i class="fa fa-gift" aria-hidden="true"></i>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="btn btn-content bg-blue-b"></a>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="content-block">
                        <div class="media bg-red-c">
                            <div class="media-body">
                                <h4 class="media-heading"><s:property value="tourBooked" /></h4>
                                <p>Tours booked</p>
                            </div>
                            <div class="media-right">
                                <div class="icon bg-red-b">
                                    <i class="fa fa-fort-awesome" aria-hidden="true"></i>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="btn btn-content bg-red-b"></a>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="content-block">
                        <div class="media bg-green-c">
                            <div class="media-body">
                                <h4 class="media-heading">$<s:property value="getText('{0,number,##0.00}',{totalMoney})" /></h4>
                                <p>Total money spent</p>
                            </div>
                            <div class="media-right">
                                <div class="icon bg-green-b">
                                    <i class="fa fa-plane" aria-hidden="true"></i>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="btn btn-content bg-green-b"></a>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="content-block">
                        <div class="media bg-orange-c">
                            <div class="media-body">
                                <h4 class="media-heading">$<s:property value="getText('{0,number,##0.00}',{maxMoney})" /></h4>
                                <p>Grandest order</p>
                            </div>
                            <div class="media-right">
                                <div class="icon bg-orange-b">
                                    <i class="fa fa-car" aria-hidden="true"></i>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="btn btn-content bg-orange-b"></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- RECENT ACTIVITY SECTION -->
    <section class="recentActivitySection">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 ">
                    <div class="recentActivityContent bg-ash">
                        <div class="dashboardPageTitle">
                            <h2>Recent Activity</h2>
                        </div>
                        <div class="row">
                            <div class="col-12 accordionsTransparent">
                                <div class="accordionSolidTitle">
                                    <div class="panel-group" id="accordionWhite">
                                        <s:iterator value="orders">
                                            <div data-value="<s:property value="id" />" class="order-panel panel panel-default">
                                                <a class="panel-heading accordion-toggle" data-toggle="collapse" data-parent="#accordionWhite" href="#<s:property value="id"/>">
                                                    <span><s:property value="id" /> - </span>
                                                    <span><s:date name="date" format="dd MMM yyyy"></s:date></span>
                                                    <i class="indicator fa fa-arrow-circle-up  pull-right"></i>
                                                </a>
                                                <div id="<s:property value="id"/>" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="col-xs-12">
                                                            <div class="infoTitle">
                                                                <h2>Booking Details</h2>
                                                                <div class="row" style="margin-left: 10px;">
                                                                    <div class="col-lg-4" style="margin-bottom: 15px;">
                                                                        <strong><i class="fa fa-map-marker" aria-hidden="true"></i> Address:</strong>
                                                                        <span><s:property value="address"></s:property></span>
                                                                    </div>
                                                                    <div class="col-lg-4" style="margin-bottom: 15px;">
                                                                        <strong><i class="fa fa-map-marker" aria-hidden="true"></i> Phone:</strong>
                                                                        <span><s:property value="phone"></s:property></span>
                                                                    </div>
                                                                    <%--<div class="col-lg-4" style="text-align: right;">--%>
                                                                        <%--<a class="cancel-order" style="color: red;">--%>
                                                                            <%--<strong>Cancel Order</strong> &nbsp; <i class="fa fa-close"></i>--%>
                                                                        <%--</a>--%>
                                                                    <%--</div>--%>
                                                                </div>
                                                            </div>
                                                            <div class="confirmDetilas">
                                                                <s:iterator value="orderItems">
                                                                    <div data-value="<s:property value="id" />" class="orderItem confirmInfo">
                                                                        <div class="infoTitle">
                                                                            <h2><a href="<s:url value="/tour/%{tourDateDTO.tour.titleUrl}" />" /><i class="fa fa-map-o"></i> &nbsp; <s:property value="tourDateDTO.tour.title" /></a></h2>
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
                                                                                    <dd><span class="order-item-adult-seat"><s:property value="adultSeat" /></span> <s:if test="adultSeat > 1">adults</s:if><s:else>adult</s:else>
                                                                                        <s:if test="childSeat > 0">
                                                                                            , <span class="order-item-child-seat"><s:property value="childSeat" /></span> <s:if test="childSeat > 1">children</s:if><s:else>child</s:else>
                                                                                        </s:if>
                                                                                    </dd>
                                                                                </dl>
                                                                            </div>
                                                                            <div class="col-sm-4 col-xs-12 priceTotal">
                                                                                <h2>Total: <span>$<span class="total-order-item"><s:property value="getText('{0,number,#,##0.00}',{price})"></s:property></span></span></h2>
                                                                                <s:if test="cancellable">
                                                                                    <h5 class="cancel-order-item"><a data-toggle="modal" data-target="#refund">Cancel...</a></h5>
                                                                                </s:if>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-12 refund-details">
                                                                                <s:iterator value="refunds">
                                                                                    <div style="margin-top:10px;">
                                                                                        <strong>[<s:date name="dateCancelled" format="dd - MM - yyyy" />]</strong> Cancelled <strong><s:property value="adultSeat" /></strong> adult seats and
                                                                                        <strong><s:property value="childSeat" /></strong> child seats. Refund rate: <strong><s:property value="refundRate * 100" />%</strong>
                                                                                    </div>
                                                                                </s:iterator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </s:iterator>
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-lg-offset-8" style="margin-top: 20px">
                                                                        <span class="priceTotal">
                                                                            <h2>Total:
                                                                                <span style="font-weight: bold; color: orangered;">$<span class="total-order"><s:property value="getText('{0,number,#,##0.00}',{total})" /></span></span>
                                                                            </h2>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </s:iterator>
                                    </div>
                                </div>
                            </div>
                        </div>
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
    <!-- Signup Modal -->
    <div class="modal fade signupLoging" id="refund" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content modalContentCustom">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <span class="modal-title" id="myModalLabel">How many seats do you want to cancel?</span>
                </div>
                <div class="modal-body">
                    <form id="refund-form">
                        <div class="general-error message bg-warning"></div>
                        <div class="form-group">
                            <s:textfield theme="simple" cssClass = "form-control displayName" name="adultSeat" placeholder="Adult seat"></s:textfield>
                            <div class="displayName-message gray message"></div>
                        </div>
                        <div class="form-group">
                            <s:textfield theme="simple" cssClass = "form-control displayName" name="childSeat" placeholder="Child seat"></s:textfield>
                            <div class="displayName-message gray message">Display name must be from 1 to 20 characters.</div>
                        </div>
                        <button class="btn btn-default">Cancel your seats</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <s:include value="/global/Footer.jsp"></s:include>
</div>

<s:include value="/global/Modals.jsp"></s:include>
<s:include value="/global/GlobalJS.jsp"></s:include>
<script>
    $(document).ready(function(){
        $('.navbar-nav.dashboardNavLeft li').eq(0).find('a').addClass('active');
        var formEl = $('#m_form');

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

        $('.cancel-order').on('click', function(e){
            var $order =  $(this).closest('.order-panel');
            var id = $order.attr('data-value');
            $.ajax({
                url: "<s:url value="/CancelOrder" />",
                method: "POST",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify({
                    id,
                }),
                success: function(data) {
                    toastr.success("Successfully cancelled.");
                    $order.remove();
                },
                error: function() {
                    toastr.error("We are sorry. This order contains uncancellable items.");
                }
            });
        });

        var childMax;
        var adultMax;
        var orderItemId;
        var $orderItem;
        var $order;

        jQuery.validator.addMethod("childMax", function(value, element) {
            return value <= childMax;
        }, "* Cannot cancel more seats than ordered.");

        jQuery.validator.addMethod("adultMax", function(value, element) {
            var adult = parseInt($('#refund').find('input[name=adultSeat]').val());
            return value <= adultMax;
        }, "* Cannot cancel more seats than ordered.");

        jQuery.validator.addMethod("adultAndChild", function(value, element) {
            var adultStr = $('#refund').find('input[name=adultSeat]').val();
            var adult = parseInt(adultStr) ? parseInt(adultStr) : 0;
            var childStr = $('#refund').find('input[name=childSeat]').val();
            var child = parseInt(childStr) ? parseInt(childStr) : 0;
            return adult + child >= 1;
        }, "* Cannot cancel no seat.");

        $('#refund-form').validate({
            rules: {
                adultSeat: {
                    digits: true,
                    min: 0,
                    adultMax: true,
                    adultAndChild: true,
                },
                childSeat: {
                    digits: true,
                    min: 0,
                    childMax: true,
                    adultAndChild: true,
                },
            },
            submitHandler: function(form, e) {
                e.preventDefault();
                var adult = parseInt($('#refund').find('input[name=adultSeat]').val());
                if (!adult) {
                    adult = 0;
                }
                var child = parseInt($('#refund').find('input[name=childSeat]').val());
                if (!child) {
                    child = 0;
                }
                $.ajax({
                    url: "<s:url value="/CancelOrderItem" />",
                    method: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        id: orderItemId,
                        adultSeat: adult,
                        childSeat: child,
                    }),
                    success: function(data) {
                        toastr.success("Successfully cancelled.");
                        $orderItem.find('.order-item-adult-seat').html(adultMax - adult);
                        $orderItem.find('.order-item-child-seat').html(childMax - child);
                        $orderItem.find('.total-order-item').html(data.remainingPrice.toFixed(2))
                        var sum = 0;
                        $order.find('.total-order-item').each((i, el) => {
                            sum += parseFloat($(el).html());
                        })
                        $order.find('.total-order').html(sum.toFixed(2));
                        var d = new Date();

                        var datestring = d.getDate()  + " - " + (d.getMonth()+1) + " - " + d.getFullYear();
                        $orderItem.find('.refund-details').append('<div style="margin-top:10px;"><strong>' +
                            '['+datestring+']</strong> Cancelled <strong>' + adult + ' </strong> adult seats and\
                        <strong>' + child + '</strong> child seats. Refund rate: <strong>' + data.result.refundRate * 100 + '%</strong>\
                        </div>');
                    },
                    error: function() {
                        toastr.error("Could not cancel. Please try again.");
                    }
                });
            },
        });

        $('.cancel-order-item').on('click', function(e){
            $orderItem = $(this).closest('.orderItem');
            $order =  $orderItem.closest('.order-panel');
            var id = $orderItem.attr('data-value');
            adultMax = parseInt($orderItem.find('.order-item-adult-seat').html());
            childMax = parseInt($orderItem.find('.order-item-child-seat').html());
            if (!adultMax)  {
                adultMax = 0;
            }
            if (!childMax) {
                childMax = 0;
            }
            orderItemId = id;
        });
    });
</script>
</body>


<!-- Mirrored from themes.iamabdus.com/star/1.3/single-package-right-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Feb 2018 09:09:54 GMT -->
</html>

