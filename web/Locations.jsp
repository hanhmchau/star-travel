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

    <!-- PAGE TITLE -->
    <section class="pageTitle" style="background-image:url(img/pages/page-title-bg3.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="titleTable">
                        <div class="titleTableInner">
                            <div class="pageTitleInfo">
                                <h1>Destinations</h1>
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
            <div class="row marginExten">
                <div class="col-sm-12 col-xs-12">
                    <div class="thumbnail citiesContent">
                        <div class="caption">
                            <div class="row">
                                <s:iterator value="locations">
                                    <div class="col-sm-4 col-xs-12" style="margin: 20px 0;">
                                        <div class="media">
                                            <a class="media-left" href="<s:url value="/location/%{url}" />">
                                                <img style="height: 80px; width: 100px; overflow: hidden;" class="media-object"
                                                     src="<s:url value="%{images['image']}" />" alt="Image">
                                            </a>
                                            <div class="media-body">
                                                <a href="<s:url value="/location/%{url}" />" class="media-heading">${name}</a>
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

