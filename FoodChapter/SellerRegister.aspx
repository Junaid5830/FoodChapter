<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="SellerRegister.aspx.cs" Inherits="FoodChapter.SellerRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px white inset;
        }

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
                data: { 'captcha': code },
                statusCode: {
                    200: function () {
                        //var code = a + b + c + d + e;
                        var c = document.getElementById("myCanvas");
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

        function isUniqueVendor()
        {
            var businessEntity = document.getElementById("txtVendorEntity").value;
            var phone = document.getElementById("txtVendorMobile1").value;
            var user = {
                "BUSINESS_ENTITY_NAME": businessEntity,
                "PERSONAL_PHONE": phone
            };
            
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
                        //alert('Wrong email or password');
                        $('#myregistration').modal('show');
                        document.getElementById("showModel").innerHTML = "Business Enity or Mobile Number  already exists.Please choose other";
                        document.getElementById("showModel").style.color = '#780103';
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function removeSpaces(string) {
            return string.split(' ').join('');
        }


        $(document).ready(function () {
            CreateVendorCaptcha();
            //$.ajax({
            //    url: '/api/Vendors/RemoveAllSessions',
            //    type: 'Get',
            //    contentType: 'application/json',
            //    dataType: 'json',

            //    statusCode: {
            //        200: function (data) {
            //        },
            //        500: function () {
            //        }
            //    },

            //    jsonp: 'jsonp'

            //});
            $('#formSaveVendor').submit(function () {

                debugger;
                $.ajax({
                    url: '/api/Vendors/GetCaptchVendorSession',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    statusCode: {
                        200: function (data) {
                            var str1 = data;
                            debugger;
                            //  var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
                            var str2 = removeSpaces(document.getElementById('txtInput').value);
                            if(str1 === str2)
                            {
                                isUniqueVendor();
                            }
                            else
                            {
                                $('#myregistration').modal('show');
                                document.getElementById("showModel").innerHTML = "Invalid Captcha.";
                                document.getElementById("showModel").style.color = '#780103';
                            }
                            
                            
                        },
                        500: function () {
                            $('#myregistration').modal('show');
                            document.getElementById("showModel").innerHTML = "Captcha not set. Reload Again";
                            document.getElementById("showModel").style.color = '#780103';
                        }
                    },
                    jsonp: 'jsonp'
                });
                
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

        
        function phoneno() {
          $('#txtVendorMobile1').keypress(function (e) {
            var a = [];
            var k = e.which;

            for (i = 48; i < 58; i++)
              a.push(i);

            if (!(a.indexOf(k) >= 0))
              e.preventDefault();
          });
        }
        function CnicNo() {
          $('#CNIC').keypress(function (e) {
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
                    <a class="active" href="SellerRegister.aspx">SELLER REGISTRATION</a>
                    <a href="FoodiesRegister.aspx">FOODIES REGISTRATION</a>
                </div>
                <div class="sr_container_wrapper col-sm-12">

                    <div class="sr_left col-md-12 col-sm-12">
                        <div class="wraplogin_form">
                            <form role="form" class="form-horizontal" id="formSaveVendor" action="#">
                                <div class="login_form_wrap" data-validate="Name is required">
                                    <input class="login_input" type="text" id="FirstName" placeholder="FIRST NAME" required="required">
                                    <span class="login_placeholder" data-placeholder="FIRST NAME"></span>
                                </div>
                                <div class="login_form_wrap" data-validate="Name is required">
                                    <input class="login_input" type="text" id="LastName" placeholder="LAST NAME" required="required">
                                    <span class="login_placeholder" data-placeholder="LAST NAME"></span>
                                </div>
                                <div class="login_form_wrap" data-validate="Email is required">
                                    <input class="login_input" type="email" id="txtVendorEmail" placeholder="EMAIL" required="required">
                                    <span class="login_placeholder" data-placeholder="EMAIL"></span>
                                </div>

                                <div class="login_form_wrap" data-validate="Mobile is required">
                                    <input class="login_input" type="text" id="txtVendorMobile1" onkeypress="phoneno()" maxlength="11" placeholder="MOBILE" required="required">
                                    <span class="login_placeholder" data-placeholder="MOBILE"></span>
                                </div>

                                <div class="login_form_wrap" data-validate="CNIC is required">
                                   <input class="login_input" type="text" id="CNIC"  onkeypress="CnicNo()" maxlength="13" placeholder="CNIC" required="required">
                                    <span class="login_placeholder" data-placeholder="CNIC"></span>
                                </div>

                                <div class="login_form_wrap" data-validate="Password is required">
                                    <input class="login_input" type="password" id="txtVendorPassword" placeholder="PASSWORD" required="required">
                                    <span class="login_placeholder" data-placeholder="PASSWORD"></span>
                                </div>
                                <div class="login_form_wrap" data-validate="Entity is required">
                                    <input class="login_input" id="txtVendorEntity" type="text" placeholder="Business Entity Name" required="required">
                                    <span class="login_placeholder" data-placeholder="Business Entity Name"></span>
                                </div>
                                <div class="login_form_wrap" data-validate="Address is required">
                                    <textarea class="login_placeholder login_input subject" id="address" placeholder="ADDRESS" required="required" style="height: 100px"></textarea>
                                </div>
                                <div class="login_form_wrap" data-validate="Password is required">
                                    <textarea class="login_placeholder login_input subject" id="subject" placeholder="BIOGRAPHY" required="required" style="height: 100px"></textarea>
                                </div>

                                <div class="seller_reg">
                                    <p class="seller_reg">SPECIALITY</p>


                                    <label>
                                        <input type="checkbox" name="type" value="1" id="chbFoods" class="specialitytypes first"><span>Foods</span></label>


                                    <label>
                                        <input type="checkbox" name="type" value="1" id="chbCakes" class="specialitytypes"><span>Cakes</span></label>

                                    <label>
                                        <input type="checkbox" name="type" value="1" id="chbDesserts" class="specialitytypes"><span>Desserts</span></label>

                                    <label>
                                        <input type="checkbox" name="type" value="1" id="chbFrozenFoods" class="specialitytypes"><span>Frozen Foods</span></label>


                                </div>

                                <p class="seller_reg pic">LOGO</p>
                                <div class="seller_reg_pic">
                                    <div class="circle-img col-md-offset-3">
                                        <img style="width:220px;height:220px;border-radius:50%;" id="vendorImage" src="Frontend/images/home_seller1.png">
                                    </div>
                                    <input class="img-show" type='file'  id="imgInp" onchange="readURL(this);" />
                                    <p id="imgaeB64" hidden></p>

                                </div>
                                    <p class="seller_reg pic">PHOTO</p>
                                <div class="seller_reg_pic">
                                    <div class="circle-img col-md-offset-3">
                                        <img style="width:220px;height:220px;border-radius:50%;" id="vendorPersonalImage" src="Frontend/images/avatar.png">
                                    </div>
                                    <input class="img-show" type='file' required="required" id="imgInpp" onchange="readdURL(this);" />
                                    <p id="imgaeeB64" hidden></p>

                                </div>
                                <div class="code_verify">
                                    <p class="seller_reg">ENTER CODE BELOW</p>
                                    <div class="verify_wrap">
                                        <canvas id="myCanvas"></canvas>

                                        <button type="button" class="btn upbutton midmar trycaptcha" id="btnFlavour" onclick="CreateVendorCaptcha();" style="margin-left: 10px; margin-top: -30px; width: 100px; height: 30px; font-size: 12px;" onclick="CreateNewFlavour();">
                                            Try Another
                                        </button>
                                    </div>
                                    <div class="captcha" style="display:inline-block;">
                                        <p style="font-size:14px;">*Captcha is case sensitive</p>
                                    </div>

                                    <div class="verify_wrap1">
                                        <textarea class="verify1" name="txtInput" id="txtInput" required="required" style="height: 60px; width: 200px;"></textarea>
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

    <img class="img_left bottom sr_btm m_animate msr" src="Frontend/images/bg_4.png">
    <div class="container">
        <div class="modal fade" id="myregistration" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" style="width: 400px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 id="showModel" class="modal-title" style="text-align: center; color: #780103; font-size: 16px;"></h4>
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
        function readdURL(input) {
          if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
              $('#vendorPersonalImage')
                  .attr('src', e.target.result)
                  .width(220)
                  .height(220);
              document.getElementById("imgaeeB64").innerHTML = e.target.result;
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
            document.getElementById("txtUserMobile2").value = "";
            document.getElementById("txtInput1").value = "";
            CreateUserCaptcha();

        }
        function clearVendor() {
            document.getElementById("FirstName").value = "";
            document.getElementById("LastName").value = "";
            document.getElementById("CNIC").value = "";
            document.getElementById("address").value = "";
            document.getElementById("txtVendorEmail").value = "";
            document.getElementById("txtVendorPassword").value = "";
            document.getElementById("txtVendorMobile1").value = "";
            document.getElementById("txtVendorMobile2").value = "";
            document.getElementById("txtInput").value = "";
            document.getElementById("subject").value = "";
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
            var name = document.getElementById("FirstName").value;
            var lastname = document.getElementById("LastName").value;
            var cnic = document.getElementById("CNIC").value;
            var address = document.getElementById("address").value;
            var email = document.getElementById("txtVendorEmail").value;
            var password = document.getElementById("txtVendorPassword").value;
            var entity = document.getElementById("txtVendorEntity").value;
            entity = entity.replace(/'/g, '');
            var mobile = document.getElementById("txtVendorMobile1").value;
            var description = document.getElementById('subject').value;
            var foods = document.getElementById('chbFoods').checked;
            var cakes = document.getElementById('chbCakes').checked;
            var frozenFoods = document.getElementById('chbFrozenFoods').checked;
            var desserts = document.getElementById('chbDesserts').checked;
            //alert(name);
            debugger;
            var VENDOR_CATEGORIES = {
                cats: []
            };
            var VID = 0;
            var newItem;
            if (cakes == true) {
                newItem = {
                    "CATEGORY_ID": 2,
                    "VENDOR_ID": VID,
                };
                VENDOR_CATEGORIES.cats.push(newItem);

            }
            if (foods == true) {
                newItem = {
                    "CATEGORY_ID": 3,
                    "VENDOR_ID": VID,
                };
                VENDOR_CATEGORIES.cats.push(newItem);

            }
            if (frozenFoods == true) {
                newItem = {
                    "CATEGORY_ID": 4,
                    "VENDOR_ID": VID,
                };
                VENDOR_CATEGORIES.cats.push(newItem);

            }
            if (desserts == true) {
                newItem = {
                    "CATEGORY_ID": 5,
                    "VENDOR_ID": VID,
                };
                VENDOR_CATEGORIES.cats.push(newItem);

            }


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
                "VENDOR_CATEGORIES": VENDOR_CATEGORIES.cats,
                "DESSERTS_SPECIALITY": desserts,
                "LAST_NAME": lastname,
                "CNIC": cnic,
                "PERSONAL_ADDRESS": address
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
                    200: function (data) {
                        var vendorId = JSON.parse(data);
                        UploadImage(vendorId);
                        UploadPersonalImage(vendorId);
                        location.href = "VendorDashboard.aspx";
                        clearVendor();

                        document.getElementById("success").innerHTML = "Vendor Saved Successfully.";
                        document.getElementById("success").style.color = 'green';
                        e.preventDefault();

                        //location.reload();
                    },
                    500: function (data) {
                        //alert(data);

                        //show modal here
                        $('#myregistration').modal('show');
                        document.getElementById("showModel").innerHTML = "Error occured. Vendor not added";
                        document.getElementById("showModel").style.color = '#780103';
                        e.preventDefault();
                    },
                    406: function () {
                        $('#myregistration').modal('show');
                        document.getElementById("showModel").innerHTML = "Email already taken. Please choose another.";
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
        function UploadPersonalImage(id) {
          var data = new FormData();
          var files = $("#imgInpp").get(0).files;
          if (files.length > 0) {
            data.append("UploadedImage", files[0]);
            var uniquekey = {
              id: id
            };
            data.append("id", id);

            // Make Ajax request with the contentType = false, and procesDate = false
            var ajaxRequest = $.ajax({
              type: "POST",
              url: "/api/Vendors/UploadPersonalImage",
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

                            document.getElementById("error").innerHTML = "Wrong email or password";
                            document.getElementById("error").style.color = 'red';
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

                            document.getElementById("error").innerHTML = "Wrong email or password";
                            document.getElementById("error").style.color = 'red';
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
                        document.getElementById("success").innerHTML = "User Saved Successfully.";
                        document.getElementById("success").style.color = 'green';
                        e.preventDefault();
                        //location.reload();
                    },
                    500: function () {
                        document.getElementById("error").innerHTML = "Error occured. User not added";
                        document.getElementById("error").style.color = 'red';
                        e.preventDefault();

                    },
                    406: function () {
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
</asp:Content>
