﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ViewOrderDetail.aspx.cs" Inherits="FoodChapter.ViewOrderDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script>
    $(document).ready(function () {
    $.ajax({
      url: '/api/Order/GetOrderDetail',
      type: 'Get',
      contentType: 'application/json',
      dataType: 'json',
      data: { 'orderId': <%= int.Parse(FoodChapter.SessionManager.GeOrderSession()) %> },
      statusCode: {
        200: function (data) {
          var json1 = JSON.parse(data);
         // debugger;
          for (var i = 0; i < json1.ORDERS.length; i++) {
            document.getElementById('orderid').innerText = json1.ORDERS[i].ORDER_ID;
            document.getElementById('email').innerText = json1.ORDERS[i].EMAIL;
            document.getElementById('contactNo').innerText = json1.ORDERS[i].CONTACT_NO;
            document.getElementById('address').innerText = json1.ORDERS[i].ADDRESS;
            document.getElementById('messsage').innerText = json1.ORDERS[i].GREETINGS;
            document.getElementById('customername').innerHTML = json1.ORDERS[i].FOODIES;


          }
        }
      },
      jsonp: 'jsonp'
    });
   
        var totalPrice = 0;
              $.ajax({
                  url: '/api/Order/GetAdminOrderDetails',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'orderId': <%= int.Parse(FoodChapter.SessionManager.GeOrderSession()) %>},
                statusCode: {
                  200: function (data) {
                    var json1 = JSON.parse(data);
                    for (var i = 0; i < json1.ORDER_DETAILS.length; i++) {

                      var tableRow = "<tr><td>"+(i+1)+"</td> "
                                      +" <td>" + json1.ORDER_DETAILS[i].ITEM_NAME + "</td>"
                                      + "<td>" + json1.ORDER_DETAILS[i].QUANTITY + "</td>"
                                      + "<td>" +"RS:" + json1.ORDER_DETAILS[i].PRICE * json1.ORDER_DETAILS[i].QUANTITY + "</td>"
                                      + "<td>" + json1.ORDER_DETAILS[i].STATUS + "</td>" 
                                      //+ "<td class="+"Vaction"+">"+"<a href="+"javascript:void(0);"+" onclick="+"DeliveredCall(" + json1.ORDER_DETAILS[i].ORDER_DETAIL_ID + ")>"+"<button  class="+"btn"+" style=margin-right:10px >"+"Delivered"+"</button>"+"</a>"
                                      //+"<a href="+"javascript:void(0);"+" onclick="+"RejectedCall(" + json1.ORDER_DETAILS[i].ORDER_DETAIL_ID + ")>"+"<button class="+"btn"+">"+"Rejected"+"</button>"+"</a>"+"</td></tr>";

                      $("#cartTableBody").append(tableRow);
                    }
                  },
                  500: function () {
                  }
                },
                jsonp: 'jsonp'
              });
    });
    
    function DeliveredCall(orderId) {
        $.ajax({
          url: '/api/order/DeliveredOrder',
          type: 'Get',
          contentType: 'application/json',
          dataType: 'json',
          data: { 'orderId': orderId },
          statusCode: {
            200: function () {
              location.reload();
            },
            500: function () {
            }
          },
          jsonp: 'jsonp'

        });
    }
    function RejectedCall(orderId) {
      $.ajax({
        url: '/api/order/RejectedOrder',
        type: 'Get',
        contentType: 'application/json',
        dataType: 'json',
        data: { 'orderId': orderId },
        statusCode: {
          200: function () {
            location.reload();
          },
          500: function () {
          }
        },
        jsonp: 'jsonp'

      });
    }
  </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <section class="content-header">
                    
                  
    <div class="x_title col-md-12">
        <h2 style="margin-bottom: 40px;">Order Details</h2>

        <div class="clearfix"></div>
    </div>
    <div class="row">
        <form id="formSaveCake" action="#">
            <div>
                <div class="col-md-12">
                    <div class="col-md-6">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12 vhead" for="subName">Order ID</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <label class="vdetail" id="orderid"></label>
                        </div>
                        <!-- col ends here -->
                        <br>
                        <br>


                        <!-- form Group ends Here -->
                    </div>
                    <div class="col-md-6">

                        <label class="control-label col-md-4 col-sm-3 col-xs-12 vhead" for="subName">Customer Name</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <label class="vdetail" id="customername"></label>

                        </div>
                        <!-- col ends here -->
                        <br>
                        <br>


                        <!-- inner col ends here -->
                    </div>


                </div>
                <!-- form Group ends Here -->

                <div class="col-md-12">
                    <div class="col-md-6">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12 vhead" for="subDescription">Email</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <label class="vdetail" id="email"></label>
                        </div>
                        <!-- col ends here -->
                        <br>
                        <br>
                    </div>

                    <!-- form Group ends Here -->


                    <div class="col-md-6">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12 vhead" for="subDescription">Phone</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <label class="vdetail" id="contactNo"></label>
                        </div>
                        
                        <!-- col ends here -->
                        <br>
                        <br>
                    </div>

                </div>
                <!-- form Group ends Here -->


                <div class="col-md-12">
                    <div class="col-md-6">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12 vhead" for="subDescription">Address</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <label class="vdetail" id="address"></label>
                        </div>
                        
                        <!-- col ends here -->
                        <br>
                        <br>
                    </div>

                    <!-- form Group ends Here -->
                    <div class="col-md-6">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12 vhead" for="subName">Message</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">

                            <label class="vdetail" id="messsage"></label>
                        </div>
                        <!-- col ends here -->
                        <br>
                        <br>
                    </div>
                </div>
        
        <div class="col-md-12" style="margin-top: 50px;">

            <form method="post" action="#" class="cart_form col-md-12">
                <table class="cart_headings col-md-12" cellspacing="0">
                    <thead>
                        <tr>
                            <th class="vrhead">Sr#</th>
                            <th class="vrhead">Item Name</th>
                            <th class="vrhead">Quantity</th>
                            <th class="vrhead">Price</th>
                            <th class="vrhead">Status</th>
                            <%--<th class="vrhead">Action</th>--%>
                        </tr>
                    </thead>
                    <tbody class="vodetail" id="cartTableBody">

                 <%--       <tr class="woocommerce-cart-form__cart-item cart_item">


                           

                            <td class="Vstatus">
                                <span>Active</span>
                            </td>

                            <td class="Vaction">
                                <button class="btn">Delivered</button>
                                <button class="btn">Rejected</button>
                            </td>


                        </tr>--%>

                    </tbody>

                </table>
            </form>
        </div>
    </div></form>



            </div></section>
</asp:Content>
