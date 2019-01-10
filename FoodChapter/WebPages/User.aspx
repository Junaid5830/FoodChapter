<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="FoodChapter.WebPages.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title></title>
    <link href="../Assets/css/animate.css" rel="stylesheet" />
    <link href="../Assets/css/bootstrap.css" rel="stylesheet" />
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assets/css/clockpicker.css" rel="stylesheet" />
    <link href="../Assets/css/color.css" rel="stylesheet" />
    <link href="../Assets/css/custom.css" rel="stylesheet" />
    <link href="../Assets/css/datepicker.css" rel="stylesheet" />
    <link href="../Assets/css/datepicker.min.css" rel="stylesheet" />
    <link href="../Assets/css/flaticon.css" rel="stylesheet" />
    <link href="../Assets/css/flora.css" rel="stylesheet" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/gallery.css" rel="stylesheet" />
    <link href="../Assets/css/menu.css" rel="stylesheet" />
    <link href="../Assets/css/owl-carousel.css" rel="stylesheet" />
    <link href="../Assets/css/placeorder.css" rel="stylesheet" />
    <link href="../Assets/css/preloader.css" rel="stylesheet" />
    <link href="../Assets/css/prettyPhoto.css" rel="stylesheet" />
    <link href="../Assets/css/responsive.css" rel="stylesheet" />
    <link href="../Assets/css/sleekslider.css" rel="stylesheet" />
    <link href="../Assets/css/style.css" rel="stylesheet" />
    <link href="../Assets/css/theme-elements.css" rel="stylesheet" />
    <link href="../Assets/css/transition.css" rel="stylesheet" />
    <link href="../Assets/css/vendor-profile.css" rel="stylesheet" />
    <link href="../Assets/css/vendor.css" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="../Assets/js/vendor/jquery-3.2.1.js"></script>
    <script src="../Assets/js/vendor/jquery-3.2.1.min.js"></script>
    <script src="../Assets/js/vendor/jquery.js"></script>
<%--    <script src="../../Scripts/jquery-1.8.2.intellisense.js"></script>
    <script src="../../Scripts/jquery-1.8.2.js"></script>
    <script src="../../Scripts/jquery.unobtrusive-ajax.js"></script>
    <script src="../../Scripts/jquery.validate-vsdoc.js"></script>--%>
    <script src="../Assets/js/vendor/bootstrap.js"></script>
    <script src="../Assets/js/vendor/bootstrap.min.js"></script>
    <script src="../Assets/js/vendor/jquery.js"></script>
    <%--<script src="../Assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>--%>
    <script src="../Assets/js/vendor/npm.js"></script>
    <script src="../Assets/js/appear.js"></script>
    <%--<script src="../Assets/js/c.js"></script>--%>
    <script src="../Assets/js/classie.js"></script>
    <script src="../Assets/js/clockpicker.js"></script>
    <script src="../Assets/js/countdown.js"></script>
    <script src="../Assets/js/countTo.js"></script>
    <script src="../Assets/js/datepicker.js"></script>
    <%--<script src="../Assets/js/gmap3.min.js"></script>--%>
    <script src="../Assets/js/hoverdir.js"></script>
    <script src="../Assets/js/isotope.pkgd.js"></script>
    <%--<script src="../Assets/js/main%20-%20Copy.js"></script>--%>
    <script src="../Assets/js/main.js"></script>
    <script src="../Assets/js/menu.js"></script>
    <script src="../Assets/js/owl-carousel.js"></script>
    <script src="../Assets/js/parallax.js"></script>
    <script src="../Assets/js/prettyPhoto.js"></script>
    <script src="../Assets/js/select-dropdown.js"></script>
    <script src="../Assets/js/sleekslider.js"></script>
    <script src="../Assets/js/sticky-em.js"></script>
    
</head>
<body id="home" >
   <!-- Main Content -->
	<main id="main-contant" class="inner-main">

		<!-- Contact Colums -->
		<div class="padding-bottom">
			<div class="container">
				<div class="row">

					<!-- Main Heading -->
					<div class="col-sm-12">
						<div class="main-heading">
							<h2>Register With Us</h2>
						</div>
					</div>
                    
                    <div class="row">
                        
                             <div class="col-xs-12 text-center" id="lblMessage">
                                 
                             </div>
                    </div>

					<!-- Main Heading -->
					<div class="col-md-2"></div>
                     <div class="col-md-8 neo">
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
                        <div class="tab-content">
                           <div class="tab-pane active" id="Login1">
                                <form role="form" class="form-horizontal" id="formLogin">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="txtLoginEmail" placeholder="Email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="txtLoginPassword" placeholder="Password" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10 modalRL nobordersubmitbutton" >
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            Submit</button>
                                        
                                    </div>
                                </div>
                                </form>
                            </div>
                            <!-- Vendors Registration -->
                             <div class="tab-pane" id="vendor-Registration">
                                 <form role="form" class="form-horizontal" id="formSaveVendor">
                                <div class="form-group">
                                    <label for="Name" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-8">   
                                                <input type="text" class="form-control" id="txtVendorName" placeholder="Name" />
                                           
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <!-- form group end here -->
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-8">
                                        <input type="email" class="form-control" id="txtVendorEmail" placeholder="Email" />
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <!-- form group end here -->
                                <div class="form-group">
                                    <label for="mobile" class="col-sm-2 control-label">
                                        Mobile</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtVendorMobile" placeholder="Mobile" />
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <!-- form group end here -->
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="txtVendorPassword" placeholder="Password" />
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <!-- form group end here -->
                                 <div class="form-group">
                                    <label for="profile" class="col-sm-2 control-label">
                                        Biography</label>
                                    <div class="col-sm-8">
                                        <textarea  id="txtVendorDescription" class="form-control" name="user_bio" placeholder="Description"></textarea>
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

                                            <input type="checkbox" name="vehicle" value="Foods" checked class="mint" /> Foods
                                            <input type="checkbox" name="vehicle" value="Cakes"  class="mint" /> Cakes
                                            <input type="checkbox" name="vehicle" value="frozen Foods"  class="mint" /> Frozen Foods
                                            <input type="checkbox" name="vehicle" value="Deals"  class="mint" /> Deals
                                </div>
                                <div class="col-md-2"></div>
                                </div><!-- Form group end here -->
                                 <div class="form-group">
                                <label for="ProfileImage" class="col-md-2 control-label">
                                Photo</label>
                                <div class="col-sm-8">
                                <input class="img-show" type='file' onchange="readURL(this);" />
                                     <img id="blah" src="#" alt="Your Photo" />
                                </div>
                                <div class="col-md-2"></div>
                                </div><!-- Form group end here -->






                               
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            Save & Continue</button> </div>
                                            <div class="col-md-4">
                                        <button type="button" class="btn btn-default btn-sm">
                                            Cancel</button>
                                    </div>
                                    <div class="col-sm-2">
                                    </div>
                                </div>
                                </form>
                            </div>




                            <!-- User Registratin Start -->
                            <div class="tab-pane" id="user-Registration">
                                <form role="form" class="form-horizontal" id="formSaveUser">
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-8">
                                        
                                                <input type="text" class="form-control" id="txtUserName" placeholder="Name" />
                                            
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-8">
                                        <input type="email" class="form-control" id="txtUserEmail" placeholder="Email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="mobile" class="col-sm-2 control-label">
                                        Mobile</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtUserMobile" placeholder="Mobile" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="txtUserPassword" placeholder="Password" />
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            Save & Continue</button> </div>
                                            <div class="col-md-4">
                                        <button type="button" class="btn btn-default btn-sm">
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

                        <div class="col-md-2"></div>
						
					
					

				</div> 
			</div>
		</div>
		
	
		
	
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
												<input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' name="quantity" min="1" max="10" placeholder="0" style="width:100%;">
                                            </div>
											 <div class="col-md-6">
											 <label for="quantity" class="control-label">
													Quantity</label>
												<input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' name="quantity" min="1" max="10" placeholder="0" style="width:100%;">
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
                <h4 class="modal-title" id="myModalLabel">
                    Login/Registration </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-8" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active modalRL"><a href="#Login1" data-toggle="tab">Login</a></li>
                            <li class="modalRL"><a href="#vendor-Registration" data-toggle="tab">Vendor Registration</a></li>
							 <li class="modalRL"><a href="#user-Registration" data-toggle="tab">User Registration</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Login1">
                                <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email1" placeholder="Email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Password" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10 modalRL">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            Submit</button>
                                        <a href="javascript:;">Forgot your password?</a>
                                    </div>
                                </div>
                                </form>
                            </div>
                            <!-- Vendors Registration -->
							 <div class="tab-pane" id="vendor-Registration">
                                 <form role="form" class="form-horizontal" id="formSaveVendor">
                                <div class="form-group">
                                    <label for="Name" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-8">   
                                                <input type="text" class="form-control" id="txtVendorName" placeholder="Name" />
                                           
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <!-- form group end here -->
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-8">
                                        <input type="email" class="form-control" id="txtVendorEmail" placeholder="Email" />
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <!-- form group end here -->
                                <div class="form-group">
                                    <label for="mobile" class="col-sm-2 control-label">
                                        Mobile</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtVendorMobile" placeholder="Mobile" />
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <!-- form group end here -->
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="txtVendorPassword" placeholder="Password" />
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <!-- form group end here -->
                                 <div class="form-group">
                                    <label for="profile" class="col-sm-2 control-label">
                                        Biography</label>
                                    <div class="col-sm-8">
                                        <textarea  id="txtVendorDescription" class="form-control" name="user_bio" placeholder="Description"></textarea>
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

                                            <input type="checkbox" name="vehicle" value="Foods" checked class="mint" /> Foods
                                            <input type="checkbox" name="vehicle" value="Cakes"  class="mint" /> Cakes
                                            <input type="checkbox" name="vehicle" value="frozen Foods"  class="mint" /> Frozen Foods
                                            <input type="checkbox" name="vehicle" value="Deals"  class="mint" /> Deals
                                </div>
                                <div class="col-md-2"></div>
                                </div><!-- Form group end here -->
                                 <div class="form-group">
                                <label for="ProfileImage" class="col-md-2 control-label">
                                Photo</label>
                                <div class="col-sm-8">
                                <input class="img-show" type='file' onchange="readURL(this);" />
                                     <img id="blah" src="#" alt="Your Photo" />
                                </div>
                                <div class="col-md-2"></div>
                                </div><!-- Form group end here -->






                               
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            Save & Continue</button> </div>
                                            <div class="col-md-4">
                                        <button type="button" class="btn btn-default btn-sm">
                                            Cancel</button>
                                    </div>
                                    <div class="col-sm-2">
                                    </div>
                                </div>
                                </form>
                            </div>


                            <!-- User Registratin Start -->
                            <div class="tab-pane" id="user-Registration">
                                <form role="form" class="form-horizontal" id="formSaveUser">
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-8">
                                        
                                                <input type="text" class="form-control" id="txtUserName" placeholder="Name" />
                                            
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-8">
                                        <input type="email" class="form-control" id="txtUserEmail" placeholder="Email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="mobile" class="col-sm-2 control-label">
                                        Mobile</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtUserMobile" placeholder="Mobile" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="txtUserPassword" placeholder="Password" />
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            Save & Continue</button> </div>
                                            <div class="col-md-4">
                                        <button type="button" class="btn btn-default btn-sm">
                                            Cancel</button>
                                    </div>
                                    <div class="col-sm-2">
                                    </div>
                                </div>
                                </form>
                            </div>
                            <!-- End User Div -->


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

			<!-- Large Signin Signup Modal -->
			
	<script>

	    $(document).ready(function () {

	        //function readURL(input) {
	        //    if (input.files && input.files[0]) {
	        //        var reader = new FileReader();

	        //        reader.onload = function (e) {
	        //            $('#blah')
            //                .attr('src', e.target.result)
            //                .width(150)
            //                .height(200);
	        //        };

	        //        reader.readAsDataURL(input.files[0]);
	        //    }
	        //}

	        function clearUser()
	        {
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
	        }

	        $("#formSaveUser").on('submit', function (e) {

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
	                        document.getElementById("lblMessage").innerHTML = "User Saved Successfully.";
	                        document.getElementById("lblMessage").style.color = 'green';
	                        clearUser();
	                    },
	                    500: function () {
	                        document.getElementById("lblMessage").innerHTML = "Error occured. User not added";
	                        document.getElementById("lblMessage").style.color = 'red';
	                    }
	                },
	                jsonp: 'jsonp'
	            });

	            event.preventDefault();
	        });

	        $("#formLogin").on('submit', function (e) {
	            var email = document.getElementById("txtLoginEmail").value;
	            var password = document.getElementById("txtLoginPassword").value;
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
	                    200: function () { location.href = "Vendors.aspx"; },
	                    401: function () {
	                        document.getElementById("lblMessage").innerHTML = "Unable to logged in.";
	                        document.getElementById("lblMessage").style.color = 'red';
	                    }
	                },
	                jsonp: 'jsonp'
	            });
	            event.preventDefault();
	        });

	        $("#formSaveVendor").on('submit', function (e) {

	            var name = document.getElementById("txtVendorName").value;
	            var email = document.getElementById("txtVendorEmail").value;
	            var password = document.getElementById("txtVendorPassword").value;
	            var mobile = document.getElementById("txtVendorMobile").value;
	            var description = $('#txtVendorDescription').val();

	            var vendor = {
	                "FIRST_NAME": name,
	                "EMAIL": email,
	                "PASSWORD": password,
	                "PERSONAL_PHONE": mobile,
                    "DESCRIPTION" : description
	            };

	            $.ajax({
	                url: '/api/Vendors/saveVendor',
	                type: 'POST',
	                contentType: 'application/json',
	                dataType: 'json',
	                data: JSON.stringify(vendor),
	                statusCode: {
	                    200: function () {
	                        document.getElementById("lblMessage").innerHTML = "Vendor Saved Successfully.";
	                        document.getElementById("lblMessage").style.color = 'green';
	                    },
	                    500: function () {
	                        document.getElementById("lblMessage").innerHTML = "Error occured. Vendor not added";
	                        document.getElementById("lblMessage").style.color = 'red';
	                    }


	                },

	                jsonp: 'jsonp'

	            });

	            event.preventDefault();
	        });


	    });
    </script>

</body>
</html>
