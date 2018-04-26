<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 23-Feb-18
  Time: 10:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="utf-8" />
    <title>Admin | Star Travel</title>

    <s:include value="AdminHeader.jsp" />

    <!-- begin::Body -->
    <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

        <s:include value="LeftAside.jsp"></s:include>

        <div class="m-grid__item m-grid__item--fluid m-wrapper">

            <!-- BEGIN: Subheader -->
            <div class="m-subheader ">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="m-subheader__title m-subheader__title--separator">Administrator</h3>
                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home">
                                <a href="<s:url value="/administrator" />" class="m-nav__link m-nav__link--icon">
                                    <i class="m-nav__link-icon la la-home"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- END: Subheader -->
            <div class="m-content">
                <!--Begin::Main Portlet-->
                <div class="m-portlet m-portlet--full-height ">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">
                                    Most Profitable
                                    <small>Tours that earn the highest amount of money.</small>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="m-portlet__body">
                        <!--begin::Content-->
                        <div class="tab-content">
                            <div class="tab-pane active show" id="m_widget5_tab1_content-2" aria-expanded="true">
                                <!--begin::m-widget5-->
                                <div class="m-widget5">
                                    <s:iterator value="mostProfitTours" status="status">
                                        <div class="m-widget5__item">
                                            <div class="m-widget5__pic" style="background-color: #ffb822 !important;">
                                                <s:property value="%{#status.count}" />
                                            </div>
                                            <div class="m-widget5__content">
                                                <h4 class="m-widget5__title">
                                                    <a href="<s:url value="/tour/%{titleUrl}" />"><s:property value="title" /></a>
                                                </h4>
                                            </div>
                                            <%--<div class="m-widget5__stats1">--%>
                                                <%--<span class="m-widget5__number">19,200</span><br>--%>
                                                <%--<span class="m-widget5__sales">sales</span>--%>
                                            <%--</div>--%>
                                            <div class="m-widget5__stats2" style="padding-right: 40px;">
                                                <span class="m-widget5__number">$<s:property value="getText('{0,number,#,##0.00}',{totalMoney})" /></span><br>
                                                <span class="m-widget5__votes">&nbsp;</span>
                                            </div>
                                        </div>
                                    </s:iterator>
                                </div>
                                <!--end::m-widget5-->
                            </div>
                        </div>
                        <!--end::Content-->
                    </div>
                </div>
                <!--End::Main Portlet-->

                <!--Begin::Main Portlet-->
                <div class="m-portlet m-portlet--full-height ">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">
                                    Best Sellers
                                    <small>Tours with the highest number of seats bought.</small>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="m-portlet__body">
                        <!--begin::Content-->
                        <div class="tab-content">
                            <div class="tab-pane active show" id="m_widget5_tab1_content-3" aria-expanded="true">
                                <!--begin::m-widget5-->
                                <div class="m-widget5">
                                    <s:iterator value="mostBoughtTours" status="status">
                                        <div class="m-widget5__item">
                                            <div class="m-widget5__pic" style="background-color: #f4516c !important;">
                                                <s:property value="%{#status.count}" />
                                            </div>
                                            <div class="m-widget5__content">
                                                <h4 class="m-widget5__title">
                                                    <a href="<s:url value="/tour/%{titleUrl}" />"><s:property value="title" /></a>
                                                </h4>
                                            </div>
                                                <%--<div class="m-widget5__stats1">--%>
                                                <%--<span class="m-widget5__number">19,200</span><br>--%>
                                                <%--<span class="m-widget5__sales">sales</span>--%>
                                                <%--</div>--%>
                                            <div class="m-widget5__stats2" style="padding-right: 40px;">
                                                <span class="m-widget5__number"><s:property value="totalBought" /></span><br>
                                                <span class="m-widget5__votes">seats</span>
                                            </div>
                                        </div>
                                    </s:iterator>
                                </div>
                                <!--end::m-widget5-->
                            </div>
                        </div>
                        <!--end::Content-->
                    </div>
                </div>
                <!--End::Main Portlet-->

                <!--Begin::Main Portlet-->
                <div class="m-portlet m-portlet--full-height ">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">
                                    Best Locations
                                    <small>Locations whose tours earned the most profit.</small>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="m-portlet__body">
                        <!--begin::Content-->
                        <div class="tab-content">
                            <div class="tab-pane active show" id="m_widget5_tab1_content" aria-expanded="true">
                                <!--begin::m-widget5-->
                                <div class="m-widget5">
                                    <s:iterator value="mostProfitLocations" status="status">
                                        <div class="m-widget5__item">
                                            <div class="m-widget5__pic" style="background-color: #34bfa3 !important;">
                                                <s:property value="%{#status.count}" />
                                            </div>
                                            <div class="m-widget5__content">
                                                <h4 class="m-widget5__title">
                                                    <a href="<s:url value="/location/%{url}" />"><s:property value="name" /></a>
                                                </h4>
                                            </div>
                                            <div class="m-widget5__stats2" style="padding-right: 40px;">
                                                <span class="m-widget5__number">$<s:property value="getText('{0,number,#,##0.00}',{total})" /></span><br>
                                                <span class="m-widget5__votes">&nbsp;</span>
                                            </div>
                                        </div>
                                    </s:iterator>
                                </div>
                                <!--end::m-widget5-->
                            </div>
                        </div>
                        <!--end::Content-->
                    </div>
                </div>
                <!--End::Main Portlet-->

                <!--Begin::Main Portlet-->
                <div class="m-portlet m-portlet--full-height ">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">
                                    Best Users
                                    <small>Users that have spent the most amount of money.</small>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="m-portlet__body">
                        <!--begin::Content-->
                        <div class="tab-content">
                            <div class="tab-pane active show" id="m_widget5_tab1_content-4" aria-expanded="true">
                                <!--begin::m-widget5-->
                                <div class="m-widget5">
                                    <s:iterator value="mostBoughtUsers" status="status">
                                        <div class="m-widget5__item">
                                            <div class="m-widget5__pic" style="background-color: #5867dd !important;">
                                                <s:property value="%{#status.count}" />
                                            </div>
                                            <div class="m-widget5__content">
                                                <h4 class="m-widget5__title">
                                                    <a href="<s:url value="/profile/settings/%{id}" />"><s:property value="displayName" /></a>
                                                </h4>
                                            </div>
                                                <%--<div class="m-widget5__stats1">--%>
                                                <%--<span class="m-widget5__number">19,200</span><br>--%>
                                                <%--<span class="m-widget5__sales">sales</span>--%>
                                                <%--</div>--%>
                                            <div class="m-widget5__stats2" style="padding-right: 40px;">
                                                <span class="m-widget5__number">$<s:property value="getText('{0,number,#,##0.00}',{total})" /></span><br>
                                                <span class="m-widget5__votes">&nbsp;</span>
                                            </div>
                                        </div>
                                    </s:iterator>
                                </div>
                                <!--end::m-widget5-->
                            </div>
                        </div>
                        <!--end::Content-->
                    </div>
                </div>
                <!--End::Main Portlet-->
            </div>
        </div>


    </div>

    <!-- end:: Body -->

    <!-- end:: Page -->
    <!-- begin::Quick Nav -->
    <s:include value="AdminFooter.jsp"/>
    <%--<script src="/AdminPages/assets/demo/default/custom/components/forms/wizard/wizard.js" type="text/javascript"></script>--%>
    <!--begin::Page Resources -->
    <%--<script src="/AdminPages/assets/demo/default/custom/components/forms/widgets/select2.js" type="text/javascript"></script>--%>

    <!--end::Page Resources -->
    <script>
        jQuery(document).ready(function() {
        });

    </script>


    </body>
    <!-- end::Body -->

    <!-- Mirrored from keenthemes.com/metronic/preview/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 22 Feb 2018 11:55:21 GMT -->
</html>