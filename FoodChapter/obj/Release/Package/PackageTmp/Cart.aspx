<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FoodChapter.WebPages.Cart" %>

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
        <link rel="stylesheet" href="../Assets/css/ratings/rating.min.css" />
        <link rel="stylesheet" href="../Assets/css/ratings/rotate.css" />
        <link rel="stylesheet" href="../Assets/css/color.css"/>
        <link rel="stylesheet" href="../Assets/css/vendor-profile.css" style="stylesheet">
       
    <link rel="stylesheet" href="../Assets/css/wbn-datepicker.css">

     <title>Cart</title>
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
    <script src="../Scripts/rating.min.js"></script>
    <script src="../Scripts/rating.js"></script>
     <script src="..../Assets/js/ratings/rating.min.js"></script>
     <script src="..../Assets/js/ratings/rating.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="../Assets/js/vendor/jquery-3.2.1.js"></script>
    <script src="../Assets/js/vendor/jquery-3.2.1.min.js"></script>
    <script src="../Assets/js/vendor/jquery.js"></script>
    <script>

        

        var maxTime = 0, total = 0, userId = 0;
        userId = '<%= int.Parse(FoodChapter.SessionManager.GetUserSession()) %>';

        $(document).ready(function () {
            
            var userId = '<%= int.Parse(FoodChapter.SessionManager.GetUserSession()) %>';
            if (userId == "0") {
                //window.location = "home.aspx";
                document.getElementById('liLogout').style.display = "none";
                document.getElementById('lblUsername').innerHTML = "";

            }
            else {
                document.getElementById('lblUsername').innerHTML = "Hi " + '<%= FoodChapter.SessionManager.GetUsernameSession() %>';
                document.getElementById('liLogin').style.display = "none";
            }

            LoadDetails();
            window.onload = function () {
                debugger;
                //localStorage.clear();
                
            };

        });

        function LoadDetails()
        {
            $("#cartTable tbody").empty();
            
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                    
                    var tableRow = "<tr><td>" + sessionProduct.NAME + "</td>"
                                                + "<td>" + sessionProduct.TIME_REQUIRED + "</td>"
                                                + "<td><input type=" + "number" + " class=" + "mixed" + " min=" + 1 + " id=" + "tbox" + i + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity(" + i + ")" + "></td>"

                                                //+ "<td><input type=" + "number" + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity("+i+")" + "></td>"
                                                //+ "<td>" + sessionProduct.QTY + "</td>"
                                                + "<td>" + sessionProduct.PRICE + "</td>"
                                                + "<td>" + parseInt(sessionProduct.PRICE, 10) * parseInt(sessionProduct.QTY, 10) + "</td>"
                                                + "<td> <button type=" + "button" + " class=" + "abovebtn" + " onclick=RemoveItem(" + i + ")> X</button> " + "</td>";
                    if (sessionProduct.PRODUCT_SUB_CATEGORY_ID == 0)
                        tableRow = tableRow + "<td> <button type=" + "button" + " class=" + "abovebtn" + " onclick=CustomizeItem(" + i + ")> Customize</button> " + "</td>";

                    tableRow = tableRow + "</tr>"
                    $("table").find("tbody").append(tableRow);
                    total += parseInt(sessionProduct.PRICE, 10) * parseInt(sessionProduct.QTY, 10);
                    if (parseInt(sessionProduct.TIME_REQUIRED) > maxTime)
                        maxTime = parseInt(sessionProduct.TIME_REQUIRED);
                }
            }

            document.getElementById("orderTime").innerHTML = maxTime;
            document.getElementById("totalAMount").innerHTML = total;
        }
        function changeQuantity(currentIndex)
        {
            var fcIndex = fcStartIndex();
            var newIndex = currentIndex - fcIndex + 1;
            var tableCells = document.getElementById('cartTable').rows.item(newIndex).cells;
            var updateTotal = parseInt(document.getElementById("tbox" + currentIndex).value) * parseInt(tableCells.item(3).innerHTML);
            var isnum = /^\d+$/.test(updateTotal);
            if (isnum != true) {
                // <"FC msgs> //Item quantity must be greater than 0.
                document.getElementById("tbox" + newIndex).value = 1;
                updateTotal = parseInt(document.getElementById("tbox" + newIndex).value) * parseInt(tableCells.item(3).innerHTML);
            }
            
            total -= parseInt(tableCells.item(4).innerHTML);
            tableCells.item(4).innerHTML = updateTotal;
            total += parseInt(tableCells.item(4).innerHTML);
            document.getElementById("totalAMount").innerHTML = total;
            var tempObj = JSON.parse(localStorage.getObj(currentIndex));
            tempObj.QTY = parseInt(document.getElementById("tbox" + newIndex).value);
            localStorage.setObj(currentIndex, JSON.stringify(tempObj));
        }

        function CustomizeItem(customizeIndex)
        {
            var tempObj = JSON.parse(localStorage.getObj(customizeIndex));
            debugger;
            $.ajax({
                url: '/api/Product/SetProductSessionToEdit',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'productId': tempObj.PRODUCT_ID },
                statusCode: {
                    200: function () {
                        $.ajax({
                            url: '/api/Order/SetOrderIndexSession',
                            type: 'Get',
                            contentType: 'application/json',
                            dataType: 'json',
                            data: { 'orderIndex': customizeIndex },
                            statusCode: {
                                200: function () {
                                    window.location = "CustomizeCake.aspx";
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

           

            
            win.focus();
        }

        function RemoveItem(removeIndex) {
            //alert(removeIndex);
            //alert(fcStartIndex());
            var fcIndex = fcStartIndex();
            var tableCells = document.getElementById('cartTable').rows.item(removeIndex - fcIndex + 1).cells;
            //removeIndex += 
            total -= parseInt(tableCells.item(4).innerHTML);
            document.getElementById("totalAMount").innerHTML = total;
            for (var i = 1; i < localStorage.length; i++)
            {
                if (i >= removeIndex)
                {
                    var tempObj = JSON.parse(localStorage.getObj(i+1));
                    localStorage.setObj(i, JSON.stringify(tempObj));
                }
            }
            document.getElementById('cartTable').deleteRow(removeIndex - fcIndex + 1);
            localStorage.removeItem('fc' + localStorage.length);
            LoadDetails();
        }

        function fcStartIndex()
        {
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                    return i;
                }
            }
        }
        
        Storage.prototype.setObj = function (key, obj) {
            key = 'fc' + key;
            return this.setItem(key, JSON.stringify(obj))
        };

        Storage.prototype.getObj = function (key) {
            key = 'fc' + key;
            return JSON.parse(this.getItem(key))
        };

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

        function NavigateToSite() {

            if (getCartCount() == 0)
            { }
            else
            {
                if (userId == "0") {
                    $.ajax({
                        url: '/api/Order/SetCartSession',
                        type: 'Get',
                        contentType: 'application/json',
                        dataType: 'json',
                        statusCode: {
                            200: function (data) { },
                            500: function () {
                            }
                        },
                        jsonp: 'jsonp'
                    });
                    $('#msgModal').modal('show');
                    document.getElementById("lblMessage").innerHTML = "To place order please registered yourself or login";
                    document.getElementById("lblMessage").style.color = 'red';
                    //alert('To place order please registered yourself or login');
                    window.location = "home.aspx";
                }
                else
                    window.location = 'ConfirmOrder.aspx';
            }
        }

        function NavigateToGallery() {
            window.location = 'gallery.aspx';
        }

    </script>
</head>
    
<body id="home">
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
      <!-- Preloader -->
        <!--div id="preloader">
            <div id="status">
                <img src="../Assets/images/preloader.gif" alt="preloader">
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
             <li class="dropdown"><label style="padding:10px 15px;color:#f7f7f7;" id="lblUsername"></label></li>
            <%--<div class="form-group top-search">
                  <input type="text" class="form-control top-search-feild" placeholder="Search">
                  <i class="fa fa-search top-search-icon" aria-hidden="true"></i>
            </div>--%>
        </li>
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
                        <a class="responsive-logo pull-left" href="home.aspx"><img src="logo.png" alt="logo"></a>
                        
                    </div>
                     <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul id="nav-list-inner" class="nav-list-inner">

                                    <li><a href="home.aspx">Home</a></li>
                                    <li><a href="gallery.aspx">Gallery</a></li>
                                    <li><a href="Vendors.aspx">Sellers</a></li>
                                    <li><a href="contact.aspx">Contact</a></li>
                                    <%--<li><a href="#" data-toggle="modal" data-target="#myModal" >Register</a></li>--%>
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
    <div class="product-description" data-name="Wine #1" data-price="5">
	    <h2 class="product-name">Cart Detail</h2>
        <div id="el" style="width:25px;margin-left:100px;color:black;" hidden="hidden"></div>
		<form id="shopping-cart" action="cart.html" method="post">
            <div class="table-responsive Col-md-10 col-md-offset-1">
                

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
                <div class="topline">
                 <div class="col-md-12 col-sm-12">
                <h5 class="product-name2">Order Ready Time:</h5> <h5 id="orderTime"><strong></strong></h5> </div>
	            <div class="col-md-12 col-sm-12">
                <h5 class="product-name3">Total Amount:</h5><h5 id="totalAMount"><strong></strong></h5></div>
                </div>

                <div style="margin-top:20px;">
                    <button type="button" class="btn upbutton pull-right MarLeft" onclick="NavigateToSite()">
                    Confirm Order</button>

                <button type="button" class="btn upbutton  pull-right" onclick="NavigateToGallery()">
                   More Products</button> 

                </div>
                </div>

            
	
</form>

    </div>
                                    </div><!-- Box-Shadow -->
                </div> <!-- theme Holder -->
                </section>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Login/Registration </h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-8" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs">
                                    <li class="active modalRL"><a href="#Login1" data-toggle="tab">Login</a></li>
                                    <li class="modalRL"><a href="#vendor-Registration" data-toggle="tab">Sellers Registration</a></li>
                                    <li class="modalRL"><a href="#user-Registration" data-toggle="tab">User Registration</a></li>
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div class="tab-pane active" id="Login1">
                                        <form role="form" class="form-horizontal" id="formLogin">
                                            <div class="form-group">
                                                <div class="col-md-2">
                                                </div>
                                                <div class="col-md-8">
                                                    <select class="form-control" id="userType">
                                                        <%--<option value="0">Please Select</option>--%>
                                                        <option value="3">Sellers</option>
                                                        <option value="2">Foodies</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-2">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" class="col-sm-2 control-label">
                                                    Email</label>
                                                <div class="col-sm-8">
                                                    <input type="email" class="form-control" id="txtEmail" placeholder="Email" />
                                                </div>
                                                <div class="col-sm-2">
                                                </div>
                                            </div>
                                            <!-- form group end here -->
                                            <div class="form-group">
                                                <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                                    Password</label>
                                                <div class="col-sm-8">
                                                    <input type="password" class="form-control" id="txtPassword" placeholder="Password" />
                                                </div>
                                                <div class="col-sm-2">
                                                </div>
                                            </div>
                                            <!-- form group end here -->
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <button type="submit" class="btn upbutton pull-right">
                                                        Login</button>
                                                </div>
                                                <div class="col-md-4">
                                                    <a style="color: #ff8c93 !important;" class="forget pull-right" href="javascript:;">Forgot your password?</a>
                                                </div>


                                                <div class="col-sm-2">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane" id="vendor-Registration">
                                        <form role="form" class="form-horizontal" id="formSaveVendor" action="#">
                                            <div class="form-group">
                                                <label for="email" class="col-sm-2 control-label">
                                                    Name</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" placeholder="Name" id="txtVendorName" required="required" />
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <!-- form group end here -->
                                            <div class="form-group">
                                                <label for="email" class="col-sm-2 control-label">
                                                    Email</label>
                                                <div class="col-sm-8">
                                                    <input type="email" class="form-control" id="txtVendorEmail" placeholder="Email" required="required" />
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <!-- form group end here -->
                                            <div class="form-group">
                                                <label for="mobile" class="col-sm-2 control-label">
                                                    Mobile</label>
                                                <div class="col-sm-3">
                                                    <input type="text" pattern="[0-9]{4}" title="Please enter 4 digit mobile code" class="form-control" id="txtVendorMobile1" placeholder="03.." oninput="verifyMobileCode()" required="required" />
                                                </div>

                                                <div class="col-sm-5">
                                                    <input type="text" pattern="[0-9]{7}" title="7 digit mobile contact part" class="form-control" id="txtVendorMobile2" placeholder="768...." required="required" />
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <!-- form group end here -->
                                            <div class="form-group">
                                                <label for="password" class="col-sm-2 control-label">
                                                    Password</label>
                                                <div class="col-sm-8">
                                                    <input type="password" class="form-control" id="txtVendorPassword" placeholder="Password" required="required" />
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <!-- form group end here -->
                                            <div class="form-group">
                                                <label for="profile" class="col-sm-2 control-label">
                                                    Business</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="txtVendorEntity" placeholder="Business Entity Name" required="required" />
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <!-- form group end here -->
                                            <div class="form-group">
                                                <label for="profile" class="col-sm-2 control-label">
                                                    Biography</label>
                                                <div class="col-sm-8">
                                                    <textarea id="txtVendorDescription" class="form-control" name="user_bio" placeholder="Description"></textarea>
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <!-- form group end here -->
                                            <div class="form-group">
                                                <label for="Multiselect" class="col-md-2 control-label">
                                                    Speciality</label>
                                                <div class="col-sm-8 img-show">
                                                    <div class="forcake">
                                                        <div class="checkboxThree">
                                                            <input type="checkbox" value="1" id="chbCakes" name="check" />
                                                            <label for="chbCakes"></label>
                                                        </div>
                                                        <!-- new checkbox  -->
                                                        <span>Cakes</span>

                                                    </div>
                                                    <div class="forcake">
                                                        <div class="checkboxThree">
                                                            <input type="checkbox" value="1" id="chbFoods" name="check" />
                                                            <label for="chbFoods"></label>
                                                        </div>
                                                        <!-- new checkbox  -->
                                                        <span>Foods</span>

                                                    </div>
                                                    <div class="forcake">
                                                        <div class="checkboxThree">
                                                            <input type="checkbox" value="1" id="chbFrozenFoods" name="check" />
                                                            <label for="chbFrozenFoods"></label>
                                                        </div>
                                                        <!-- new checkbox  -->
                                                        <span>Frozen Foods</span>

                                                    </div>
                                                    <div class="forcake">
                                                        <div class="checkboxThree">
                                                            <input type="checkbox" value="1" id="chbDesserts" name="check" />
                                                            <label for="chbDesserts"></label>
                                                        </div>
                                                        <!-- new checkbox  -->
                                                        <span>Desserts</span>

                                                    </div>


                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <!-- Form group end here -->
                                            <div class="form-group">
                                                <label for="ProfileImage" class="col-md-2 control-label">
                                                    Photo</label>
                                                <div class="col-sm-8">
                                                    <input class="img-show" type='file' id="imgInp" onchange="readURL(this);" />
                                                    <p id="imgaeB64" hidden></p>
                                                    <img id="vendorImage" src="" alt="" />
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <!-- Form group end here -->

                                            <div class="form-group" style="margin-top: 50px;">
                                                <label for="ProfileImage" class="col-md-2 control-label">
                                                </label>
                                                <div class="col-sm-8">
                                                    <label style="color: #DD0000">Enter Code Below:</label>
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <div class="form-group" style="margin-top: 20px;">
                                                <label for="ProfileImage" class="col-md-2 control-label">
                                                </label>
                                                <div class="col-sm-8">
                                                    <%--<span id="txtCaptchaDiv" style=" margin-top:20px; background-color:#A51D22;color:#FFF;padding:5px"></span>--%>
                                                    <canvas id="myCanvas" width="240" height="70" style="border: 1px solid #000000; background-color: #9c9d9c"></canvas>
                                                    <button type="button" class="btn upbutton midmar trycaptcha" id="btnFlavour" onclick="CreateVendorCaptcha();" style="margin-left: 10px; margin-top: -30px; width: 100px; height: 30px; font-size: 12px;" onclick="CreateNewFlavour();">
                                                        Try Another</button>
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ProfileImage" class="col-md-2 control-label">
                                                </label>
                                                <div class="col-sm-4">
                                                    <input type="text" name="txtInput" id="txtInput" size="15" />
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>


                                            <div class="row">

                                                <div class="col-md-4"></div>
                                                <div class="col-sm-6">
                                                    <button type="submit" class="btn pull-right upbutton">
                                                        Register</button>
                                                </div>

                                                <div class="col-sm-2">
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                    <div class="tab-pane" id="user-Registration">
                                        <form role="form" class="form-horizontal" id="formSaveUser" action="#">
                                            <div class="form-group">
                                                <label for="email" class="col-sm-2 control-label">
                                                    Name</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="txtUserName" placeholder="Name" required="required" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" class="col-sm-2 control-label">
                                                    Email</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="txtUserEmail" placeholder="Email" required="required" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="mobile" class="col-sm-2 control-label">
                                                    Mobile</label>
                                                <div class="col-sm-2">
                                                    <input class="form-control" pattern="[0-9]{4}" title="Please enter 4 digit mobile code" id="txtUserMobile1" placeholder="03.." oninput="verifyUserMobileCode()" required="required" />
                                                </div>
                                                <div class="col-sm-8">
                                                    <input class="form-control" pattern="[0-9]{7}" title="7 digit mobile contact part" id="txtUserMobile2" placeholder="768...." required="required" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="password" class="col-sm-2 control-label">
                                                    Password</label>
                                                <div class="col-sm-10">
                                                    <input type="password" class="form-control" id="txtUserPassword" placeholder="Password" required="required" />
                                                </div>
                                            </div>

                                            <div class="form-group" style="margin-top: 50px;">
                                                <label for="ProfileImage" class="col-md-2 control-label">
                                                </label>
                                                <div class="col-sm-8">
                                                    <label style="color: #DD0000">Enter Code Below:</label>
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <div class="form-group" style="margin-top: 20px;">
                                                <label for="ProfileImage" class="col-md-2 control-label">
                                                </label>
                                                <div class="col-sm-8">
                                                    <%--<span id="txtCaptchaDiv" style=" margin-top:20px; background-color:#A51D22;color:#FFF;padding:5px"></span>--%>
                                                    <canvas id="myCanvas1" width="240" height="70" style="border: 1px solid #000000; background-color: #9c9d9c"></canvas>
                                                    <button type="button" class="btn upbutton midmar trycaptcha" onclick="CreateUserCaptcha();" style="margin-left: 10px; margin-top: -30px; width: 100px; height: 30px; font-size: 12px;" onclick="CreateNewFlavour();">
                                                        Try Another</button>
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ProfileImage" class="col-md-2 control-label">
                                                </label>
                                                <div class="col-sm-4">
                                                    <input type="text" name="txtInput" id="txtInput1" size="15" />
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-4"></div>
                                                <div class="col-sm-6">
                                                    <button type="submit" class="btn pull-right upbutton">
                                                        Register</button>

                                                </div>

                                                <div class="col-sm-2">
                                                </div>
                                            </div>

                                        </form>
                                    </div>


                                </div>
                                <div id="OR" class="hidden-xs">
                                    OR
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row text-center sign-with">
                                    <div class="col-md-12">
                                        <h3 class="signin-with-color">Sign in with</h3>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="btn-group btn-group-justified">
                                            <div class="col-md-6 col-sm-6 mycustom" onclick="document.getElementById('fbSignIN').style.display = 'block';"><a href="javascript:void(0);"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></div>
                                            <div class="col-md-6 col-sm-6 mycustom"><a href=""><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></div>
                                        </div>

                                    </div>
                                    <div id="fbSignIN">
                                        <div>
                                            <input type="text" style="margin-left: -10px; margin-top: 30px; width: 250px;" id="fbMobile" class="form-control" placeholder="MOBILE">
                                            <label style="margin-top: 20px; width: 250px;">OR</label>
                                        </div>
                                        <div>
                                            <input type="text" style="margin-left: -10px; margin-top: 10px; width: 250px;" id="fbEmail" class="form-control" placeholder="EMAIL">
                                        </div>
                                        <div>
                                            <button type="button" class="btn upbutton midmar" id="btnPhoneSignIn" onclick="fbSignIn();" style="margin-left: -10px; margin-top: 30px; width: 250px; height: 30px; font-size: 12px;" onclick="CreateNewFlavour();">
                                                SignIn</button>
                                        </div>

                                    </div>
                                    
                                </div>
                                <!-- Show Message Here -->
                                <div class="showmsg">

                                    <h4 id="error"></h4>
                                    <h4 id="success"></h4>


                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



</body>
</html>