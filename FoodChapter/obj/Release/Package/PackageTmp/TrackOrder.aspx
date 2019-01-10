<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TrackOrder.aspx.cs" Inherits="FoodChapter.TrackOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style>

.navbar-inverse
{
    background-color:transparent;    border:none;
}
.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover
{
    background-color:transparent;
}

.container-fluid1
{
    margin: 0 auto;
    float: none;
    margin-top: 30px;
}

</style>
    <script>
     
        $(document).ready(function () {
          
          var orderId = 0;
          var OrderDetailId = 0;
          $("#btnSearch").click(function () {
            if (document.getElementById('txtOrderId').value == "") {
              
              document.getElementById('errormessage').innerHTML = 'No Orders for this Id.';
              document.getElementById('errormessage').style.color = 'red';
            }
            else {
                OrderDetailId = document.getElementById('txtOrderId').value;
              $.ajax({
                url: '/api/Order/getCustomerOrderDetails',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'orderId': document.getElementById('txtOrderId').value },
                statusCode: {
                  200: function (data) {
                    var json1 = JSON.parse(data);
                    console.log(data);
                    $("#cartTable .cart_det").empty();
                    for (var i = 0; i < json1.ORDER_DETAILS.length; i++) {

                      var tableRow = "<tr class=" + "product" + "><td><img" + " style=" + "width:100px; float:left" + " src= " + json1.ORDER_DETAILS[i].ITEM_PHOTO + ">" + "<a href=" + "#><span class=" + "track_name>" + json1.ORDER_DETAILS[i].ITEM_NAME + "</span>" + "</a>" + "</td>"
                                      + "<td><span class=" + "track_name>" + json1.ORDER_DETAILS[i].QUANTITY + "</span>" + "</td>"
                                      + "<td><span class=" + "track_name>" + "RS:" + json1.ORDER_DETAILS[i].PRICE * json1.ORDER_DETAILS[i].QUANTITY + "</span>" + "</td>"
                                      + "<td><span class=" + "track_name>" + json1.ORDER_DETAILS[i].CREATED_ON + "</span>" + "</td>"
                                      + "<td><span class=" + "staus>" + json1.ORDER_DETAILS[i].STATUS + "</span>" + "</td>"
                                      + "<td><button class=" + "rcustomize"+" onclick=CancelOrder(" + OrderDetailId + ")>Cancel</button>" + "</td></tr>"
                      $("#cartTable").append(tableRow);
                      $("#errormessage").hide();  
                    }
                  },
                  500: function () {
                  }
                },
                jsonp: 'jsonp'
              });
              return;
            }
          });
        });

        function CancelOrder(OrderDetailId) {
          alert();
           $.ajax({
            url: '/api/Order/CancelOrder',
            type: 'Get',
            contentType: 'application/json',
            dataType: 'json',
            data: { 'orderId': document.getElementById('txtOrderId').value ,'OrderDetailId':OrderDetailId},
            statusCode: {
              200: function (data) {
                var json1 = JSON.parse(data);
                console.log(data);
              
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
	<div class="trackorder_bg">
	    <div class="gallery_bg fade1">
            <div class="seller_heading">
			        <h1 style="margin-top: 188px;" class="sellers_pg_heading">Track Order</h1>
	        </div>
        </div>
    </div>
	<div class="startcontent">
        <img class="img_right sr_tp m_animate" src="Frontend/images/bg_1.png"/>
        <img class="img_left m_animate" src="Frontend/images/bg_2.png"/>
        <div class="container">
            <div class="cart_pg_wrap">
    	            <div class="container_section">
			            <div class="track_container col-md-12 col-sm-12">
			   		        
						        <div class="checkout_form_wrap col-md-6" data-validate="Name is required">
							        <input class="checkout_input filterOrder" id="txtOrderId" type="text" name="order-id" placeholder="ORDER ID"/>
							        <span class="login_placeholder" data-placeholder="ORDER-ID"></span>
						        </div>
				            
			                    <div class="proceed_btn_wrap col-md-12">
							        <div class="">
								        <button class="cbtn_submit" id="btnSearch" >SUBMIT</button>
							        </div>
			                    </div>
                            
			                <div class="track_order_wrap col-md-12 col-sm-12">

    			                    <table class="cart_headings"id="cartTable">
            		                    <thead>
            			                <tr>
            				

            				                <th class="product-name">Product</th>
            				                <th class="product-quantity">Quantity</th>
							                <th class="product-price">Price</th>
            				
            				                <th class="product-order-time">Order Time</th>
            				                <th class="product-status">Status</th>
                                     <th class="product-status">Cancel</th>
            			                </tr>
            	   	                    </thead>
                             
            	   	                    <tbody class="cart_det">
			
                                    </tbody>
						                <tbody class="cart_det">
			
						               
                                    </tbody>
            	   	                 </table>
            	      <label style="text-align:center;" id="errormessage"></label>
                        </div>
		             
	                </div>
                </div>
            </div> 
        </div>
    </div>

</asp:Content>
