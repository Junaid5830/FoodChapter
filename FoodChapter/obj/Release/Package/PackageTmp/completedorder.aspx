<%@ Page Title="Completed Order" Language="C#" MasterPageFile="~/MasterPages/Vendor.Master" AutoEventWireup="true" CodeBehind="completedorder.aspx.cs" Inherits="FoodChapter.WebPages.completedorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function EditOrder(orderId)
        {
           // alert(orderId);
            var order = {
                "IS_DELIVERED": 1,
                "ORDER_ID": orderId,
                "IS_REJECTED": 0,
                "REJECTED_REASON": " "
            };
            $.ajax({
                url: '/api/Order/UpdateOrderInfo',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(order),
                statusCode: {
                    200: function () {
                        location.reload();
                        //alert('Order Updated Succesfully');
                    },
                    500: function (response) {
                        alert('Error occured. Order not saved');
                    }


                },

                jsonp: 'jsonp'

            });
        }
        var maxTime = 0, total = 0, vendorId = -1;

        $(document).ready(function () {
            window.onload = function () {
                vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
                $.ajax({
                    url: '/api/Order/GetCompletedOrderReport',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'vendorId': vendorId },
                    statusCode: {
                        200: function (data) {
                            var json1 = JSON.parse(data);
                            for (var i = 0; i < json1.ORDER_DETAILS.length; i++) {
                                $("#completedorder").append('<tr class="even pointer"><td class=" "><a href="#">' + json1.ORDER_DETAILS[i].ORDER_ID + '</a></td>'
                                    + '<td class=" ">' + json1.ORDER_DETAILS[i].FOODIES + ' </td> <td class=" ">' + json1.ORDER_DETAILS[i].TOTAL_ITEMS + ' </td><td class=" ">' + json1.ORDER_DETAILS[i].CONTACT_NO + '</td>'
                                    + '<td class=" ">' + json1.ORDER_DETAILS[i].ADDRESS + ' </td><td class=" ">' + json1.ORDER_DETAILS[i].CREATED_ON + '</td>'
                                    +'<td class=" ">' + json1.ORDER_DETAILS[i].GREETINGS + '</td> <td class=" ">Pending</td>'
                                    + "<td> <button type=" + "button" + " class=" + "btn btn-primary btn-sm" + " onclick=NavigateToSite(" + parseInt(json1.ORDER_DETAILS[i].ORDER_ID) + ")> View Details</button> " + "</td>" + '</tr>');
                                // $("#completedorder").append('<tr class="odd pointer"><td style="width:25%;"></td><td style="width:50%;"><h4 style="color: red;">Sorry, there is no list available</h4></td><td style="width:25%;"></td></tr>');
                            }
                            if (json1.ORDER_DETAILS.length == 0) {
                                $("#completedorder").append('<tr class="odd pointer"><td style="width:25%;"></td><td style="width:100%;"><h4 style="color: red;">Sorry, there is no list available</h4></td><td style="width:25%;"></td><td style="width:25%;"></td><td style="width:25%;"></td><td style="width:25%;"></td><td style="width:25%;"></td><td style="width:25%;"></td></tr>');
                            }
                        },
                        500: function () {
                        }
                    },
                    jsonp: 'jsonp'
                });
            }
        });

        function NavigateToSite(orderId) {
            $.ajax({
                url: '/api/Order/SetOrderSession',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'orderId': orderId },
                statusCode: {
                    200: function () {
                        var url = 'VendorOrderDetail.aspx';
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
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 

       <div class="x_panel">
    <div class="x_title">
				<h3>Completed Orders</h3>
				<div class="clearfix"></div>
			</div>

<div class="content" style="min-height: 600px; margin-left: -40px;">
	<div class="container index">

		<div class="table-responsive">
			<table class="table table-striped jambo_table bulk_action">
				<thead>
					<tr class="headings">
						<th class="column-title"> Order Id</th>
						<th class="column-title">Foodies</th>
            <th class="column-title">Total_Items</th>
						<th class="column-title">Phone</th>
						<th class="column-title">Address</th>
						<th class="column-title">Date</th>
                        <th class="column-title">Comments</th>
						<th class="column-title">Status</th>
						<th class="column-title">Option</th>
						<%--<th class="column-title"></th>--%>

					</tr>
				</thead>

				<tbody id="completedorder">

				</tbody>
			</table>
		</div>
	</div>
</div>


           </div>


    </asp:Content>
