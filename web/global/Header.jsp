<%@ taglib prefix = "s" uri = "/struts-tags"%>
<!-- HEADER -->
<header>
    <nav class="navbar navbar-default navbar-main navbar-fixed-top" role="navigation">
        <div class="container">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<s:url value="/" />"></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div style="visibility: hidden;" class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown singleDrop active">
                        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">Home </a>
                        <ul class="dropdown-menu dropdown-menu-left">
                            <li class="dropdown singleDrop active "><a href="/">Home Main</a></li>
                            <li class="dropdown singleDrop  "><a href="index-v2.html">Home City</a></li>
                            <li class="dropdown singleDrop  "><a href="index-v3.html">Home Destination</a></li>
                        </ul>
                    </li>
                    <li class="dropdown megaDropMenu ">
                        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false">Tours</a>
                        <ul class="row dropdown-menu">
                            <li class="col-sm-3 col-xs-12">
                                <ul class="list-unstyled">
                                    <li>Tour Packages Grid View</li>
                                    <li class=""><a href="packages-grid-left-sidebar.html">Packages Sidebar Left</a></li>
                                    <li class=""><a href="packages-grid-right-sidebar.html">Packages Sidebar Right</a></li>
                                    <li class=""><a href="packages-grid.html">Packages 3 Columns</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-3 col-xs-12">
                                <ul class="list-unstyled">
                                    <li>Tour Packages List View</li>
                                    <li class=""><a href="packages-list-left-sidebar.html">Packages Sidebar Left</a></li>
                                    <li class=""><a href="packages-list-right-sidebar.html">Packages Sidebar Right</a></li>
                                    <li class=""><a href="packages-list.html">Packages List</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-3 col-xs-12">
                                <ul class="list-unstyled">
                                    <li>Single Package</li>
                                    <li class=""><a href="single-package-left-sidebar.html">Packages Sidebar Left</a></li>
                                    <li class=""><a href="single-package-right-sidebar.html">Packages Sidebar Right</a></li>
                                    <li class=""><a href="single-package-fullwidth.html">Package Fullwidth</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-3 col-xs-12">
                                <ul class="list-unstyled">
                                    <li>Booking Steps</li>
                                    <li class=""><a href="booking-1.html">Step 1 - Personal Info</a></li>
                                    <li class=""><a href="booking-2.html">Step 2 - Payment Info</a></li>
                                    <li class=""><a href="booking-3.html">Step 3 - Confirmation</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown megaDropMenu ">
                        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false">Hotels</a>
                        <ul class="row dropdown-menu">
                            <li class="col-sm-3 col-xs-12">
                                <ul class="list-unstyled">
                                    <li>Hotels Grid View</li>
                                    <li class=""><a href="hotels-grid-left-sidebar.html">Hotels Sidebar Left</a></li>
                                    <li class=""><a href="hotels-grid-right-sidebar.html">Hotels Sidebar Right</a></li>
                                    <li class=""><a href="hotels-grid.html">Hotels 3 Columns</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-3 col-xs-12">
                                <ul class="list-unstyled">
                                    <li>Hotels List View</li>
                                    <li class=""><a href="hotels-list-left-sidebar.html">Hotels Sidebar Left</a></li>
                                    <li class=""><a href="hotels-list-right-sidebar.html">Hotels Sidebar Right</a></li>
                                    <li class=""><a href="hotels-list.html">Hotels List</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-3 col-xs-12">
                                <ul class="list-unstyled">
                                    <li>Single Hotel</li>
                                    <li class=""><a href="single-hotel-left-sidebar.html">Hotels Sidebar Left</a></li>
                                    <li class=""><a href="single-hotel-right-sidebar.html">Hotels Sidebar Right</a></li>
                                    <li class=""><a href="single-hotel-fullwidth.html">Hotels Fullwidth</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-3 col-xs-12">
                                <ul class="list-unstyled">
                                    <li>Booking Steps</li>
                                    <li class=""><a href="booking-1.html">Step 1 - Personal Info</a></li>
                                    <li class=""><a href="booking-2.html">Step 2 - Payment Info</a></li>
                                    <li class=""><a href="booking-3.html">Step 3 - Confirmation</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown singleDrop ">
                        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">PAGES</a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li class=""><a href="about-us.html">About Us</a></li>
                            <li class=""><a href="contact.html">Contact Us</a></li>
                            <li class="dropdown dropdown-submenu ">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">Gallery <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu ">
                                    <li class=""><a href="gallery-grid.html">Gallery Grid</a></li>
                                    <li class=""><a href="gallery-masonry.html">Gallery Masonry</a></li>
                                    <li class=""><a href="gallery-photo-slider.html">Photo Slider</a></li>
                                </ul>
                            </li>
                            <li class="dropdown dropdown-submenu ">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">Destinations <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu dropdown-menu-left">
                                    <li class=""><a href="destination-cities.html">Destination Cities</a></li>
                                    <li class=""><a href="destination-single-city.html">Single Destination</a></li>
                                </ul>
                            </li>
                            <li><a href="404.html">404 Not Found</a></li>
                            <li><a href="coming-soon.html">Coming Soon</a></li>
                        </ul>
                    </li>
                    <li class="dropdown singleDrop ">
                        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li class="dropdown dropdown-submenu">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">Blog Grid View <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li class=""><a href="blog-grid-three-col.html">Blog Grid 3 Col</a></li>
                                    <li class=""><a href="blog-grid-two-col.html">Blog Grid 2 Col</a></li>
                                </ul>
                            </li>
                            <li class="dropdown dropdown-submenu">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">Blog List View <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li class=""><a href="blog-list-right-sidebar.html">Blog List Right Sidebar</a></li>
                                    <li class=""><a href="blog-list-left-sidebar.html">blog-list-left-sidebar.html</a></li>
                                    <li class=""><a href="blog-list-fullwidth.html">Blog List Fullwidth</a></li>
                                </ul>
                            </li>
                            <li class="dropdown dropdown-submenu">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">Single Blog Post <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li class=""><a href="blog-single-right-sidebar.html">Right Sidebar</a></li>
                                    <li class=""><a href="blog-single-left-sidebar.html">Left Sidebar</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown singleDrop ">
                        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin</a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li class=""><a href="dashboard.html">Dashboard</a></li>
                            <li class=""><a href="booking.html">Booking</a></li>
                            <li class=""><a href="profile.html">Profile</a></li>
                            <li class=""><a href="setting.html">Settings</a></li>
                            <li class=""><a href="#" data-toggle="modal" data-target="#signup">Signup</a></li>
                            <li class=""><a href="#" data-toggle="modal" data-target="#login">Login</a></li>
                        </ul>
                    </li>
                    <li class="dropdown singleDrop">
                        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Shortcodes</a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li class=""><a href="accordion-and-toggles.html">Accordions &amp; Toggles</a></li>
                            <li class=""><a href="tabs-and-dropdown.html">Tabs &amp; Dropdowns</a></li>
                            <li class=""><a href="pricing-table.html">Pricing Tables</a></li>
                        </ul>
                    </li>
                    <li class="dropdown searchBox">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="searchIcon"><i class="fa fa-search" aria-hidden="true"></i></span></a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li>
                    <span class="input-group">
                      <input type="text" class="form-control" placeholder="Search..." aria-describedby="basic-addon2">
                      <span class="input-group-addon" id="basic-addon2">Search</span>
                    </span>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div class="navbar-user">
                <s:if test="%{#session.USER != null}">
                    <ul class="nav navbar-nav" style="list-style-type: none">
                        <li class="dropdown singleDrop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <img class="img-circle user-avatar" src="img/dashboard/dash-user.jpg" alt="">
                                <span class="user-displayName"><s:property value="%{#session.USER.displayName}"></s:property></span>
                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="<s:url value="/profile/invoices/%{#session.USER.id}" />">Profile</a></li>
                                <%--<li><a href="/profile/invoices/<s:property value="#session.USER.id" />">Profile</a></li>--%>
                                <li><a href="<s:url value="/profile/booking" />">Booking</a></li>
                                <li><a href="<s:url value="/profile/settings/%{#session.USER.id}" />">Account settings</a></li>
                                <s:if test="%{#session.USER.role == @chau.consts.Consts$ROLE_STATUS@ADMIN.value}">
                                    <li><a href="<s:url value="/administrator" />">Administration</a></li>
                                </s:if>
                                <li><a href="<s:url value="/LogOutAction" />">Log out</a></li>
                            </ul>
                        </li>
                    </ul>
                </s:if>
                <s:else>
                    <ul class="nav navbar-nav">
                        <li class="sign-in-box">
                            <a class="dropdown-toggle not-logged-in-sign-in" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-user-circle-o"></i>
                                <span class="" data-toggle="modal" data-target="#login">Sign In</span>
                            </a>
                        </li>
                        <li><div class="dropdown-toggle horizontal-separator">|</div></li>
                        <li class="sign-up-box">
                            <a class="dropdown-toggle not-logged-in-sign-up" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="" data-toggle="modal" data-target="#signup">Sign Up</span>
                            </a>
                        </li>
                        <li><div class="dropdown-toggle horizontal-separator">|</div></li>
                        <li class="sign-up-box">
                            <a href="<s:url value="/profile/booking" />" class="dropdown-toggle not-logged-in-sign-up" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class=""><i class="fa fa-shopping-cart"></i></span>
                            </a>
                        </li>
                    </ul>
                </s:else>
            </div>
        </div>
    </nav>
</header>
