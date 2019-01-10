<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="FoodChapter.WebPages.ProductDetail" %>

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
            var productId = '<%= int.Parse(FoodChapter.SessionManager.GetProductSession()) %>';
            //window.onfocus = function () { location.reload(true) }
            //window.onfocus = function () { blurred && (location.reload()); };
            //window.localStorage.clear();
            //alert(localStorage.length);
            window.onload = function () {
                debugger;


                $.ajax({

                    url: '/api/Product/SearchProductByProductId',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: {'productId': productId},
                    statusCode: {
                        200: function (data) {
                            var json1 = JSON.parse(data);

                            subCatagoryId = json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;
                            var name = json1.PRODUCT[0].NAME;
                            //var description = document.getElementById('txtDesc').value;
                            var timeReq = json1.PRODUCT[0].TIME_REQUIRED;
                            var vendorId = json1.PRODUCT[0].VENDOR_ID;
                            var price = json1.PRODUCT[0].PRICE;
                                    
                            var tableRow = "<tr><td>NAME</td>"
                                                + "<td>" + json1.PRODUCT[0].NAME + "</td>";
                            tableRow = tableRow + "</tr>";

                            $("table").find("tbody").append(tableRow);
                            tableRow = "<tr><td>Price</td>"
                                                + "<td> Rs : " + json1.PRODUCT[0].PRICE + "</td>";
                            tableRow = tableRow + "</tr>";
                            $("table").find("tbody").append(tableRow);

                            tableRow = "<tr><td>Description</td>"
                                                + "<td>" + json1.PRODUCT[0].DESCRIPTION + "</td>";
                            tableRow = tableRow + "</tr>";
                            $("table").find("tbody").append(tableRow);

                            tableRow = "<tr><td>Time Required</td>"
                                                + "<td>" + json1.PRODUCT[0].TIME_REQUIRED + "</td>";
                            tableRow = tableRow + "</tr>";
                            $("table").find("tbody").append(tableRow);

                            tableRow = "<tr><td>Serves</td>"
                                                + "<td>" + json1.PRODUCT[0].SERVES + "</td>";
                            tableRow = tableRow + "</tr>";
                            $("table").find("tbody").append(tableRow);

                        },
                        500: function () {
                        }

                    },
                    jsonp: 'jsonp'

            });
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
                <strong class="inner-logo"><a href="index.php"><img src="../Assets/../Assets/images/logo.png" alt="logo"></a></strong>
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
				<th scope="col">Product Detail</th>
				<th scope="col"></th>
				
			</tr>
		</thead>
		<tbody>

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


             <script>
                 function readURL(input) {
                     if (input.files && input.files[0]) {
                         var reader = new FileReader();

                         reader.onload = function (e) {
                             $('#blah')
                                 .attr('src', e.target.result)
                                 .width(150)
                                 .height(200);
                         };

                         reader.readAsDataURL(input.files[0]);
                     }
                 }
</script>			

        <script>

            //    $(document).ready(function () {

            //        $("#formSaveUser").on('submit', function (e) {


            //    }

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#vendorImage')
                            .attr('src', e.target.result)
                            .width(150)
                            .height(200);
                        document.getElementById("imgaeB64").innerHTML = e.target.result;
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
            //);
</script>
<script>

    function clearUser() {

        document.getElementById("txtUserName").value = "";
        document.getElementById("txtUserEmail").value = "";
        document.getElementById("txtUserPassword").value = "";
        document.getElementById("txtUserMobile").value = "";

    }
    function clearVendor() {
        document.getElementById("txtVendorName").value = "";
        document.getElementById("txtVendorEmail").value = "";
        document.getElementById("txtVendorPassword").value = "";
        document.getElementById("txtVendorMobile").value = "";
        document.getElementById("txtVendorDescription").value = "";
        document.getElementById("txtVendorEntity").value = "";
        chbFoods.checked = false;
        chbCakes.checked = true;
        chbFrozenFoods.checked = false;
        chbDesserts.checked = false;
        chbDeals.checked = false;
    }

    function funSaveVendor() {
        e.preventDefault();
        var name = document.getElementById("txtVendorName").value;
        var email = document.getElementById("txtVendorEmail").value;
        var password = document.getElementById("txtVendorPassword").value;
        var entity = document.getElementById("txtVendorEntity").value;
        var mobile = document.getElementById("txtVendorMobile").value;
        //var vendorImg = document.getElementById("imgaeB64").innerHTML;
        //var vendorImg = document.getElementById("vendorImage").getAttribute('src');
        //Uint8Array.from(atob(vendorImg), c => c.charCodeAt(0))
        //var imgBytes = _base64ToArrayBuffer(vendorImg.split(',')[1]);

        var description = document.getElementById('txtVendorDescription').value;
        var foods = document.getElementById('chbFoods').checked;
        var deals = document.getElementById('chbDeals').checked;
        var cakes = document.getElementById('chbCakes').checked;
        var frozenFoods = document.getElementById('chbFrozenFoods').checked;
        var desserts = document.getElementById('chbDesserts').checked;
        //alert(name);
        debugger;
        var vendor = {
            "FIRST_NAME": name,
            "EMAIL": email,
            "PASSWORD": password,
            "PERSONAL_PHONE": mobile,
            "DESCRIPTION": description,
            "BUSINESS_ENTITY_NAME": entity,
            "FOODS_SPECIALITY": foods,
            "CAKES_SPECIALITY": cakes,
            "FROZEN_FOODS_SPECIALITY": frozenFoods,
            "DEALS_SPECIALITY": deals,
            "DESSERTS_SPECIALITY": desserts
            //"VENDRO_PHOTO": imgBytes
        };
        $.ajax({
            url: '/api/Vendors/saveVendor',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(vendor),
            statusCode: {
                200: function (data) {
                    var vendorId = JSON.parse(data);
                    UploadImage(vendorId);
                    clearVendor();
                    document.getElementById("lblMessage").innerHTML = "Vendor Saved Successfully.";
                    document.getElementById("lblMessage").style.color = 'green';
                    e.preventDefault();

                    //location.reload();
                },
                500: function () {
                    document.getElementById("lblMessage").innerHTML = "Error occured. Vendor not added";
                    document.getElementById("lblMessage").style.color = 'red';
                    e.preventDefault();
                },
                406: function () {
                    document.getElementById("lblMessage").innerHTML = "Email not Unique. Please choose another.";
                    document.getElementById("lblMessage").style.color = 'red';
                    e.preventDefault();
                }
            },
            jsonp: 'jsonp'
        });
    }

    function UploadImage(id) {
        var data = new FormData();
        var files = $("#imgInp").get(0).files;
        if (files.length > 0) {
            data.append("UploadedImage", files[0]);
            var uniquekey = {
                id: id
            };
            data.append("id", id);

            // Make Ajax request with the contentType = false, and procesDate = false
            var ajaxRequest = $.ajax({
                type: "POST",
                url: "/api/Vendors/UploadImage",
                contentType: false,
                processData: false,
                data: data
            });
            ajaxRequest.done(function (xhr, textStatus) {
                //alert('Image Uploaded successfully')
            });
        }
    }
    function funAuthenticate() {
        var email = document.getElementById("txtEmail").value;
        var password = document.getElementById("txtPassword").value;

        var userType = $('#userType').val();
        if (userType == 0) {
            // <"FC msgs> //Please select a type
        }
        else if (userType == 2) {
            var user = {
                "EMAIL": email,
                "PASSWORD": password
            };

            $.ajax({
                url: '/api/User/authenticateUser',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(user),
                statusCode: {
                    200: function (data) {
                        location.href = 'gallery.aspx';
                    },
                    401: function () {
                        document.getElementById("lblMessage").innerHTML = "Wrong email or password";
                        document.getElementById("lblMessage").style.color = 'red';
                    }
                },
                jsonp: 'jsonp'
            });
        }
        else {
            var user = {
                "EMAIL": email,
                "PASSWORD": password
            };

            $.ajax({
                url: '/api/Vendors/authenticateVendor',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(user),
                statusCode: {
                    200: function (data) {
                        var id = JSON.parse(data);
                        //alert(id);

                        location.href = 'VendorProfile.aspx';
                    },
                    401: function (data) {
                        //alert('Wrong email or password');
                        document.getElementById("lblMessage").innerHTML = "Wrong email or password";
                        document.getElementById("lblMessage").style.color = 'red';
                    }
                },
                jsonp: 'jsonp'
            });
        }
    }

    function _base64ToArrayBuffer(base64) {
        var binary_string = window.atob(base64);
        //alert("a");
        var len = binary_string.length;
        var bytes = new Uint8Array(len);
        for (var i = 0; i < len; i++) {
            bytes[i] = binary_string.charCodeAt(i);
        }
        return bytes.buffer;
    }

    function funSaveUser() {

        var name = document.getElementById("txtUserName").value;
        var email = document.getElementById("txtUserEmail").value;
        var password = document.getElementById("txtUserPassword").value;
        var mobile = document.getElementById("txtUserMobile").value;

        var user = {
            "NAME": name,
            "EMAIL": email,
            "PASSWORD": password,
            "PHONE": mobile
        };
        $.ajax({
            url: '/api/User/saveUser',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(user),
            statusCode: {
                200: function () {
                    clearUser();

                    document.getElementById("lblMessage").innerHTML = "User Saved Successfully.";
                    document.getElementById("lblMessage").style.color = 'green';
                    e.preventDefault();
                    //location.reload();
                },
                500: function () {
                    document.getElementById("lblMessage").innerHTML = "Error occured. User not added";
                    document.getElementById("lblMessage").style.color = 'red';
                    e.preventDefault();

                },
                406: function () {
                    document.getElementById("lblMessage").innerHTML = "Email not Unique. Please choose another.";
                    document.getElementById("lblMessage").style.color = 'red';
                    e.preventDefault();

                }
            },
            jsonp: 'jsonp'
        });
        //e.preventDefault();
    }
</script>
</body>
</html>