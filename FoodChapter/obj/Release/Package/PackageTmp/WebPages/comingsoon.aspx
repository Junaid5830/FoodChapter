<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="comingsoon.aspx.cs" Inherits="FoodChapter.WebPages.comingsoon" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Food Chapter | Coming Soon</title>
     <!--REQUIRED STYLE SHEETS-->
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="../Assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLE CSS -->
    <link href="../Assets/newstyle/css/font-awesome.min.css" rel="stylesheet" />
    <!-- VEGAS STYLE CSS -->
    <link href="../Assets/newstyle/scripts/vegas/jquery.vegas.min.css" rel="stylesheet" />
       <!-- CUSTOM STYLE CSS -->
    <link href="../Assets/newstyle/css/style.css" rel="stylesheet" />
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

 <script>


     $(document).ready(function () {
         //alert("ahsan");=

         $('#formSaveVendor').submit(function () {
             funSaveVendor();
             return false;
         });

         $('#formSaveUser').submit(function () {
             funSaveUser();
             return false;
         });

         $.ajax({
             url: '/api/Vendors/GetAllVendors',
             type: 'Get',
             contentType: 'application/json',
             dataType: 'json',

             statusCode: {
                 200: function (data) {
                     //alert("success");
                     var json1 = JSON.parse(data);

                     for (var i = 0; i < json1.VENDORS.length; i++) {
                         $("#showme").append('<li> <figure class="v2-menu-img"><a href="#"><img src="../Assets/images/menu-v-2/img-01.jpg" alt="img-01"> </a></figure><div class="v2-menu-detail"><h5><a href"#">' + json1.VENDORS[i].FIRST_NAME + '</a></h5> <p>Category: Food, Cakes</p><ul class="rating-star vendor-page"><li>Rated: </li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star-half-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li></ul><span class="v-vp"><a href="#" class="sm-btn111">View Profile</a></span><span class="v-vp-order"><a href="#" class="sm-btn111">Place Order</a></span></div></li>');
                     }

                     debugger;
                 },
                 500: function () {
                 }


             },

             jsonp: 'jsonp'

         });

     });


	</script>

    </head>
<body>

    <div class="loader"></div>

    <!-- MAIN CONTAINER -->
    <div class="container-fluid">
        <!-- NAVBAR SECTION -->
    <div class="navbar navbar-inverse navbar-fixed-top top-nav">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#" ><img src="../Assets/newstyle/img/logo.png" alt="Logo"></a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right top-right">
            <li ><a data-toggle="modal" data-target="#mVendors" href="#mVendors">Vendors</a></li>
            <li><a data-toggle="modal" data-target="#myModal" href="#myModal">Get Register</a></li>
            <!-- <li><a data-toggle="modal" data-target="#mContact" href="#myModal">CONTACT</a></li> -->
          </ul>
        </div>         
      </div>
    </div>
     <!-- END NAVBAR SECTION -->

         <!-- MAIN ROW SECTION -->
         <div class="row">
         <div class="top-margin"></div>
            <div class="col-md-6 col-md-offset-3 col-sm-12">
                <div id="movingicon">
                      <i class="fa fa-flask fa-spin icon-color"></i>
                    <br />   
                  <div id="headLine"></div>   
                </div>              
            </div>
             <!--/. HEAD LINE DIV-->
            <div class="col-md-8 col-md-offset-2" >
                <div id="counter"></div>
                        <div id="counter-default" class="row">
                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="inner">
                                    <div id="day-number" class="timer-number"></div>
                                    <div class="timer-text">DAYS</div>
                                   
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="inner">
                                    <div id="hour-number" class="timer-number"></div>
                                    <div class="timer-text">HOURS</div>
                                    
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="inner">
                                    <div id="minute-number" class="timer-number"></div>
                                    <div class="timer-text">MINUTES</div>
                                  
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="inner">
                                    <div id="second-number" class="timer-number"></div>
                                    <div class="timer-text">SECOND</div>

                                   

                                </div>
                            </div>
                        </div>
                
            </div>
               <!--/. COUNTER DIV-->
            <div class="col-md-6 col-md-offset-3">    
               
                <div class="input-group">    
      <input type="text" class="form-control">
                      <span class="input-group-btn">
        <button class="btn btn-primary" type="button">  <i class="fa fa-cog fa-spin subscribe-icon"></i> SUBSCRIBE ! </button>
      </span>
    </div>       
                   </div>
             <!--/. SUBSCRIBE DIV-->
            <div class="col-md-6 col-md-offset-3">
                 <div class="social-links" >
                     <a href="#" >  <i class="fa fa-facebook fa-4x"></i> </a>
                      <a href="#" >  <i class="fa fa-google-plus fa-4x"></i> </a>
                      <a href="#" >  <i class="fa fa-twitter fa-4x"></i> </a>
                      <a href="#" >  <i class="fa fa-linkedin fa-4x"></i> </a>
                      
                     </div>
            </div>
               <!--/. SOCIAL DIV-->
         </div>
     <!--END MAIN ROW SECTION -->
    </div>


    <!-- More Modal ABove -->
      <!-- MAIN CONTAINER END -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel1">Registration</h4>
	      </div>
	      <div class="modal-body">
	      <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Nav tabs -->
                        <div class="row">
                        <div class="col-md-10 col-md-offset-2">
                        <ul class="nav nav-tabs">
                            
                            <li class="active modalRL"><a href="#vendor-Registration" data-toggle="tab">Vendor Registration</a></li>
                             <li class="modalRL"><a href="#user-Registration" data-toggle="tab">User Registration</a></li>
                        </ul>
                        </div>
                        </div>
                        <!-- Tab panes -->
                        <div class="tab-content">
                           
                            <div class="row">
                        
                                     <div class="col-xs-12 text-center" id="lblMessage">
                                 
                                     </div>
                            </div>
                             <div class="tab-pane active vendor-register" id="vendor-Registration">
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
                                        <input maxlength="12" data-fv-numeric="true" data-fv-numeric-message="Please enter valid phone numbers" data-fv-phone-country11="PK" class="form-control" id="txtVendorMobile" placeholder="Mobile" required="required"/>
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

                                            <input type="checkbox" name="vehicle" id="chbFoods" value="Foods" checked class="mint" /> Foods
                                            <input type="checkbox" name="vehicle" id="chbCakes" value="Cakes"  class="mint" /> Cakes
                                            <input type="checkbox" name="vehicle" id="chbFrozenFoods" value="frozen Foods"  class="mint" /> Frozen Foods
                                            <input type="checkbox" name="vehicle" id="chbDeals" value="Deals"  class="mint" /> Deals
                                </div>
                                <div class="col-md-2"></div>
                                </div><!-- Form group end here -->
                                 <div class="form-group">
                                <label for="ProfileImage" class="col-md-2 control-label">
                                Photo</label>
                                <div class="col-sm-8">
                                <input class="img-show" type='file' onchange="readURL(this);" />
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
                            <div class="tab-pane vendor-register" id="user-Registration">
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
                                        <input class="form-control" id="txtUserMobile" placeholder="Mobile" required="required" />
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
                        </div>
                        
                    </div>
                    
                </div> <!-- Row ends here -->
            </div>
	      </div>



	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary back-btn btn-back" data-dismiss="modal">CLOSE ME</button>
	      </div>


	    </div>
	  </div>
	</div>

	<!-- ########################################################################## -->
     <!--/. ABOUT MODAL POPUP DIV-->
    <div class="modal fade" id="mVendors" tabindex="-1" role="dialog" aria-labelledby="Vendors1" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="Vendors1"> <i class="fa fa-plus"></i> VENDORS </h4>
	      </div>
	      <div class="modal-body">
          <div class="row">
                    <div class="col-md-12">
                        <ul id="showme" class="v-2-menu-list">
                        
                        </ul>





                    </div><!-- col ends here -->

          </div><!-- Row -->
		        
		        </div> <!-- Modal Body -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary back-btn" data-dismiss="modal">CLOSE ME</button>
	      </div>
	    </div>
	  </div>
	</div>
     <!--/. SERVICES MODAL POPUP DIV-->
    <div class="modal fade" id="mContact" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel"> <i class="fa fa-plus"></i> CONTACT US</h4>
	      </div>
	      <div class="modal-body">
              <div class="mian-popup-body">
                   <h1> <span class="fa fa-book "></span> REACH US</h1>
		        	<div class="row">
		        	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Pellentesque volutpat, diam in accumsan scelerisque.
                       
		        	</p>
                    <h3> <span class="fa fa-cog fa-spin "></span> Our Location</h3>
		        	<p>
		        		123 UA, Newyork Street, 2078. <br />
                        Call: +42-78-0090-00.
                         
		        	</p>
              <br/><br/>
		        	<div >
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2999841.293321206!2d-75.80920404999999!3d42.75594204999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4ccc4bf0f123a5a9%3A0xddcfc6c1de189567!2sNew+York!5e0!3m2!1sen!2s!4v1395313088825" class="mymap" ></iframe>
					</div>
		        </div>
		        </div>
		        
	      </div>
	     <div class="modal-footer">
	        <button type="button" class="btn btn-primary back-btn" data-dismiss="modal">CLOSE ME</button>
	      </div>
	    </div>
	  </div>
	</div>
    <!--/. CONTACT MODAL POPUP DIV-->
     <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
     <!-- CORE JQUERY  -->
    <script src="../Assets/newstyle/plugins/jquery-1.10.2.js"></script>
     <!-- BOOTSTRAP CORE SCRIPT   -->
    <script src="../Assets/newstyle/plugins/bootstrap.js"></script>
    <!-- COUNTDOWN SCRIPTS -->
    <script src="../Assets/newstyle/plugins/jquery.countdown.js"></script>
    <script src="../Assets/newstyle/js/countdown.js"></script>
    <!-- VEGAS SLIDESHOW SCRIPTS -->
    <script src="../Assets/newstyle/plugins/vegas/jquery.vegas.min.js"></script>
     <!-- CUSTOM SCRIPTS -->
    <script src="../Assets/newstyle/js/custom.js"></script>
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
    var vendor = {
        "FIRST_NAME": name,
        "EMAIL": email,
        "PASSWORD": password,
        "PERSONAL_PHONE": mobile,
        "DESCRIPTION": description,
        "BUSINESS_ENTITY_NAME": entity,
        "FOODS_SPECIALITY": foods,
        "CAKES_SPECIALITY": deals,
        "FROZEN_FOODS_SPECIALITY": cakes,
        "DEALS_SPECIALITY": frozenFoods
        //"VENDRO_PHOTO": imgBytes
        

    };
    debugger;


    $.ajax({
        url: '/api/Vendors/saveVendor',
        type: 'POST',
        contentType: 'application/json',
        dataType: 'json',
        data: JSON.stringify(vendor),
        statusCode: {
            200: function () {
                clearVendor();
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

    
        

    }

    function _base64ToArrayBuffer(base64) {
        var binary_string = window.atob(base64);
        alert("a");
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
                },
                500: function () {
                    document.getElementById("lblMessage").innerHTML = "Error occured. User not added";
                    document.getElementById("lblMessage").style.color = 'red';
                }
            },
            jsonp: 'jsonp'
        });

    }
</script>

</body>
</html>
