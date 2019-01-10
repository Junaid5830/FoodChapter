<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlacedOrders.aspx.cs" Inherits="FoodChapter.WebPages.PlacedOrders" %>

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

     <title>Confirm Order</title>
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
        var maxTime = 0, total = 0, vendorId = -1;
        $(document).ready(function () {
            //window.onfocus = function () { location.reload(true) }
            //window.onfocus = function () { blurred && (location.reload()); };
            //window.localStorage.clear();
            //alert(localStorage.length);
            window.onload = function () {
                debugger;


                $.ajax({
                    url: '/api/Order/GetOrderReport',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'vendorId': vendorId },
                    statusCode: {
                        200: function (data) {
                            var json1 = JSON.parse(data);
                            for (var i = 0; i < json1.ORDER_DETAILS.length; i++) {
                                var tableRow = "<tr><td>" + json1.ORDER_DETAILS[i].ORDER_ID + "</td>"
                                                + "<td>" + json1.ORDER_DETAILS[i].CREATED_ON + "</td>"
                                                + "<td>" + json1.ORDER_DETAILS[i].NAME + "</td>"
                                                + "<td>" + json1.ORDER_DETAILS[i].MOBILE + "</td>"
                                                + "<td>" + json1.ORDER_DETAILS[i].ADDRESS + "</td>"
                                                + "<td> <button type=" + "button" + " class=" + "btn btn-primary btn-sm" + " onclick=NavigateToSite(" + parseInt(json1.ORDER_DETAILS[i].ORDER_ID, 10) + ")> View Details</button> " + "</td>";
                    
                                tableRow = tableRow + "</tr>"; 
                                //$("#cartTableBody").find(.append(tableRow);
                                $("table").find("tbody").append(tableRow);
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
            debugger;
            $.ajax({
                url: '/api/Order/SetOrderSession',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'orderId': orderId },
                statusCode: {
                    200: function () {
                       
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });

            var url = '/WebPages/OrderDetail.aspx';
            var win = window.open(url, '_blank');
            win.focus();
            
        }

    </script>
</head>
    
<body id="home">
      <!-- Preloader -->
       <div id="preloader">
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
         <li class="dropdown"><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
         
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
                <strong class="inner-logo"><a href="index.php"><img src="../Assets/images/logo.png" alt="logo"></a></strong>
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
    <div class="product-description" data-name="Wine #1" data-price="5">
	    <h3 class="product-name">Placed orders</h3>
		<form id="shopping-cart" action="cart.html" method="post">
            <div class="table-responsive table_make">
	<table class="table" id="cartTable">
		<thead>
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Order Date</th>
				<th scope="col">Customer Name</th>
				<th scope="col">Mobile</th>
				<th scope="col">Address</th>
				<th scope="col">Details</th>
			</tr>
		</thead>
		<tbody id="cartTableBody">

		</tbody>

	    

	</table>
                <%--<h3 class="product-name">Order Ready Time</h3> <h3 id="orderTime"></h3>
	            <h2 class="product-name">Total Amount</h2> <h2 id="totalAMount"></h2>

                <button type="button" class="btn btn-primary btn-sm" >
                    Add More Items</button> 
                 
                 <button type="button" class="btn btn-primary btn-sm" onclick="NavigateToSite()">
                    Confirm Order</button>
                </div>--%>

            
	
</form>

    </div>
    <!-- Product Description -->
                                                                      </div></div>                       
</div><!-- Box-Shadow -->
                </div> <!-- theme Holder -->
                </section>

</body>
</html>