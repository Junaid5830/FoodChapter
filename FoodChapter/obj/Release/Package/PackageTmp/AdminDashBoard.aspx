<%@ Page Title="Vendor Dashboard" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashBoard.aspx.cs" Inherits="FoodChapter.WebPages.VendorDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
     $(document).ready(function () {
            debugger;
            var adminId = '<%= int.Parse(FoodChapter.SessionManager.GetAdminSession()) %>';
       if (adminId == "0") {
                window.location = "login.aspx";
            }
            $.ajax({
              url: '/api/User/GetAdminDashBoardData',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'adminId': adminId },
                statusCode: {
                    200: function (data) {
                      var json1 = JSON.parse(data);
                      console.log(data);
                        debugger;
                        document.getElementById("pendingOrders").innerHTML = json1.DASHBOARD[0].PENDING_ORDERS;
                        document.getElementById("complete").innerHTML = json1.DASHBOARD[0].COMPLETED_ORDERS;
                        document.getElementById("rejected").innerHTML = json1.DASHBOARD[0].COMPLETED_ORDERS1;
                        document.getElementById("customer").innerHTML = json1.DASHBOARD[0].CUSTOMERS;
                        document.getElementById("vendor").innerHTML = json1.DASHBOARD[0].VENDORS;
                        document.getElementById("cake").innerHTML = json1.DASHBOARD[0].CAKES;
                        document.getElementById("food").innerHTML = json1.DASHBOARD[0].FOODS;
                        document.getElementById("frozen").innerHTML = json1.DASHBOARD[0].FROZEN_FOODS;
                        document.getElementById("dessert").innerHTML = json1.DASHBOARD[0].DESSERTS;
                       
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
									  <h3 id="pendingOrders"></h3>

									  <p>Pending Orders</p>
									</div>
									<div class="icon">
									 <i class="fa fa-chevron-right"></i>
									</div> 
									<a href="Pendingorder.aspx" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
								  </div>
							</div>
							 <div class="col-lg-6 col-xs-6">
							  <!-- small box -->
							  <div class="small-box bg-green">
								<div class="inner">
								  <h3 id="complete"></h3>

								  <p>Complete Orders</p>
								</div>
								<div class="icon">
								 <i class="fa fa-product-hunt"></i>
								</div>
								<a href="Completeorder.aspx" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
							  </div>
							</div>
               	<div class="col-lg-6 col-xs-6">
							  <!-- small box -->
							  <div class="small-box bg-red">
								<div class="inner">
								  <h3 id="rejected"></h3>

								  <p>Rejected Orders</p>
								</div>
								<div class="icon">
								  <i class="fa fa-shopping-cart"></i>
								</div>
								<a href="#" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
							  </div>
							</div>
							<!-- ./col -->
							<div class="col-lg-6 col-xs-6">
							  <!-- small box -->
							  <div class="small-box bg-yellow">
								<div class="inner">
								  <h3 id="customer"></h3>

								  <p>Customers</p>
								</div>
								<div class="icon">
								 <i class="fa fa-user"></i>
								</div>
								<a href="#" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
							  </div>
							</div>
							<!-- ./col -->
							<div class="col-lg-6 col-xs-6">
							  <!-- small box -->
							  <div class="small-box bg-blue">
								<div class="inner">
								  <h3 id="vendor"></h3>

								  <p>Vendors</p>
								</div>
								<div class="icon">
								  <i class="fa fa-user"></i>
								</div>
								<a href="#" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
							  </div>
							</div>
													<div class="col-lg-6 col-xs-6">
							  <!-- small box -->
							  <div class="small-box bg-gray">
								<div class="inner">
								  <h3 id="cake"></h3>

								  <p>Cakes</p>
								</div>
								<div class="icon">
								 	 <i class="fa fa-birthday-cake"></i>
								</div>
								<a href="CakeList.aspx" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
							  </div>
							</div>

                						<div class="col-lg-6 col-xs-6">
							  <!-- small box -->
							  <div class="small-box bg-green">
								<div class="inner">
								  <h3 id="food"></h3>

								  <p>Foods</p>
								</div>
								<div class="icon">
								 <i class="fa fa-utensils"></i>
								</div>
								<a href="vendorproducts.aspx" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
							  </div>
							</div>

                						<div class="col-lg-6 col-xs-6">
							  <!-- small box -->
							  <div class="small-box bg-orange">
								<div class="inner">
								  <h3 id="frozen"></h3>

								  <p>Frozen Foods</p>
								</div>
								<div class="icon">
								 <i class="fa fa-cookie"></i>
								</div>
								<a href="vendorproducts.aspx" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
							  </div>
							</div>

                						<div class="col-lg-6 col-xs-6">
							  <!-- small box -->
							  <div class="small-box bg-yellow">
								<div class="inner">
								  <h3 id="dessert"></h3>

								  <p>Desserts</p>
								</div>
								<div class="icon">
								<i class="fa fa-cookie"></i>
								</div>
								<a href="vendorproducts.aspx" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
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
