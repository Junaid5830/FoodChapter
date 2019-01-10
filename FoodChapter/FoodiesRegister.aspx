<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="FoodiesRegister.aspx.cs" Inherits="FoodChapter.FoodiesRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .container-fluid1 {
            margin: 0 auto;
            float: none;
            margin-top: 30px;
        }


        .navbar-inverse {
            background-color: transparent;
            border: none;
        }

            .navbar-inverse .navbar-nav > .active > a, .navbar-inverse .navbar-nav > .active > a:focus, .navbar-inverse .navbar-nav > .active > a:hover {
                background-color: transparent;
            }
    </style>
    <script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '229452994403732',
                xfbml: true,
                version: 'v3.1'
            });
            FB.AppEvents.logPageView();
            //acc('1');
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '1590429834334644',
                xfbml: true,
                version: 'v2.10'
            });
            FB.AppEvents.logPageView();
            //acc('1');
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
    <script>
        // initialize Account Kit with CSRF protection
        AccountKit_OnInteractive = function () {
            AccountKit.init(
              {
                  appId: "1590429834334644",
                  state: "vbhj789056alm",
                  version: "v1.0",
                  fbAppEventsEnabled: true,
                  Redirect: "http://localhost:3716/Home.aspx"

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
                            location.href = 'Gallery.aspx';
                        },
                        401: function () {
                            document.getElementById("success").innerHTML = "";
                            document.getElementById("showModel").innerHTML = "Wrong email or password";
                            document.getElementById("showModel").style.color = 'red';
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


    <script>

        function CreateVendorCaptcha() {
            var textArray = [];
            var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

            var code = "";
            for (var i = 0; i < 6; i++) {
                textArray[i] = possible.charAt(Math.floor(Math.random() * possible.length));

                code += textArray[i];
            }

            $.ajax({
                url: '/api/Vendors/SetCaptchVendorSession',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'captcha': code.toLowerCase() },
                statusCode: {
                    200: function () {
                        //var code = a + b + c + d + e;
                        //var c = document.getElementById("myCanvas");
                        //var ctx = c.getContext("2d");
                        //ctx.font = "30px 'Calibri'";
                        //ctx.clearRect(0, 0, c.width, c.height);
                        ////ctx.fontcolor = ""
                        //var x = 20 + Math.floor(Math.random() * 60);
                        //var y = 20 + Math.floor(Math.random() * 30);
                        //ctx.strokeText(code, x, y);
                        //ctx.moveTo(0, 0);
                        //ctx.lineTo(240, 70);
                        //ctx.stroke();
                        //ctx.moveTo(0, 70);
                        //ctx.lineTo(240, 0);
                        //ctx.stroke();
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });


        }

        function CreateUserCaptcha() {
            var textArray = [];
            var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

            var code = "";
            for (var i = 0; i < 6; i++) {
                textArray[i] = possible.charAt(Math.floor(Math.random() * possible.length));

                code += textArray[i];
            }

            $.ajax({
                url: '/api/User/SetCaptchUserSession',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'captcha': code.toLowerCase() },
                statusCode: {
                    200: function () {
                        //var code = a + b + c + d + e;
                        var c = document.getElementById("myCanvas1");
                        var ctx = c.getContext("2d");
                        ctx.font = "50px 'Calibri'";
                        ctx.clearRect(0, 0, c.width, c.height);
                        //ctx.fontcolor = ""
                        var x = 20 + Math.floor(Math.random() * 60);
                        var y = 20 + Math.floor(Math.random() * 30);
                        ctx.strokeText(code, x, y);
                        ctx.stroke();
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });


        }


        Storage.prototype.setObj = function (key, obj) {
            key = 'fc' + key;
            return this.setItem(key, JSON.stringify(obj))
        };

        Storage.prototype.getObj = function (key) {
            key = 'fc' + key;
            return JSON.parse(this.getItem(key))
        };

        function ViewVendorPrfile() {
            var vendorId = document.getElementById("vendorId").innerHTML;
            $.ajax({
                url: '/api/Vendors/SetViewVendorSession',
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId },
                statusCode: {
                    200: function () {
                        //clearProduct();
                        window.location = "vendor-profile.aspx";
                        //alert('Product Update succesfullty');
                    },
                    500: function () {
                        alert('Error occured. Cake not available');
                    }
                },
                jsonp: 'jsonp'

            });
        }
        function ViewCakeVendorPrfile() {
            var vendorId = document.getElementById("cakeVendorId").innerHTML;
            $.ajax({
                url: '/api/Vendors/SetViewVendorSession',
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId },
                statusCode: {
                    200: function () {
                        //clearProduct();
                        window.location = "vendor-profile.aspx";
                        //alert('Product Update succesfullty');
                    },
                    500: function () {
                        alert('Error occured. Cake not available');
                    }
                },
                jsonp: 'jsonp'

            });
        }

        function removeSpaces(string) {
            return string.split(' ').join('');
        }

        $(document).ready(function () {
            //document.getElementById('fbSignIN').style.display = 'none';
            CreateVendorCaptcha();
            CreateUserCaptcha();
            // Validate the Entered input aganist the generated security code function




            $('#formSaveVendor').submit(function () {

                $.ajax({
                    url: '/api/Vendors/GetCaptchVendorSession',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    statusCode: {
                        200: function (data) {
                            var str1 = data;

                            //var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
                            var str2 = removeSpaces(document.getElementById('txtInput').value);
                            if (str1 != str2.toLowerCase()) {
                                var why = "- Security code did not match.\n";
                                alert(why);
                            }
                            else {
                                $.ajax({
                                    url: '/api/Vendors/IsUniqueVendor',
                                    type: 'POST',
                                    contentType: 'application/json',
                                    dataType: 'json',
                                    data: JSON.stringify(user),
                                    statusCode: {
                                        200: function (data) {
                                            funSaveVendor();
                                        },
                                        500: function (data) {
                                          $('#myregistration').modal('show');
                                            document.getElementById("showModel").innerHTML = "Business Enity or Mobile Number is already exist";
                                            document.getElementById("error").style.color = '#780103';
                                        }
                                    },
                                    jsonp: 'jsonp'
                                });
                            }
                        },
                        500: function () {
                        }
                    },
                    jsonp: 'jsonp'
                });
                var businessEntity = document.getElementById("txtVendorEntity").value;
                var phone = document.getElementById("txtVendorMobile1").value;
                var user = {
                    "BUSINESS_ENTITY_NAME": businessEntity,
                    "PERSONAL_PHONE": phone
                };
                $('#imgload2').hide();
                return false;
            });

            $('#formSaveUser').submit(function () {
                $.ajax({
                    url: '/api/User/GetCaptchUserSession',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    statusCode: {
                        200: function (data) {
                            var str1 = data;
                            debugger;
                            //var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
                            var str2 = removeSpaces(document.getElementById('txtInput1').value);
                            if (str1 != str2.toLowerCase()) {
                              $('#myregistration').modal('show');
                              document.getElementById("showModel").innerHTML = "Invalid Captcha.";
                              document.getElementById("showModel").style.color = '#780103';
                            }
                            else {
                                funSaveUser();
                            }
                        },
                        500: function () {
                        }
                    },
                    jsonp: 'jsonp'
                });
                return false;
            });

            $('#formLogin').submit(function () {
                $('#imgload').show();
                funAuthenticate();
                $('#imgload').hide();
                return false;
            });

        });


        function verifyUserMobileCode() {
            var code = document.getElementById("txtUserMobile1").value;
            if (code.substring(0, 2) != "03")
                document.getElementById("txtUserMobile1").value = 0;
            else {
                if (code.length > 4) {
                    document.getElementById("txtUserMobile2").focus();
                    var mobile = document.getElementById("txtUserMobile2").value;
                    if (mobile.length == 0) {
                        document.getElementById("txtUserMobile2").value = code.substring(4, 5);
                    }
                    document.getElementById("txtUserMobile1").value = code.substring(0, 4);
                }
            }
        }

        function verifyMobileCode() {
            var code = document.getElementById("txtVendorMobile1").value;
            if (code.substring(0, 2) != "03")
                document.getElementById("txtVendorMobile1").value = 0;
            else {
                if (code.length > 4) {
                    document.getElementById("txtVendorMobile2").focus();
                    var mobile = document.getElementById("txtVendorMobile2").value;
                    if (mobile.length == 0) {
                        document.getElementById("txtVendorMobile2").value = code.substring(4, 5);
                    }
                    document.getElementById("txtVendorMobile1").value = code.substring(0, 4);
                }
            }
        }

        function phoneno() {
          $('#txtUserMobile1').keypress(function (e) {
            var a = [];
            var k = e.which;

            for (i = 48; i < 58; i++)
              a.push(i);

            if (!(a.indexOf(k) >= 0))
              e.preventDefault();
          });
        }
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
        <div class="container">

            <div class="my_container_section">
                <div class="login_tabs">
                    <a href="Login.aspx">LOGIN</a>
                    <a href="SellerRegister.aspx">SELLER REGISTRATION</a>
                    <a class="active" href="FoodiesRegister.aspx">FOODIES REGISTRATION</a>
                </div>
                <div class="sr_container_wrapper col-sm-12">

                    <div class="sr_left col-md-12 col-sm-12">
                        <div class="wraplogin_form">
                            <form role="form" class="form-horizontal" id="formSaveUser" action="#">
                                <div class="login_form_wrap" data-validate="Name is required">
                                    <input class="login_input" type="text" id="txtUserName" placeholder="NAME" required="Name is required">
                                    <span class="login_placeholder" data-placeholder="FIRST NAME"></span>
                                </div>

                                <div class="login_form_wrap" data-validate="Email is required">
                                    <input class="login_input" type="email" id="txtUserEmail" placeholder="EMAIL" required="Email is required">
                                    <span class="login_placeholder" data-placeholder="EMAIL"></span>
                                </div>

                                <div class="login_form_wrap" data-validate="Mobile is required">
                                    <input class="login_input" type="text" id="txtUserMobile1"  placeholder="MOBILE" onkeypress="phoneno()" maxlength="11" required="Mobile is required">
                                    <span class="login_placeholder" data-placeholder="MOBILE"></span>
                                </div>


                                <div class="login_form_wrap" data-validate="Password is required">
                                    <input class="login_input" type="password" id="txtUserPassword" placeholder="PASSWORD" required="password is required">
                                    <span class="login_placeholder" data-placeholder="PASSWORD"></span>
                                </div>


                                <div class="code_verify">
                                    <p class="seller_reg">ENTER CODE BELOW</p>
                                    <div class="verify_wrap">
                                        <canvas id="myCanvas1"></canvas>

                                        <button type="button" class="btn upbutton midmar trycaptcha" id="btnFlavour" onclick="CreateUserCaptcha();" style="margin-left: 10px; margin-top: -30px; width: 100px; height: 30px; font-size: 12px;" onclick="CreateNewFlavour();">
                                            Try Another
                                        </button>
                                    </div>
                                    <div class="captcha" style="display:inline-block;">
                                        <p style="font-size:14px;">*Captcha is case sensitive</p>
                                    </div>
                                    <div class="verify_wrap1">
                                        <textarea class="verify1" name="txtInput" id="txtInput1" required="code is required" style="height: 60px; width: 200px;"></textarea>
                                    </div>
                                </div>

                                <button type="submit" class="contact upbutton col-md-12 btn_sr">REGISTER</button>
                            </form>
                        </div>

                    </div>
                    
                </div>
            </div>
        </div>

        <img class="img_right  bottom sr_tp m_animate" src="Frontend/images/bg_3.png">
    </div>

    <div class="container">
        <div class="modal fade" id="myregistration" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" style="width: 400px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 id="showModel" class="modal-title" style="text-align: center; color: #780103; font-size: 16px;">
                        
                        </h4>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script>

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#vendorImage')
                        .attr('src', e.target.result)
                        .width(220)
                        .height(220);
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
            document.getElementById("txtUserMobile1").value = "";
            //document.getElementById("txtUserMobile2").value = "";
            document.getElementById("txtInput1").value = "";
            debugger;
            CreateUserCaptcha();

        }
        function clearVendor() {
            document.getElementById("txtVendorName").value = "";
            document.getElementById("txtVendorEmail").value = "";
            document.getElementById("txtVendorPassword").value = "";
            document.getElementById("txtVendorMobile1").value = "";
            document.getElementById("txtVendorMobile2").value = "";
            document.getElementById("txtInput").value = "";
            document.getElementById("txtVendorDescription").value = "";
            document.getElementById("txtVendorEntity").value = "";
            chbFoods.checked = false;
            chbCakes.checked = true;
            chbFrozenFoods.checked = false;
            chbDesserts.checked = false;
            CreateVendorCaptcha();
            //chbDeals.checked = false;
        }

        function funSaveVendor() {
            //e.preventDefault();
            var name = document.getElementById("txtVendorName").value;
            var email = document.getElementById("txtVendorEmail").value;
            var password = document.getElementById("txtVendorPassword").value;
            var entity = document.getElementById("txtVendorEntity").value;
            var mobile = document.getElementById("txtVendorMobile1").value;
            //var vendorImg = document.getElementById("imgaeB64").innerHTML;
            //var vendorImg = document.getElementById("vendorImage").getAttribute('src');
            //Uint8Array.from(atob(vendorImg), c => c.charCodeAt(0))
            //var imgBytes = _base64ToArrayBuffer(vendorImg.split(',')[1]);

            var description = document.getElementById('txtVendorDescription').value;
            var foods = document.getElementById('chbFoods').checked;
            //var deals = document.getElementById('chbDeals').checked;
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
                //"DEALS_SPECIALITY": deals,
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
                        location.href = "VendorDashboard.aspx";
                        clearVendor();
                        document.getElementById("error").innerHTML = "";
                        document.getElementById("showModel").innerHTML = "Vendor Saved Successfully.";
                        document.getElementById("showModel").style.color = 'green';
                        e.preventDefault();

                        //location.reload();
                    },
                    500: function () {
					$('#myregistration').modal('show');
                        document.getElementById("success").innerHTML = "";
                        document.getElementById("showModel").innerHTML = "Error occured. Vendor not added";
                        document.getElementById("showModel").style.color = '#780103';
                        e.preventDefault();
                    },
                    406: function () {
                      $('#myregistration').modal('show');
                        
                        document.getElementById("showModel").innerHTML = "Email not Unique. Please choose another.";
                        document.getElementById("showModel").style.color = '#780103';
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
                            location.href = 'Gallery.aspx';
                        },
                        401: function () {
						$('#myregistration').modal('show');
                            //document.getElementById("success").innerHTML = "";
                            document.getElementById("showModel").innerHTML = "Wrong email or password";
                            document.getElementById("showModel").style.color = '#780103';
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

                            location.href = 'VendorDashboard.aspx';
                        },
                        401: function (data) {
                            //alert('Wrong email or password');
							$('#myregistration').modal('show');
                            //document.getElementById("success").innerHTML = "";
                            document.getElementById("showModel").innerHTML = "Wrong email or password";
                            document.getElementById("showModel").style.color = '#780103';
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
            var mobile = document.getElementById("txtUserMobile1").value;

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
                        location.href = 'Gallery.aspx';
                        $('#myregistration').modal('show');
                        document.getElementById("showModel").innerHTML = "User Saved Successfully.";
                        document.getElementById("showModel").style.color = '#780103';
                        e.preventDefault();
                        location.reload();
                    },
                    500: function () {
					$('#myregistration').modal('show');
                        //document.getElementById("success").innerHTML = "";
                        document.getElementById("showModel").innerHTML = "Error occured. User not added";
                        document.getElementById("showModel").style.color = '#780103';
                        e.preventDefault();

                    },
                    406: function () {
                        $('#myregistration').modal('show');
                        document.getElementById("showModel").innerHTML = "Email not Unique. Please choose another.";
                        document.getElementById("showModel").style.color = '#780103';
                        e.preventDefault();

                    }
                },
                jsonp: 'jsonp'
            });
            //e.preventDefault();
        }
    </script>
</asp:Content>
