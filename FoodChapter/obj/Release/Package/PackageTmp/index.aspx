<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FoodChapter.WebPages.index" %>

<!doctype html>
<!--[if lt IE 7]>       <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>          <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>          <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->  <html class="no-js" lang=""> <!--<![endif]-->
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

     <title>Home</title>
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
    <link href="../Assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLE CSS -->
    <!-- VEGAS STYLE CSS -->
       <!-- CUSTOM STYLE CSS -->
     <!-- GOOGLE FONT -->
     <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
     <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="../Assets/css/custom.css">
    <link rel="stylesheet" href="../Assets/css/vendor.css">

    <!-- Scripts Run through here -->
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

    
        
          <!-- Start appending Vendors  here -->








    </head>

    <script>
        alert('hi');
        debugger
        var valid = '<%= FoodChapter.SessionManager.isUserSessionSet()%>';
        alert(valid);
        if (valid == 'False') {
            alert('hi');
            window.location = "home.aspx";

        }

        $(document).ready(function () {
            //alert("ahsan");=
            
            $.ajax({
                url: '/api/Vendors/RemoveAllSessions',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',

                statusCode: {
                    200: function (data) {
                    },
                    500: function () {
                    }
                },

                jsonp: 'jsonp'
                
            });

            $('#formSaveVendor').submit(function () {
                funSaveVendor();
                return false;
            });

            $('#formSaveUser').submit(function () {
                funSaveUser();
                return false;
            });
            
            $('#formLogin').submit(function () {
                <%--var id= '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession())  %>' ;--%>
                funAuthenticate();
                return false;
            });

        });
</script>

    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
    <body id="home">
        <!-- Preloader -->
        <!--div id="preloader">
            <div id="status">
                <img src="images/preloader.gif" alt="preloader">
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
                <strong class="inner-logo"><a href="index.php"><img src="../Assets/images/logo.png" alt="logo"></a></strong>
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
                                          
                                </ul>

                   </div>
                </nav>
            </div>
        </div>
    </header>
    <!-- Header inner -->
    </header>
            <!-- Header -->
 
  <!-- Banner Slider -->
                <div class="banner-v2">
                    <div class="banner-inner-v2">
                        <div id="sleekslider" class="sleekslider">

                            <!-- Slides -->
                            <div class="slide active bg-1">
                                <div class="tg-display-table">	
                                    <div class="tg-display-table-cell">
                                        <div class="slide-content-v2 pull-right">
                                            <h2 class="slider-text">Home Made Quality Food</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Slides -->

                            <!-- Slides -->
                            <div class="slide bg-2">
                                <div class="tg-display-table">	
                                    <div class="tg-display-table-cell">
                                        <div class="slide-content-v2 pull-right">
                                            <h2>Home Made Quality Food</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Slides -->

                            <!-- Slides -->
                            <div class="slide bg-3">
                                <div class="tg-display-table">	
                                    <div class="tg-display-table-cell">
                                        <div class="slide-content-v2 pull-right">
                                            <h2>Home Made Quality Food</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Slides -->

                            <!-- Navigation Arrows with Thumbnails -->
                            <nav class="nav-split">
                                <a class="prev" href="">
                                    <span class="icon-wrap fa fa-angle-left"></span>
                                </a>
                                <a class="next" href="">
                                    <span class="icon-wrap fa fa-angle-right"></span>
                                </a>
                            </nav>

                        </div>
                    </div>
                </div>
                <!-- Banner Slider -->

            </header>
            <!-- Header -->

            <!-- Main Content -->
            <main id="main-contant">

                <!-- Online Food Shop v2 -->
			
               
					
                <!-- Online Food Shop v2 -->
                <!-- Team Section -->
                <section id="register" class="section-padding team-section">
                    <div class="container">

                        <!-- Main Heading -->
                        <div class="main-heading">
                            <h3><span>Meet Our Proffesionals</span><strong>Register Here</strong></h3>
                        </div>
                        <!-- ########################### REGISTERATION ########################### -->
                        <div class="row">

                        <div class="col-md-12">

                                <!-- Nav tabs -->
                        <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-8">
                        <ul class="nav nav-tabs">
                        <li class="active modalRL"><a href="#Login1" data-toggle="tab">Login</a></li>
                            <li class=" modalRL"><a href="#vendor-Registration" data-toggle="tab">Vendor Registration</a></li>
                             <li class="modalRL"><a href="#user-Registration" data-toggle="tab">User Registration</a></li>
                        </ul>
                        </div>
                        <div class="col-md-2"></div>
                        </div>
                        <!-- Tab panes -->
                        <div class="tab-content  login-lg">
                            <div class="row">
                        
                                     <div class="col-xs-12 text-center" id="lblMessage">
                                 
                                     </div>
                            </div>
                           <div class="tab-pane active" id="Login1">
                                <form role="form" class="form-horizontal" id="formLogin">
                                    <div class="form-group">
                                        <div class="col-md-2">

                                        </div>
                                        <div class="col-md-8">
                                            <select class="form-control" id="userType">
                                                <option value="0">Please Select</option>
                                                <option value="2">Foodies</option>
                                                <option value="3">FoodSellers</option>
                                            </select>
                                        </div>
                                        <div class="col-md-2">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <div class="col-sm-8">
                                        <label for="email" class="label-sm control-label">
                                            Email</label>
                                            <input type="email" class="form-control" id="txtEmail" placeholder="Email" />
                                        </div>
                                    </div>
                                <div class="form-group">
                                <div class="col-md-2"></div>
                                    
                                    <div class="col-sm-8">
                                    <label for="exampleInputPassword1" class="label-sm control-label">
                                        Password</label>
                                        <input type="password" class="form-control" id="txtPassword" placeholder="Password" />
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            Submit</button>
                                            </div>
                                            <div class="col-md-4 forgotme">
                                        <a class="forget" href="javascript:;">Forgot your password?</a>
                                    </div>
                                    <div class="col-sm-2">
                                    </div>
                                </div>
                                </form>
                            </div>
                            <!-- Vendors Registration -->
                             <div class="tab-pane" id="vendor-Registration">
                                 <form role="form" class="form-horizontal" id="formSaveVendor" action="#"> 
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-8">
                                    <input type="text" class="form-control" placeholder="Name" id="txtVendorName" required="required"/>
                                       
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
                                    <div class="col-sm-8">
                                        <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtVendorMobile" placeholder="Mobile" required="required"/>
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <!-- form group end here -->
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="txtVendorPassword" placeholder="Password" required="required"/>
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
                                <!-- form group end here -->
                                 <div class="form-group">
                                    <label for="profile" class="col-sm-2 control-label">
                                        Biography</label>
                                    <div class="col-sm-8">
                                        <textarea id="txtVendorDescription" class="form-control" name="user_bio" placeholder="Description" ></textarea>
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <!-- form group end here -->
                                <div class="form-group">
                                <label for="Multiselect" class="col-md-2 control-label">
                                Speciality</label>
                                <div class="col-sm-8 img-show">
                               <!-- <select multiple name="Multiselect" id="multi">
                                             <option value="volvo">Foods</option>
                                             <option value="saab">Cakes</option>
                                              <option value="opel">Frozen Foods</option>
                                             <option value="audi">Deals</option>
                                             </select> -->

                                            <input type="checkbox" name="vehicle" id="chbCakes" value="Cakes" checked class="mint" /> Cakes
                                            <input type="checkbox" name="vehicle" id="chbFoods" value="Foods"  class="mint" /> Foods
                                            <input type="checkbox" name="vehicle" id="chbFrozenFoods" value="frozen Foods"  class="mint" /> Frozen Foods
                                            <input type="checkbox" name="vehicle" id="chbDesserts" value="Deals"  class="mint" /> Desserts
                                            <input type="checkbox" name="vehicle" id="chbDeals" value="Deals"  class="mint" /> Deals
                                </div>
                                <div class="col-md-2"></div>
                                </div><!-- Form group end here -->
                                 <div class="form-group">
                                <label for="ProfileImage" class="col-md-2 control-label">
                                Photo</label>
                                <div class="col-sm-8">
                                <input class="img-show" type='file' id="imgInp" onchange="readURL(this);" />
                                     <p id="imgaeB64" hidden></p>
                                     <img id="vendorImage" src="" alt="Your Photo Here" />
                                </div>
                                <div class="col-md-2"></div>
                                </div><!-- Form group end here -->






                               
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="submit" class="btn btn-primary btn-sm" >
                                            Save & Continue</button> </div>
                                            <div class="col-md-4">
                                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">
                                            Cancel</button>
                                    </div>
                                    <div class="col-sm-2">
                                    </div>
                                </div>
                                </form>
                            </div>




                            <!-- User Registratin Start -->
                            <div class="tab-pane" id="user-Registration">
                                <form role="form" class="form-horizontal" id="formSaveUser" action="#">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-8">
                                        
                                           <input type="text" class="form-control" id="txtUserName" placeholder="Name" required="required" />
                                           
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-8">
                                        <input type="email" class="form-control" id="txtUserEmail" placeholder="Email"  required="required" />
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
                                    <label for="password" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="txtUserPassword" placeholder="Password" required="required" />
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="submit" class="btn btn-primary btn-sm" >
                                            Save & Continue</button> </div>
                                            <div class="col-md-4">
                                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">
                                            Cancel</button>
                                    </div>
                                    <div class="col-sm-2">
                                    </div>
                                </div>
                                </form>
                            </div>
                            <!-- End User Div -->
</div>


                        </div>



                        </div>













                        <!-- Main Heading -->

                        <!-- Team Figures -->
                       
                        <!-- Team Figures -->



                    </div>
                </section>
                <!-- Team Section -->
                 <!-- Testimonial -->
                
                <!-- Testimonial -->


            </main>

            <div class="modal fade" id="mVendors" tabindex="-1" role="dialog" aria-labelledby="Vendors1"
    aria-hidden="true">
     <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="Vendors1">
                    Our Vendors </h4>
            </div>
            <div class="modal-body">


             <div class="col-md-12">
                    <div class="col-md-10 col-md-offset-1">
                                <ul id="showme" class="v-2-menu-list">
                            
                            </ul>





                    </div><!-- col ends here -->

          </div><!-- Row -->
              
            </div>
        </div>
    </div>
</div>


                  


 









<!-- Vendors Modal -->


      
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
     <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    Login </h4>
            </div>
            <div class="modal-body">
             <div class="row">
                    <div class="col-md-8" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active modalRL"><a href="#Login1" data-toggle="tab">Login</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Login1">
                                <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-8">
                                        <input type="email" class="form-control" id="email1" placeholder="Email" />
                                    </div>
                                    <div class="col-sm-2">
                                    </div>
                                </div>
                                <!-- form group end here -->
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-8">
                                        <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Password" />
                                    </div>
                                    <div class="col-sm-2">
                                    </div>
                                </div>
                                <!-- form group end here -->
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            Submit</button>
                                            </div>
                                            <div class="col-md-4">
                                        <a class="forget" href="javascript:;">Forgot your password?</a>
                                    </div>
                                    <div class="col-sm-2">
                                    </div>
                                </div>
                                </form>
                            </div>
                            
                       
                        </div>
                         <div id="OR" class="hidden-xs">
                            OR</div>
                    </div>
                    <div class="col-md-4">
                        <div class="row text-center sign-with">
                            <div class="col-md-12">
                                <h3 class="signin-with-color">
                                    Sign in with</h3>
                            </div>
                            <div class="col-md-12">
                                <div class="btn-group btn-group-justified">
                                    <a href="#" class="btn btn-primary">Facebook</a> <a href="#" class="btn btn-danger">
                                        Google</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


              
            </div>
        </div>
    </div>
</div>

			<!-- Large Signin Signup Modal -->

			<!-- Bootstrap Modal -->
			<!-- Bootstrap Modal -->
			<!-- Product Description modal -->
					<div class="container">
						  <!-- Modal -->
						  <div class="modal fade" id="productModal1" role="dialog">
							<div class="modal-dialog">
							
							  <!-- Modal content-->
							  <div class="modal-content">
								<div class="modal-body">
									<div class="product-modal-row">
										<div class="product-modal-img">
											<img src="images/products/img-01.jpg" alt="img-01">
										</div>
										<div class="product-modal-detail">
												<h5>Fresh Cream</h5><span>Rs.25</span>
												<div>
													<h5><a href="Vendor-Profile.php">Vendor Profile</a><h5>
												</div>
												<div>
													1-10 Pounds
												</div>
												<div class="dropdown">
                                                  <button class="dropbtn">Flavour</button>
                                                        <div class="dropdown-content">
                                                         <a href="#">staberry</a>
                                                         <a href="#">vanilla</a>
                                                        <a href="#">chocalte</a>
                                                        </div>
                                                </div>
												<div>
													1-5 Tiers
												</div>
												<span class="modal-order-btn"><a href="placeorder.php" class="sm-btn11">Order</a></span>
												<div>
													Description Start from here you can write anything here about product
												</div>
										</div>
									</div>
								</div>
							  </div>
							  
							  <!-- Modal content-->
							</div>
						  </div>
						  
						</div>

			<!-- Product Description Modal -->
			<!-- Bootstrap Modal -->
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
        <li class="site-links__item"><a class="site-links__item__link" href="#" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click flower care">Home</a></li>
        
        <li class="site-links__item"><a class="site-links__item__link" href="#register" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click meet out florist">Register</a></li>
        <li class="site-links__item"><a class="site-links__item__link" href="#mVendors" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click workshops">Vendors</a></li>
        
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

        <!-- Java Script -->
        <script src="../Assets/js/vendor/jquery.js"></script>             
        <script src="../Assets/js/vendor/bootstrap.min.js"></script>  
        <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
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
//                    clearVendor();
                    //document.getElementById("lblMessage").innerHTML = "Vendor Saved Successfully.";
                    //document.getElementById("lblMessage").style.color = 'green';
                    location.reload();
                },
                500: function () {
                    document.getElementById("lblMessage").innerHTML = "Error occured. Vendor not added";
                    document.getElementById("lblMessage").style.color = 'red';
                },
                406: function () {
                    document.getElementById("lblMessage").innerHTML = "Email not Unique. Please choose another.";
                    document.getElementById("lblMessage").style.color = 'red';
                }
            },
            jsonp: 'jsonp'
        });
    }

    function UploadImage(id)
    {
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
    function funAuthenticate()
    {
        var email = document.getElementById("txtEmail").value;
        var password = document.getElementById("txtPassword").value;

        var userType = $('#userType').val();
        if (userType == 0)
        {
            alert('Please select a type');
        }
        else if(userType == 2)
        {
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
        else
        {
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
                    //document.getElementById("lblMessage").innerHTML = "User Saved Successfully.";
                    //document.getElementById("lblMessage").style.color = 'green';
                    location.reload();
                },
                500: function () {
                    document.getElementById("lblMessage").innerHTML = "Error occured. User not added";
                    document.getElementById("lblMessage").style.color = 'red';
                },
                406: function () {
                    document.getElementById("lblMessage").innerHTML = "Email not Unique. Please choose another.";
                    document.getElementById("lblMessage").style.color = 'red';
                }
            },
            jsonp: 'jsonp'
        });

    }
</script>
                                
    </body>
</html>
        