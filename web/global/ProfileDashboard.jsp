<%@taglib prefix="s" uri="/struts-tags"%>

<section style="margin-top: 65px;" class="dashboardMenu">
    <nav class="navbar dashboradNav">
        <div class="container">
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
                    <li><a href="<s:url value="/profile/invoices/%{user.id}" />"><i class="fa fa-tachometer" aria-hidden="true"></i>Dashboard</a></li>
                    <li><a href="<s:url value="/profile/%{user.id}" />"><i class="fa fa-user" aria-hidden="true"></i>Profile</a></li>
                    <li><a href="<s:url value="/profile/booking" />"><i class="fa fa-cube" aria-hidden="true"></i>Booking</a></li>
                    <li><a href="<s:url value="/profile/settings/%{user.id}" />"><i class="fa fa-cogs" aria-hidden="true"></i>Settings</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->

        </div><!-- /.container -->
    </nav>
</section>
