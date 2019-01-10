<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FoodChapter.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px white inset;
        }
.container-fluid1
{
    margin: 0 auto;
    float: none;
    margin-top: 30px;
}

.navbar-inverse
{
    background-color:transparent;
    border:none;
}
.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover
{
    background-color:transparent;
}



</style>
  
    <script>
    
       


        $(document).ready(function () {
          
            <% FoodChapter.SessionManager.RemoveUserSession(); %>
            document.getElementById('fbSignIN').style.display = 'none';
            

          $('#formLogin').submit(function () {

            
                funAuthenticate();
               
                return false;
                
            });
         
        });


    </script>
  <script>
    function Validation(){
      document.getElementById('txtEmail').innerHTML = 'Please Enter a Email!';
      document.getElementById('txtPassword').innerHTML = 'Please Enter a Password!';
    }
    </script>
    <script>

        function clearUser() {

            document.getElementById("txtUserName").value = "";
            document.getElementById("txtUserEmail").value = "";
            document.getElementById("txtUserPassword").value = "";
            document.getElementById("txtUserMobile1").value = "";
            document.getElementById("txtUserMobile2").value = "";
            document.getElementById("txtInput1").value = "";
            CreateUserCaptcha();

        }
 
        function funAuthenticate() {
            var email = document.getElementById("txtEmail").value;
            var password = document.getElementById("txtPassword").value;

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
                            location.href = 'Gallery.aspx';
                        },
                        401: function () {
                            funAuthenticateVendor();

                            //$('#myregistration').modal('show');
                            //document.getElementById("success").innerHTML = "";
                            //document.getElementById("error").innerHTML = "Wrong email or password";
                            //document.getElementById("error").style.color = 'red';
                        }
                    },
                    jsonp: 'jsonp'
                });
            }
        function funAuthenticateVendor() {
            var email = document.getElementById("txtEmail").value;
            var password = document.getElementById("txtPassword").value;

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

                        location.href = 'VendorDashboard.aspx';
                    },
                    401: function (data) {
                        $('#myregistration').modal('show');
                        document.getElementById("success").innerHTML = "";
                        document.getElementById("error").innerHTML = "Wrong email or password";
                        document.getElementById("error").style.color = 'red';
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function funSaveUser() {

            var name = document.getElementById("txtUserName").value;
            var email = document.getElementById("txtUserEmail").value;
            var password = document.getElementById("txtUserPassword").value;
            var mobile = document.getElementById("txtUserMobile1").value + document.getElementById("txtUserMobile2").value;

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
                        document.getElementById("error").innerHTML = "";
                        document.getElementById("success").innerHTML = "User Saved Successfully.";
                        document.getElementById("success").style.color = 'green';
                        e.preventDefault();
                        //location.reload();
                    },
                    500: function () {
                        document.getElementById("success").innerHTML = "";
                        document.getElementById("error").innerHTML = "Error occured. User not added";
                        document.getElementById("error").style.color = 'red';
                        e.preventDefault();

                    },
                    406: function () {
                        document.getElementById("success").innerHTML = "";
                        document.getElementById("error").innerHTML = "Email not Unique. Please choose another.";
                        document.getElementById("error").style.color = 'red';
                        e.preventDefault();

                    }
                },
                jsonp: 'jsonp'
            });
            //e.preventDefault();
        }
    </script>

    <script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
<%--     <script>
         // This is called with the results from from FB.getLoginStatus().
         function statusChangeCallback(response) {
             console.log('statusChangeCallback');
             console.log(response);
             // The response object is returned with a status field that lets the
             // app know the current login status of the person.
             // Full docs on the response object can be found in the documentation
             // for FB.getLoginStatus().
             if (response.status === 'connected') {
                 // Logged into your app and Facebook.
                 testAPI();
             } else {
                 // The person is not logged into your app or we are unable to tell.
                 document.getElementById('status').innerHTML = 'Please log ' +
                   'into this app.';
             }
         }

         // This function is called when someone finishes with the Login
         // Button.  See the onlogin handler attached to it in the sample
         // code below.
         function checkLoginState() {
             FB.getLoginStatus(function (response) {
                 statusChangeCallback(response);
             });
         }

         window.fbAsyncInit = function () {
             FB.init({
                 appId: '239475963587525',
                 cookie: true,  // enable cookies to allow the server to access 
                 // the session
                 xfbml: true,  // parse social plugins on this page
                 version: 'v3.1' // use graph api version 2.8
             });

             // Now that we've initialized the JavaScript SDK, we call 
             // FB.getLoginStatus().  This function gets the state of the
             // person visiting this page and can return one of three states to
             // the callback you provide.  They can be:
             //
             // 1. Logged into your app ('connected')
             // 2. Logged into Facebook, but not your app ('not_authorized')
             // 3. Not logged into Facebook and can't tell if they are logged into
             //    your app or not.
             //
             // These three cases are handled in the callback function.

             //FB.getLoginStatus(function (response) {
             //    statusChangeCallback(response);
             //});

         };

         // Load the SDK asynchronously
         (function (d, s, id) {
             var js, fjs = d.getElementsByTagName(s)[0];
             if (d.getElementById(id)) return;
             js = d.createElement(s); js.id = id;
             js.src = "https://connect.facebook.net/en_US/sdk.js";
             fjs.parentNode.insertBefore(js, fjs);
         }(document, 'script', 'facebook-jssdk'));

         // Here we run a very simple test of the Graph API after login is
         // successful.  See statusChangeCallback() for when this call is made.
         function testAPI() {
             console.log('Welcome!  Fetching your information.... ');
             FB.api('/me', function (response) {
                 console.log('Successful login for: ' + response.name);
                 window.location = 'Gallery.aspx';
                 //document.getElementById('status').innerHTML =
                 //  'Thanks for logging in, ' + response.name + '!';
             });
         }
</script>   --%>
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '239475963587525',
                cookie: true,  // enable cookies to allow the server to access 
                // the session
                xfbml: true,  // parse social plugins on this page
                version: 'v3.1' // use graph api version 2.8
            });
        };

        // Load the SDK asynchronously
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
    <script>
        // initialize Account Kit with CSRF protection
        AccountKit_OnInteractive = function () {
            AccountKit.init(
              {
                  appId: "239475963587525",
                  state: "vbhj789056alm",
                  version: "v1.0",
                  fbAppEventsEnabled: true,
                  Redirect: "https://foodchapter.pk/Gallery.aspx"

              }
            );
        };



        // login callback
        function loginCallback(response) {
            debugger;
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
                            location.href = 'Gallery.aspx';
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
            debugger;
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
            //alert('a');
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
        var CLIENTID = '822909308879-m0ec01vl60jc6fl8b17nblr0kpavsg4t.apps.googleusercontent.com';
        var REDIRECT = 'http://foodchapter.pk/Gallery.aspx';
        var LOGOUT = 'http://accounts.google.com/Logout';
        var TYPE = 'token';
        var _url = OAUTHURL + 'scope=' + SCOPE + '&client_id=' + CLIENTID + '&redirect_uri=' + REDIRECT + '&response_type=' + TYPE;
        var acToken;
        var tokenType;
        var expiresIn;
        var user;
        var loggedIn = false;
        function googleLogin() {
            debugger;
            var win = window.open(_url, "windowname1", 'width=800, height=600');
            var pollTimer = window.setInterval(function () {
                try {
                    console.log(win.document.URL);
                    debugger;
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
            debugger;
            $.ajax(
                {
                    url: VALIDURL + token,
                    data: null,
                    success: function (responseText) {
                        getUserInfo();
                        loggedIn = true;
                        //$('#loginText').hide();
                        //$('#logoutText').show();
                        location.href = "Gallery.aspx";
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
                    debugger;
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


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="gallery_pg_header_bg_login">
	<div class="gallery_bg fade1">
	<div class="seller_heading">
				<h1 style="margin-top: 188px;" class="sellers_pg_heading">Login / Registration</h1>
    </div>
	</div>
      
</div>
<div class="startcontent">
<img class="img_right sr_tp m_animate" src="Frontend/images/bg_1.png">
<img class="img_left m_animate" src="Frontend/images/bg_2.png">
<div class="container ">

	<div class="rloginwrap col-md-12">
		<div class="login_tabs col-md-12">
			<a style="font-size:35px" class="active" href="Login.aspx">LOGIN</a>
		</div>
		<div class="contact_container_wrappe col-sm-12">
			
			<div class="login_left col-md-7 col-sm-12">
				<div class="login_side">
        <form role="form" class="form-horizontal" id="formLogin">
		
						
						<div class="login_form_wrap" data-validate="Email is required">
               <label for="email" class="control-label contact_label" style="width:100%;text-align:left;">
                                        Email</label>
							<input id="txtEmail" class="login_input" type="email" name="email" placeholder="EMAIL" required="Email is required">
							<span class="login_placeholder" data-placeholder="EMAIL"></span>
						</div>
						
						<div class="login_form_wrap" data-validate="Password is required">
               <label for="email" class="control-label contact_label" style="width:100%;text-align:left;">
                                        Password</label>
							<input id="txtPassword" class="login_input" type="password" name="psw" placeholder="PASSWORD" required="Password is required">
							<span class="login_placeholder" data-placeholder="PASSWORD"></span>
						</div>
						
						<button type="submit" class="contact" id="login">LOGIN</button>
					</form>
				</div>
				
			</div>
			<div class="contact_right col-md-4 col-sm-12">
				<div class="login_right">
                    <%--<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
                    </fb:login-button>--%>

					<button class="login"><a href="javascript:void(0);" onclick="document.getElementById('fbSignIN').style.display = 'block';"><img src="Frontend/images/login_03.png" style="width:300px;"></a></button>
                    <%--<button class="login"><a href="javascript:void(0);" onclick="checkLoginState()"><img src="Frontend/images/login_03.png" style="width:300px;"></a></button>--%>


                    <div id="fbSignIN">
                                        <div>
                                            <input type="text" style=" margin-top: 30px; width: 250px;" id="fbMobile" class="form-control" placeholder="MOBILE">
                                            <label style="margin-top: 20px; width: 250px;">OR</label>
                                        </div>
                                        <div>
                                            <input type="text" style=" margin-top: 10px; width: 250px;" id="fbEmail" class="form-control" placeholder="EMAIL">
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success" id="btnPhoneSignIn" onclick="fbSignIn();" style=" margin-top: 30px; width: 250px; height: 30px; font-size: 12px;" >
                                                SignIn</button>
                                        </div>

                                    </div>

					<%--<button class="login"><a href="javascript:void(0);"  onclick="googleLogin()"><img src="Frontend/images/login_06.png" style="width:300px;"></a></button>--%>
				</div>
			</div>

		</div>
	</div>
</div>

      <div class="container">
        <div class="modal fade" id="myregistration" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" style="width:400px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" style="text-align: center; color:#780103; font-size:16px;">Please enter correct email or password!
                        
                        </h4>
                    </div>

                </div>
            </div>
        </div>
</div>
    
</asp:Content>
