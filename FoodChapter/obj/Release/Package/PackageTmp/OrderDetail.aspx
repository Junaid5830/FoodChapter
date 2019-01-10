<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="FoodChapter.WebPages.OrderDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
     <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
     <link rel="stylesheet" href="../Assets/css/flora.css">
        <link rel="stylesheet" href="../Assets/css/bootstrap.css">
        <link rel="stylesheet" href="../Assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="../Assets/css/style.css">
    <link rel="stylesheet" href="../Assets/css/custom.css">
   
        <link rel="stylesheet" href="../Assets/css/responsive.css">
        <link rel="stylesheet" href="../Assets/css/theme-elements.css">
        <link rel="stylesheet" href="../Assets/css/color.css">
        <link rel="stylesheet" href="../Assets/css/vendor-profile.css" style="stylesheet">
       
    <link rel="stylesheet" href="../Assets/css/wbn-datepicker.css">

     <title>Order Detail</title>
  <link rel="stylesheet" href="../Assets/css/gallery.css">
<%--   <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
 <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
       
     <!--   <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" /> -->
<!-- <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="libs/jquery/jquery.js"><\/script>')</script>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-5002e1366084f15f"></script>
  <script src="dist/fixto.min.js"></script>

   <script src="../Assets/js/vendor/mod.js"></script>--%>

       
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
     <!--REQUIRED STYLE SHEETS-->
    <!-- BOOTSTRAP CORE STYLE CSS -->
    
     <!-- FONTAWESOME STYLE CSS -->
    <link href="../Assets/newstyle/css/font-awesome.min.css" rel="stylesheet" />
    <!-- VEGAS STYLE CSS -->

     <!-- GOOGLE FONT -->
     <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
     <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="../Assets/css/custom.css">
   
    <title></title>
    <script src="../Scripts/jquery-1.8.2.intellisense.js"></script>
    <script src="../Scripts/jquery-ui-1.8.24.min.js"></script>
    <script src="../Scripts/jquery-1.8.2.js"></script>
    <script src="../Scripts/jquery-1.8.2.min.js"></script>
    <script src="../Scripts/jquery-ui-1.8.24.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="../Assets/js/vendor/jquery-3.2.1.js"></script>
    <script src="../Assets/js/vendor/jquery-3.2.1.min.js"></script>
    <script src="../Assets/js/vendor/jquery.js"></script>
    <script>
        var orderId = 0, vendorId;
        orderId = '<%= int.Parse(FoodChapter.SessionManager.GeOrderSession()) %>';
        vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';

        var maxTime = 0, total = 0;

        function ViewCakeDetail(productId) {

            var x = document.getElementById("divTeirTable");
                x.style.display = 'block';
                

            $.ajax({
                url: '/api/Product/GetCakeDetail',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'cakeId': productId },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        $("#tierTable tbody").empty();
                        for (var i = 0; i < json1.CAKE_DETAIL.length; i++) {

                            var tableRow = "<tr><td>" + json1.CAKE_DETAIL[i].TIER_ORDER + "</td>"
                                            + "<td>" + json1.CAKE_DETAIL[i].FLAVOUR + "</td>"
                                            + "<td>" + json1.CAKE_DETAIL[i].TIER_WEIGHT + "</td>"
                                            //+ "<td>" + json1.ORDER_DETAILS[i].FLAVOUR + "</td>"
                                            + "<td>" + json1.CAKE_DETAIL[i].FLAVOUR_PRICE + "</td>"
                                            + "<td>" + json1.CAKE_DETAIL[i].TIER_WEIGHT * json1.CAKE_DETAIL[i].FLAVOUR_PRICE + "</td>"

                            tableRow = tableRow + "</tr>";
                            $("#tierTableBody").append(tableRow);

                        }
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });

        }

        $(document).ready(function () {
            //window.onfocus = function () { location.reload(true) }
            //window.onfocus = function () { blurred && (location.reload()); };
            //window.localStorage.clear();
            //alert(localStorage.length);
            
            
            var x = document.getElementById("divTeirTable");
                x.style.display = 'none';
                
                window.onload = function () {
                    var totalPrice = 0;
                    //orderId = window.location.href.split("=")[1];
                    $.ajax({
                        url: '/api/Order/GetCustomerData',
                        type: 'Get',
                        contentType: 'application/json',
                        dataType: 'json',
                        data: { 'orderId': orderId },
                        statusCode: {
                            200: function (data) {
                                var json1 = JSON.parse(data);
                                for (var i = 0; i < json1.ORDER_DETAILS.length; i++) {
                                    document.getElementById('custName').innerHTML = json1.ORDER_DETAILS[i].NAME;
                                    document.getElementById('custMobile').innerHTML = json1.ORDER_DETAILS[i].MOBILE;
                                    document.getElementById('custAddress').innerHTML = json1.ORDER_DETAILS[i].ADDRESS;
                                    
                                }

                                $.ajax({
                                    url: '/api/Order/GetOrderDetails',
                                    type: 'Get',
                                    contentType: 'application/json',
                                    dataType: 'json',
                                    data: { 'orderId': orderId, 'vendorId': vendorId },
                                    statusCode: {
                                        200: function (data) {
                                            var json1 = JSON.parse(data);
                                            for (var i = 0; i < json1.ORDER_DETAILS.length; i++) {

                                                var tableRow = "<tr><td>" + json1.ORDER_DETAILS[i].BUSINESS_ENTITY_NAME + "</td>"
                                                                + "<td>" + json1.ORDER_DETAILS[i].PERSONAL_PHONE + "</td>"
                                                                + "<td>" + json1.ORDER_DETAILS[i].PRODUCT_NAME + "</td>"
                                                                + "<td>" + json1.ORDER_DETAILS[i].QUANTITY + "</td>"
                                                                + "<td>" + json1.ORDER_DETAILS[i].UNIT_AMOUNT + "</td>"
                                                                //+ "<td>" + json1.ORDER_DETAILS[i].FLAVOUR + "</td>"
                                                                + "<td>" + json1.ORDER_DETAILS[i].TIERS_COUNT + "</td>"
                                                                + "<td>" + json1.ORDER_DETAILS[i].SIZE + "</td>"
                                                                + "<td>" + json1.ORDER_DETAILS[i].GREETINGS + "</td>";
                                                if (json1.ORDER_DETAILS[i].IS_CUSTOMIZE == 1)
                                                    tableRow = tableRow + "<td> <button type=" + "button" + " class=" + "btn btn-primary btn-sm" + " onclick=ViewCakeDetail(" + json1.ORDER_DETAILS[i].PRODUCT_ID + ")> View Details</button> " + "</td>"

                                                tableRow = tableRow + "</tr>";

                                                $("#cartTableBody").append(tableRow);
                                                //$("#cartTable").find("tbody").append(tableRow);
                                                totalPrice = totalPrice + json1.ORDER_DETAILS[i].UNIT_AMOUNT * json1.ORDER_DETAILS[i].QUANTITY;
                                                document.getElementById('txtPrice').innerHTML = totalPrice;
                                                if (json1.ORDER_DETAILS[i].IS_DELIVERED == 1) {
                                                    document.getElementById("chkDelivered").checked = true;
                                                }
                                                if (json1.ORDER_DETAILS[i].IS_REJECTED == 1) {
                                                    document.getElementById("chkRejected").checked = true;
                                                    document.getElementById("textReason").value = json1.ORDER_DETAILS[i].REJECTED_REASON;

                                                }
                                            }
                                        },
                                        500: function () {
                                        }
                                    },
                                    jsonp: 'jsonp'
                                });


                            },
                            500: function () {
                            }
                        },
                        jsonp: 'jsonp'
                    });

                }
                    

            
        });
              
        function ConfirmOrder()
        {
            var deilvered = 0, rejected = 0, rejectedReason = '';
            if (document.getElementById('chkDelivered').checked) {
                deilvered = 1;
            }
            if (document.getElementById('chkRejected').checked) {
                rejected = 1;
            }
            
            rejectedReason = document.getElementById("textReason").value;
            if (rejected == 1 && rejectedReason.length == 0) {
                alert('Please mention rejection reason');
            }
            else {

                var order = {
                    "IS_DELIVERED": deilvered,
                    "ORDER_ID": orderId,
                    "VENDOR_ID": vendorId,
                    "IS_REJECTED": rejected,
                    "REJECTED_REASON": rejectedReason
                };
                $.ajax({
                    url: '/api/Order/UpdateOrderInfo',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(order),
                    statusCode: {
                        200: function () {
                            alert('Order Updated Succesfully');
                            window.history.back();
                        },
                        500: function (response) {
                            alert('Error occured. Order not saved');
                        }


                    },

                    jsonp: 'jsonp'

                });
            }
        }


        

    </script>
</head>
    
<body id="home">
      <!-- Preloader -->
        div id="preloader">
            <div id="status">
                <img src="../Assets/images/load1.gif" alt="preloader">
            </div>
        </div>
        <!-- Preloader -->

        <!-- Wrapper -->
        <div class="wrapper">

            <!-- Header -->
            <header class="header-2">
            <!-- top header -->
                 <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="top-bar" id="top-bar">
        <ul class="nav navbar-nav navbar-right navinner">
         <li>
            <div class="form-group top-search">
                  <input type="text" class="form-control top-search-feild" placeholder="Search">
                  <i class="fa fa-search top-search-icon" aria-hidden="true"></i>
            </div>
        </li>
         <li class="dropdown"><a href="#" data-toggle="modal" data-target="#myModal" >Login</a></li>
         
      <!--   <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-shopping-cart"></span> 2 - Items<span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-cart" role="menu">
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://lorempixel.com/50/50/" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>23$</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn btn-xs btn-danger pull-right">x</button>
                    </span>
                </span>
              </li>
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://lorempixel.com/50/50/" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>23$</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn btn-xs btn-danger pull-right">x</button>
                    </span>
                </span>
              </li>
              <li class="divider"></li>
              <li><a class="text-center" href="">View Cart</a></li>
          </ul>
        </li> -->
        <li></li>
      </ul>
        </div><!-- /.navbar-collapse -->
            <!-- top header -->
               <!-- Header inner -->
    <header class="header-inner">
        <div class="container myContainer">
            <div class="row">
               <div class="col-md-4 mytag">
				<strong class="inner-logo"><a href="home.aspx"><img src="../Assets/images/logo.png" alt="logo"></a></strong>
                <p>The Best Chapter In Your Life</p>
                    </div><!-- col ends here -->
                <nav class="nav-inner">
                    <div class="navbar-header">
                        <a class="side-bar-btn pull-right fa fa-bars" href="#" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"></a>
                        <a class="responsive-logo pull-left" href="index.php"><img src="logo.png" alt="logo"></a>
                        
                    </div>
                     <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul id="nav-list-inner" class="nav-list-inner">
                                
                                    <li><a href="gallery.aspx">Gallery</a></li>
                                    <li><a href="vendors.aspx">Sellers</a></li>
                                    <li><a href="contact.aspx">contact</a></li>   
                                    <li><a href="#" data-toggle="modal" data-target="#myModal">Register</a></li>
                                          
                                </ul>

                   </div>
                </nav>
            </div>
        </div>
    </header>
    <!-- Header inner -->
    </header>
            <!-- Header -->

             <section class="parallax-window inerr-banner newbg newSection" data-parallax="scroll">

                <div class="theme-border-holder"> 
                                <div class="theme-border shadow-effect box-shadow">
                                <div class="row"><div class="col-md-12">

    <div class="product-description" data-name="Wine #1" style="margin-top:100px; margin-left:20px" data-price="5">
	    <h3 class="product-name" style="background-color:#F6A0A5;color:white;width:150px;height:25px;margin-left:5px;">Order Detail</h3>
       
         <div class="form-group col-sm-10 row" style="margin-top:20px;">

        <label for="DescriptionNote" class="control-label col-md-3 col-sm-2 col-xs-12 text-left pad">
                Customer Name : </label>
             <div class="col-md-6 col-sm-6 col-xs-12">
                <label for="DescriptionNote" class="control-label" id ="custName">
                    name </label>
            </div>
        </div>
        
        <div class="form-group col-sm-10 row">
            <label for="DescriptionNote" class="control-label col-md-3 col-sm-2 col-xs-12 text-left pad">
                Mobile : </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <label for="DescriptionNote" class="control-label " id ="custMobile">
                    mob</label>
            </div>
        </div>
        <div class="form-group col-sm-10 row">

                <label for="DescriptionNote" class="control-label col-md-3 col-sm-2 col-xs-12 text-left pad"> Address : </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <label for="DescriptionNote" class="control-label" id ="custAddress">
                    address </label>
                </div>
        </div>

	    
        

		<form id="shopping-cart" action="cart.html" method="post">
            <div class="form-group" id="divTeirTable">
                
            <div class="table-responsive col-sm-6" style="margin-top:20px;">
                <label for="DescriptionNote" class="control-label" id ="cakedetail" style="background-color:#F6A0A5;color:white;width:120px;margin-bottom:10px;">
                Cake Detail </label>
                <table class="table table-striped jambo_table bulk_action" id="tierTable">
	            <thead>
		            <tr class="headings" style="background-color:#F6A0A5;color:white">
			            <th scope="col">Tier Order</th>
			            <th scope="col">Flavour</th>
			            <th scope="col">Pound</th>
			            <th scope="col">Price</th>
			            <th scope="col">Sub Total</th>
		            </tr>
	            </thead>
	            <tbody id="tierTableBody">

	            </tbody>
            </table>
        </div>
    </div>
            <div class="table-responsive col-sm-12" style="margin-top:20px">
	<table class="table table-striped jambo_table bulk_action" id="cartTable">
		<thead>
			<tr class="headings" style="background-color:#F6A0A5;color:white">
				<th scope="col">Seller</th>
				<th scope="col">Contact No.</th>
				<th scope="col">Item</th>
				<th scope="col">Qty</th>
				<th scope="col">Unit Price</th>
				<%--<th scope="col">Flavour</th>--%>
				<th scope="col">Tiers</th>
				<th scope="col">Size</th>
				<th scope="col">GREETINGS</th>
				<th scope="col">Action</th>
			</tr>
		</thead >
		<tbody id="cartTableBody">

		</tbody>


	</table>
            
    <div class="form-group row" style="margin-left:5px; margin-top:20px;margin-bottom:30px; background-color:#F6A0A5;color:white;width:300px">

        <label for="DescriptionNote" class="control-label col-sm-6 col-xs-12 text-left pad" style="background-color:#F6A0A5;color:white">
                Order Price : </label>
        <div class="col-md-6 col-sm-2 col-xs-12">
            <label for="DescriptionNote" class="control-label" id ="txtPrice" style="background-color:#F6A0A5;color:white">
                0 </label>
        </div>   
    </div>   

    <div class="form-group">
            <input type="checkbox" name="chkDelivered" id="chkDelivered" value="Butter"  class="mint" /> Delivered
            <input type="checkbox" name="chkRejected" id="chkRejected" value="3D"  class="mint" /> Rejected
                                           
    </div> 
	
    <div class="form-group">
        <label for="Address" style="margin-top:30px;margin-bottom:20px;">
            Rejection Reason</label>
        <div >
        <textarea class="form-control " placeholder="Rejection Reason" id="textReason" rows="3"></textarea>

            <%--<input type="text"class="form-control" id="Address" placeholder="Mobile" required="required" />--%>
        </div>
    </div>

    <button type="button" class="btn upbutton pull-right" onclick="ConfirmOrder()">
    Confirm Order</button>
</form>

    </div>

            <!-- Product Description ends -->

                                                   </div></div>                       
</div><!-- Box-Shadow -->
                </div> <!-- theme Holder -->
                </section>

</body>
</html>