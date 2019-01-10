<%@ Page Title="Vendor Dashboard" Language="C#" MasterPageFile="~/MasterPages/Vendor.Master" AutoEventWireup="true" CodeBehind="VendorDashboard.aspx.cs" Inherits="FoodChapter.WebPages.VendorDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        $(document).ready(function () {
            debugger;
            var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
            if (vendorId == "0") {
                window.location = "Home.aspx";
            }
            $.ajax({
                url: '/api/User/GetDashBoardData',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;
                        document.getElementById("pendingOrders").innerHTML = json1.DASHBOARD[0].PENDING_ORDERS;
                        document.getElementById("orderCount").innerHTML = json1.DASHBOARD[0].ORDERS;
                        document.getElementById("customerCount").innerHTML = json1.DASHBOARD[0].CUSTOMERS;
                        document.getElementById("productCount").innerHTML = json1.DASHBOARD[0].PRODUCTS;
                       
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        });

    </script>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="dashboard_graph">
	
  
            <div class="col-sm-12 ">
	            <div class="panel panel-default">            
	            	

	            	<div class="panel-body">
	            		<!-- item -->
					    <div class="row-item row">
		                	
		                	
							<div class="col-lg-6 col-xs-6">
								  <!-- small box -->
								  <div class="small-box bg-aqua">
									<div class="inner">
									  <h3 id="pendingOrders">80</h3>

									  <p>Pending Orders</p>
									</div>
									<div class="icon">
									 <i class="fa fa-chevron-right"></i>
									</div> 
									<%--<a href="pendingorder.aspx" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>--%>
								  </div>
							</div>
							 <div class="col-lg-6 col-xs-6">
							  <!-- small box -->
							  <div class="small-box bg-green">
								<div class="inner">
								  <h3 id="productCount">52</h3>

								  <p>Products</p>
								</div>
								<div class="icon">
								   <i class="fa fa-shopping-cart"></i>
								</div>
								<%--<a href="VendorProducts.aspx" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>--%>
							  </div>
							</div>
							<!-- ./col -->
							<div class="col-lg-6 col-xs-6">
							  <!-- small box -->
							  <div class="small-box bg-yellow">
								<div class="inner">
								  <h3 id="customerCount">96</h3>

								  <p>Customers</p>
								</div>
								<div class="icon">
								 <i class="fa fa-user"></i>
								</div>
								<%--<a href="#" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>--%>
							  </div>
							</div>
							<!-- ./col -->
							<div class="col-lg-6 col-xs-6">
							  <!-- small box -->
							  <div class="small-box bg-red">
								<div class="inner">
								  <h3 id="orderCount">424</h3>

								  <p>Completed Orders</p>
								</div>
								<div class="icon">
                                    <i class="fa fa-truck" aria-hidden="true"></i>
								
								</div>
								<%--<a href="completedorder.aspx" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>--%>
							  </div>
							</div>
							
		                </div>
		                <!-- end item -->

					</div>
				</div>
        	</div>


	<div class="clearfix"></div>
</div>	
</asp:Content>
