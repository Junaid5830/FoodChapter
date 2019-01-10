<%@ Page Title="" MasterPageFile="~/Layout.Master" Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="FoodChapter.WebPages.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .navbar-inverse
        {
            background-color:transparent;    border:none;
        }
        .navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover
        {
            background-color:transparent;
        }

        .container-fluid1
        {
            margin: 0 auto;
            float: none;
            margin-top: 30px;
        }

    </style>


    <script>
        function AuthenticateUser() {
            var email = document.getElementById("txtLoginEmail").value;
            var password = document.getElementById("txtLoginPassword").value;
            var user = {

                "EMAIL": email,
                "PASSWORD": password
            };

            $.ajax({
                url: '/api/User/authenticateAdmin',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(user),
                statusCode: {
                    200: function (data) {
                        var id = JSON.parse(data);
                        location.href = 'admindashboard.aspx';
                    },
                    401: function () {
                        document.getElementById("lblMessage").innerHTML = "Unable to logged in.";
                        document.getElementById("lblMessage").style.color = 'red';
                    },
                    500: function (data) {
                        var errorss = JSON.parse(data);
                        alert(errorss);
                    }
                },
                jsonp: 'jsonp'
            });
        }

        $(document).ready(function () {

            //$.ajax({
            //    url: '/api/Vendors/Test',
            //    type: 'Get',
            //    contentType: 'application/json',
            //    dataType: 'json',

            //    statusCode: {
            //        200: function (data) {
            //            alert('hi');
            //        },
            //        500: function () {
            //        }


            //    },

            //    jsonp: 'jsonp'

            //});


            $('#formSaveVendor').submit(function () {
                funSaveVendor();
                return false;
            });

            $('#formSaveUser').submit(function () {
                funSaveUser();
                return false;
            });

            $('#formLogin').submit(function () {
                AuthenticateUser();
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
                            $("#showme").append('<li> <figure class="v2-menu-img"><a href="#"><img src="../Assets/images/menu-v-2/img-01.jpg" alt="img-01"> </a></figure><div class="v2-menu-detail"><h5><a href"#">' + json1.VENDORS[i].FIRST_NAME + '</a></h5> <p>Category: Food, Cakes</p><ul class="rating-star vendor-page"><li>Rated: </li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star-half-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li></ul><span class="v-vp"><a href="#" class="sm-btn111">View Profile</a></span><span class="v-vp-order"><a href="#" class="sm-btn111">Add to Cart</a></span></div></li>');
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	                    
			<div class="seller_heading">
				<h1 class="sellers_pg_heading" style="margin-top: 190px;" >Login</h1>
			</div>
			
		

	
	<div class="gallery_pg_header_bg_login">
	<div class="gallery_bg fade1">
	<!--	<img src="images/login_slider_1.png" style="width:100%">-->
	</div>


</div>
    <div class="wrapper">
        <div class="top-bar" id="top-bar">
            <div class="loginbg" style="text-align:center;">
                <div class="container">
                    <div class="row rowfm">
                        <div class="col-md-3"></div>
                        <div class="col-md-6 col-sm-6 col-xs-12 FormLogin">
                            <h1 style="text-align: center; display: block;" class="product-name h_ty" id="LoginHeading">LOGIN</h1>



                            <div class="col-xs-12 text-center">
                                <label id="lblMessage"></label>
                            </div>

                            <form id="formLogin" class="loginfm  col-md-12 col-sm-4 ">
                                <div class="form-group">
                                    <label for="email" class="control-label contact_label" style="width:100%;text-align:left;">
                                        Email</label>
                                    <input type="email" class="ad_input" id="txtLoginEmail" placeholder="Email" required="Email is required" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="control-label contact_label" style="width:100%;text-align:left;">
                                        Password</label>
                                    <input type="password" class="ad_input" id="txtLoginPassword" placeholder="Password" required="password is required" />
                                </div>
                                <div class="row">
                                </div>
                                <button type="submit" class="cbtn_submit">
                                    SUBMIT</button>

                            </form>
                        </div>
                        <div class="col-md-3"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>