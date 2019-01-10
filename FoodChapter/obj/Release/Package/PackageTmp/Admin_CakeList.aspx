<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_CakeList.aspx.cs" Inherits="FoodChapter.Admin_CakeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script>
    function deleteProduct(cakeId) {
        if (confirm("Are you sure?") == true) {

            $.ajax({
                url: '/api/Product/DeleteCake',
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'cakeId': cakeId },
                statusCode: {
                    200: function () {
                        location.reload();
                    },
                    500: function () {
                        alert('Error occured. Cake not Deleted');
                    }
                },
                jsonp: 'jsonp'

            });
        }
    }
    function EditCall(cakeId) {

        $.ajax({
            url: '/api/Product/SetCakeSessionToEdit',
            type: 'GET',
            contentType: 'application/json',
            dataType: 'json',
            data: { 'cakeId': cakeId },
            statusCode: {
                200: function () {
                    window.location = "EditCake.aspx";
                },
                500: function () {
                    alert('Error occured. Cake not available');
                }
            },
            jsonp: 'jsonp'

        });

    }
    $(document).ready(function () {
      <%-- var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';--%>
        $.ajax({
          url: '/api/Product/GetAdminAllCakes',
            type: 'Get',
            contentType: 'application/json',
            dataType: 'json',
            statusCode: {
                200: function (data) {
                    var json1 = JSON.parse(data);

                    for (var i = 0; i < json1.CAKES.length; i++) {
                      $("#vendorcakes").append('<tr class="odd pointer"><td>'+(i+1)+'</td><td class=" ">' + json1.CAKES[i].CAKE_ID + '</td><td class=" "><a href="#">' + json1.CAKES[i].NAME + '</a></td><td class=" "> ' + json1.CAKES[i].PRICE + '</td><td class=" ">active</td><td class=" "><img width="50px" alt="" src="' + json1.CAKES[i].CAKE_PHOTO + '"></td><td class=" "> ' + json1.CAKES[i].STATUS + '</td><td class=" last"><a href="javascript:void(0);" onclick="NavigateToSite(' + json1.CAKES[i].CAKE_ID + ')">View</a> | <a href="javascript:void(0);" onclick="ApprovedCall(' + json1.CAKES[i].CAKE_ID + ')">Approve</a> | <a href="javascript:void(0);" onclick="deleteProduct(' + json1.CAKES[i].CAKE_ID + ')" onclick="return confirm( Are you sure? )">Delete</a></td></tr>');
                        
                    }
                    if (json1.CAKES.length == 0) {
                        $("#vendorcakes").append('<tr class="odd pointer"><td style="width:25%;"></td><td style="width:50%;"><h4 style="color: red;">Sorry, there is no list available</h4></td><td style="width:25%;"></td></tr>');
                    }

                },
                500: function () {
                }

            },
            jsonp: 'jsonp'

        });

    });

    function NavigateToSite(cakeId) {
      $.ajax({
        url: '/api/Order/SetCakeSession',
        type: 'Get',
        contentType: 'application/json',
        dataType: 'json',
        data: { 'cakeId': cakeId },
        statusCode: {
          200: function () {
            var url = 'AdminViewCake.aspx';
            window.location = url;
          },
          500: function () {
          }
        },
        jsonp: 'jsonp'
      });

      //var url = '/WebPages/OrderDetail.aspx';
      //var win = window.open(url, '_blank');
      //win.focus();
    }
    function ApprovedCall(cakeId) {
      debugger;
      $.ajax({
        url: '/api/Product/ApprovedCakesByAdmin',
        type: 'Get',
        contentType: 'application/json',
        dataType: 'json',
        data: { 'cakeId': cakeId },
        statusCode: {
          200: function () {
            //clearProduct();
            //alert('Product Deleted succesfullty');
            location.reload();
          },
          500: function () {
            //alert('Error occured. Product not Deleted');
          }
        },
        jsonp: 'jsonp'

      });
    }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="x_title">
            <h3>List CAKES</h3> 
                <div class="clearfix"></div>
        </div>
        <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action" id="vendorcakes">
                        <thead>
                          <tr class="headings">
                            <th style="display: table-cell;" class="column-title">Sr# </th>
                            <th style="display: table-cell;" class="column-title">Id </th>
                            <th style="display: table-cell;" class="column-title">Name </th>
                            <th style="display: table-cell;" class="column-title">Price </th>
                            <th style="display: table-cell;" class="column-title">Active </th>
                            <th style="display: table-cell;" class="column-title">Photo </th>
                            <th style="display: table-cell;" class="column-title">Status </th>
                            <th style="display: table-cell;" class="column-title no-link last"><span class="nobr">Action</span>
                            </th>
                            <th style="display: none;" class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt">1 Records Selected</span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>

                        <tbody>

                        </tbody>
                      </table>
            </div>
</asp:Content>
