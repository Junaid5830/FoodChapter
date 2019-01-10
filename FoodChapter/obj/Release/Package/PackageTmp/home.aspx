<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="FoodChapter.WebPages.home" %>

<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <link rel="stylesheet" href="../Assets/css/bootstrap.css">
    <link rel="stylesheet" href="../Assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="../Assets/css/style.css">

    <link rel="stylesheet" href="../Assets/css/flora.css">
    <link rel="stylesheet" href="../Assets/css/responsive.css">
    <link rel="stylesheet" href="../Assets/css/theme-elements.css">
    <link rel="stylesheet" href="../Assets/css/color.css">
    <link rel="stylesheet" href="../Assets/css/vendor-profile.css" style="stylesheet">
    <link rel="stylesheet" href="../Assets/css/vendor.css">
    <link rel="stylesheet" href="../Assets/css/wbn-datepicker.css">
    <link rel="stylesheet" href="../Assests/css/font.css" />


    <link rel="stylesheet" href="../Assets/css/gallery.css">

    <link rel="stylesheet" href="../Assets/css/custom.css">

    <!--   <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" /> -->
    <!-- <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
    <!-- <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script> -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="libs/jquery/jquery.js"><\/script>')</script>
    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-5002e1366084f15f"></script>


    <script src="../Assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
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
                  Redirect: "http://localhost:3716/home.aspx"

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
        function searchByTag() {
            var tag = document.getElementById("tagSearch").value;
            $.ajax({
                url: '/api/Product/SearchProductByProductTag',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'productTag': tag },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;
                        //alert(json1.PRODUCTS.length);
                        $("#filter-masonry").empty();
                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            //alert(i);         
                            //var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                            //alert(url);
                            if (json1.PRODUCTS[i].CATAGORY_ID == 1) {
                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                                $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desi"><figure class="product-figure"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Place Order</a></div></div> </div></div></figure></div>');
                                $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                            }
                            else if (json1.PRODUCTS[i].CATAGORY_ID == 2) {
                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                                $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 frozen"><figure class="product-figure"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Place Order</a></div></div> </div></div></figure></div>');
                                $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                            }
                            else if (json1.PRODUCTS[i].CATAGORY_ID == 3) {
                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                                $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desserts"><figure class="product-figure"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Place Order</a></div></div> </div></div></figure></div>');
                                $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                            }

                        }
                        $.ajax({
                            url: '/api/Product/SearchCakesByCakeTag',
                            type: 'Get',
                            contentType: 'application/json',
                            dataType: 'json',
                            data: { 'cakeTag': tag },
                            statusCode: {
                                200: function (data) {
                                    var json1 = JSON.parse(data);
                                    debugger;
                                    //alert(json1.PRODUCTS.length);
                                    for (var i = 0; i < json1.CAKES.length; i++) {
                                        //alert(i);    
                                        var url = json1.CAKES[i].CAKE_PHOTO;
                                        $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 cakes"><figure class="product-figure"><img id="cakeImage' + json1.CAKES[i].CAKE_ID + '"src="../Assets/images/products/img-01.jpg" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.CAKES[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.CAKES[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewCakeDetail(' + json1.CAKES[i].CAKE_ID + ')" data-toggle="modal" data-target="#cakeModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')">Place Order</a></div></div> </div></div></figure></div>');
                                        $("#cakeImage" + json1.CAKES[i].CAKE_ID).attr("src", url);
                                    }
                                    showSearch();
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
            document.getElementById("tagSearch").value = "";
        }
        function showTopSellers() {
            $.ajax({
                //url: '/api/Vendors/GetAllVendors',
                url: '/api/Vendors/GetFeaturedSellers',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                statusCode: {
                    200: function (response) {
                        var json1 = JSON.parse(response);
                        $('#team-slider').empty();
                        for (var i = 0; i < json1.VENDORS.length; i++) {
                            //$('#detailFlavour').append('<a href="#">' + json1.CAKE_FLAVORS[i].DESCRIPTION + '</a>');
                            $("#team-slider").append('<figure class="team-figure team-figure2"><img src=' + json1.VENDORS[i].PROFILE_IMAGE + ' alt="img-01"><div class="overlay overlay2"><div class="theme-border myborder myborder2"><div class="tg-display-table hometable"><div class="tg-display-table-cell"><div class="team-detail homedetail"><a href="#"><h3>' + json1.VENDORS[i].BUSINESS_ENTITY_NAME + '</h3></a><a href="#"><p>' + json1.VENDORS[i].PERSONAL_ADDRESS + '</p></a><ul class="social-icons"><li><a href="#" class="fa fa-facebook"></a></li><li><a href="#" class="fa fa-twitter"></a></li><li><a href="#" class="fa fa-tumblr"></a></li><li><a href="#" class="fa fa-google"></a></li></ul><ul class="rating-star vendor"><li>Rated:</li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star-half-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li></ul></div></div></div></div></figure>');
                        }
                    },
                    500: function () {
                    }

                },
                jsonp: 'jsonp'

            });

        }

        function showFoods() {
            var x = document.getElementById("filter-masonry");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-cakes");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-foods");
            x.style.display = 'block';
            var x = document.getElementById("filter-masonry-desserts");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-frozen");
            x.style.display = 'none';


        }

        function showSearch() {
            var x = document.getElementById("filter-masonry");
            x.style.display = 'block';
            var x = document.getElementById("filter-masonry-cakes");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-foods");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-desserts");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-frozen");
            x.style.display = 'none';
        }

        function showAll() {
            var x = document.getElementById("filter-masonry");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-cakes");
            x.style.display = 'block';
            var x = document.getElementById("filter-masonry-foods");
            x.style.display = 'block';
            var x = document.getElementById("filter-masonry-desserts");
            x.style.display = 'block';
            var x = document.getElementById("filter-masonry-frozen");
            x.style.display = 'block';
        }

        function showCakes() {
            var x = document.getElementById("filter-masonry");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-cakes");
            x.style.display = 'block';
            var x = document.getElementById("filter-masonry-foods");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-desserts");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-frozen");
            x.style.display = 'none';
        }

        function showDesserts() {
            var x = document.getElementById("filter-masonry");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-cakes");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-foods");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-desserts");
            x.style.display = 'block';
            var x = document.getElementById("filter-masonry-frozen");
            x.style.display = 'none';


        }

        function showFrozen() {
            var x = document.getElementById("filter-masonry");
            x.style.display = 'none';
            //var x = document.getElementsByClassName("desi");
            var x = document.getElementById("filter-masonry-cakes");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-foods");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-desserts");
            x.style.display = 'none';
            var x = document.getElementById("filter-masonry-frozen");
            x.style.display = 'block';


        }

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
                        var c = document.getElementById("myCanvas");
                        var ctx = c.getContext("2d");
                        ctx.font = "30px 'Calibri'";
                        ctx.clearRect(0, 0, c.width, c.height);
                        //ctx.fontcolor = ""
                        var x = 20 + Math.floor(Math.random() * 60);
                        var y = 20 + Math.floor(Math.random() * 30);
                        ctx.strokeText(code, x, y);
                        ctx.moveTo(0, 0);
                        ctx.lineTo(240, 70);
                        ctx.stroke();
                        ctx.moveTo(0, 70);
                        ctx.lineTo(240, 0);
                        ctx.stroke();
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
                        ctx.font = "30px 'Calibri'";
                        ctx.clearRect(0, 0, c.width, c.height);
                        //ctx.fontcolor = ""
                        var x = 20 + Math.floor(Math.random() * 60);
                        var y = 20 + Math.floor(Math.random() * 30);
                        ctx.strokeText(code, x, y);
                        ctx.moveTo(0, 0);
                        ctx.lineTo(240, 70);
                        ctx.stroke();
                        ctx.moveTo(0, 70);
                        ctx.lineTo(240, 0);
                        ctx.stroke();
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });


        }
        //facebook start
        var OAUTHURL = 'https://accounts.facebook.com/o/oauth2/auth?';
        var VALIDURL = 'https://www.facebookapis.com/oauth2/v1/tokeninfo?access_token=';
        var SCOPE = 'https://www.facebookapis.com/auth/userinfo.profile https://www.facebookapis.com/auth/userinfo.email';
        var CLIENTID = 'e769612267b790286d7c19a58a0ed122.apps.facebookusercontent.com';
        var REDIRECT = 'http://localhost:3716/2_gallery.aspx';
        var LOGOUT = 'http://accounts.facebook.com/Logout';
        var TYPE = 'token';
        var _url = OAUTHURL + 'scope=' + SCOPE + '&client_id=' + CLIENTID + '&redirect_uri=' + REDIRECT + '&response_type=' + TYPE;
        var acToken;
        var tokenType;
        var expiresIn;
        var user;
        var loggedIn = false;
        function facebookLogin() {

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
        //google start
        var OAUTHURL = 'https://accounts.google.com/o/oauth2/auth?';
        var VALIDURL = 'https://www.googleapis.com/oauth2/v1/tokeninfo?access_token=';
        var SCOPE = 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email';
        var CLIENTID = '822909308879-vvumf7duli43tiae6jp7u3h45po5dpuu.apps.googleusercontent.com';
        var REDIRECT = 'http://localhost:3716/gallery.aspx';
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





        function addCakeToCart(cakeId) {
            $('#itemAdd').modal('show');

            $.ajax({
                url: '/api/Product/SearchCakeByCakeId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'cakeId': cakeId },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        subCatagoryId = 0;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;
                        var name = json1.CAKE[0].NAME;
                        //var description = document.getElementById('txtDesc').value;
                        var timeReq = json1.CAKE[0].ESTIMATED_TIME;
                        var vendorId = json1.CAKE[0].VENDOR_ID;
                        var price = json1.CAKE[0].PRICE;
                        var images = json1.CAKE[0].CAKE_PHOTO;
                        var product = {
                            "PRODUCT_ID": cakeId,
                            "IS_CAKE": 1,
                            "NAME": name,
                            "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,
                            "VENDOR_ID": vendorId,
                            "TIME_REQUIRED": timeReq,
                            //"SIZE": size,
                            "PRICE": price,
                            "QTY": 1,
                          "CAKE_PHOTO": images
                            //"DESCRIPTION": description
                        };
                        //
                        var count = localStorage.length;
                        count = count + 1;
                        if (IsProductAlreadyExist(product) == true) {
                            UpdateQuantity(product)
                        }
                        else {
                            localStorage.setObj(count, JSON.stringify(product));
                        }
                        SetCartCount();
                    },
                    500: function () {
                    }

                },
                jsonp: 'jsonp'

            });
        }

        function addToCart(productId) {
            $('#itemAdd').modal('show');
            $.ajax({
                url: '/api/Product/SearchProductByProductId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'productId': productId },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);

                        subCatagoryId = json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;
                        var name = json1.PRODUCT[0].NAME;
                        //var description = document.getElementById('txtDesc').value;
                        var timeReq = json1.PRODUCT[0].TIME_REQUIRED;
                        var vendorId = json1.PRODUCT[0].VENDOR_ID;
                        var price = json1.PRODUCT[0].PRICE;
                        var images = json1.PRODUCT[0].PRODUCT_PHOTO;
                        var product = {
                            "PRODUCT_ID": productId,
                            "IS_CAKE": 0,
                            "NAME": name,
                            "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,
                            "VENDOR_ID": vendorId,
                            "TIME_REQUIRED": timeReq,
                            //"SIZE": size,
                            "PRICE": price,
                            "QTY": 1,
                            "PRODUCT_PHOTO": images
                            //"DESCRIPTION": description
                        };
                        //

                        var count = localStorage.length;
                        count = count + 1;
                        debugger
                        if (IsProductAlreadyExist(product) == true) {
                            UpdateQuantity(product)
                        }
                        else {
                            localStorage.setObj(count, JSON.stringify(product));
                        }
                        SetCartCount();
                    },
                    500: function () {
                    }

                },
                jsonp: 'jsonp'

            });

        }

        function IsProductAlreadyExist(product) {
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                    //alert(sessionProduct.NAME);
                    if (sessionProduct.NAME == product.NAME) {
                        return true;
                    }
                }
            }
            return false;
        }


        function UpdateQuantity(product) {
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                    if (sessionProduct.NAME == product.NAME) {
                        sessionProduct.QTY = sessionProduct.QTY + 1;
                        localStorage.setObj(i, JSON.stringify(sessionProduct));
                        i = localStorage.length;
                    }
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

        function SetCartCount() {
            document.getElementById('cartCount').innerHTML = '<span class="glyphicon glyphicon-shopping-cart"></span>' + getCartCount();
        }

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

        function addDetailCakeCart() {
            addCakeToCart(detailCakeId);
        }

        function addDetailCart() {
            addToCart(detailProductId);
        }

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
        function ViewDetail(productId) {
            detailProductId = productId;
            $.ajax({
                url: '/api/Product/SearchProductByProductId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'productId': productId },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);

                        var imrUrl = json1.PRODUCT[0].PRODUCT_PHOTO;
                        document.getElementById("productDetailImage").src = "" + imrUrl;

                        document.getElementById("productName").innerHTML = json1.PRODUCT[0].NAME;
                        document.getElementById("productServes").innerHTML = json1.PRODUCT[0].SERVES;
                        document.getElementById("productPrice").innerHTML = "Rs." + json1.PRODUCT[0].PRICE;
                        document.getElementById("productDesc").innerHTML = json1.PRODUCT[0].DESCRIPTION;
                        document.getElementById("timeReq").innerHTML = json1.PRODUCT[0].TIME_REQUIRED;
                        document.getElementById("vendorId").innerHTML = json1.PRODUCT[0].VENDOR_ID;



                    },
                    500: function () {
                    }

                },
                jsonp: 'jsonp'

            });
        }

        function ViewCakeDetail(cakeId) {
            $.ajax({
                //url: '/api/Vendors/GetAllVendors',
                url: '/api/Product/GetAllCakeFlavors',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'cakeId': cakeId },
                //data: JSON.stringify(),
                statusCode: {
                    200: function (response) {
                        var json1 = JSON.parse(response);
                        $('#detailFlavour').empty();
                        for (var i = 0; i < json1.CAKE_FLAVORS.length; i++) {
                            $('#detailFlavour').append('<a href="#">' + json1.CAKE_FLAVORS[i].DESCRIPTION + '</a>');

                        }
                    },
                    500: function () {
                    }

                },
                jsonp: 'jsonp'

            });

            detailCakeId = cakeId;
            $.ajax({
                url: '/api/Product/SearchCakeByCakeId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'cakeId': cakeId },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        subCatagoryId = 0;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;
                        var name = json1.CAKE[0].NAME;
                        //var description = document.getElementById('txtDesc').value;
                        var timeReq = json1.CAKE[0].ESTIMATED_TIME;
                        var vendorId = json1.CAKE[0].VENDOR_ID;
                        var price = json1.CAKE[0].PRICE;

                        var imrUrl = json1.CAKE[0].CAKE_PHOTO;
                        document.getElementById("cakeDetailImage").src = "" + imrUrl;

                        document.getElementById("cakeName").innerHTML = json1.CAKE[0].NAME;
                        document.getElementById("cakeWeight").innerHTML = json1.CAKE[0].MIN_WEIGHT + "-" + json1.CAKE[0].MAX_WEIGHT + " Pounds";
                        //document.getElementById("cakeTiers").innerHTML=json1.CAKE[0].MIN_TIERS +"-"+  json1.CAKE[0].MAX_TIERS;           
                        document.getElementById("cakePrice").innerHTML = "Rs." + json1.CAKE[0].PRICE;
                        document.getElementById("cakeDesc").innerHTML = json1.CAKE[0].DESCRIPTION;
                        document.getElementById("cakeVendorId").innerHTML = json1.CAKE[0].VENDOR_ID;

                        //document.getElementById("timeReq").innerHTML=json1.PRODUCT[0].TIME_REQUIRED;   



                    },
                    500: function () {
                    }

                },
                jsonp: 'jsonp'

            });
        }

        function removeSpaces(string) {
            return string.split(' ').join('');
        }

        $(document).ready(function () {
            showTopSellers();
            showAll();
            document.getElementById('fbSignIN').style.display = 'none';
            CreateVendorCaptcha();
            CreateUserCaptcha();
            // Validate the Entered input aganist the generated security code function

            SetCartCount();
            $(document).ajaxStop(function () {
                //alert(showindex)
                //if (showindex == 0)
                //    settimeout(showall, 2000)
            });
            // Remove the spaces from the entered and generated code

            var cartStatus = '<%= int.Parse(FoodChapter.SessionManager.GetCartSession()) %>';
            //alert(cartStatus)
            if (cartStatus == 0) {
                localStorage.clear();
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
            }

            $.ajax({
                url: '/api/Product/TopSixProducts',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;
                        //alert(json1.PRODUCTS.length);
                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            //alert(i);         
                            //var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                            //alert(url);
                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                            $("#filter-masonry-foods").append('<div class="masonry-grid-foods col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure redfig"><div class="beforeimg"><img id="foodsImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
                            //$("#filter-masonry-foods").append('<div class="masonry-grid-foods col-lg-4 col-sm-4 col-xs-6"><figure class="product-figure"><img id="foodsImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                            $("#foodsImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                        }
                        showAll();
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });

            $.ajax({
                url: '/api/Product/TopSixCakes',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;
                        //alert(json1.PRODUCTS.length);
                        for (var i = 0; i < json1.CAKES.length; i++) {
                            //alert(i);    
                            var url = json1.CAKES[i].CAKE_PHOTO;
                            $("#filter-masonry-cakes").append('<div class="masonry-grid-cakes col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure redfig"><div class="beforeimg"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src="../Assets/images/products/img-01.jpg" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.CAKES[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.CAKES[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewCakeDetail(' + json1.CAKES[i].CAKE_ID + ')" data-toggle="modal" data-target="#cakeModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
                            //$("#filter-masonry-cakes").append('<div class="masonry-grid-cakes col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src="../Assets/images/products/img-01.jpg" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.CAKES[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.CAKES[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewCakeDetail(' + json1.CAKES[i].CAKE_ID + ')" data-toggle="modal" data-target="#cakeModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                            $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);
                        }
                        showAll();
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });

            $.ajax({
                url: '/api/Product/TopSixFrozenFoods',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;
                        //alert(json1.PRODUCTS.length);
                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            //alert(i);         
                            //var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                            //alert(url);
                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                            $("#filter-masonry-frozen").append('<div class="masonry-grid-frozen col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure redfig"><div class="beforeimg"><img id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
                            //$("#filter-masonry-frozen").append('<div class="masonry-grid-frozen col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure"><img id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                            $("#frozenImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                        }
                        showAll();
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });

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

            $.ajax({
                url: '/api/Product/TopSixFrozenDesserts',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                            $("#filter-masonry-desserts").append('<div class="masonry-grid-desserts col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure redfig"><div class="beforeimg"><img id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
                            //$("#filter-masonry-desserts").append('<div class="masonry-grid-desserts col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure"><img id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                            $("#dessertImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                        }
                        showAll();
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });

            $('#formSaveVendor').submit(function () {
                $('#imgload2').show();
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
                                            //alert('Wrong email or password');
                                            document.getElementById("success").innerHTML = "";
                                            document.getElementById("error").innerHTML = "Business Enity or Mobile Number is already exist";
                                            document.getElementById("error").style.color = 'red';
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
                var phone = document.getElementById("txtVendorMobile1").value + document.getElementById("txtVendorMobile2").value;
                var user = {
                    "BUSINESS_ENTITY_NAME": businessEntity,
                    "PERSONAL_PHONE": phone
                };
                $('#imgload2').hide();
                return false;
            });

            $('#formSaveUser').submit(function () {
                $('#imgload3').show();
                $.ajax({
                    url: '/api/User/GetCaptchUserSession',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    statusCode: {
                        200: function (data) {
                            var str1 = data;

                            //var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
                            var str2 = removeSpaces(document.getElementById('txtInput1').value);
                            if (str1 != str2.toLowerCase()) {
                                var why = "- Security code did not match.\n";
                                alert(why);
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
                $('#imgload3').hide();
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

    </script>

</head>
<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
<body id="home">
    
    <!-- Preloader -->
    <%--<div id="preloader">
        <div id="status">
            <img src="../Assets/images/load1.gif" alt="preloader">
        </div>
    </div>--%>
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
                            <input type="text" class="form-control top-search-feild" placeholder="Search" id="tagSearch">
                            <i class="fa fa-search top-search-icon" aria-hidden="true" onclick="searchByTag()"></i>
                        </div>
                    </li>
                    <li class="dropdown"><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>

                    <%-- <li class="dropdown">
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
            </div>
            <!-- /.navbar-collapse -->
            <!-- top header -->
            <!-- Header inner -->
            <header class="header-inner">
                <div class="container myContainer">
                    <div class="row">
                        <div class="col-md-4 mytag">
                            <strong class="inner-logo"><a href="home.aspx">
                                <img src="../Assets/images/logo.png" alt="logo"></a></strong>
                            <p>The Best Chapter In Your Life</p>
                        </div>
                        <!-- col ends here -->
                        <nav class="nav-inner">
                            <div class="navbar-header">
                                <a class="side-bar-btn pull-right fa fa-bars" href="#" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"></a>
                                <a class="responsive-logo pull-left" href="home.aspx">
                                    <img src="../Assets/images/logo.png" alt="logo"></a>

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
                                    <li><a href="Cart.aspx" id="cartCount"><span class="glyphicon glyphicon-shopping-cart"></span>   </a></li>
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
<%--        <div class="banner-v2">
            <div class="banner-inner-v2">
                <div id="sleekslider" class="sleekslider">

                    <!-- Slides -->
                    <div class="slide active bg-1 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2 class="slider-text">Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Slides -->

                    <!-- Slides -->
                    <div class="slide bg-2 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Slides -->
                            <div class="slide bg-3 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-4 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-5 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-6 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-7 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-8 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-9 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-10 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-11 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-12 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-13 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-14 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- Slides -->
                     <!-- Slides -->
                     <div class="slide bg-15 mainBg">
                        <div class="tg-display-table dueTable">
                            <div class="mycells">
                                <div class="slide-content-v2 text-center bottomshow">
                                    <h2>Home Made <br /> QualityFood</h2>
                                </div>
                            </div>
                        </div>
                    </div>






                    <!-- Slides -->
               
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
        </div>--%>
        <!-- Banner Slider -->

        </header>
            <!-- Header -->

        <!-- Main Content -->
        <main id="main-contant">

                <!-- Online Food Shop v2 -->
			
                <div class="home-gallery-background">
				  <div class="section-padding Bottomp">
                    <div class="container">

                        <!-- Main Heading -->
                        <div class="main-heading">
                            <h3><span style="color:#000">Discover The Taste Of</span> <strong>Home Made Foods</strong></h3>
                        </div>
                        <!-- Main Heading -->

                        <!-- Filter Tags List -->
                        <div class="filter-tags-holder">
                            <ul id="tg-filterbale-nav" class="option-set tg-filterbale-nav">
                                <li><a class="selected" data-filter="*" href="javascript:void(0)" onclick="showAll();">All</a></li>
                                <li><a data-filter=".desi" href="javascript:void(0)" onclick="showFoods();">Foods</a></li>
                                <li><a data-filter=".cakes" href="javascript:void(0)" onclick="showCakes();">Cakes</a></li>
                                <li><a data-filter=".desserts" href="javascript:void(0)" onclick="showDesserts();">Desserts</a></li>
                                <li><a data-filter=".frozen" href="javascript:void(0)" onclick="showFrozen();">Frozen Foods</a></li>
                                <!--li><a data-filter=".biscuits" href="#">Biscuits</a></li>
                                <li><a data-filter=".fast-food" href="#">Fast Food</a></li>
                                <li><a data-filter=".jusis" href="#">Juices</a></li-->
                            </ul>
                        </div>
                        <!-- Filter Tags List -->

                        <!-- Menu Grid List -->
                        <div class=" row">
                            <div id="filter-masonry" class="products-grid-list">
                                <!-- Product Figure -->
                                <%--<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desi">
                                    <figure class="product-figure">
                                        <img src="../Assets/images/products/img-01.jpg" alt="img-01">
                                        <div class="overlay">
                                            <div class="tg-display-table theme-border">
                                                <div class="tg-display-table-cell">
                                                    <div class="product-detail">
                                                        <h3>Volestias Swanti</h3>
                                                        <span><span>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
                                                        <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal1">View Detail</a>
														<a class="sm-btn1" href="placeorder.php">Place Order</a>
												    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </div>--%>
                                <!-- Product Figure -->

                                <!-- Product Figure -->
                                <%--<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 cakes">
                                    <figure class="product-figure">
                                        <img src="../Assets/images/products/img-02.jpg" alt="img-02">
                                        <div class="overlay">
                                            <div class="tg-display-table theme-border">
                                                <div class="tg-display-table-cell">
                                                    <div class="product-detail">
                                                        <h3>Volestias Swanti</h3>
                                                        <span><span>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
                                                        <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal1">View Detail</a>
														<a class="sm-btn1" href="placeorder.php">Place Order</a>
												    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </div>
                                <!-- Product Figure -->

                                <!-- Product Figure -->
                                <div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desi">
                                    <figure class="product-figure">
                                        <img src="../Assets/images/products/img-03.jpg" alt="img-03">
                                        <div class="overlay">
                                            <div class="tg-display-table theme-border">
                                                <div class="tg-display-table-cell">
                                                    <div class="product-detail">
                                                        <h3>Volestias Swanti</h3>
                                                        <span><span>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
                                                        <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal1">View Detail</a>
														<a class="sm-btn1" href="placeorder.php">Place Order</a>
												    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </div>
                                <!-- Product Figure -->

                                <!-- Product Figure -->
                                <div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 cakes">
                                    <figure class="product-figure">
                                        <img src="../Assets/images/products/img-04.jpg" alt="img-04">
                                        <div class="overlay">
                                            <div class="tg-display-table theme-border">
                                                <div class="tg-display-table-cell">
                                                    <div class="product-detail">
                                                        <h3>Volestias Swanti</h3>
                                                        <span><span>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
                                                        <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal1">View Detail</a>
														<a class="sm-btn1" href="placeorder.php">Place Order</a>
												    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </div>
                                <!-- Product Figure -->

                                <!-- Product Figure -->
                                <div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desi">
                                    <figure class="product-figure">
                                        <img src="../Assets/images/products/img-05.jpg" alt="img-05">
                                        <div class="overlay">
                                            <div class="tg-display-table theme-border">
                                                <div class="tg-display-table-cell">
                                                    <div class="product-detail">
                                                        <h3>Volestias Swanti</h3>
                                                        <span><span>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
                                                        <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal1">View Detail</a>
														<a class="sm-btn1" href="placeorder.php">Place Order</a>
												    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </div>--%>
                                <!-- Product Figure -->

                                <!-- Product Figure -->
                                <%--<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desi">
                                    <figure class="product-figure">
                                        <img src="../Assets/images/products/img-06.jpg" alt="img-06">
                                        <div class="overlay">
                                            <div class="tg-display-table theme-border">
                                                <div class="tg-display-table-cell">
                                                    <div class="product-detail">
                                                        <h3>Volestias Swanti</h3>
                                                        <span><span>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
                                                        <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal1">View Detail</a>
														<a class="sm-btn1" href="placeorder.php">Place Order</a>
												    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </div>--%>
                                <!-- Product Figure -->
                            </div>
                            <div id="filter-masonry-foods" class="products-grid-list-foods">
                            </div>
                            <div id="filter-masonry-cakes" class="products-grid-list-cakes">
                            </div>
                            <div id="filter-masonry-desserts" class="products-grid-list-desserts">
                            </div>
                            <div id="filter-masonry-frozen" class="products-grid-list-frozen">
                            </div>
                        </div>
                        <!-- Menu Grid List -->
					</div>
					</div>
                    </div>
					
                <!-- Online Food Shop v2 -->
                <!-- Team Section -->
                
                         <!-- Team Section -->
                <section class="section-padding team-section">
                    <div class="container">

                        <div class="main-heading">
                            <h3><span>Meet Our Proffesionals</span><strong>Our Top Sellers</strong></h3>
                        </div>

                        <!-- Team Figures -->
                        <div id="team-slider" class="team-slider">
                            
                        </div>
                        <!-- Team Figures -->

                    </div>
                </section>
                <!-- Team Section -->
                 <!-- Testimonial 
                <section class="testimonial-holder rm-bg">
				<div class="section-padding gallery-mask">
                    <div class="container">

                        <!-- Main Heading 
                        <div class="main-heading">
                            <h3><span style="color:#fff;">Our Customers</span><strong>Our Testimonials<strong></h3>
                        </div>
                        <!-- Main Heading 

                        <!-- Testimonial Slider 
                        <div id="testimonial-slider" class="testimonial-slider">
                            <!-- Slide 
                            <div class="testimonial-silde">
                                <div class="user-detqail-holder">
                                    <img class="client-img" src="../Assets/images/client-img.jpg" alt="client-img">
                                    <div class="user-detail">
                                        <h3><a href="#">Ali</a></h3>
                                        <ul class="rating-star">
                                            <li>Rated: </li>
                                            <li><a href="#" class="fa fa-star"></a></li>
                                            <li><a href="#" class="fa fa-star"></a></li>
                                            <li><a href="#" class="fa fa-star-half-o"></a></li>
                                            <li><a href="#" class="fa fa-star-o"></a></li>
                                            <li><a href="#" class="fa fa-star-o"></a></li>
                                        </ul>
                                    </div>
                                </div>
								 <blockquote>“I love foodchapter foods. Main Market Lahore They Are Provided Quality Food and its Good for Health”</blockquote>
                                <img class="testimonial-img" src="../Assets/images/testimonial-img1.jpg" alt="testimonial-img">
                            </div>
                            <!-- Slide -->

                            <!-- Slide 
                            <div class="testimonial-silde">
                                <div class="user-detqail-holder">
                                    <img class="client-img" src="../Assets/images/client-img1.jpg" alt="client-img">
                                    <div class="user-detail">
                                        <h3><a href="#">Asad</a></h3>
                                        <ul class="rating-star">
                                            <li>Rated: </li>
                                            <li><a href="#" class="fa fa-star"></a></li>
                                            <li><a href="#" class="fa fa-star"></a></li>
                                            <li><a href="#" class="fa fa-star-half-o"></a></li>
                                            <li><a href="#" class="fa fa-star-o"></a></li>
                                            <li><a href="#" class="fa fa-star-o"></a></li>
                                        </ul>
                                    </div>
                                </div>
								 <blockquote>“I love foodchapter foods. Main Market Lahore They Are Provided Quality Food and its Good for Health”</blockquote>
                                <img class="testimonial-img" src="../Assets/images/testimonial-img2.jpg" alt="testimonial-img">
                            </div>
                            <!-- Slide -->

                            <!-- Slide 
                            <div class="testimonial-silde">
                                <div class="user-detqail-holder">
                                    <img class="client-img" src="../Assets/images/client-img2.jpg" alt="client-img">
                                    <div class="user-detail">
                                        <h3><a href="#">Imran</a></h3>
                                        <ul class="rating-star">
                                            <li>Rated: </li>
                                            <li><a href="#" class="fa fa-star"></a></li>
                                            <li><a href="#" class="fa fa-star"></a></li>
                                            <li><a href="#" class="fa fa-star-half-o"></a></li>
                                            <li><a href="#" class="fa fa-star-o"></a></li>
                                            <li><a href="#" class="fa fa-star-o"></a></li>
                                        </ul>
                                    </div>
                                </div>
								 <blockquote>“I love foodchapter foods. Main Market Lahore They Are Provided Quality Food and its Good for Health”</blockquote>
                                <img class="testimonial-img" src="../Assets/images/testimonial-img3.jpg" alt="testimonial-img">
                            </div>
                            <!-- Slide 
                        </div>
                        <!-- Testimonial Slider 
                    </div>
					</div>
                </section>
                <!-- Testimonial -->
            </main>
        <!-- Main Content -->
        <!-- Bootstrap Modal -->
        <!-- Large modal -->
        <!--div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
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
        <!--ul class="nav nav-tabs">
                            <li class="active modalRL"><a href="#Login" data-toggle="tab">Login</a></li>
                            <li class="modalRL"><a href="#Registration" data-toggle="tab">Registration</a></li>
                        </ul>
                        <!-- Tab panes -->
        <!--div class="tab-content">
                            <div class="tab-pane active" id="Login">
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
                            <div class="tab-pane" id="Registration">
                                <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <select class="form-control">
                                                    <option>Mr.</option>
                                                    <option>Ms.</option>
                                                    <option>Mrs.</option>
                                                </select>
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" placeholder="Name" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email" placeholder="Email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="mobile" class="col-sm-2 control-label">
                                        Mobile</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="mobile" placeholder="Mobile" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="password" placeholder="Password" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10 modalRL">
                                        <button type="button" class="btn btn-primary btn-sm">
                                            Save & Continue</button>
                                        <button type="button" class="btn btn-default btn-sm">
                                            Cancel</button>
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
</div-->
        <!-- Large Signin Signup modal -->
        <div class="container">
						  <!-- Modal -->
						  <div class="modal fade" id="productModal" role="dialog">
							<div class="modal-dialog">
							
							  <!-- Modal content-->
							  <div class="modal-content">
								<div class="modal-body">
									<div class="product-modal-row">
										<div class="product-modal-img">
											<img id="productDetailImage" src="../Assets/images/products/img-01.jpg" alt="img-01"/>
										</div>
										<div class="product-modal-detail">
												<strong><span id="productName"></span></strong>
												<div class="Mpadding">
													<a href="javascript:void(0);" onclick="ViewVendorPrfile()" class="profile-btn">Vendor Profile</a>
												</div>
												<div class="Mpadding"><span class="align-left">Serves: </span><span class="align-left" id="productServes"></span></div>
												<div>
												<div class="Mpadding"><span class="align-left">Time Required: </span><span class="align-left" id="timeReq"></span></div>												    
												</div>
												
                                                <label id="vendorId" hidden="hidden"></label>
												<span class="modal-order-btn">
													<span class=""id="productPrice"></span>
													<a href="javascript:void(0);" onclick="addDetailCart()" class="sm-btn22">Order</a>
												</span>
                                            
												<div style="margin-top:20px;">
													<span id="">Description: </span><span id="productDesc"></span>
												</div>
										</div>
									</div>
								</div>
							  </div>
							  
							  <!-- Modal content-->
							</div>
						  </div>
		<div class="modal fade" id="cakeModal" role="dialog">
							<div class="modal-dialog">
							
							  <!-- Modal content-->
							  <div class="modal-content">
								<div class="modal-body">
									<div class="product-modal-row">
										<div class="product-modal-img">
											<img id="cakeDetailImage" src="../Assets/images/products/img-01.jpg" alt="img-01"/>
										</div>
										<div class="product-modal-detail">
												<span id="cakeName">Fresh Cream</span>
												<div>
													<a href="javascript:void(0);" onclick="ViewCakeVendorPrfile()" class="profile-btn">Vendor Profile</a>
												</div>
												<div><span class="align-left">Weight: </span><span class="align-left" id="cakeWeight"></span></div>
												<div>
												<div class="dropdown">
                                                  <button class="dropbtn">Flavour</button>
                                                        <div class="dropdown-content" id="detailFlavour">
                                                         <%--<a href="#">staberry</a>
                                                         <a href="#">vanilla</a>
                                                        <a href="#">chocalte</a>--%>
                                                        </div>
                                                </div>
												</div>
												
                                                <label id="cakeVendorId" hidden="hidden"></label>                                                
												<span class="modal-order-btn">
													<span class=""id="cakePrice"></span>
													<a href="javascript:void(0);" onclick="addDetailCakeCart()" class="sm-btn22">Order</a>
												</span>
												<div>
													<span id="">Description: </span><span id="cakeDesc"></span>
												</div>
										</div>
									</div>
								</div>
							  </div>
							  
							  <!-- Modal content-->
							</div>
						  </div>				  
		</div>

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
                                                    <%--<a style="color: #ff8c93 !important;" class="forget pull-right" href="javascript:;">Forgot your password?</a>--%>
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
                                            <button type="button" class="btn upbutton midmar" id="btnPhoneSignIn" onclick="fbSignIn();" style="margin-left: -10px; margin-top: 30px; width: 250px; height: 30px; font-size: 12px;" >
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
         <!-- Success Item add Modal -->
        <div class="modal fade" id="itemAdd" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" style="text-align: center;">Item Added to Cart
                        
                        </h4>
                    </div>
                    <div class="modal-body  modal-body2">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-8 col-md-offset-2">
                                    <h3 style="color: green; text-align: center">Thank You</h3>
                                    <h5 style="color: green; text-align: center">Go to cart to place order.</h5>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Success Item add Modal Modal -->
        <!-- Large Signin Signup Modal -->

        <!-- Success Message Modal -->
        <div class="modal fade" id="vSuccess" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" style="text-align: center;">Redirecting...
                        
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-8 col-md-offset-2">
                                    <h3 style="color: green; text-align: center">Thank You</h3>
                                    <h5 style="color: green; text-align: center">You are successfully registered. Be Patient while redirecting..</h5>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Success Message Modal Modal -->

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
                                    <img src="../Assets/images/products/img-01.jpg" alt="img-01">
                                </div>
                                <div class="product-modal-detail">
                                    <h5>Fresh Cream</h5>
                                    <span>Rs.25</span>
                                    <div>
                                        <h5><a href="#">Vendor Profile</a><h5>
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
                                    <span class="modal-order-btn"><a href="#" class="sm-btn11">Order</a></span>
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
        <!-- Footer -->
        <footer id="footer">
            <div class="container">

                <!-- Footer Columns -->
                <div class="footer">
                    <img src="../Assets/images/logo.png" width="200px" height="" alt="Food Chapter log" style="margin-bottom: 13px;"><a class="business-info" href="tel://+923453177413">
                        <p>Lhr: +92 345 3177413</p>
                    </a><a class="business-info" href="tel://+923453177413">
                        <p>Pk: +92 345 3177413</p>
                    </a><a class="business-info" href="mailto:irfan@xevensolutions.com">
                        <p>info@foodchapter.pk</p>
                    </a>
                    <div class="social-links"><a class="icon-instagram" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="instagram logo">
                        <img src="../Assets/images/img/logo-instagram.png" alt="Instagram logo"></a><a class="icon-twitter" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="twitter logo"><img src="../Assets/images/img/logo-twitter.png" alt="Twitter logo"></a><a class="icon-facebook" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="facebook logo"><img src="../Assets/images/img/logo-facebook.png" alt="Facebook logo"></a><a class="icon-pinterest" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="pinterest logo"><img src="../Assets/images/img/logo-pinterest.png" alt="Pinterest logo"></a></div>
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
                    <div class="card-icons">
                        <img src="../Assets/images/img/cards.png" alt="Accepted payment methods" width="200px"></div>
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
    <%--<script>
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
    </script>--%>

    <script>

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
            document.getElementById("txtUserMobile1").value = "";
            document.getElementById("txtUserMobile2").value = "";
            document.getElementById("txtInput1").value = "";
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
            var mobile = document.getElementById("txtVendorMobile1").value + document.getElementById("txtVendorMobile2").value;
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
                        document.getElementById("success").innerHTML = "Vendor Saved Successfully.";
                        document.getElementById("success").style.color = 'green';
                        e.preventDefault();

                        //location.reload();
                    },
                    500: function () {
                        document.getElementById("success").innerHTML = "";
                        document.getElementById("error").innerHTML = "Error occured. Vendor not added";
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
                            document.getElementById("success").innerHTML = "";
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
</body>
</html>
