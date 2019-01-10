<%@ Page Title="Vendor Profile" Language="C#" AutoEventWireup="true" CodeBehind="Vendor-Profile.aspx.cs" Inherits="FoodChapter.WebPages.Vendor_Profile" %>

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
       <link rel="stylesheet" href="../Assets/css/ratings/rating.min.css" />
        <link rel="stylesheet" href="../Assets/css/ratings/rotate.css" />
    <link rel="stylesheet" href="../Assets/css/wbn-datepicker.css">

     <title>Vendors Profile</title>
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
        <script>window.jQuery || document.write('<script src="libs/jquery/jquery.js"><\/script>')</script>
    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-5002e1366084f15f"></script>
    <script src="../Scripts/rating.min.js"></script>
    <script src="../Scripts/rating.js"></script>
     <script src="..../Assets/js/ratings/rating.min.js"></script>
     <script src="..../Assets/js/ratings/rating.js"></script>

    <script src="../Assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
    
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '1590429834334644',
                xfbml: true,
                version: 'v2.10'
            });
            FB.AppEvents.logPageView();
            acc('1');
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

        function ShowRating()
        {
            var el = document.querySelector('#el');
            var currentRating = 0;
            var maxRating = 5;
            var callback = function (rating) { alert(rating); };
            var myRating = rating(el, currentRating, maxRating, callback);
            myRating.setRating(5);
        }
    </script>
    <script>
        var cakeShowCount = 0, foodShowCount = 0, frozenShowCount = 0, dessertsShowCount = 0, userRating = 5, userId = 0;
        function showStars(id) {
            
            var el = document.querySelector('#' + id);
            var currentRating = 0;
            var maxRating = 5;
            //var callback = function (rating) { alert(rating); };
            var callback = function (rating) { userRating = rating };
            var myRating = rating(el, currentRating, maxRating, callback);
            myRating.setRating(5);
        }

        function ShowReview()
        {
            document.getElementById('addReview').style.display = 'block';
        }

        function ShowVendorRating()
        {
            $.ajax({
                url: '/api/Vendors/GetVendorRating',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId },
                statusCode: {
                    200: function (data) {
                        var json2 = JSON.parse(data);
                        var ratingValue = 0;
                        if(json2.RATING[0] != null)
                            ratingValue = json2.RATING[0].RATING;
                        if (ratingValue == null || ratingValue == 0)
                            showStarsWithRating('el3', 5);
                        else
                            showStarsWithRating('el3', ratingValue);
                    },
                    500: function () {
                    }
                },
            });
        }

        function ShowVendorReviews() {
            $.ajax({
                url: '/api/Vendors/GetVendorsReview',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId },
                statusCode: {
                    200: function (data) {
                        var json2 = JSON.parse(data);
                        var ratingValue = 0;
                        if(json2.RATING[0] != null)
                            ratingValue = json2.RATING[0].RATING;
                        for (var i = 0; i < json2.RATING.length; i++) {
                            var ratingValue = json2.RATING[i].RATING;
                            
                            var review = '<label style="font-size:20px;">' + json2.RATING[i].NAME + '</label><div class="row"><p class="col-md-10" >' + json2.RATING[i].REVIEW + '</p><div id="el' + i + json2.RATING[i].USER_ID + '" class="col-md-2" style="width:55px;margin-left:100px;color:black;pointer-events:none;"></div></div><hr/>';

                            $("#showReview").append(review);
                            showStarsWithRating('el'+i+json2.RATING[i].USER_ID, ratingValue);

                        }
                    },
                    500: function () {
                    }
                },
            });
        }

        function SaveReview()
        {

            var review = document.getElementById('textReview').value;
            //userId = 8;
            if (userId == 0) {
              //  document.getElementById('reviewError').innerHTML = 'Please Login First to submit your review.';
                //document.getElementById('reviewError').style.color = 'red';
            }
            else {
                $.ajax({
                    url: '/api/Vendors/CheckUserOrder',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'userId': userId },
                    statusCode: {
                        200: function (data)
                        {
                            var json2 = JSON.parse(data);
                            if (json2.RATING[0].ORDER_COUNT != 0) {
                                var vendorReview = {
                                    "VENDOR_ID": vendorId,
                                    "USER_ID": userId,
                                    "RATING": userRating,
                                    "REVIEW": review
                                };
                                $.ajax({
                                    url: '/api/Vendors/SaveVendorReview',
                                    type: 'POST',
                                    contentType: 'application/json',
                                    dataType: 'json',
                                    data: JSON.stringify(vendorReview),
                                    statusCode: {
                                        200: function (result) {
                                            document.getElementById('textReview').value = "";
                                            showStarsWithRating('el2', 5);
                                            document.getElementById('reviewError').innerHTML = 'Your review is saved succesfully. Thank you For your review';
                                            document.getElementById('reviewError').style.color = 'green';
                                        },
                                        401: function (data) {
                                            document.getElementById('reviewError').innerHTML = 'Unable to save your review.';
                                            document.getElementById('reviewError').style.color = 'red';
                                        }
                                    }
                                });
                            }
                            else {
                                document.getElementById('reviewError').innerHTML = 'To submit a review. You must have placed an order to this Food Seller';
                                document.getElementById('reviewError').style.color = 'red';
                            }
                        },
                        500: function () {
                        }
                    },
                });
            }
        }

        function showStarsWithRating(id, ratingValue) {

            document.getElementById(id).innerHTML = "";
            var el = document.querySelector('#' + id);
            var currentRating = ratingValue;
            var maxRating = 5;
            //var callback = function (rating) { alert(rating); };
            var callback = function (rating) { };
            var myRating = rating(el, currentRating, maxRating, callback);
            //myRating.setRating(5);
        }

        function showFoods() {
            var x = document.getElementsByClassName("desi");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'block';
            }
            x = document.getElementsByClassName("cakes");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }
            x = document.getElementsByClassName("desserts");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }
            x = document.getElementsByClassName("frozen");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }

        }

        function showAll() {
            var x = document.getElementsByClassName("desi");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'block';
            }
            x = document.getElementsByClassName("cakes");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'block';
            }
            x = document.getElementsByClassName("desserts");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'block';
            }
            x = document.getElementsByClassName("frozen");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'block';
            }
        }

        function showCakes() {
            var x = document.getElementsByClassName("desi");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }
            x = document.getElementsByClassName("cakes");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'block';
            }
            x = document.getElementsByClassName("desserts");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }
            x = document.getElementsByClassName("frozen");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }
        }

        function showDesserts() {
            var x = document.getElementsByClassName("desi");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }
            x = document.getElementsByClassName("cakes");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }
            x = document.getElementsByClassName("desserts");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'block';
            }
            x = document.getElementsByClassName("frozen");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }
        }

        function showFrozen() {
            var x = document.getElementsByClassName("desi");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }
            x = document.getElementsByClassName("cakes");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }
            x = document.getElementsByClassName("desserts");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'none';
            }
            x = document.getElementsByClassName("frozen");
            for (var i = 0; i < x.length; i++) {
                x[i].style.display = 'block';
            }
        }


        vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetViewVendorSession()) %>';
        vendorId = 9;
        userId = '<%= int.Parse(FoodChapter.SessionManager.GetUserSession())%>';
        
        if (vendorId == "0") {
            //alert('jkl');
            window.location = "home.aspx";
        }
        ShowVendorRating();
        ShowVendorReviews();
        var detailCakeId = 0, detailProductId = 0;
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
                        debugger;
                        var subCatagoryId = 0;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;

                        var name = json1.CAKE[0].NAME;
                        //var description = document.getElementById('txtDesc').value;
                        var timeReq = json1.CAKE[0].ESTIMATED_TIME;
                        var vendorId = json1.CAKE[0].VENDOR_ID;
                        var price = json1.CAKE[0].PRICE;

                        var product = {
                            "PRODUCT_ID": cakeId,
                            "IS_CAKE": 1,
                            "NAME": name,
                            "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,
                            "VENDOR_ID": vendorId,
                            "TIME_REQUIRED": timeReq,
                            //"SIZE": size,
                            "PRICE": price,
                            "QTY": 1
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
                        var product = {
                            "PRODUCT_ID": productId,
                            "IS_CAKE": 0,
                            "NAME": name,
                            "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,
                            "VENDOR_ID": vendorId,
                            "TIME_REQUIRED": timeReq,
                            //"SIZE": size,
                            "PRICE": price,
                            "QTY": 1
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

        function LoadDetails() {
            $("#foodOrder").empty();
            $("#frozenOrder").empty();
            var maxTime = 0;
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                    var orderProduct = '<div class="cart_empty_container">' +
                                            '<span class="default-delivery-label" style="color:#F6A0A5;">' + sessionProduct.NAME + '</span>'
                                      + '</div>';
                    if (sessionProduct.TIME_REQUIRED > maxTime)
                        maxTime = sessionProduct.TIME_REQUIRED;
                    $("#foodOrder").append(orderProduct);
                    $("#frozenOrder").append(orderProduct);
                }
            }
            document.getElementById("foodTime").innerHTML = maxTime;
            document.getElementById("frozenTime").innerHTML = maxTime;
        }

        function IsProductAlreadyExist(product) {
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                //alert(sessionProduct.NAME);
                if (sessionProduct != null) {
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

        function SetCartCount() {
            document.getElementById('cartCount').innerHTML = '<span class="glyphicon glyphicon-shopping-cart"></span>' + getCartCount();
            LoadDetails();
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

        Storage.prototype.setObj = function (key, obj) {
            key = 'fc' + key;
            return this.setItem(key, JSON.stringify(obj))
        };

        Storage.prototype.getObj = function (key) {
            key = 'fc' + key;
            return JSON.parse(this.getItem(key))
        };

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

            //$.ajax({
            //    url: '/api/Product/GetCakeTierDetail',
            //    type: 'Get',
            //    contentType: 'application/json',
            //    dataType: 'json',
            //    data: { 'cakeId': cakeId },
            //    statusCode: {
            //        200: function (data) {
            //            var json1 = JSON.parse(data);
            //            debugger;
            //            $('#cakeTiers').empty();
            //            for (var i = 0; i < json1.CAKE_TIERS.length; i++) {
            //                //alert(i);    
            //                $('#cakeTiers').append('<span class="align-left"> Tiers # ' + json1.CAKE_TIERS[i].TIER_ORDER + '| MIN_WEIGHT :' + json1.CAKE_TIERS[i].MIN_WEIGHT + ' MAX_WEIGHT :' + json1.CAKE_TIERS[i].MAX_WEIGHT + '</span><span class="align-left" ></span>');
            //                //var cakeObject = { "TIER_ORDER": json1.CAKE_TIERS[i].TIER_ORDER, "MIN_WEIGHT": json1.CAKE_TIERS[i].MIN_WEIGHT, "MAX_WEIGHT": json1.CAKE_TIERS[i].MAX_WEIGHT }
            //                //cakeTierArray[i] = cakeObject;
            //            }
            //        },
            //        500: function () {
            //        }
            //    },
            //    jsonp: 'jsonp'
            //});

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
                        debugger;
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

        function GetCakes() {
            $.ajax({
                url: '/api/Product/SearchCakeByVendorId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId, 'showCount': cakeShowCount * 12 },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        //alert(cakeShowCount);
                        if (json1.CAKES.length == 0) {
                            $("#btnCakes").hide();
                        }
                        else {
                            $("#btnCakes").show();
                        }
                        if (cakeShowCount == 0) {
                            $("#filter-masonry").empty();
                        }
                        for (var i = 0; i < json1.CAKES.length; i++) {
                            var url = json1.CAKES[i].CAKE_PHOTO;
                            $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 cakes"><figure class="product-figure product-figure3"><img id="cakeImage' + json1.CAKES[i].CAKE_ID + '"src="../Assets/images/products/img-01.jpg" alt="img-01"><div class="overlay overlay3"><div class="tg-display-table theme-border viewcell"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.CAKES[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.CAKES[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn33" href="javascript:void(0);" onclick="ViewCakeDetail(' + json1.CAKES[i].CAKE_ID + ')" data-toggle="modal" data-target="#cakeModal">View Detail</a><a class="sm-btn33" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                            $("#cakeImage" + json1.CAKES[i].CAKE_ID).attr("src", "" + url);
                        }

                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
            SetCartCount();
        }


        function GetDesserts() {
            $.ajax({
                url: '/api/Product/SearchDessertsByVendorId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId, 'showCount': dessertsShowCount * 12 },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;
                        if (json1.PRODUCTS.length == 0) {
                            $("#btnDesserts").hide();
                        }
                        else {
                            $("#btnDesserts").show();
                        }
                        $("#filter-masonry2").empty();
                        //alert(dessertsShowCount);
                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            //alert(i);         
                            //var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                            //alert(url);
                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                            $("#filter-masonry2").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desserts"><figure class="product-figure pro-fig"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="Desserts"><div class="overlay overy"><div class="tg-display-table theme-border theme-border-short"><div class="tg-display-table-cell table-cell"><div class="product-detail detailsof"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><span>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</span></span></div><div class="gallery-button gallery-btn"> <a class="sm-btn33 zu-btn" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn33 sub-btn" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                            $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", "" + url);

                        }

                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function GetFoods() {
            $.ajax({
                url: '/api/Product/SearchProductByVendorId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId, 'showCount': foodShowCount * 12 },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        
                        $("#foodList").empty();
                        if (json1.PRODUCTS.length == 0) {
                            $("#btnFoods").hide();
                        }
                        else {
                            $("#btnFoods").show();
                        }
                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            
                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                            $("#foodList").append(
                                '<article class="menu__category">'
                                   + '<div class="leftslide">'
                                      + '<img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '"src="images/products/img-01.jpg" alt="thumbnail">'
                                      + '</div><!-- left ends -->'
                                      + '<div class="rightslide">'
                                           + '<div class="menu__category__header">'
                                                + '<div id="menu_daily-menu_category_platter" class="menu__category__title">'
                                                  + json1.PRODUCTS[i].NAME
                                                + '</div>'
                                         + '</div> <!-- Header Category -->'
                                + '<article class="menu-item   ">' +
                                         '<div class="menu-item__content-wrapper">' +
                                               '<div class="menu-item__content-container">'
                                                 + '<div class="menu-item__content ">'
                                                      + '<div class="menu-item__title" title="Sandwich Platter">' + json1.PRODUCTS[i].DESCRIPTION + '</div>'
                                                                             + '<p class="menu-item__description"> Serves : ' + json1.PRODUCTS[i].SERVES + ' | Time Reqruired : ' + json1.PRODUCTS[i].TIME_REQUIRED + '</p>'
                                                     + '</div>'
                                                      + '<div class="menu-item__dish-characteristic-container" style="margin-top:20px;">'
                                                          + '<a class="sm-btn33" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a>'
                                                          + '<a class="sm-btn33" href="javascript:void(0);" style="margin-left:10px;" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a>'
                                                     + '</div>'

                                                 + '</div>'
                                                + '<div class="menu-item__variations-container  ">'
                                                   + '<ul class="menu-item__variations">'
                                                         + '<article class="menu-item__variation js-fire-click-tracking-event" data-event="clicked_product" data-clicked_product_id="658578" data-clicked_product_name="6 Inch Sub with Soft Drink" data-clicked_product_category_name="Ramadan Exclusive Discounted Deals" data-clicked_product_category_id="89147" data-clicked_product_popular="no" data-item_url="/cart/add-product/vendor/s3nh/product/864506?productId=658578">'
                                                         + '<div class="menu-item__variation__title">&nbsp;</div>'
                                                             + '<div class="menu-item__variation__price ">Rs.' + json1.PRODUCTS[i].PRICE + '</div>'

                                                        + '</article>'
                                                   + '</ul>'
                                              + '</div>'
                                          + '</div><!-- Content Wrapper -->'
                                 + '</article>'
                                 + '</div><!-- right slide ends -->'
                                 + '</article>');
                            $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", "" + url);

                        }

                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function GetFrozenFoods() {
            $.ajax({
                url: '/api/Product/SearchFrozenFoodsByVendorId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId, 'showCount': frozenShowCount * 12 },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        if (json1.PRODUCTS.length == 0) {
                            $("#btnFrozen").hide();
                        }
                        else {
                            $("#btnFrozen").show();
                        }
                        $("#frozenList").empty();
                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                            $("#frozenList").append(
                                '<article class="menu__category">'
                                   + '<div class="leftslide">'
                                      + '<img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '"src="images/products/img-01.jpg" alt="thumbnail">'
                                      + '</div><!-- left ends -->'
                                      + '<div class="rightslide">'
                                           + '<div class="menu__category__header">'
                                                + '<div id="menu_daily-menu_category_platter" class="menu__category__title">'
                                                  + json1.PRODUCTS[i].NAME
                                                + '</div>'
                                         + '</div> <!-- Header Category -->'
                                + '<article class="menu-item   ">' +
                                         '<div class="menu-item__content-wrapper">' +
                                               '<div class="menu-item__content-container">'
                                                 + '<div class="menu-item__content ">'
                                                      + '<div class="menu-item__title" title="Sandwich Platter">' + json1.PRODUCTS[i].DESCRIPTION + '</div>'
                                                                             + '<p class="menu-item__description"> Serves :' + json1.PRODUCTS[i].SERVES + ' | Time Reqruired :' + json1.PRODUCTS[i].TIME_REQUIRED + '</p>'
                                                     + '</div>'
                                                     + '<div class="menu-item__dish-characteristic-container" style="margin-top:20px;">'
                                                          + '<a class="sm-btn33" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a>'
                                                          + '<a class="sm-btn33" href="javascript:void(0);" style="margin-left:10px;" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a>'
                                                     + '</div>'

                                                 + '</div>'
                                                + '<div class="menu-item__variations-container  ">'
                                                   + '<ul class="menu-item__variations">'
                                                         + '<article class="menu-item__variation js-fire-click-tracking-event" data-event="clicked_product" data-clicked_product_id="658578" data-clicked_product_name="6 Inch Sub with Soft Drink" data-clicked_product_category_name="Ramadan Exclusive Discounted Deals" data-clicked_product_category_id="89147" data-clicked_product_popular="no" data-item_url="/cart/add-product/vendor/s3nh/product/864506?productId=658578">'
                                                         + '<div class="menu-item__variation__title">&nbsp;</div>'
                                                             + '<div class="menu-item__variation__price ">Rs.' + json1.PRODUCTS[i].PRICE + '</div>'


                                                        + '</article>'
                                                   + '</ul>'
                                              + '</div>'
                                          + '</div><!-- Content Wrapper -->'
                                 + '</article>'
                                 + '</div><!-- right slide ends -->'
                                 + '</article>');
                            $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", "" + url);

                        }

                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function GetDesserts2(subCategory) {
            cakeShowCount = 0, foodShowCount = 0, frozenShowCount = 0, dessertsShowCount = 0;
            $.ajax({
                url: '/api/Product/SearchDessertsByVendorId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId, 'showCount': dessertsShowCount * 12, 'subCategoryId': subCategory },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        $("#filter-masonry2").empty();
                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            
                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                            $("#filter-masonry2").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desserts"><figure class="product-figure pro-fig"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="Desserts"><div class="overlay overy"><div class="tg-display-table theme-border theme-border-short"><div class="tg-display-table-cell table-cell"><div class="product-detail detailsof"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><span>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</span></span></div><div class="gallery-button gallery-btn"> <a class="sm-btn33 zu-btn" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn33 sub-btn" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                            $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", "" + url);

                        }
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function GetFoods2(subCategory) {
            cakeShowCount = 0, foodShowCount = 0, frozenShowCount = 0, dessertsShowCount = 0;
            $.ajax({
                url: '/api/Product/SearchProductByVendorId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId, 'showCount': foodShowCount * 12, 'subCategoryId': subCategory },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;
                        $("#foodList").empty();
                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                            $("#foodList").append(
                                '<article class="menu__category">'
                                   + '<div class="leftslide">'
                                      + '<img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '"src="images/products/img-01.jpg" alt="thumbnail">'
                                      + '</div><!-- left ends -->'
                                      + '<div class="rightslide">'
                                           + '<div class="menu__category__header">'
                                                + '<div id="menu_daily-menu_category_platter" class="menu__category__title">'
                                                  + json1.PRODUCTS[i].NAME
                                                + '</div>'
                                         + '</div> <!-- Header Category -->'
                                + '<article class="menu-item   ">' +
                                         '<div class="menu-item__content-wrapper">' +
                                               '<div class="menu-item__content-container">'
                                                 + '<div class="menu-item__content ">'
                                                      + '<div class="menu-item__title" title="Sandwich Platter">' + json1.PRODUCTS[i].DESCRIPTION + '</div>'
                                                                             + '<p class="menu-item__description"> Serves : ' + json1.PRODUCTS[i].SERVES + ' | Time Reqruired : ' + json1.PRODUCTS[i].TIME_REQUIRED + '</p>'
                                                     + '</div>'
                                                      + '<div class="menu-item__dish-characteristic-container" style="margin-top:20px;">'
                                                          + '<a class="sm-btn33" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a>'
                                                          + '<a class="sm-btn33" href="javascript:void(0);" style="margin-left:10px;" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a>'
                                                     + '</div>'

                                                 + '</div>'
                                                + '<div class="menu-item__variations-container  ">'
                                                   + '<ul class="menu-item__variations">'
                                                         + '<article class="menu-item__variation js-fire-click-tracking-event" data-event="clicked_product" data-clicked_product_id="658578" data-clicked_product_name="6 Inch Sub with Soft Drink" data-clicked_product_category_name="Ramadan Exclusive Discounted Deals" data-clicked_product_category_id="89147" data-clicked_product_popular="no" data-item_url="/cart/add-product/vendor/s3nh/product/864506?productId=658578">'
                                                         + '<div class="menu-item__variation__title">&nbsp;</div>'
                                                             + '<div class="menu-item__variation__price ">Rs.' + json1.PRODUCTS[i].PRICE + '</div>'

                                                        + '</article>'
                                                   + '</ul>'
                                              + '</div>'
                                          + '</div><!-- Content Wrapper -->'
                                 + '</article>'
                                 + '</div><!-- right slide ends -->'
                                 + '</article>');
                            $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", "" + url);

                        }
                        //                      foodShowCount++;
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function GetFrozenFoods2(subCategory) {
            cakeShowCount = 0, foodShowCount = 0, frozenShowCount = 0, dessertsShowCount = 0;
            $.ajax({
                url: '/api/Product/SearchFrozenFoodsByVendorId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId, 'showCount': frozenShowCount * 12, 'subCategoryId': subCategory },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;
                        $("#frozenList").empty();

                        //alert(json1.PRODUCTS.length);
                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            //alert(i);         
                            //var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                            //alert(url);
                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                            $("#frozenList").append(
                                '<article class="menu__category">'
                                   + '<div class="leftslide">'
                                      + '<img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '"src="images/products/img-01.jpg" alt="thumbnail">'
                                      + '</div><!-- left ends -->'
                                      + '<div class="rightslide">'
                                           + '<div class="menu__category__header">'
                                                + '<div id="menu_daily-menu_category_platter" class="menu__category__title">'
                                                  + json1.PRODUCTS[i].NAME
                                                + '</div>'
                                         + '</div> <!-- Header Category -->'
                                + '<article class="menu-item   ">' +
                                         '<div class="menu-item__content-wrapper">' +
                                               '<div class="menu-item__content-container">'
                                                 + '<div class="menu-item__content ">'
                                                      + '<div class="menu-item__title" title="Sandwich Platter">' + json1.PRODUCTS[i].DESCRIPTION + '</div>'
                                                                             + '<p class="menu-item__description"> Serves :' + json1.PRODUCTS[i].SERVES + ' | Time Reqruired :' + json1.PRODUCTS[i].TIME_REQUIRED + '</p>'
                                                     + '</div>'
                                                     + '<div class="menu-item__dish-characteristic-container" style="margin-top:20px;">'
                                                          + '<a class="sm-btn33" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a>'
                                                          + '<a class="sm-btn33" href="javascript:void(0);" style="margin-left:10px;" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a>'
                                                     + '</div>'

                                                 + '</div>'
                                                + '<div class="menu-item__variations-container  ">'
                                                   + '<ul class="menu-item__variations">'
                                                         + '<article class="menu-item__variation js-fire-click-tracking-event" data-event="clicked_product" data-clicked_product_id="658578" data-clicked_product_name="6 Inch Sub with Soft Drink" data-clicked_product_category_name="Ramadan Exclusive Discounted Deals" data-clicked_product_category_id="89147" data-clicked_product_popular="no" data-item_url="/cart/add-product/vendor/s3nh/product/864506?productId=658578">'
                                                         + '<div class="menu-item__variation__title">&nbsp;</div>'
                                                             + '<div class="menu-item__variation__price ">Rs.' + json1.PRODUCTS[i].PRICE + '</div>'


                                                        + '</article>'
                                                   + '</ul>'
                                              + '</div>'
                                          + '</div><!-- Content Wrapper -->'
                                 + '</article>'
                                 + '</div><!-- right slide ends -->'
                                 + '</article>');
                            $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", "" + url);

                        }
                        //  frozenShowCount++;
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }







        $(document).ready(function () {
            $('#interest_tabs').on('click', 'a[data-toggle="tab"]', function (e) {
                //e.preventDefault();

                var $link = $(this);
                if (!$link.parent().hasClass('active')) {

                    //remove active class from other tab-panes
                    $('.tab-content:not(.' + $link.attr('href').replace('#', '') + ') .tab-pane').removeClass('active');
                    // click first submenu tab for active section
                    $('a[href="' + $link.attr('href') + '_all"][data-toggle="tab"]').click();

                    // activate tab-pane for active section
                    $('.tab-content.' + $link.attr('href').replace('#', '') + ' .tab-pane:first').addClass('active');
                }

            });
           <%-- var showVp = '<%= int.Parse(FoodChapter.SessionManager.GetShowVPSession()) %>';
           

            if (showVp == "0") {
                $('#detailModal').modal('show');
            }--%>
            //$('#detailModal').modal('show');
            GetCakes();
            //var vendorId = 1;
            $("#btnCakes").click(function () {
                foodShowCount = 0, frozenShowCount = 0, dessertsShowCount = 0;
                cakeShowCount++;
                GetCakes();

            });
            $("#btnFoods").click(function () {
                cakeShowCount = 0, frozenShowCount = 0, dessertsShowCount = 0;
                foodShowCount++;
                GetFoods();

            });
             $("#btnDesserts").click(function () {
                cakeShowCount = 0, foodShowCount = 0, frozenShowCount = 0;
                dessertsShowCount++;
                GetDesserts();

             });
             $("#btnFrozen").click(function () {
                cakeShowCount = 0, foodShowCount = 0, dessertsShowCount = 0;
                frozenShowCount++;
                GetFrozenFoods();


            });

             $.ajax({
                //url: '/api/Vendors/GetAllVendors',
                url: '/api/Vendors/GetVendorProfile',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId },
                //data: JSON.stringify(),
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;
                        for (var i = 0; i < json1.VENDOR.length; i++) {
                            document.getElementById('vendorName').innerText = json1.VENDOR[i].BUSINESS_ENTITY_NAME;
                            document.getElementById('vendorModalLabel').innerHTML = json1.VENDOR[i].BUSINESS_ENTITY_NAME + '<i class="fa fa-times pull-right mean" data-dismiss="modal" aria-hidden="true"></i>';

                            var imrUrl = json1.VENDOR[i].PROFILE_IMAGE;
                            document.getElementById("vendorProfileImage").src = "" + imrUrl;
                            document.getElementById("vendorModalImage").src = "" + imrUrl;
                            document.getElementById('vendorModalEmail').innerHTML = json1.VENDOR[i].EMAIL;
                            document.getElementById("vendorModalCell").innerHTML = json1.VENDOR[i].PERSONAL_PHONE;


                            document.getElementById('vendorEmail').innerHTML = json1.VENDOR[i].EMAIL;
                            document.getElementById("vendorCell").innerHTML = json1.VENDOR[i].PERSONAL_PHONE;
                            var spFoods = document.getElementById("spFooods");
                            var spCakes = document.getElementById("spCakes");
                            var spDeals = document.getElementById("spDeals");
                            var spDesserts = document.getElementById("spDesserts");
                            var spFrozen = document.getElementById("spFrozen");

                            var spFoods1 = document.getElementById("spFooods1");
                            var spCakes1 = document.getElementById("spCakes1");
                            var spDeals1 = document.getElementById("spDeals1");
                            var spDesserts1 = document.getElementById("spDesserts1");
                            var spFrozen1 = document.getElementById("spFrozen1");

                            //document.getElementById("txtPassword").value = json1.VENDOR[i].PASSWORD;
                            document.getElementById("vendorBio").innerHTML = json1.VENDOR[i].DESCRIPTION;
                            //if (json1.VENDOR[i].FOODS_SPECIALITY == true) {
                            //    chbFoods.checked = true;
                            //}
                            if (json1.VENDOR[i].FOODS_SPECIALITY == true) {
                                spFoods.style.display = 'block';
                                spFoods1.style.display = 'block';
                            }
                            else {
                                spFoods.style.display = 'none';
                                spFoods1.style.display = 'none';
                            }

                            if (json1.VENDOR[i].FROZEN_FOODS_SPECIALITY == true) {
                                spFrozen.style.display = 'block';
                                spFrozen1.style.display = 'block';
                            }
                            else {
                                spFrozen1.style.display = 'none';
                                spFrozen.style.display = 'none';
                            }

                            if (json1.VENDOR[i].DEALS_SPECIALITY == true) {
                                spDeals.style.display = 'block';
                                spDeals1.style.display = 'block';
                            }
                            else {
                                spDeals1.style.display = 'none';
                                spDeals.style.display = 'none';
                            }

                            if (json1.VENDOR[i].DESSERTS_SPECIALITY == true) {
                                spDesserts.style.display = 'block';
                                spDesserts1.style.display = 'block';
                            }
                            else {
                                spDesserts.style.display = 'none';
                                spDesserts1.style.display = 'none';
                            }

                            if (json1.VENDOR[i].CAKES_SPECIALITY == true) {
                                spCakes.style.display = 'block';
                                spCakes1.style.display = 'block';
                            }
                            else {
                                spCakes1.style.display = 'none';
                                spCakes.style.display = 'none';
                            }

                        }
                    }
                },
                jsonp: 'jsonp'
            });

            $.ajax({
                url: '/api/Product/GetProductSubCatagories',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'catagoryId': 1 },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        //debugger;
                        $('#SubCategories').empty();
                        for (var i = 0; i < json1.SUBCATEGORIES.length; i++) {
                            //$('#SubCategories').append('<option value="' + json1.SUBCATEGORIES[i].ID + '">' + json1.SUBCATEGORIES[i].SUB_CATAGORY_NAME + '</option>');

                            $('#Foodsul').append('<li class="categories__list__item"> <a href="javascript:void(0);" onclick="GetFoods2(' + json1.SUBCATEGORIES[i].ID + ')">' + json1.SUBCATEGORIES[i].SUB_CATAGORY_NAME + '</a></li>');


                        }
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'

            });
            $.ajax({
                url: '/api/Product/GetProductSubCatagories',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'catagoryId': 3 },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        //debugger;
                        $('#SubCategories').empty();
                        for (var i = 0; i < json1.SUBCATEGORIES.length; i++) {
                            //$('#SubCategories').append('<option value="' + json1.SUBCATEGORIES[i].ID + '">' + json1.SUBCATEGORIES[i].SUB_CATAGORY_NAME + '</option>');

                            $('#Dessertul').append('<li class="categories__list__item"> <a href="javascript:void(0);" onclick="GetDesserts2(' + json1.SUBCATEGORIES[i].ID + ')">' + json1.SUBCATEGORIES[i].SUB_CATAGORY_NAME + '</a></li>');


                        }
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'

            });
            $.ajax({
                url: '/api/Product/GetProductSubCatagories',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'catagoryId': 2 },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        //debugger;
                        $('#SubCategories').empty();
                        for (var i = 0; i < json1.SUBCATEGORIES.length; i++) {
                            //$('#SubCategories').append('<option value="' + json1.SUBCATEGORIES[i].ID + '">' + json1.SUBCATEGORIES[i].SUB_CATAGORY_NAME + '</option>');

                            $('#Frozenul').append('<li class="categories__list__item"> <a href="javascript:void(0);" onclick="GetFrozenFoods2(' + json1.SUBCATEGORIES[i].ID + ')">' + json1.SUBCATEGORIES[i].SUB_CATAGORY_NAME + '</a></li>');


                        }
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

    </script>


</head>
<body id="home">
    <div class="modal fade " id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-sm modalMsg ">
                <div class="modal-content ">
                    
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-6 col-md-offset-3">
                                    
                                    <h5 style=" text-align: center" id="lblMessage">

                                    </h5>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    <style>
        .modal-backdrop.in{
            opacity : 0;
        }
        .modal.in .modal-dialog {
    /* -webkit-transform: translate(0,0); */
    -ms-transform: translate(0,0);
    -o-transform: translate(0,0);
    transform: translate(0,0);
    background-color: #f68c93;
    margin-top: 0px;
}
    </style>
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
                    <li>
                        <li class="dropdown">
                            <label style="padding: 10px 15px; color: #f7f7f7;" id="lblUsername"></label>
                        </li>
                        <%--<div class="form-group top-search">
                  <input type="text" class="form-control top-search-feild" placeholder="Search">
                  <i class="fa fa-search top-search-icon" aria-hidden="true"></i>
            </div>--%>
                    </li>
                    <li class="dropdown"><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>


                    <li></li>
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
                                <a class="responsive-logo pull-left" href="index.php">
                                    <img src="logo.png" alt="logo"></a>

                            </div>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul id="nav-list-inner" class="nav-list-inner">

                                    <li><a href="gallery.aspx">Gallery</a></li>
                                    <li><a href="vendors.aspx">Sellers</a></li>
                                    <li><a href="contact.aspx">contact</a></li>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal">Register</a></li>
                                    <li><a href="Cart.aspx" id="cartCount"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
                                </ul>

                            </div>
                        </nav>
                    </div>
                </div>
            </header>
            <!-- Header inner -->
        </header>
        <!-- Header -->
        <!-- Inner banner -->
        <section class="parallax-window inerr-banner newbg" data-parallax="scroll">

            <div class="theme-border-holder">
                <div class="shadow-effect-2 box-shadow-2">
                    <div class="theme-border-2 shadow-effect box-shadow theme-border">
                        <div class="shadow-effect-3 box-shadow-3">
                            <div class="inner-banner-heading">
                                <div class="heading-holder">
                                    <img id="vendorProfileImage" src="../Assets/images/products/img-01.jpg" alt="img-01" />
                                    <div class="details-holder">
                                        <h4 id="vendorName"></h4>
                                        <h6>Email: <span id="vendorEmail"></span></h6>
                                        <h6>Call: <span id="vendorCell"></span></h6>
                                        <h6>We Serve in:</h6>
                                        <div class="view-detail-div">
                                            <div id="spFooods1" class="viewchain"><i class="fa fa-check" aria-hidden="true"></i><span>Foods</span></div>
                                            <div id="spCakes1" class="viewchain"><i class="fa fa-check" aria-hidden="true"></i><span>Cakes</span></div>
                                            <div id="spDeals1" class="viewchain"><i class="fa fa-check" aria-hidden="true"></i><span>Deals</span></div>
                                            <div id="spDesserts1" class="viewchain"><i class="fa fa-check" aria-hidden="true"></i><span>Desserts</span></div>
                                            <div id="spFrozen1" class="viewchain"><i class="fa fa-check" aria-hidden="true"></i><span>Frozen Foods</span></div>

                                        </div>
                                        <div class="vdescription">
                                            <h6>Our Biography:</h6>
                                            <p id="vendorDesc">
                                                
                                            </p>
                                        </div>
                                        <%--<div class="view-detail-div"><a href="" data-toggle="modal" data-target="#detailModal" class="view-detail">View profile</a></div>--%>
                                        
                                         <div id="el3" class="col-md-12 col-md-offset-11" style="width:55px;margin-top:-160px;pointer-events:none;">
                                                                <%--<script>showStars('el3');</script>--%>
                                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Shadow effect 3 -->

                    </div>
                </div>
                <!-- Shadow 2 effect -->
        </section>
        <!-- Inner banner -->

        <!-- Main Content -->
        <main id="main-wrapper" class="inner-main">

		<!-- Our Best Menu -->
		<section class="menu-v2">
			<div class="container">
            <!-- here start the Nested Tabs -->
               <div class="nest-me1 shadow-effect box-shadow">
    <div class="nest-me shadow-effect-2 box-shadow-2 usermake">
    







<ul class="nav nav-tabs nestedme col-md-offset-3" id="interest_tabs">
    <!--top level tabs-->
    <li id="bakery_item" class="modalRL parent-list active" onclick="GetCakes()"><a href="#Cakes" data-toggle="tab" id="cakeTab">Cakes</a></li>
  <li id="foods_item" class="modalRL parent-list" onclick="GetFoods()"><a href="#food" data-toggle="tab">Foods</a></li>
  <li id="desserts_item" class="modalRL parent-list" onclick="GetDesserts()"><a href="#new_desserts" data-toggle="tab">Desserts</a></li>
  <li id="fronzen_foods_item" class="modalRL parent-list" onclick="GetFrozenFoods()"><a href="#frozan_FC" data-toggle="tab">Frozen Foods</a></li>
 
</ul>

    <div class="tab-content">
       
        <div id="Cakes" class="tab-pane active">
          
    
                        <div class=" row">
                            <div id="filter-masonry"  class="products-grid-list">
                               
                             

                               
                            </div> 
                        </div>
                        
                        <div class="view-more-gallery"><a href="javascript:void(0);" id="btnCakes" class="view-more">View More</a></div>
                        
                        <!-- Menu Grid List -->
                        <div style="clear: both;"></div>
                     

                      </div> <!-- Brand_popular -->

       
                            
        </div>


        
    </div>



    <div class="tab-content">
        <div id="food" class="tab-pane ">
           
<!-- Start Here -->
<aside class="vendor-menu__categories">

    <div class="form-group filter__search">
				<i class="fa fa-search filter__search-icon" aria-hidden="true"></i>
                <input type="text" id="txtSearch" class="form-control  filterData" placeholder="Search">
				 
			</div>

   <div class="js-sticky-element js-vendor-detail-menu-categories" data-sticky-bottom-margin="40" style="">
        <div class="categories__title">Foods</div>
                   <ul id="Foodsul" class="categories__list ">

               
                    </ul>
                  
              </div>
  </aside>

<div class="vendor-menu_menus">
    <section class="menu">
        <div class="menu__header" id="foodList">

        </div>
    </section>
    <div class="view-more-gallery"><a href="javascript:void(0);" id="btnFoods" class="view-more">View More</a></div>

</div>


          
           <!-- Cart Container Starts here -->
           <div class="cart-container">
                <div class="js-sticky-element">
                   <div class="cart__header__head ">
                       <div class="cart__header__head__delivery-time">
                             <div class="cart__header__head__delivery-time__label" style="color:#F6A0A5;">Estimated delivery time</div>
                             <div class="cart__header__head__delivery-time__time">
                               <span class="delivery_time_minutes" id="foodTime" >30</span>
                                  <span class="delivery_time_label">minutes</span>
                                  </div>
                                  <div class="clear"></div>
                                 </div>
                                </div><!-- cart header head -->
                             
                           

                           <!-- head end here -->
                           <div class="cart__header">
                            <div class="cart__header__title">
                              <span class="default-delivery-label">Your order</span>
                                <div class="clear"></div>
                           </div>
                          </div>
                          <!-- Cart Box -->
                          <div class="cart_empty" id="foodOrder">
                              <%--<div class="cart_empty_container">
                                <span class="no-items-text">Add menu items into your Basket</span>
                              </div>--%>
                          </div>
                          </div><!-- Sticky end here -->

            </div><!-- end here cart container -->


        </div>
        
    </div>

    <!--brands tab content-->

  

    <!--media tab content-->
     <div class="tab-content">
    
        <div id="new_desserts" class="tab-pane">
    <aside class="vendor-menu__categories">
           <div class="form-group filter__search">
				<i class="fa fa-search filter__search-icon" aria-hidden="true"></i>
                <input type="text" id="txtSearch" class="form-control  filterData" placeholder="Search">
				 
			</div>
         <div class="js-sticky-element js-vendor-detail-menu-categories" data-sticky-bottom-margin="40" style="">
        <div class="categories__title">Desserts</div>
                   <ul id="Dessertul" class="categories__list ">
                       
                         
               
                            </ul>
                   
              </div>
    </aside>
    <div class="vendor-menu_menus desserts_menu">
    <section class="menu">


                <div class=" row">
                            <div id="filter-masonry2"  class="products-grid-list">
                             
                                </div>
                                </div>

                        <div style="clear: both;"></div>

</section> 
                        <div class="view-more-gallery"><a href="javascript:void(0);" id="btnDesserts" class="view-more">View More</a></div>
        <!-- Section of Menu ends here -->
</div> <!-- Vendor Menu Menus -->


        </div> <!-- Desserts Swallowd -->

           
    </div>

    <!--
    #################################################################################################################################

                                                                Desserts Ends Here _

    ################################################################################################################################# -->

    <!--music tab content-->
    <div class="tab-content">
        <div id="frozan_FC" class="tab-pane">
           <aside class="vendor-menu__categories">
    <div class="form-group filter__search">
				<i class="fa fa-search filter__search-icon" aria-hidden="true"></i>
                <input type="text" id="txtSearch" class="form-control  filterData" placeholder="Search">
				 
			</div>
         <div class="js-sticky-element js-vendor-detail-menu-categories" data-sticky-bottom-margin="40" style="">
        <div class="categories__title">Frozen Foods</div>
                   <ul id="Frozenul" class="categories__list ">
                       
               
                            </ul>
                   
              </div>
  </aside>

<div class="vendor-menu_menus">
<section class="menu">
  <div class="menu__header" id="frozenList"></div>
    


        </section>
                        <div class="view-more-gallery"><a href="javascript:void(0);" id="btnFrozen" class="view-more">View More</a></div>

      </div>
                       <!-- Cart Container Starts here -->
           <div class="cart-container">
                <div class="js-sticky-element">
                   <div class="cart__header__head ">
                       <div class="cart__header__head__delivery-time">
                             <div class="cart__header__head__delivery-time__label" style="color:#F6A0A5;">Estimated delivery time</div>
                             <div class="cart__header__head__delivery-time__time">
                               <span class="delivery_time_minutes" id="frozenTime">30</span>
                                  <span class="delivery_time_label">minutes</span>
                                  </div>
                                  <div class="clear"></div>
                                 </div>
                                </div><!-- cart header head -->
                             
                           

                           <!-- head end here -->
                           <div class="cart__header">
                            <div class="cart__header__title">
                              <span class="default-delivery-label">Your order</span>
                                <div class="clear"></div>
                           </div>
                          </div>
                          <!-- Cart Box -->
                          <div class="cart_empty" id="frozenOrder">
                              <%--<div class="cart_empty_container">
                                <span class="no-items-text" >Add menu items into your Basket</span>
                              </div>--%>
                          </div>
                          </div><!-- Sticky end here -->

            </div><!-- end here cart container -->

        </div>
       
    </div>

   
    
</div>
       

                
                    </div><!-- here ends nested tabs -->
             <div class="shadow-effect-2 box-shadow-2" style="margin-top:80px;" id="reviews">
                    <div class="theme-border-2 shadow-effect box-shadow theme-border">
                        <div class="shadow-effect-3 box-shadow-3">
                            <div class="inner-banner-heading">
                                <div class="heading-holder">
                                    <div class="details-holder" style="max-width: 1000px !important;">
                                        <div>
                                            <h4 style="margin-top:30px;">Reviews</h4>
                                            <div class="col-md-offset-9" style="margin-top:-25px;"><a href="javascript:void(0);" onclick="ShowReview();" id="btnAddReview" class="view-more">Write A Review!</a></div>
                                             <hr/>
                                        </div>
                                        <div id ="addReview"  style="display: none" >
                                            <div class="row">
                                                <div class="col-md-10">
                                                    <textarea class="form-control " style="height:200px;" placeholder="Write Review Here" id="textReview" rows="5" required="required"></textarea>
                                                </div>
                                                <div id="el2" class="col-md-2" style="width:55px;margin-left:100px;color:black;">
                                                    <script>showStars('el2');</script>
                                                </div>
                                            </div>
                                            <div class="col-md-offset-10" style="margin-top:25px;width:60px;height:15px;"><a href="javascript:void(0);" onclick="SaveReview()" id="saveReview" class="view-more">Save</a></div>
                                            <label id=""></label>
                                            <hr/>
                                        </div>
                                        
                                        <div id ="showReview">
                                                <label style="font-size:20px;">Asad Abbas</label>
                                                <div class="row">
                                                    <p class="col-md-10" >lkandaklsd alsdknaksdna sdkansd;lkand ascdksa nck;n x c;kanckac as;kc nas;lkcmas ca;lsnca;lscmasc a
                                                    sacnalkcnsa caskcnsaklc;ns aclaskcnsakl;cna scas;klcn;aslcm csas;lcnaslcma c;lascm;lasc</p>
                                                <div id="el1" class="col-md-2" style="width:55px;margin-left:100px;color:black;">
                                                    <script>showStars('el1');</script>
                                                </div>
                                                    
                                                </div>
                                                
                                                <hr/>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <!-- Shadow effect 3 -->

                    </div>
                </div>
    </div>
    <!-- Bottom Shadow Ends Here -->


    </div>
				
		<%--</section>--%>
    <!-- Our Best Menu -->
    

    //ahsan removed it working time



    <!-- Testimonial -->

    <!-- Testimonial -->
    </main>
	<!-- Main Content -->
    <!-- Large View Profile Modal -->
    <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg detailm">
            <div class="modal-content">
                <div class="modal-header ">
                    <h4 class="modal-title uptitle" id="vendorModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <div class="info-block" id="infoTag">
                        <div class="row">
                            <div class="col-md-3">
                                <img id="vendorModalImage" src="../Assets/images/products/img-01.jpg" alt="img-01" />
                            </div>
                            <div class="col-md-8 viewmodalpro">
                                <div class="row" style="margin-left: 50px;">
                                    <div class="col-md-12 vendor-detail-up">

                                        <h5>Email Address:</h5>
                                        <p><a href="mailto:tahirabbaskhan@gmail.com" id="vendorModalEmail">tahirabbaskhan@gmail.com</a></p>
                                    </div>
                                    <div class="col-md-12 vendor-detail-up">
                                        <h5>Phone Number: </h5>
                                        <p><a href="telto:0300-000-0001" id="vendorModalCell">0300-000-0001</a></p>
                                    </div>
                                    <div class="col-md-12 tick related">
                                        <h5>Speciality:</h5>
                                        <div class="col-md-12">
                                            <div id="spFooods" class="viewchain"><i class="fa fa-check" aria-hidden="true"></i><span>Foods</span></div>
                                            <div id="spCakes" class="viewchain"><i class="fa fa-check" aria-hidden="true"></i><span>Cakes</span></div>
                                            <div id="spDeals" class="viewchain"><i class="fa fa-check" aria-hidden="true"></i><span>Deals</span></div>
                                            <div id="spDesserts" class="viewchain"><i class="fa fa-check" aria-hidden="true"></i><span>Desserts</span></div>
                                            <div id="spFrozen" class="viewchain"><i class="fa fa-check" aria-hidden="true"></i><span>Frozen Foods</span></div>

                                        </div>
                                        <!-- end fourth column -->
                                        <%--<div class="col-md-4">
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Foods</span></div>
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Cakes</span></div>
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Deals</span></div>
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Frozen Foods</span></div>
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Sweets</span></div>
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Spicy</span></div>
								          </div>
								           <!-- end fourth column -->
								           <div class="col-md-4">
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Foods</span></div>
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Cakes</span></div>
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Deals</span></div>
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Frozen Foods</span></div>
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Sweets</span></div>
								          <div><i class="fa fa-check" aria-hidden="true"></i><span>Spicy</span></div>
								          </div>--%>
                                        <!-- end fourth column -->
                                    </div>
                                    <div class="col-md-12 tink related">
                                        <h5>Biography:</h5>
                                        <p id="vendorBio">
                                        </p>


                                    </div>



                                </div>
                                <!-- inner row ends here -->
                            </div>
                        </div>
                        <!-- row ends here -->
                        <button type="button" class="btn pull-button upbutton pull-right" data-dismiss="modal">CLOSE ME</button>

                    </div>
                    <!-- infoTag ends here -->
                </div>
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
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <button type="submit" class="btn upbutton pull-right">
                                                    Login</button>
                                            </div>
                                            <div class="col-md-4">
                                                <img src="../Assets/images/preloader.gif" id="imgload" alt="loading" style="display: none; width: 15px; height: 15px" />
                                                <%--<a style="color: #ff8c93 !important;" class="forget pull-right" href="javascript:;">Forgot your password?</a>--%>
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
                                                <img src="../Assets/images/preloader.gif" id="imgload2" alt="loading" style="display: none; width: 15px; height: 15px" />
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
                                                <img src="../Assets/images/preloader.gif" id="imgload3" alt="loading" style="display: none; width: 15px; height: 15px" />
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
                                        <div class="col-md-6 col-sm-6 mycustom"><a href="javascript:void(0);" onclick="googleLogin()"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></div>
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
                                        <button type="button" class="btn upbutton midmar" id="btnPhoneSignIn" onclick="fbSignIn();" style="margin-left: -10px; margin-top: 30px; width: 250px; height: 30px; font-size: 12px;">
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

    <!-- Large Place Order modal -->
    <div class="modal fade" id="myOrderModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Order Status/New Order</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
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
                                                <span>here is your item name<span />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                                Quantity</label>
                                            <div class="col-sm-10">
                                                <span>here is you item quantity<span />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                                Description</label>
                                            <div class="col-sm-10">
                                                <span>here is you item Description<span />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                                Delivery Time</label>
                                            <div class="col-sm-10">
                                                <span>12:45 pm at your place<span />
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
                                            <input id="phone" name="phone" type="text" class="form-control" placeholder="Address">
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
                                                <input type="number" name="quantity" min="1" max="10" placeholder="0" style="width: 100%;">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="quantity" class="control-label">
                                                    Quantity</label>
                                                <input type="number" name="quantity" min="1" max="10" placeholder="0" style="width: 100%;">
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-6 col-xs-6">
                                            <textarea id="message" name="address" class="form-control" style="width: 400px; height: 100px" placeholder="Greeting Box"></textarea>
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
    <!-- Product Description modal -->

    <!-- Modal -->
    <div class="modal fade" id="productModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-body">
                    <div class="product-modal-row">
                        <div class="product-modal-img">
                            <img id="productDetailImage" src="../Assets/images/products/img-01.jpg" alt="" />
                        </div>
                        <div class="product-modal-detail">
                            <span id="productName"></span>
                            <div style="margin-top: 10px;">
                                <a href="javascript:void(0);" onclick="window.location='vendor-profile.aspx';" class="profile-btn">Vendor Profile</a>
                            </div>
                            <div style="margin-top: 10px;"><span class="align-left">Serves: </span><span class="align-left" id="productServes"></span></div>
                            <div>
                                <div style="margin-top: 10px;"><span class="align-left">Time Required: </span><span class="align-left" id="timeReq"></span></div>
                            </div>

                            <label id="vendorId" hidden="hidden"></label>
                            <span class="modal-order-btn">
                                <span class="" id="productPrice"></span>
                                <a href="javascript:void(0);" onclick="addDetailCart()" class="sm-btn33">Order</a>
                            </span>

                            <div style="margin-top: 20px;">
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
                            <img id="cakeDetailImage" src="../Assets/images/products/img-01.jpg" alt="" />
                        </div>
                        <div class="product-modal-detail">
                            <span id="cakeName">Fresh Cream</span>
                            <div>
                                <a href="javascript:void(0);" onclick="window.location='vendor-profile.aspx';" class="profile-btn">Vendor Profile</a>
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
                            <div style="margin-top: 10px;">
                                <div id="cakeTiers">
                                    <span class="align-left">Tiers: </span><span class="align-left"></span>

                                </div>

                            </div>
                            <label id="cakeVendorId" hidden="hidden"></label>
                            <span class="modal-order-btn">
                                <span class="" id="cakePrice"></span>
                                <a href="javascript:void(0);" onclick="addDetailCakeCart()" class="sm-btn33">Order</a>
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

    <!-- Product Description Modal -->

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





    </div>

 <script src="~/js/sticky-em.js"></script>
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
        function myFunction() {
            alert("No products are added yet. Keep Visiting Thank You!");
        }
    </script>
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
                        //document.getElementById("error").innerHTML = "";
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Vendor Saved Successfully.";
                        document.getElementById("lblMessage").style.color = 'green';
                        e.preventDefault();

                        //location.reload();
                    },
                    500: function () {
                        //document.getElementById("success").innerHTML = "";
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Error occured. Vendor not added";
                        document.getElementById("lblMessage").style.color = 'red';
                        e.preventDefault();
                    },
                    406: function () {
                        //document.getElementById("success").innerHTML = "";
                        $('#msgModal').modal('show');
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
                            $('#msgModal').modal('show');
                            //document.getElementById("lblMessage").innerHTML = "Email not Unique. Please choose another.";
                            //document.getElementById("lblMessage").style.color = 'red';
                            //document.getElementById("success").innerHTML = "";
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

                            location.href = 'VendorDashboard.aspx';
                        },
                        401: function (data) {
                            //alert('Wrong email or password');
                            //document.getElementById("success").innerHTML = "";
                            $('#msgModal').modal('show');
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
                        //document.getElementById("error").innerHTML = "";
                        $('#msgModal').modal('show');
                        //document.getElementById("lblMessage").innerHTML = "Wrong email or password";
                        //document.getElementById("lblMessage").style.color = 'red';
                        document.getElementById("lblMessage").innerHTML = "User Saved Successfully.";
                        document.getElementById("lblMessage").style.color = 'green';
                        e.preventDefault();
                        //location.reload();
                    },
                    500: function () {
                        //document.getElementById("success").innerHTML = "";
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Error occured. User not added";
                        document.getElementById("lblMessage").style.color = 'red';

                        e.preventDefault();

                    },
                    406: function () {
                        document.getElementById("success").innerHTML = "";
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Email not Unique. Please choose another.";
                        document.getElementById("lblMessage").style.color = 'red';
                        //document.getElementById("error").innerHTML = "Email not Unique. Please choose another.";
                        //document.getElementById("error").style.color = 'red';
                        e.preventDefault();

                    }
                },
                jsonp: 'jsonp'
            });
            //e.preventDefault();
        }
    </script>


    <footer id="footer">
        <div class="container">

            <!-- Footer Columns -->
            <div class="footer">
                <img src="../Assets/../Assets/images/logo.png" width="200px" height="" alt="Food Chapter log" style="margin-bottom: 13px;"><a class="business-info" href="tel://+923453177413">
                    <p>Lhr: +92 345 3177413</p>
                </a><a class="business-info" href="tel://+923453177413">
                    <p>Pk: +92 345 3177413</p>
                </a><a class="business-info" href="mailto:irfan@xevensolutions.com">
                    <p>info@foodchapter.pk</p>
                </a>
                <div class="social-links"><a class="icon-instagram" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="instagram logo">
                    <img src="../Assets/../Assets/images/logo-instagram.png" alt="Instagram logo"></a><a class="icon-twitter" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="twitter logo"><img src="../Assets/../Assets/images/logo-twitter.png" alt="Twitter logo"></a><a class="icon-facebook" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="facebook logo"><img src="../Assets/../Assets/images/logo-facebook.png" alt="Facebook logo"></a><a class="icon-pinterest" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="pinterest logo"><img src="../Assets/../Assets/images/logo-pinterest.png" alt="Pinterest logo"></a></div>
                <ul class="site-links">
                    <li class="site-links__item"><a class="site-links__item__link" href="#" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click flower care">Home</a></li>

                    <li class="site-links__item"><a class="site-links__item__link" href="#register" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click meet out florist">Register</a></li>
                    <li class="site-links__item"><a class="site-links__item__link" href="#mVendors" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click workshops">Vendors</a></li>


                </ul>
                <div class="card-icons">
                    <img src="../Assets/../Assets/images/cards.png" alt="Accepted payment methods" width="200px"></div>
                <div class="legal">
                    <p class="legal__copyright">© 2017 Xeven  Solutions. All rights reserved.&nbsp;<a class="legal__link" href="#" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click t&amp;cs">Privacy policy (Terms &amp; Conditions)</a></p>
                </div>
            </div>
            <!-- Footer Columns -->

        </div>


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


    </footer>
    <!-- Footer -->

    </div>
</body>
</html>
