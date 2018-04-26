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
    <section class="dashboardMenu">
        <nav class="navbar dashboradNav">
            <div class="container">
                <div class="dashboardNavRight">
                    <ul class="NavRight">
                        <li class="dropdown singleDrop">
                            <a href="#" class=" " data-toggle="" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bell" aria-hidden="true"></i> <span class="notifyNumber">2</span></a>
                            <ul class="dropdown-menu dropdownMenu">
                                <li>
                                    <a href="#">
                                        <h4>information</h4>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <h5>Maldive Tour Packages</h5>
                                        <p>6 Hours Ago</p>
                                        <i class="fa fa-times" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <h5>London Tour Booking</h5>
                                        <p>15 Hours Ago</p>
                                        <i class="fa fa-times" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <h5>Maldive Tour Packages</h5>
                                        <p>2 Hours Ago</p>
                                        <i class="fa fa-times" aria-hidden="true"></i>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown singleDrop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="img/dashboard/dash-user.jpg" alt=""><i class="fa fa-angle-down" aria-hidden="true"></i></a>
                            <ul class="dropdown-menu dropdownMenu">
                                <li><a href="profile.html"><h5>Profile</h5></a></li>
                                <li><a href="setting.html"><h5>Account Settings</h5></a></li>
                                <li><a href="#"><h5>Log out</h5></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav dashboardNavLeft">
                        <li><a href="dashboard.html"><i class="fa fa-tachometer" aria-hidden="true"></i>Dashboard</a></li>
                        <li><a href="profile.html"><i class="fa fa-user" aria-hidden="true"></i>Profile</a></li>
                        <li><a class="active" href="booking.html"><i class="fa fa-cube" aria-hidden="true"></i>Booking</a></li>
                        <li><a href="setting.html"><i class="fa fa-cogs" aria-hidden="true"></i>Settings</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->

            </div><!-- /.container -->
        </nav>
    </section>

    <!-- BOOKING TYPE SECTION -->
    <section class="bookingTypeSection">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="bookingType bg-ash">
                        <ul class="bookingList">
                            <li><a class="active" href="#">All Types</a></li>
                        </ul>
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
                            <h2>All Types</h2>
                        </div>
                        <div class="table-responsive"  data-pattern="priority-columns">
                            <table class="table listingsTable">
                                <tbody>
                                <s:iterator var="item" value="%{#session.CART.contents}">
                                    <tr style="position: relative;" class="rowItem" data-id="<s:property value="tourDateDTO.id" />"
                                        data-date="<s:property value="tourDateDTO.date" />"
                                        data-adult-price="<s:property value="tourDateDTO.tour.adultPrice" />"
                                        data-child-price="<s:property value="tourDateDTO.tour.childPrice" />">
                                        <td class="dateTd">
                                            <div class="date">
                                                <s:date format="dd" name="tourDateDTO.date"></s:date>
                                                <span>
                                                    <s:date format="MMM" name="tourDateDTO.date"></s:date>
                                                    <s:date format="yy" name="tourDateDTO.date"></s:date>
                                                </span>
                                            </div>
                                        </td>
                                        <td class="iconTd">
                                            <div class="icon br-orange">
                                                <i class="fa fa-fort-awesome" aria-hidden="true"></i>
                                            </div>
                                        </td>
                                        <td class="packageTd">
                                            <ul class="list-inline listingsInfo">
                                                <li>
                                                    <h4>
                                                        <a href="<s:url value="%{tourDateDTO.tour.titleUrl}" />">
                                                            <s:property value="tourDateDTO.tour.title"></s:property>
                                                        </a>
                                                    </h4>
                                                    <p>
                                                        <s:property value="tourDateDTO.tour.numberOfDays" />
                                                        <s:if test="tourDateDTO.tour.numberOfDays > 1">days</s:if><s:else>day</s:else>
                                                        <s:property value="tourDateDTO.tour.numberOfNights" />
                                                        <s:if test="tourDateDTO.tour.numberOfNights > 1">nights</s:if><s:else>night</s:else>
                                                    </p>
                                                </li>
                                            </ul>
                                        </td>

                                        <td class="seatTd">
                                            <div>
                                                <div class="count-input adult-count">
                                                    <span class="incr-btn decrease">-</span>
                                                    <input autocomplete="off" class="adultSeat quantity" value="<s:property value="adultSeat"></s:property>" />
                                                    <span class="incr-btn increase" data-action="increase">+</span>
                                                    <s:if test="adultSeat > 1">adults</s:if><s:else>adult</s:else>
                                                </div>
                                            </div>
                                            <div>
                                                <div class="count-input child-count">
                                                    <span class="incr-btn decrease" data-action="decrease">-</span>
                                                    <input autocomplete="off" class="childSeat quantity" value="<s:property value="childSeat"></s:property>" />
                                                    <span class="incr-btn increase" data-action="increase">+</span>
                                                    <s:if test="childSeat > 1">children</s:if><s:else>child</s:else>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="priceTd">
                                            <ul class="list-inline listingsInfo text-right">
                                                <li>
                                                    <h4>$
                                                        <span class="total"><s:property value="getText('{0,number,#,##0.00}',{temporaryTotal})"></s:property></span>
                                                    </h4>
                                                    <p>Total</p>
                                                </li>
                                            </ul>
                                        </td>
                                        <td style="position:relative">
                                            <div class="cart-item-remove">
                                                x
                                            </div>
                                        </td>
                                    </tr>
                                </s:iterator>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <s:if test="#session.CART != null && #session.CART.contents.size > 0">
                    <div class="bg-ash cart-total col-xs-12 col-md-6 col-md-offset-3">
                        <div class="row">
                            <div class="" style="text-align: center">
                                <span class="panel-heading">Total: </span>
                                <span class="panel-heading cart-total">
                                $<s:property value="getText('{0,number,#,##0.00}',{#session.CART.total})"></s:property>
                            </span>
                            </div>
                            <div class="col-xs-12 col-md-10 col-md-offset-1">
                                <a href="<s:url value="/checkout" />" class="btn-checkout btn btn-block bg-orange-c">Checkout</a>
                            </div>
                        </div>
                    </div>
                </s:if>
            </div>
        </div>
    </section>

    <s:include value="/global/Footer.jsp"></s:include>
</div>

<s:include value="/global/Modals.jsp"></s:include>
<s:include value="/global/GlobalJS.jsp"></s:include>
<script>
    $(document).ready(function(){
        $('body').on('change', '.quantity', function(e){
            var validated = validate.call(this);
        });

        $('.incr-btn').on('click', function(e){
            var that = this;
            setTimeout(function(){
                var validated = validate.call(that);
            }, 0);
        });

        var validate = function() {
            var adultCount = parseInt($(this).closest('td').find('.adultSeat').val());
            var childCount = parseInt($(this).closest('td').find('.childSeat').val());
            var validated = childCount <= adultCount && adultCount > 0;
            console.log(validated);
            $('.btn-checkout').prop('disabled', !validated).toggleClass('btn-disabled', !validated);

            var $rowItem = $(this).closest('.rowItem');
            var adultPrice = parseFloat($rowItem.attr('data-adult-price'));
            var childPrice = parseFloat($rowItem.attr('data-child-price'));
            var total = adultPrice * adultCount + childPrice * childCount;

            var that = this;
            if (validated) {
                setTimeout(function () {
                    $.ajax({
                        url: '<s:url value="/UpdateCartItemQuantity" />',
                        method: 'POST',
                        dataType: "json",
                        contentType: "application/json",
                        data: JSON.stringify({
                            id: $rowItem.attr('data-id'),
                            adultCount,
                            childCount
                        }),
                        success: function(data) {
                            var cartTotal = 0;
                            $(that).closest('.rowItem').find('.total').html(total.toFixed(2));
                            $('.total').each(function(i, el) {
                                cartTotal+= parseFloat($(el).html());
                            });
                            $('span.cart-total').html('$'+cartTotal.toFixed(2));
                        },
                        error: function(data) {
                            setTimeout(function () {
                                let $inputSibling = $(that).siblings('.quantity');
                                if ($(that).attr('data-action') === 'increase') {
                                    $inputSibling.val(parseInt($inputSibling.val()) - 1);
                                } else {
                                    $inputSibling.val(parseInt($inputSibling.val()) + 1);
                                }
                                $('.btn-checkout').prop('disabled', false).toggleClass('btn-disabled', false);
                                toastr.error("Not enough seat left for this tour.");
                            }, 0);
                        },
                    })
                }, 0);
            } else {
                setTimeout(function () {
                    let $inputSibling = $(that).siblings('.quantity');
                    if ($(that).attr('data-action') === 'increase') {
                        $inputSibling.val(parseInt($inputSibling.val()) - 1);
                    } else {
                        $inputSibling.val(parseInt($inputSibling.val()) + 1);
                    }
                    $('.btn-checkout').prop('disabled', false).toggleClass('btn-disabled', false);
                }, 0);
            }
            return validated;
        };

        $('body').on('click', '.cart-item-remove', function(e){
            var $rowItem = $(this).closest('.rowItem');
            var id = $rowItem.attr('data-id');
            $.ajax({
                url: '<s:url value="/RemoveFromCartAction" />',
                method: 'POST',
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify({
                    id,
                }),
                success: function(data) {
                    $rowItem.remove();
                    let cartTotal = 0;
                    $('.total').each(function(i, el) {
                        cartTotal+= parseFloat($(el).html());
                    });
                    $('span.cart-total').html('$'+cartTotal.toFixed(2));
                },
                error: function(data) {
                }
            })
        });
    });
</script>
</body>


<!-- Mirrored from themes.iamabdus.com/star/1.3/single-package-right-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Feb 2018 09:09:54 GMT -->
</html>

