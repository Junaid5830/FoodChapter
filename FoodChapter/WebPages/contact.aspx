<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="FoodChapter.WebPages.contact" %>

<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->	<html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        <link rel="stylesheet" href="../Assets/css/bootstrap.css">
        <link rel="stylesheet" href="../Assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="../Assets/css/style.css">
	<link rel="stylesheet" href="../Assets/css/custom.css">
	<link rel="stylesheet" href="../Assets/css/flora.css">
        <link rel="stylesheet" href="../Assets/css/responsive.css">
        <link rel="stylesheet" href="../Assets/css/theme-elements.css">
        <link rel="stylesheet" href="../Assets/css/color.css">
		<link rel="stylesheet" href="../Assets/css/vendor-profile.css" style="stylesheet">
		<link rel="stylesheet" href="../Assets/css/vendor.css">
    <link rel="stylesheet" href="../Assets/css/wbn-datepicker.css">


        <link rel="stylesheet" href="../Assets/css/gallery.css">
       
     <!--   <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" /> -->
<!-- <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="libs/jquery/jquery.js"><\/script>')</script>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-5002e1366084f15f"></script>
  

   <script src="../Assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
    <script>
        // initialize Account Kit with CSRF protection
        AccountKit_OnInteractive = function () {
            AccountKit.init(
              {
                  appId: "1590429834334644",
                  state: "vbhj789056alm",
                  version: "v1.0",
                  fbAppEventsEnabled: true,
                  Redirect: "http://localhost:3716/WebPages/home.aspx"
              }
            );
        };



        // login callback
        function loginCallback(response) {
            if (response.status === "PARTIALLY_AUTHENTICATED") {
                var code = response.code;
                var csrf = response.state;
                var email = document.getElementById("fbEmail").value;
                var mobile = document.getElementById("fbMobile").value;
                var user = {
                    "EMAIL": email,
                    "PHONE": mobile
                };

                $.ajax({
                    url: '/api/User/AuthenticateFaceBookUser',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(user),
                    statusCode: {
                        200: function (data) {
                            location.href = 'gallery.aspx';
                        },
                        401: function () {
                            document.getElementById("success").innerHTML = "";
                            document.getElementById("error").innerHTML = "Wrong email or password";
                            document.getElementById("error").style.color = 'red';
                        }
                    },
                    jsonp: 'jsonp'
                });

                //alert(code);
                // Send code to server to exchange for access token

            }
            else if (response.status === "NOT_AUTHENTICATED") {
                // handle authentication failure
            }
            else if (response.status === "BAD_PARAMS") {
                // handle bad parameters
            }
        }

        function fbSignIn() {
            var email = document.getElementById("fbEmail").value;
            var mobile = document.getElementById("fbMobile").value;
            if (mobile.length > 0)
                smsLogin();
            else if (email.length > 0)
                emailLogin();
        }

        // phone form submission handler
        function smsLogin() {
            var countryCode = "+92"; //document.getElementById("country_code").value;
            var phoneNumber = document.getElementById("fbMobile").value;
            AccountKit.login(
              'PHONE',
              { countryCode: countryCode, phoneNumber: phoneNumber }, // will use default values if not specified
              loginCallback
            );
        }


        // email form submission handler
        function emailLogin() {

            var emailAddress = document.getElementById("fbEmail").value;
            AccountKit.login(
              'EMAIL',
              { emailAddress: emailAddress },
              loginCallback
            );
        }


    </script>




<script>
    //google start
    var OAUTHURL = 'https://accounts.google.com/o/oauth2/auth?';
    var VALIDURL = 'https://www.googleapis.com/oauth2/v1/tokeninfo?access_token=';
    var SCOPE = 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email';
    var CLIENTID = '822909308879-vvumf7duli43tiae6jp7u3h45po5dpuu.apps.googleusercontent.com';
    var REDIRECT = 'http://localhost:3716/WebPages/gallery.aspx';
    var LOGOUT = 'http://accounts.google.com/Logout';
    var TYPE = 'token';
    var _url = OAUTHURL + 'scope=' + SCOPE + '&client_id=' + CLIENTID + '&redirect_uri=' + REDIRECT + '&response_type=' + TYPE;
    var acToken;
    var tokenType;
    var expiresIn;
    var user;
    var loggedIn = false;
    function googleLogin() {

        var win = window.open(_url, "windowname1", 'width=800, height=600');
        var pollTimer = window.setInterval(function () {
            try {
                console.log(win.document.URL);
                if (win.document.URL.indexOf(REDIRECT) != -1) {
                    window.clearInterval(pollTimer);
                    var url = win.document.URL;
                    //alert(url);
                    acToken = gup(url, 'access_token');
                    tokenType = gup(url, 'token_type');
                    expiresIn = gup(url, 'expires_in');
                    win.close();
                    validateToken(acToken);
                    //validateToken('asdadadad');
                }
            }
            catch (e) {

            }
        }, 500);
    }
    function validateToken(token) {
        //alert(token);
        $.ajax(
            {
                url: VALIDURL + token,
                data: null,
                success: function (responseText) {
                    getUserInfo();
                    loggedIn = true;
                    //$('#loginText').hide();
                    //$('#logoutText').show();
                    location.href = "gallery.aspx";
                },
                dataType: "jsonp"
            });
    }
    //function onSignIn(googleUser) {
    //    var profile = googleUser.getBasicProfile();
    //    console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    //    console.log('Name: ' + profile.getName());
    //    console.log('Image URL: ' + profile.getImageUrl());
    //    console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
    //}
    function getUserInfo() {
        $.ajax({
            url: 'https://www.googleapis.com/oauth2/v1/userinfo?access_token=' + acToken,
            data: null,
            success: function (resp) {
                user = resp;
                console.log(user);
                console.log(user.name)
                //$('#uName').text('Welcome ' + user.name);
                //$('#imgHolder').attr('src', user.picture);
            },
            dataType: "jsonp"
        });
    }
    //credits: http://www.netlobo.com/url_query_string_javascript.html  

    function gup(url, name) {
        namename = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var regexS = "[\\#&]" + name + "=([^&#]*)";
        var regex = new RegExp(regexS);
        var results = regex.exec(url);
        if (results == null)
            return "";
        else
            return results[1];
    }
    function startLogoutPolling() {
        $('#loginText').show();
        $('#logoutText').hide();
        loggedIn = false;
        //$('#uName').text('Welcome ');
        //$('#imgHolder').attr('src', 'none.jpg');
    }


    //google end

</script>


    </head>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
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
		 <li class="dropdown"><label style="padding:10px 15px;color:#f7f7f7;" id="lblUsername"></label></li>
            <%--<li>
			<div class="form-group top-search">
				  <input type="text" class="form-control top-search-feild" placeholder="Search">
				  <i class="fa fa-search top-search-icon" aria-hidden="true"></i>
			</div>
		</li>--%>

		 <li class="dropdown"><a href="#" data-toggle="modal" data-target="#myModal" >Login</a></li>
            <li><a href="Cart.aspx" id="cartCount"><span class="glyphicon glyphicon-shopping-cart"></span>   </a></li>
         
        <%--<li class="dropdown">
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
        </li>--%>
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
						<a class="responsive-logo pull-left" href="home.aspx"><img src="../Assets/images/logo.png" alt="logo"></a>
						<div class="responsive-cart-dropdown">
							<a class="cart-btn fa fa-shopping-cart" href="#" data-toggle="dropdown"><span class="shop-batch">2</span></a>
							<div class="dropdown-menu cart-dropdown">
								<div class="cart-list-holder">
									<div class="cart-list">
										<img src="../Assets/images/small-product-img2.jpg" alt="small-product-img2">
										<div class="cart-detail">
											<span class="product-quantity">2 × Natus Error Sit </span>
											<span class="final-price">$ 16.37</span>
											<a href="#" class="stock-batch">In Stock</a>
										</div>
										<a href="#" class="pull-right cart-del-icon"><i class="fa fa-trash-o"></i></a>
									</div>
									<div class="cart-list">
										<img src="../Assets/images/small-product-img2.jpg" alt="small-product-img2">
										<div class="cart-detail">
											<span class="product-quantity">2 × Natus Error Sit </span>
											<span class="final-price">$ 16.37</span>
											<a href="#" class="stock-batch">In Stock</a>
										</div>
										<a href="#" class="pull-right cart-del-icon"><i class="fa fa-trash-o"></i></a>
									</div>
									<div class="cart-list">
										<img src="../Assets/images/small-product-img2.jpg" alt="small-product-img2">
										<div class="cart-detail">
											<span class="product-quantity">2 × Natus Error Sit </span>
											<span class="final-price">$ 16.37</span>
											<a href="#" class="stock-batch">In Stock</a>
										</div>
										<a href="#" class="pull-right cart-del-icon"><i class="fa fa-trash-o"></i></a>
									</div>
									<div class="cart-del-option">
										<a href="#" class="pull-left del"><i class="fa fa-trash-o"></i>Clear Your Cart</a>
										<span class="pull-right Subtotal">Subtotal:<strong> $130.49</strong></span>
									</div>
								</div>
								<div class="cart-btns">
									<a class="sm-btn pull-left" href="#">View Cart</a>
									<a class="sm-btn pull-right" href="#">Checkout</a>
								</div>
							</div>
						</div>
					</div>
					 <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul id="nav-list-inner" class="nav-list-inner">
                                    
                                    <li><a href="gallery.aspx">Gallery</a></li>
                                    <li><a href="vendors.aspx">Sellers</a></li>
                                    <li><a href="contact.aspx">contact</a></li> 
                                    <li><a href="#" data-toggle="modal" data-target="#myModal">Register</a></li> 
                                    <%--<li><a href="home.aspx">Logout</a></li>--%>         
                                </ul>

                   </div>
				</nav>
			</div>
		</div>
	</header>
	<!-- Header inner -->
    </header>
            <!-- Header -->


            <!-- Main Content -->
	<main id="main-contant" class="inner-main">

		<!-- Contact Colums -->
		<div class="padding-bottom four-col">
			<div class="container">
				<div class="row">
                    <div class="marpd">

					<!-- Main Heading -->
					<div class="col-sm-12">
						<div class="main-heading">
							<h2><span>Get In Touch</span>Contact Us</h2>
						</div>
					</div>
					<!-- Main Heading -->

					<!-- Columns -->
					<div class="address-columns">
						<!-- Contact Column -->
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="contact-column">
								<span class="flaticon-location74"></span>
								<h3>Our Location</h3>
								<p>Main Market Lahore Pakistan</p>
							</div>
						</div>
						<!-- Contact Column -->
						<!-- Contact Column -->
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="contact-column">
								<span class="flaticon-new100"></span>
								<h3>Email Us</h3>
								<ul>
									<li>info@xeventechnologies.com</li>
									<li>bilal@xevensolutions.com</li>
									<li>info@foodchapter.com</li>
								</ul>
							</div>
						</div>
						<!-- Contact Column -->
						<!-- Contact Column -->
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="contact-column">
								<span class="flaticon-telephone114"></span>
								<h3>Call Us</h3>
								<ul>
									<li>+92 333 7297306</li>
									<li>+92 345 3177413 </li>
									<li>+92 312 4071367</li>
								</ul>
							</div>
						</div>
						<!-- Contact Column -->
						<!-- Contact Column -->
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="contact-column">
								<span class="flaticon-shopper28"></span>
								<h3>Reservation</h3>
								<ul>
									<li>+92 333 7297306</li>
									<li>+92 345 3177413 </li>
									<li>info@foodchapter.com</li>
								</ul>
							</div>
						</div>
						<!-- Contact Column -->
					</div>
					<!-- Columns -->
                        </div> <!-- end -->
				</div>
			</div> <!-- container -->
		</div>
		<!-- Contact Colums -->
	
		<!-- Contact Map -->
		<div class="contact-map">
			
			<div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="custommap">
			<div class="contact-form">
				<h3>Contact Us</h3>
				<form>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Full Name">
						<i class="fa fa-user"></i>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Email Address">
						<i class="fa fa-envelope"></i>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Your Name">
						<i class="fa fa-globe"></i>
					</div>
					<div class="form-group">
						<textarea class="form-control" rows="5" placeholder="Message"></textarea>
						<i class="fa fa-paper-plane"></i>
					</div>
					<button class="full-width-btn upbutton  sendme">Send Message</button>
				</form>
			</div>
                    </div>

                    </div>
            </div>
                </div>
		</div>
		<!-- Contact Map -->	
	
	</main>
	<!-- Main Content -->
	<!-- Bootstrap Modal -->
			<!-- Large Place Order modal -->
<div class="modal fade" id="myOrderModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    Order Status/New Order</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active modalRL"><a href="#orderStatus" data-toggle="tab">Order Status</a></li>
                            <li class="modalRL"><a href="#newOrder" data-toggle="tab">New Order</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="orderStatus">
                                <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Item Name</label>
                                    <div class="col-sm-10">
                                        <span>here is your item name<span/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                        Quantity</label>
                                    <div class="col-sm-10">
                                        <span>here is you item quantity<span/>
                                    </div>
                                </div>
								 <div class="form-group">
                                    <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                        Description</label>
                                    <div class="col-sm-10">
                                        <span>here is you item Description<span/>
                                    </div>
                                </div>
								 <div class="form-group">
                                    <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                        Delivery Time</label>
                                    <div class="col-sm-10">
                                        <span>12:45 pm at your place<span/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10 modalRL">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            Cancel Order</button>
									    <button type="submit" class="btn btn-primary btn-sm">
                                            Edit Order</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                            <div class="tab-pane" id="newOrder">
                                <form role="form" class="form-horizontal">
                                 <div class="form-group1 col-lg-6 col-xs-6">
                                            <input type="text" class="form-control" placeholder="Name">
                                  </div>
                                  <div class="form-group col-lg-6 col-xs-6">
                                            <input type="text" class="form-control" placeholder="Email">
                                   </div>
                                   <div class="form-group1 col-lg-6 col-xs-6">
                                            <input type="tel" class="form-control" placeholder="Phone Number">
                                   </div>
                                   <div class="form-group col-lg-6 col-xs-6">
											<input id="phone" name="phone" type="text" class="form-control" Placeholder="Address">
								 </div>
								<div class="form-group1 col-lg-6 col-xs-6">
                                           <select class="form-control">
                                                    <option selected>Select Category</option>
                                                    <option>Food</option>
													<option>Cakes</option>
                                                    <option>CupCakes</option>
													<option>Cookies</option>
                                                    <option>Pasteries</option>
                                           </select>
                                        </div>
									   <div class="form-group col-lg-6 col-xs-6">
											 <div class="col-md-6">
												<input type="text" class="form-control" placeholder="Item Name">
                                            </div>
											 <div class="col-md-6">
												<input type="text" class="form-control" placeholder="Item ID">
                                            </div>
										</div>
										 <div class="form-group1 col-lg-6 col-xs-6">
											 <div class="col-md-6">
                                           <select class="form-control">
                                                    <option selected>Select Flavour</option>
                                                    <option>Flavour2</option>
                                                    <option>Flavour3</option>
													<option>Flavour4</option>
                                                    <option>Flavour5</option>
                                           </select>
                                            </div>
											 <div class="col-md-6">
                                           <select class="form-control">
                                                     <option selected>Select Flavour</option>
                                                    <option>Flavour2</option>
                                                    <option>Flavour3</option>
													<option>Flavour4</option>
                                                    <option>Flavour5</option>
                                           </select>
                                            </div>
										</div>
										  <div class="form-group col-lg-6 col-xs-6">
											<input id="phone-personal" name="phone" type="tel" class="form-control" placeholder="Discription/Note">
										</div>
										<div class="form-group1 col-lg-6 col-xs-6">
											 <div class="col-md-6">
											  <label for="weight" class="control-label">
													Weight</label>
												<input type="number" name="quantity" min="1" max="10" placeholder="0" style="width:100%;">
                                            </div>
											 <div class="col-md-6">
											 <label for="quantity" class="control-label">
													Quantity</label>
												<input type="number" name="quantity" min="1" max="10" placeholder="0" style="width:100%;">
                                             </div>
										</div>
										 <div class="form-group col-lg-6 col-xs-6">
											<textarea id="message" name="address" class="form-control" style="width:400px;height:100px" placeholder="Greeting Box" ></textarea>
										</div>
                                <div class="row">
                                    <div class="col-sm-12 modalRL btn-center">
                                        <button type="button" class="btn btn-primary btn-sm">
                                            Order</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

			<!-- Bootstrap Modal -->
 <!-- Large Signin Signup modal -->
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
                                <div class="tab-content pad-bottom">
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
                                            <div class="row wayup">
                                                <div class="col-md-4">
                                                    <img src="../Assets/images/preloader.gif" id="imgload" alt="loading" style="display:none;width:15px;height:15px" />
                                                    
                                                </div>
                                                <div class="col-sm-6 wayupshort">
                                                    <button type="submit" class="btn upbutton pull-right">
                                                        Login</button>
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

                                            <div class="form-group" style="margin-bottom: 0px;">
                                                <label for="ProfileImage" class="col-md-2 control-label">
                                                </label>
                                                <div class="col-sm-8">
                                                    <label style="color: #DD0000; text-transform: capitalize;">Enter Code Below:</label>
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px !imporant;">
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
                                                <div class="col-sm-6">
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
                                                    <img src="../Assets/images/preloader.gif" id="imgload2" alt="loading" style="display:none;width:15px;height:15px" />
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
                                                    <img src="../Assets/images/preloader.gif" id="imgload3" alt="loading" style="display:none;width:15px;height:15px" />
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
                                            <div class="col-md-6 col-sm-6 mycustom"><a href="javascript:void(0);"  onclick="googleLogin()"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></div>
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
                                    <div class="col-xs-12 text-center" id="lblMessage">
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

        <!-- Large Signin Signup Modal -->


             <!-- Footer -->
            <footer id="footer">
                <div class="container">

                    <!-- Footer Columns -->
                    <div class="footer">
<img src="../Assets/images/logo.png" width="200px" height="" alt="Food Chapter log" style="margin-bottom: 13px;"><a class="business-info" href="tel://+923453177413">
        <p>Lhr: +92 345 3177413</p></a><a class="business-info" href="tel://+923453177413">
        <p>Pk: +92 345 3177413</p></a><a class="business-info" href="mailto:irfan@xevensolutions.com">
        <p>info@foodchapter.pk</p></a>
      <div class="social-links"><a class="icon-instagram" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="instagram logo"><img src="../Assets/images/img/logo-instagram.png" alt="Instagram logo"></a><a class="icon-twitter" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="twitter logo"><img src="../Assets/images/img/logo-twitter.png" alt="Twitter logo"></a><a class="icon-facebook" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="facebook logo"><img src="../Assets/images/img/logo-facebook.png" alt="Facebook logo"></a><a class="icon-pinterest" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="pinterest logo"><img src="../Assets/images/img/logo-pinterest.png" alt="Pinterest logo"></a></div>
      <ul class="site-links">
        <li class="site-links__item"><a class="site-links__item__link" href="/home.aspx" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click flower care">Home</a></li>
        <li class="site-links__item"><a class="site-links__item__link" href="/gallery.aspx" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click meet out florist">Gallery</a></li>
        <li class="site-links__item"><a class="site-links__item__link" href="/vendors.aspx" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click workshops">Vendors</a></li>
         <li class="site-links__item"><a class="site-links__item__link" href="/contact.aspx" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click delivery">Contact</a></li>
       <!-- <li class="site-links__item"><a class="site-links__item__link" href="#" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click faq">FAQS</a></li>
        <li class="site-links__item"><a class="site-links__item__link" href="#" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click contact">Contact</a></li>
        <li class="site-links__item"><a class="site-links__item__link" href="#" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click reviews">Terms &amp; Conditions</a></li>
        <li class="site-links__item"><a class="site-links__item__link" href="#" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click about ">About</a></li> 
        <li class="site-links__item"><a class="site-links__item__link" href="#" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click careers">Careers</a></li> -->
      </ul>
      <div class="card-icons"><img src="../Assets/images/img/cards.png" alt="Accepted payment methods" width="200px"></div>
      <div class="legal">
        <p class="legal__copyright">© 2017 Xeven  Solutions. All rights reserved.&nbsp;<a class="legal__link" href="#" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click t&amp;cs">Privacy policy (Terms &amp; Conditions)</a></p>
      </div>
    </div>
                    <!-- Footer Columns -->

                </div>
           
            </footer>
            <!-- Footer -->

        </div>
        <!-- Wrapper -->

        <!-- Java Script -->
        <script src="../Assets/js/vendor/jquery.js"></script>        		
        <script src="../Assets/js/vendor/bootstrap.min.js"></script> 	
       <!-- <script src="http://maps.google.com/maps/api/js?sensor=false"></script> -->
        <script src="../Assets/js/gmap3.min.js"></script>				
        <script src="../Assets/js/parallax.js"></script>	
        <script src="../Assets/js/sleekslider.js"></script>			   	 
        <script src="../Assets/js/countTo.js"></script>
        <script src="../Assets/js/countdown.js"></script>			
        <script src="../Assets/js/sticky-em.js"></script>
        <script src="../Assets/js/owl-carousel.js"></script>		
        <script src="../Assets/js/datepicker.js"></script>
        <script src="../Assets/js/clockpicker.js"></script>						
        <script src="../Assets/js/classie.js"></script>			
        <script src="../Assets/js/select-dropdown.js"></script>	
        <script src="../Assets/js/menu.js"></script>			
        <script src="../Assets/js/appear.js"></script>		
        <script src="../Assets/js/prettyPhoto.js"></script>			
        <script src="../Assets/js/isotope.pkgd.js"></script>			
        <script src="../Assets/js/hoverdir.js"></script>				
        <script src="../Assets/js/main.js"></script>				
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
                  $('#formSaveVendor').submit(function () {
                      // alert('a');
                      $('#imgload2').show();
                      funSaveVendor();
                      $('#imgload2').hide();
                      return false;
                  });

                  $('#formSaveUser').submit(function () {
                      $('#imgload3').show();
                      funSaveUser();
                      $('#imgload3').show();
                      return false;
                  });

                  $('#formLogin').submit(function () {
                      <%--var id= '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession())  %>' ;--%>
                      $('#imgload').show();
                      funAuthenticate();
                      $('#imgload').show();
                return false;
            });

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
        //e.preventDefault();
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
        //alert('hi');
        var userType = $('#userType').val();
        //if (userType == 0) {
        //    // <"FC msgs> //Please select a type
        //}
        //else
            if (userType == 2) {
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
            "USER_TYPE": 1,
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
    $(document).ready(function () {
        document.getElementById('fbSignIN').style.display = 'none';
    });
</script>	
    </body>
</html>