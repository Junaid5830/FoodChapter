<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_ProductList.aspx.cs" Inherits="FoodChapter.Admin_ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script>
    function deleteProduct(productId) {
        //alert(productId);
        if (confirm("Are you sure?") == true) {
            $.ajax({
                url: '/api/Product/DeleteProduct',
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'productId': productId },
                statusCode: {
                    200: function () {
                        //clearProduct();
                        location.reload();
                    },
                    500: function () {
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Product not Deleted";
                        document.getElementById("lblMessage").style.color = 'red';
                        //alert('Error occured. Product not Deleted');
                    }
                },
                jsonp: 'jsonp'

            });
        }
    }

   
    $(document).ready(function () {
        
      
      <%--  var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
        if (vendorId == "0")
        {
            window.location = "home.aspx";
        }--%>

        $.ajax({
          url: '/api/Product/GetAdminAllProducts',
            type: 'Get',
            contentType: 'application/json',
            dataType: 'json',
            statusCode: {
                200: function (data) {
                    var json1 = JSON.parse(data);
                    console.log(data);
                    for (var i = 0; i < json1.PRODUCTS.length; i++) {
                      $("#vendorproduct").append('<tr class="odd pointer"><td>'+(i+1)+'</td><td class=" ">' + json1.PRODUCTS[i].PRODUCT_ID + '</td><td class=" "><a href="#">' + json1.PRODUCTS[i].NAME + '</a></td><td class=" "> ' + json1.PRODUCTS[i].PRICE + '</td><td class=" ">active</td><td class=" "><img width="50px" alt="" src="' + json1.PRODUCTS[i].PRODUCT_PHOTO + '"></td><td class=" "> ' + json1.PRODUCTS[i].STATUS + '</td><td class=" last"><a href="javascript:void(0);" onclick="NavigateToSite(' + json1.PRODUCTS[i].PRODUCT_ID + ')">View</a> | <a href="javascript:void(0);" onclick="ApprovedCall(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Approve</a> | <a href="javascript:void(0);" onclick="deleteProduct(' + json1.PRODUCTS[i].PRODUCT_ID + ')" onclick="return confirm( Are you sure? )">Delete</a></td></tr>');

                        //$("#showme").append('<li> <figure class="v2-menu-img"><a href="#"><img src="../Assets/images/menu-v-2/img-01.jpg" alt="img-01"> </a></figure><div class="v2-menu-detail"><h5><a href"#">' + json1.PRODUCTS[i].NAME + '</a></h5> <p>Category: Food, Cakes</p><ul class="rating-star vendor-page"><li>Rated: </li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star-half-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li></ul><span class="v-vp"><a onclick="EditCall(' + json1.PRODUCTS[i].PRODUCT_ID + ')" class="sm-btn111">Edit</a></span><span class="v-vp-order"><a href="javascript:void(0);" onclick="deleteProduct(' + json1.PRODUCTS[i].PRODUCT_ID + ')" class="sm-btn111">Delete</a></span></div></li>');
                    }
                    if (json1.PRODUCTS.length == 0) {
                        $("#vendorproduct").append('<tr class="odd pointer"><td style="width:25%;"></td><td style="width:50%;"><h4 style="color: red;">Sorry, there is no list available</h4></td><td style="width:25%;"></td></tr>');
                    }

                },
                500: function () {
                }

            },
            jsonp: 'jsonp'

        });

    });

    function NavigateToSite(productId) {
      $.ajax({
        url: '/api/Order/SetProductSession',
        type: 'Get',
        contentType: 'application/json',
        dataType: 'json',
        data: { 'productId': productId },
        statusCode: {
          200: function () {
            var url = 'AdminViewProduct.aspx';
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
    function ApprovedCall(productId) {
      debugger;
      $.ajax({
        url: '/api/Product/ApprovedProductsByAdmin',
        type: 'Get',
        contentType: 'application/json',
        dataType: 'json',
        data: { 'productId': productId },
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
   <div class="modal fade " id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-sm modalMsg ">
                <div class="modal-content ">
                    
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-6 col-md-offset-3">
                                    
                                    <h5 style=" text-align: center" id="lblMessage">

                                    </h5>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    <style>
        .modal-backdrop.in{
            opacity : 0;
        }
        .modal.in .modal-dialog {
    /* -webkit-transform: translate(0,0); */
    -ms-transform: translate(0,0);
    -o-transform: translate(0,0);
    transform: translate(0,0);
    background-color: #f68c93;
    margin-top: 0px;
}
    </style>
    <div class="x_title">
            <h3>List Products</h3> 
                <div class="clearfix"></div>
        </div>
        <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action" id="vendorproduct">
                        <thead>
                          <tr class="headings">
                              <th style="display: table-cell;" class="column-title">Sr# </th>
                            <th style="display: table-cell;" class="column-title">Id </th>
                            <th style="display: table-cell;" class="column-title">Name </th>
                            <th style="display: table-cell;" class="column-title">Price </th>
                            <th style="display: table-cell;" class="column-title">Active </th>
                            <th style="display: table-cell;" class="column-title">Photo </th>
                            <th style="display: table-cell;" class="column-title">Status </th>
                            <%--<th style="display: table-cell;" class="column-title">Vendor Name </th>--%>
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
