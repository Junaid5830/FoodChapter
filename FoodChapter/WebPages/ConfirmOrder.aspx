<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmOrder.aspx.cs" Inherits="FoodChapter.WebPages.Cart" %>

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
   
    <title>Confirm Order</title>
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
        var maxTime = 0, total = 0, customerId = -59, customerType = 1, userId = 0;
        $(document).ready(function () {


            userId = '<%= int.Parse(FoodChapter.SessionManager.GetUserSession()) %>';
            if (userId == "0") {
                //window.location = "home.aspx";
                document.getElementById('liLogout').style.display = "none";
                document.getElementById('lblUsername').innerHTML = "";

            }
            else {
                document.getElementById('lblUsername').innerHTML = "Hi " + '<%= FoodChapter.SessionManager.GetUsernameSession() %>';
                document.getElementById('liLogin').style.display = "none";
                
                $.ajax({
                    url: '/api/User/GetUserById',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'userId': userId },
                    statusCode: {
                        200: function (data) {
                            var json1 = JSON.parse(data);

                            document.getElementById("txtUserName").value = json1.USERS[0].NAME;
                            document.getElementById('txtUserMobile').value = json1.USERS[0].PHONE;
                            document.getElementById("txtEmail").value = json1.USERS[0].EMAIL;
                        },
                        500: function () {
                        }
                    },
                    jsonp: 'jsonp'
                });

            }
            $('.dropdown-inverse1 li > a').click(function (e) {
                //e.stopPropagation();
                //var catagory = $(this).closest('li').val();
                var catagory = $('#subCatagoryMenu').val(); //$('#subCatagoryMenu option:selected').text()
            });

            $('#formPlaceOrder').submit(function () {
                funPlaceOrder();
                return false;
            });

            //window.localStorage.clear();
            //alert(localStorage.length);
            window.onload = function () {
                debugger;
                for (var i = 1; i <= localStorage.length; i++) {
                    var sessionProduct = JSON.parse(localStorage.getObj(i));
                    if (sessionProduct != null) {
                        $("table").find("tbody").append("<tr><td>" + sessionProduct.NAME + "</td>"
                                                    + "<td>" + sessionProduct.TIME_REQUIRED + "</td>"
                                                    //+ "<td><input type=" + "number" + " min="+1+" id=" + "tbox" + i + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity(" + i + ")" + "></td>"

                                                    //+ "<td><input type=" + "number" + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity("+i+")" + "></td>"
                                                    + "<td>" + sessionProduct.QTY + "</td>"
                                                    + "<td>" + sessionProduct.PRICE + "</td>"
                                                    + "<td>" + parseInt(sessionProduct.PRICE, 10) * parseInt(sessionProduct.QTY, 10) + "</td></tr>"
                                                    //+ "<td> <button type=" + "button" + " class=" +"btn btn-primary btn-sm"+" onclick=RemoveItem("+i+")> X</button> "+ "</td></tr>"


                            );
                        total += parseInt(sessionProduct.PRICE, 10) * parseInt(sessionProduct.QTY, 10);
                        if (parseInt(sessionProduct.TIME_REQUIRED) > maxTime)
                            maxTime = parseInt(sessionProduct.TIME_REQUIRED);
                    }
                }

                document.getElementById("orderTime").innerHTML = maxTime;
                document.getElementById("totalAMount").innerHTML = total;
            };

        });

        Storage.prototype.setObj = function (key, obj) {
            key = 'fc' + key;
            return this.setItem(key, JSON.stringify(obj))
        };

        Storage.prototype.getObj = function (key) {
            key = 'fc' + key;
            return JSON.parse(this.getItem(key))
        };

       
        function clearOrder()
        {
            document.getElementById("txtUserName").value = "";
            document.getElementById('txtUserMobile').value = "";
            document.getElementById("txtEmail").value = "";
            document.getElementById('textAddress').value = "";
        }

        function funSaveCustomer()
        {
            var name = document.getElementById("txtUserName").value;
            var mobile = document.getElementById('txtUserMobile').value;
            var email = document.getElementById("txtEmail").value;
            var address = document.getElementById('textAddress').value;
            var city = $('#Cities').val();
            var guestCustomer = {
                "NAME": name,
                "MOBILE": mobile,
                "EMAIL": email,
                "ADDRESS": address,
                "CITY": city
            };
            $.ajax({
                url: '/api/User/saveGuestCustomer',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(guestCustomer),
                statusCode: {
                    200: function (response) {
                        customerId = parseInt(response);
                    },
                    500: function (response) {
                        // <"FC msgs> //Error occured. Order is not saved
                    }


                },

                jsonp: 'jsonp'

            });
        }

        function getCartCount() {
            var cartCount = 0;
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                    cartCount++;
                }
            }
            return cartCount;
        }

        function funPlaceOrder()
        {
            if (userId == "0")
            {
                alert('To place order please registered yourself or login');
                window.location = "home.aspx";
            }
            else
            {
                if (getCartCount() == 0)
                { }
                else
                {
                    if (customerId == -59) {
                        var name = document.getElementById("txtUserName").value;
                        var mobile = document.getElementById('txtUserMobile').value;
                        var email = document.getElementById("txtEmail").value;
                        var address = document.getElementById('textAddress').value;
                        var city = $('#Cities').val();
                        var guestCustomer = {
                            "NAME": name,
                            "MOBILE": mobile,
                            "EMAIL": email,
                            "ADDRESS": address,
                            "CITY": city
                        };
                        $.ajax({
                            url: '/api/User/saveGuestCustomer',
                            type: 'POST',
                            contentType: 'application/json',
                            dataType: 'json',
                            data: JSON.stringify(guestCustomer),
                            statusCode: {
                                200: function (response) {
                                    customerId = parseInt(response);
                                    funSaveOrderDetail();
                                },
                                500: function (response) {
                                    // <"FC msgs> //Error occured. Order is not saved

                                }


                            },

                            jsonp: 'jsonp'

                        });
                        customerType = 0;
                    }
                    else {
                        funSaveOrderDetail();
                    }
                }
                //while (customerId == -59)
                //{ }
            }
        }

        function fcStartIndex() {
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                    return i;
                }
            }
        }

        function funSaveOrderDetail()
        {
            debugger;
            var fcIndex = fcStartIndex();
            var tempObj = JSON.parse(localStorage.getObj(fcIndex));

            var VendroId = tempObj.VENDOR_ID;
            var order = {
                "CUSTOMER_ID": customerId,
                "VENDOR_ID": VendroId,
                "CUSTOMER_TYPE": customerType,
                "USER_ID": userId,
                "IS_REJECTED": 0,
                "IS_DELIVERED": 0
            };
            
            $.ajax({
                url: '/api/Order/SaveOrder',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(order),
                statusCode: {
                    200: function (response) {
                        var OrderId = parseInt(response);
                        var orderDetail = [];
                        var cakeDetail = [];
                        var detailCount = 0, orderCoount = 0;
                        for (var i = fcIndex; i <= localStorage.length; i++) {
                            var tempObj = JSON.parse(localStorage.getObj(i));
                            if (tempObj != null) {
                                var product = {
                                    "PRODUCT_ID": tempObj.PRODUCT_ID,
                                    "VENDOR_ID": tempObj.VENDOR_ID,
                                    "USER_ID": userId,
                                    "QUANTITY": tempObj.QTY,
                                    "UNIT_AMOUNT": tempObj.PRICE,
                                    "PRODUCT_TYPE": tempObj.PRODUCT_SUB_CATEGORY_ID,
                                    "ORDER_ID": OrderId,
                                    "CAKE_FLAVOR_ID": tempObj.CAKE_FLAVOR_ID,
                                    "TIERS_COUNT": tempObj.TIERS_COUNT,
                                    "SIZE": tempObj.SIZE,
                                    "GREETINGS": tempObj.GREETINGS,
                                    "IS_CUSTOMIZE": tempObj.IS_CUSTOMIZE
                                };
                                orderDetail[i - fcIndex] = product;
                                debugger;
                                if (tempObj.IS_CUSTOMIZE == 1) {
                                    var cakeDetailObj = tempObj.CAKE_CUSTOMIZE_DETAIL;
                                    for (var k = 0; k < cakeDetailObj.length; k++) {
                                        var customDetail = {
                                            "CAKE_ID": tempObj.PRODUCT_ID,
                                            "ORDER_ID": OrderId,
                                            "CAKE_FALVOUR_ID": cakeDetailObj[k].CAKE_FALVOUR_ID,
                                            "TIER_ORDER": cakeDetailObj[k].TIER_ORDER,
                                            "TIER_WEIGHT": cakeDetailObj[k].TIER_WEIGHT,
                                            "FLAVOUR_PRICE": cakeDetailObj[k].FLAVOUR_PRICE
                                        };
                                        cakeDetail[detailCount] = customDetail;
                                        detailCount++;
                                    }

                                }
                            }
                        }
                        var productListJson = JSON.stringify(orderDetail);
                        var cakeDetailList = JSON.stringify(cakeDetail);
                        $.ajax({
                            url: '/api/Order/SaveOrderDetail',
                            type: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            data: productListJson,// JSON.stringify(tagsList) },//JSON.stringify({ 'tagsList': tagsList }),
                            statusCode: {
                                200: function () { },
                                500: function () {
                                    // <"FC msgs> //Error occured. Order is not saved
                                }


                            },

                            jsonp: 'jsonp'

                        });

                        
                        $.ajax({
                            url: '/api/Product/SaveCakeCustomizeDetail',
                            type: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            data: cakeDetailList,// JSON.stringify(tagsList) },//JSON.stringify({ 'tagsList': tagsList }),
                            statusCode: {
                                200: function () {
                                    //clearOrder();
                                    //$("#panelBody").empty();
                                    //document.getElementById("panelBody").removeChild;
                                    //<"FC msgs> //Order Saved Succesfully
                                    localStorage.clear();
                                },
                                500: function () {
                                    // <"FC msgs> //Error occured. Order is not saved
                                }
                            },
                            jsonp: 'jsonp'
                        });

                        //alert('Order Save succesfullty');
                        //localStorage.clear();

                        var payment = document.getElementById("totalAMount").innerHTML;
                        var orderDate = new Date();
                        var email = document.getElementById("txtEmail").value;
                        $.ajax({
                            url: '/api/Order/SendEmailToUser',
                            type: 'Get',
                            contentType: 'application/json',
                            dataType: 'json',
                            data: { 'emailData': email + '|' + OrderId + '|' + payment + '|' + orderDate },
                            statusCode: {
                                200: function () {


                                },
                                500: function () {
                                }
                            },
                            jsonp: 'jsonp'
                        });
                        $.ajax({
                            url: '/api/Order/SetOrderSession',
                            type: 'Get',
                            contentType: 'application/json',
                            dataType: 'json',
                            data: { 'orderId': OrderId },
                            statusCode: {
                                200: function () {
                                    $.ajax({
                                        url: '/api/Order/SetOrderPaymentSession',
                                        type: 'Get',
                                        contentType: 'application/json',
                                        dataType: 'json',
                                        data: { 'payment': payment },
                                        statusCode: {
                                            200: function () {
                                                $.ajax({
                                                    url: '/api/Order/SetOrderPaymentDate',
                                                    type: 'Get',
                                                    contentType: 'application/json',
                                                    dataType: 'json',
                                                    data: { 'orderDate': orderDate },
                                                    statusCode: {
                                                        200: function () {
                                                            clearOrder();
                                                            window.location = 'thankyou.aspx';
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
                                },
                                500: function () {
                                }
                            },
                            jsonp: 'jsonp'
                        });
                    },
                    500: function (response) {
                        // <"FC msgs> //Error occured. Order is not saved
                    }
                },
                jsonp: 'jsonp'
            });

            

        }
        

    </script>
</head>
    
<body id="home">
      <!-- Preloader -->
       <%--<div id="preloader">
            <div id="status">
                <img src="../Assets/images/load1.gif" alt="preloader">
            </div>
        </div>--%>
        <!-- Preloader -->

        <!-- Wrapper -->
        <div class="wrapper">

            <!-- Header -->
            <header class="header-2">
            <!-- top header -->
                 <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="top-bar" id="top-bar">
        <ul class="nav navbar-nav navbar-right navinner">
         <li class="dropdown"><label style="padding:10px 15px;color:#f7f7f7;" id="lblUsername"></label></li>
            <%--<li>
            <div class="form-group top-search">
                  <input type="text" class="form-control top-search-feild" placeholder="Search">
                  <i class="fa fa-search top-search-icon" aria-hidden="true"></i>
            </div>
        </li>--%>
         <li id="liLogin" class="dropdown"><a href="#" data-toggle="modal" data-target="#myModal" ></a></li>
         <li id="liLogout" class="dropdown"><a href="home.aspx" >Logout</a></li>
         
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
                                    <li><a href="home.aspx">Home</a></li>
                                    <li><a href="gallery.aspx">Gallery</a></li>
                                    <li><a href="vendors.aspx">Sellers</a></li>
                                    <li><a href="contact.aspx">contact</a></li>   
                                    <%--<li id="liLogout"><a href="home.aspx">Logout</a></li>--%>      
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
	    <h2 class="product-name">Confirm Order</h2>
		<form id="shopping-cart" action="cart.html" method="post">
            <div class="table-responsive table_make">
	<table class="table" id="cartTable">
		<thead>
			<tr>
				<th scope="col">Item</th>
				<th scope="col">Time Require</th>
				<th scope="col">Qty</th>
				<th scope="col">Unit Price</th>
				<th scope="col">Sub Total</th>
			</tr>
		</thead>
		<tbody>

		</tbody>

	    

	</table>
                <h3 class="product-name2">Order Ready Time</h3> <h3 id="orderTime"></h3>
	            <h3 class="product-name2">Total Amount</h3> <h3 id="totalAMount"></h3>

                

            
	
</form>
 <form role="form" class="form-horizontal" id="formPlaceOrder" action="#">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-8">
                                        
                                           <input type="text" class="form-control" id="txtUserName" placeholder="Name" required="required" />
                                           
                                        
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="mobile" class="col-sm-2 control-label">
                                        Mobile</label>
                                    <div class="col-sm-8">
                                        <input class="form-control" pattern="[0-9]{11}" title="11 or more digit contact number" id="txtUserMobile" placeholder="Mobile" required="required" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="mobile" class="col-sm-2 control-label">
                                        EMAIL</label>
                                    <div class="col-sm-8">
                                        <input type="email" class="form-control" id="txtEmail" placeholder="Email" required="required" />
                                    </div>
                                </div>
                                <div class="form-group">
                                        <label for="mobile" class="col-sm-2 control-label">
                                        City</label>
                                        <div class="col-sm-8">
                                                    <select class="form-control" id="Cities">
                                                        <option value="0">Select City</option>
                                                        <option value="Lahore">Lahore</option>
                                                        <option value="Islamabad">Islamabad</option>
                                                        <option value="Karachi">Karachi</option>
                                                    </select>

                                                      
                                                </div>

                      
                                            </div>
                                <div class="form-group">
                                    <label for="Address" class="col-sm-2 control-label">
                                        Address</label>
                                    <div class="col-sm-8">
                                    <textarea class="form-control " placeholder="Address" id="textAddress" rows="5" required="required"></textarea>

                                        <%--<input type="text"class="form-control" id="Address" placeholder="Mobile" required="required" />--%>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="submit" class="btn upbutton pull-right" >
                                            Place Order</button> </div>
                                            
                                </div>
                                </form>
       
    </div>
                </div></div>                       
</div><!-- Box-Shadow -->
                </div> <!-- theme Holder -->
                </section>
 
</body>
</html>