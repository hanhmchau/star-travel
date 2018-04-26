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
                <div class="m-portlet m-portlet--full-height">
                    <!--begin: Portlet Head-->
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">
                                    Manage categories
                                    <small>Data table</small>
                                </h3>
                            </div>
                        </div>
                        <div class="m-portlet__head-tools">
                            <ul class="m-portlet__nav">
                                <li class="m-portlet__nav-item">
                                    <a href="#" data-toggle="m-tooltip" class="m-portlet__nav-link m-portlet__nav-link--icon" data-direction="left" data-width="auto" title="Get help with filling up this form">
                                        <i class="flaticon-info m--icon-font-size-lg3"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--end: Portlet Head-->
                    <!--begin: Form Wizard-->

                    <div class="m-portlet__body">
                        <!--begin: Search Form -->
                        <div class="m-form m-form--label-align-right m--margin-top-20 m--margin-bottom-30">
                            <div class="row align-items-center">
                                <div class="col-xl-8 order-2 order-xl-1">
                                    <div class="form-group m-form__group row align-items-center">
                                    </div>
                                </div>
                                <div class="col-xl-4 order-1 order-xl-2 m--align-right">
                                    <a data-toggle="modal" data-target="#create-category" class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air m-btn--pill">
                                        <span>
                                            <i class="la la-cart-plus"></i>
                                            <span>New Category</span>
                                        </span>
                                    </a>
                                    <div class="m-separator m-separator--dashed d-xl-none"></div>
                                </div>
                            </div>
                        </div>
                        <!--end: Search Form -->

                        <!--begin: Datatable -->
                        <div class="m_datatable" id="ajax_data">

                        </div>
                        <!--end: Datatable -->
                    </div>
                    <!--end: Form Wizard-->
                </div>
                <!--End::Main Portlet-->
            </div>
        </div>


    </div>
    <button class="hide send-images"></button>

    <!--begin::Modal-->
    <div class="modal fade" id="m_modal_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">New category</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="recipient-name" class="form-control-label">Category name:</label>
                            <input name="category-name" type="text" class="form-control" id="recipient-name">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Update</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::Modal-->

    <!--begin::Modal-->
    <div class="modal fade" id="create-category" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Create new category</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label class="form-control-label">Category name:</label>
                            <input name="category-name" type="text" class="form-control">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Create New Category</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::Modal-->


    <!-- end:: Body -->

    <!-- end:: Page -->
    <!-- begin::Quick Nav -->
    <s:include value="AdminFooter.jsp"/>
    <%--<script src="/AdminPages/assets/demo/default/custom/components/forms/wizard/wizard.js" type="text/javascript"></script>--%>
    <!--begin::Page Resources -->
    <%--<script src="/AdminPages/assets/demo/default/custom/components/forms/widgets/select2.js" type="text/javascript"></script>--%>
    <script src="/AdminPages/assets/vendors/custom/jquery-ui/jquery-ui.bundle.js" type="text/javascript"></script>
    <!--end::Page Resources -->
    <script>
        jQuery(document).ready(function() {
//== Class definition
            var outerDatatable;

            var DatatableLocalSortDemo = function () {
                //== Private functions

                // basic demo
                var demo = function () {

                    var datatable = $('.m_datatable').mDatatable({
                        // datasource definition
                        data: {
                            type: 'remote',
                            source: {
                                read: {
                                    url: '<s:url value="/GetAllCategories" />',
                                }
                            },
                            pageSize: 10,
                            serverPaging: true,
                            serverFiltering: true,
                            serverSorting: true,
                        },

                        // layout definition
                        layout: {
                            theme: 'default', // datatable theme
                            class: '', // custom wrapper class
                            scroll: false, // enable/disable datatable scroll both horizontal and vertical when needed.
                            footer: false // display/hide footer
                        },

                        // column sorting
//                        sortable: true,

                        pagination: true,

                        search: {
                            input: $('#generalSearch')
                        },

                        // columns definition
                        columns: [{
                            data: "id",
                            field: "id",
                            title: "Id",
                            width: 100,
                            sortable: true, // disable sort for this column
                            selector: false,
                        }, {
                            field: "name",
                            title: "Name",
                            width: 850,
//                            template: '{{OrderID}} - {{ShipCountry}}'
                        }, {
                            field: "Actions",
                            title: "Actions",
                            sortable: false,
                            template: function (row, index, datatable) {
                                return '\
						<a data-value="'+row.id+'" data-toggle="modal" data-target="#m_modal_4" class="btn-update-cat m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Edit details">\
							<i class="la la-edit"></i>\
						</a>\
						<a data-value="'+row.id+'" class="btn-delete-cat m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete">\
							<i class="la la-trash"></i>\
						</a>\
					            ';
                            }
                        }]

                    });

                    outerDatatable = datatable;

                    var query = datatable.getDataSourceQuery();

                    $('#m_form_status').on('change', function () {
                        // shortcode to datatable.getDataSourceParam('query');
                        var query = datatable.getDataSourceQuery();
                        query.Status = $(this).val().toLowerCase();
                        // shortcode to datatable.setDataSourceParam('query', query);
                        datatable.setDataSourceQuery(query);
                        datatable.load();
                    }).val(typeof query.Status !== 'undefined' ? query.Status : '');

                    $('#m_form_type').on('change', function () {
                        // shortcode to datatable.getDataSourceParam('query');
                        var query = datatable.getDataSourceQuery();
                        query.Type = $(this).val().toLowerCase();
                        // shortcode to datatable.setDataSourceParam('query', query);
                        datatable.setDataSourceQuery(query);
                        datatable.load();
                    }).val(typeof query.Type !== 'undefined' ? query.Type : '');

                    $('#m_form_status, #m_form_type').selectpicker();

                };

                return {
                    // public functions
                    init: function () {
                        demo();
                    }
                };
            }();

            DatatableLocalSortDemo.init();
            var saveId;

            $('body').on('click', '.btn-update-cat', function(e){
                var id = $(this).attr('data-value');
                saveId = id;
                var title = outerDatatable.dataSet.filter((i, el) => el.id == id)[0].name;
                $("#m_modal_4").find('input').val(title);
            });

            $('body').on('click', '.btn-delete-cat', function(e){
                var id = $(this).attr('data-value');
                $(this).closest('tr').addClass('to-delete');
                $.ajax({
                    url: '<s:url value="/administrator/DeleteCategoryAction" />',
                    method: 'POST',
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        id,
                    }),
                    success: function(e) {
                        outerDatatable.row('.to-delete').remove();
                        outerDatatable.reload();
                    },
                    error: function() {
                    }
                });
            });

            $('#create-category .btn-primary').on('click', function(e){
                let name = $('#create-category').find('input').val();
                if (name) {
                    $.ajax({
                        url: '<s:url value="/administrator/CreateNewCategoryAction" />',
                        method: 'POST',
                        dataType: "json",
                        contentType: "application/json",
                        data: JSON.stringify({
                            name,
                        }),
                        success: function (e) {
                            outerDatatable.reload();
                        },
                        error: function () {
                        }
                    });
                }
            });

            $('#m_modal_4 .btn-primary').on('click', function(e){
                let name = $('#m_modal_4').find('input').val();
                console.log(name);
                if (name) {
                    $.ajax({
                        url: '<s:url value="/administrator/UpdateCategoryAction" />',
                        method: 'POST',
                        dataType: "json",
                        contentType: "application/json",
                        data: JSON.stringify({
                            id: saveId,
                            name: $('#m_modal_4').find('input').val(),
                        }),
                        success: function (e) {
                            outerDatatable.reload();
                        },
                        error: function () {
                        }
                    });
                }
            });
        });

    </script>


    </body>
    <!-- end::Body -->

    <!-- Mirrored from keenthemes.com/metronic/preview/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 22 Feb 2018 11:55:21 GMT -->
</html>