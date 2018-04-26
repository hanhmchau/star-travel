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
    <title>Search - Star Travel</title>

    <s:include value="/global/GlobalCSS.jsp"></s:include>
    <style>
        .thumbnail.deals {
            box-shadow: 0 3px 10px rgba(0,0,0,.1);
        }
    </style>
</head>


<body class="body-wrapper ">
<div class="main-wrapper">
    <s:include value="/global/Header.jsp"></s:include>

    <!-- PAGE CONTENT -->
    <section class="mainContentSection singlePackage">
        <div class="container">
            <div class="row countryTitle">
                <div class="col-sm-8 col-xs-12">
                    <div id="package-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <s:iterator status="status" value="%{location.images}">
                                <div class="item <s:if test="#status.count == 1">active</s:if>">
                                    <img src="<s:url value="%{value}" />">
                                </div>
                            </s:iterator>
                        </div>
                        <a class="left carousel-control" href="#package-carousel" data-slide="prev"><span class="glyphicon glyphicon-menu-left"></span></a>
                        <a class="right carousel-control" href="#package-carousel" data-slide="next"><span class="glyphicon glyphicon-menu-right"></span></a>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <aside>
                        <div class="weatherInfo">
                            <img src="<s:url value="/img/cities/weather-bg.jpg" />" alt="image">
                            <div class="cityWeather">
                                <div class="cityTable">
                                    <div class="cityTableInner">
                                        <div class="cityWeatherInfo">
                                            <img src="<s:url value="/img/icons/cloud.png" />">
                                            <h2>28<sup>0</sup></h2>
                                            <p><s:property value="title" /></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="dayTime">
                                <span class="pull-left"><s:date format="MMM dd, yyyy" name="%{today}"></s:date></span>
                                <span class="pull-right"><s:date format="EE" name="%{today}"></s:date></span>
                            </div>
                            <div class="daysWeather">
                                <ul class="list-inline">
                                    <li>Tue <span><img src="img/icons/cloud-rain.png" alt="image"></span>18<sup>0</sup></li>
                                    <li>Wed <span><img src="img/icons/sun.png" alt="image"></span>25<sup>0</sup></li>
                                    <li>Thu <span><img src="img/icons/cloud-sm.png" alt="image"></span>22<sup>0</sup></li>
                                </ul>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div role="tabpanel" class="countryTabs">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#over-view" aria-controls="over-view" role="tab" data-toggle="tab">OVER VIEW</a>
                            </li>
                            <li class="pull-right">
                                <ul class="list-inline">
                                    <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
                                </ul>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="over-view">
                                <div class="row">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="commonInfo">
                                            <s:property value="location.description" escapeHtml="false" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="relatedProduct">
                        <h2>Tours from <s:property value="location.name" /></h2>
                        <div class="row tour-panel">
                            <s:iterator value="tours">
                                <div class="col-lg-4 col-sm-6 col-xs-12">
                                    <div class="thumbnail deals packagesPage">
                                        <div style="height: 190px; overflow: hidden;">
                                            <img src="<s:url value="%{images[0]}"/>">
                                        </div>
                                        <a target="_blank" href="<s:url value="/tour/%{titleUrl}" />" class="pageLink"></a>
                                        <div class="discountInfo">
                                            <ul class="list-inline rating homePage">
                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            </ul>
                                            <ul class="list-inline duration">
                                                <li>${numberOfDays} <s:if test="numberOfDays > 1">days</s:if><s:else>day</s:else></li>
                                                <li>${numberOfNights} <s:if test="numberOfNights > 1">nights</s:if><s:else>night</s:else></li>
                                            </ul>
                                        </div>
                                        <div class="caption" style="height: 310px;">
                                            <div style="height: 80px; text-overflow: ellipsis">
                                                <h4><a href="<s:url value="/tour/%{titleUrl}" />" class="captionTitle">${title}</a></h4>
                                            </div>
                                            <div style="whitespace: nowrap; height: 80px; margin-bottom: 40px;
                                         overflow: hidden; text-overflow: ellipsis;">
                                                <s:property value="description" escapeHtml="false"></s:property>
                                            </div>
                                            <div class="detailsInfo">
                                                <h5>
                                                    <span>Start From</span>
                                                    $<s:property value="getText('{0,number,#,##0.00}',{adultPrice})" />
                                                </h5>
                                                <ul class="list-inline detailsBtn">
                                                    <a target="_blank" href="<s:url value="/tour/%{titleUrl}" />" class="btn buttonTransparent">Details</a>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </s:iterator>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="paginationCenter">
                                    <ul class="pagination">
                                        <s:if test="%{pages > 1}">
                                            <li class="disabled btn-prev">
                                                <a aria-label="Previous">
                                                    <span aria-hidden="true"><i class="fa fa-long-arrow-left" aria-hidden="true"></i>Previous</span>
                                                </a>
                                            </li>
                                            <s:iterator begin="1" end="%{pages}" status="status">
                                                <li class="paging <s:if test="#status.count == 1">active</s:if>"><a  ><s:property value="#status.count" /></a></li>
                                            </s:iterator>
                                            <li class="btn-next">
                                                <a aria-label="Next">
                                                    <span aria-hidden="true">Next<i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
                                                </a>
                                            </li>
                                        </s:if>
                                    </ul>
                                </div>
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
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.2.0/js/ion.rangeSlider.min.js"></script>--%>

<script>
    $(document).ready(function(){
        let categories = [];
        <s:iterator value="categories">
        categories.push(${id});
        </s:iterator>
        var contextPath = "${pageContext.request.contextPath}"

        var getTourMarkup = function(tour) {
            return '<div class="col-lg-4 col-sm-6 col-xs-12">\
                        <div class="thumbnail deals packagesPage">\
                            <div style="height: 190px; overflow: hidden;">\
                                <img src="'+contextPath+tour.images[0]+'">\
                            </div>\
                            <a target="_blank" href="'+contextPath+'/tour/'+tour.titleUrl+'" class="pageLink"></a>\
                            <div class="discountInfo">\
                                <ul class="list-inline rating homePage">\
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>\
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>\
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>\
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>\
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>\
                                </ul>\
                                <ul class="list-inline duration">\
                                    <li>'+tour.numberOfDays+ ' ' + (tour.numberOfDays > 1 ? 'days' : 'day') + '</li>\
                                    <li>'+tour.numberOfNights+ ' ' + (tour.numberOfNights > 1 ? 'nights' : 'night') + '</li>\
                                </ul>\
                            </div>\
                            <div class="caption" style="height: 310px;">\
                            <div style="height: 80px; text-overflow: ellipsis">\
                            <h4><a href="single-package-left-sidebar.html" class="captionTitle">'+tour.title+'</a></h4>\
                        </div>\
                        <div style="whitespace: nowrap; height: 80px; margin-bottom: 40px;\
                            overflow: hidden; text-overflow: ellipsis;">'+tour.description+'</div>\
                            <div class="detailsInfo">\
                                <h5><span>Start From</span>$'+tour.adultPrice.toFixed(2)+'</h5>\
                                <ul class="list-inline detailsBtn">\
                                    <a target="_blank" href="'+contextPath+'/tour/'+tour.titleUrl+'" class="btn buttonTransparent">Details</a>\
                                </ul>\
                            </div>\
                        </div>\
                    </div>\
                </div>';
        };

        var searchTours = function() {
            $.ajax({
                url: '<s:url value="/GetToursByLocation" />',
                method: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify(state),
                success: function(data) {
                    $('.tour-panel').html('');
                    $('.total').html(state.total);
                    data.tours.forEach((el, i) => {
                        $('.tour-panel').append(getTourMarkup(el));
                    });
                    setupPagination(data.total);
                    movePage(state.page);
                },
                error: function() {
                }
            });
        };

        var setupPagination = function(total) {
            var pageCount = Math.ceil(total / state.perPage);
            var $pagination = $('.paginationCenter .pagination');
            $pagination.html('');
            var $prev = $('                  <li class="btn-prev">\n' +
                '                                <a aria-label="Previous">\n' +
                '                                    <span aria-hidden="true"><i class="fa fa-long-arrow-left" aria-hidden="true"></i>Previous</span>\n' +
                '                                </a>\n' +
                '                            </li>');
            var $next = $('                  <li class="btn-next">\n' +
                '                                <a aria-label="Next">\n' +
                '                                    <span aria-hidden="true">Next<i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>\n' +
                '                                </a>\n' +
                '                            </li>');
            if (pageCount > 1) {
                $pagination.append($prev);
                for (let i = 1; i <= pageCount; i++) {
                    $pagination.append('<li class="paging '+ (i==state.page ? 'active' : '') +'"><a>'+i+'</a></li>');
                }
                $pagination.append($next);
            }
        };

        var movePage = function(page) {
            $('html, body').animate({
                scrollTop: 0
            }, 500);
            var pageCount = Math.ceil(state.total / state.perPage);
            $('.pagination li').removeClass('active');
            $('.pagination li.paging').eq(page).addClass('active');
            $('.pagination li.btn-prev').toggleClass('disabled', page == 1).toggleClass('.btn-disabled', page  == 1);
            $('.pagination li.btn-next').toggleClass('disabled', page == pageCount).toggleClass('.btn-disabled', page  == pageCount);
        };

        $('body').on('click', '.pagination li:not(.disabled)', function(e){
            if ($(this).hasClass('btn-prev')) {
                state.page--;
            } else if ($(this).hasClass('btn-next')) {
                state.page++;
            } else {
                console.log($(this).find('a').html());
                state.page = parseInt($(this).find('a').html());
            }
            searchTours();
        });

        $(".ed-datepicker").datepicker({
            format: "dd/mm/yyyy",
            orientation: "top auto",
            todayBtn: true,
            todayHighlight: false,
            autoclose: true,
            weekStart: 1,
            beforeShowDay: function(date) {
                return date > new Date();
            }
        }).on('hide', function(e){
        }).on('changeMonth', function(e){
        }).on('show', function(e){
        }).on('clearDate', function(e){
        }).on('changeDate', function(e){
            if (e.date) {
                var date = e.date;
                date.setTime(date.getTime() - date.getTimezoneOffset()*60*1000);
                if ($(e.currentTarget).hasClass('from-date')) {
                    state.fromDate = date;
                } else {
                    state.toDate = date;
                }
            }
        });

        $( "#slider-range" ).slider({
            range: true,
            min: 0,
            max: 500,
            values: [ 0, 500 ],
            slide: function( event, ui ) {
                $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
            }
        });

        var slider = $('#slider-range').slider("instance");

        $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
            " - $" + $( "#slider-range" ).slider( "values", 1 ) );

        var state = {
            locationId: '<s:property value="%{location.id}" />',
            page: 1,
            perPage: 9,
            total: <s:property value="%{total}" />
        };

        $('input[name=search]').on('change', function(e){
            state.phrase= $(this).val();
        });

        $('#slider-range').on('slidechange', function(e, ui){
            let value = $("#slider-range").slider('option', 'values');
            state.minPrice = value[0];
            state.maxPrice = value[1];
        });

        $('.check-box-list input[type=checkbox]').on('change', function(e){
            state.categories = [];
            $('.check-box-list input[type=checkbox]:checked').each((i, el) => {
                state.categories.push($(el).val());
            });
        });

        $('.btn-search').on('click', function(e){
            state.page = 1;
            searchTours();
        });

        $('.searchFilter div li a').on('click', function(e){
            state.sort = $(this).attr('rel');
            state.page = 1;
            searchTours();
        });
    });
</script>
</body>


<!-- Mirrored from themes.iamabdus.com/star/1.3/single-package-right-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Feb 2018 09:09:54 GMT -->
</html>

