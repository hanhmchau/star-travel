<%@taglib prefix="s" uri="/struts-tags" %>

<!-- BEGIN: Left Aside -->
<button class="m-aside-left-close  m-aside-left-close--skin-dark " id="m_aside_left_close_btn"><i class="la la-close"></i></button>
<div id="m_aside_left" class="m-grid__item	m-aside-left  m-aside-left--skin-dark ">
    <!-- BEGIN: Aside Menu -->
    <div
            id="m_ver_menu"
            class="m-aside-menu  m-aside-menu--skin-dark m-aside-menu--submenu-skin-dark "
            data-menu-vertical="true"
            data-menu-scrollable="false" data-menu-dropdown-timeout="500"
    >
        <ul class="m-menu__nav  m-menu__nav--dropdown-submenu-arrow ">
            <li class="m-menu__item  m-menu__item--active" aria-haspopup="true" ><a href="<s:url value="/administrator" />" class="m-menu__link "><i class="m-menu__link-icon flaticon-line-graph"></i><span class="m-menu__link-title">  <span class="m-menu__link-wrap">      <span class="m-menu__link-text">Dashboard</span>      <span class="m-menu__link-badge"><span class="m-badge m-badge--danger">2</span></span>  </span></span></a></li>
            <li class="m-menu__section">
                <h4 class="m-menu__section-text">Create New</h4>
                <i class="m-menu__section-icon flaticon-more-v3"></i>
            </li>
            <li class="m-menu__item  m-menu__item--submenu" aria-haspopup="true"  data-menu-submenu-toggle="hover">
                <a  href="<s:url value="/administrator/create-new-tour" />" class="m-menu__link m-menu__toggle">
                    <i class="m-menu__link-icon  flaticon-add-circular-button"></i>
                    <span class="m-menu__link-text">Tour</span>
                </a>
            </li>
            <li class="m-menu__item  m-menu__item--submenu" aria-haspopup="true"  data-menu-submenu-toggle="hover">
                <a  href="<s:url value="/administrator/create-new-destination" />" class="m-menu__link m-menu__toggle">
                    <i class="m-menu__link-icon flaticon-location"></i>
                    <span class="m-menu__link-text">Location</span>
                </a>
            </li>
            <li class="m-menu__section">
                <h4 class="m-menu__section-text">Manage</h4>
                <i class="m-menu__section-icon flaticon-more-v3"></i>
            </li>
            <li class="m-menu__item  m-menu__item--submenu" aria-haspopup="true"  data-menu-submenu-toggle="hover">
                <a  href="<s:url value="/administrator/manage-tours" />" class="m-menu__link m-menu__toggle">
                    <i class="m-menu__link-icon flaticon-paper-plane "></i>
                    <span class="m-menu__link-text">Tours</span>
                </a>
            </li>
            <li class="m-menu__item  m-menu__item--submenu" aria-haspopup="true"  data-menu-submenu-toggle="hover">
                <a  href="<s:url value="/administrator/manage-users" />" class="m-menu__link m-menu__toggle">
                    <i class="m-menu__link-icon flaticon-user-settings"></i>
                    <span class="m-menu__link-text">Users</span>
                </a>
            </li>
            <li class="m-menu__item  m-menu__item--submenu" aria-haspopup="true"  data-menu-submenu-toggle="hover">
                <a  href="<s:url value="/administrator/manage-categories" />" class="m-menu__link m-menu__toggle">
                    <i class="m-menu__link-icon flaticon-map"></i>
                    <span class="m-menu__link-text">Categories</span>
                </a>
            </li>
            <li class="m-menu__item  m-menu__item--submenu" aria-haspopup="true"  data-menu-submenu-toggle="hover">
                <a  href="<s:url value="/administrator/manage-locations" />" class="m-menu__link m-menu__toggle">
                    <i class="m-menu__link-icon  flaticon-pin "></i>
                    <span class="m-menu__link-text">Locations</span>
                </a>
            </li>
            <li class="m-menu__section">
                <h4 class="m-menu__section-text">Report</h4>
                <i class="m-menu__section-icon flaticon-more-v3"></i>
            </li>
            <li class="m-menu__item  m-menu__item--submenu" aria-haspopup="true"  data-menu-submenu-toggle="hover">
                <a  href="<s:url value="/administrator/reports" />" class="m-menu__link m-menu__toggle">
                    <i class="m-menu__link-icon   flaticon-analytics  "></i>
                    <span class="m-menu__link-text">Reports</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- END: Aside Menu -->
</div>
<!-- END: Left Aside -->

