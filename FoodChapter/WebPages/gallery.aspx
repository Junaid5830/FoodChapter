<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="FoodChapter.WebPages.gallery" %>

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
       
    <link rel="stylesheet" href="../Assets/css/wbn-datepicker.css">

     <title>Gallery</title>
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
        $(document).ready(function () {

            document.getElementById('fbSignIN').style.display = 'none';

            $(".view-more-gallery").click(function () {
                $(".view-more-hide").show();
            });
        });
</script>
 <script>
     var topCount = 12, showIndex = 0, foodCount = 0, cakeCount = 0, dessertCount = 0, frozenCount = 0;
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

                             $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desi"><figure class="product-figure redfig"><div class="beforeimg"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><span>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" data-toggle="modal" data-target="#vSuccess" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
                             $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                         }
                         else if (json1.PRODUCTS[i].CATAGORY_ID == 2) {
                             var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                             $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 frozen"><figure class="product-figure redfig"><div class="beforeimg"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><span>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" data-toggle="modal" data-target="#vSuccess" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
                             $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                         }
                         else if (json1.PRODUCTS[i].CATAGORY_ID == 3) {
                             var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                             $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desserts"><figure class="product-figure redfig"><div class="beforeimg"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><span>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" data-toggle="modal" data-target="#vSuccess" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
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
                                     $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 cakes"><figure class="product-figure redfig"><div class="beforeimg"><img id="cakeImage' + json1.CAKES[i].CAKE_ID + '"src="../Assets/images/products/img-01.jpg" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.CAKES[i].NAME + '</h3><span><span>' + 'Rs : ' + json1.CAKES[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewCakeDetail(' + json1.CAKES[i].CAKE_ID + ')" data-toggle="modal" data-target="#cakeModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
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


     function hideFoods() {
         var x = document.getElementsByClassName("desi");
         for (var i = 0; i < x.length; i++) {
             x[i].style.display = 'none';
         }
     }

     function hideCakes() {
         var x = document.getElementsByClassName("cakes");
         for (var i = 0; i < x.length; i++) {
             x[i].style.display = 'none';
         }
     }

     function hideFrozen() {
         var x = document.getElementsByClassName("frozen");
         for (var i = 0; i < x.length; i++) {
             x[i].style.display = 'none';
         }
     }

     function hideDesserts() {
         var x = document.getElementsByClassName("desserts");
         for (var i = 0; i < x.length; i++) {
             x[i].style.display = 'none';
         }
     }
     function showFoods() {
         showIndex = 1;
         //var x = document.getElementsByClassName("desi");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'block';
         //}
         //x = document.getElementsByClassName("cakes");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'none';
         //}
         //x = document.getElementsByClassName("desserts");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'none';
         //}
         //x = document.getElementsByClassName("frozen");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'none';
         //}
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
         showIndex = 0;
         //var x = document.getElementsByClassName("desi");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'block';
         //}
         //x = document.getElementsByClassName("cakes");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'block';
         //}
         //x = document.getElementsByClassName("desserts");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'block';
         //}
         //x = document.getElementsByClassName("frozen");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'block';
         //}
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
         //var x = document.getElementsByClassName("desi");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'none';
         //}
         //x = document.getElementsByClassName("cakes");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'block';
         //}
         //x = document.getElementsByClassName("desserts");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'none';
         //}
         //x = document.getElementsByClassName("frozen");
         //for (var i = 0; i < x.length; i++) {
         //    x[i].style.display = 'none';
         //}
         showIndex = 2;
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
         showIndex = 3;
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
         showIndex = 4;
         debugger;
         var x = document.getElementById("filter-masonry");
         x.style.display = 'none';
         var x = document.getElementById("filter-masonry-cakes");
         x.style.display = 'none';
         var x = document.getElementById("filter-masonry-foods");
         x.style.display = 'none';
         var x = document.getElementById("filter-masonry-desserts");
         x.style.display = 'none';
         var x = document.getElementById("filter-masonry-frozen");
         x.style.display = 'block';
     }

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
             data: {'productId': productId},
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
             if(sessionProduct != null)
             {
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
             if(sessionProduct != null)
             {
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

     function ViewDetail(productId)
     {
         detailProductId = productId;
         $.ajax({
             url: '/api/Product/SearchProductByProductId',
             type: 'Get',
             contentType: 'application/json',
             dataType: 'json',
             data: {'productId': productId},
             statusCode: {
                 200: function (data) {
                     var json1 = JSON.parse(data);

                     var imrUrl = json1.PRODUCT[0].PRODUCT_PHOTO;
                     document.getElementById("productDetailImage").src = "" + imrUrl;

                     document.getElementById("productName").innerHTML=json1.PRODUCT[0].NAME;                   
                     document.getElementById("productServes").innerHTML=json1.PRODUCT[0].SERVES;                   
                     document.getElementById("productPrice").innerHTML= "Rs." + json1.PRODUCT[0].PRICE;                   
                     document.getElementById("productDesc").innerHTML=json1.PRODUCT[0].DESCRIPTION;                   
                     document.getElementById("timeReq").innerHTML=json1.PRODUCT[0].TIME_REQUIRED;   
                     document.getElementById("vendorId").innerHTML=json1.PRODUCT[0].VENDOR_ID;  
                     
                     

                 },
                 500: function () {
                 }

             },
             jsonp: 'jsonp'

         });
     }
     function ViewVendorPrfile()
     {
         var vendorId =  document.getElementById("vendorId").innerHTML;
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
     function ViewCakeVendorPrfile()
     {
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


     function ViewCakeDetail(cakeId)
     {
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
         //                $('#cakeTiers').append('<span class="align-left"> Tiers # ' + json1.CAKE_TIERS[i].TIER_ORDER + '| MIN_WEIGHT :' + json1.CAKE_TIERS[i].MIN_WEIGHT + ' MAX_WEIGHT :' + json1.CAKE_TIERS[i].MAX_WEIGHT + '</span><span class="align-left" ></span>');
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
             data: {'cakeId': cakeId},
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

                     document.getElementById("cakeName").innerHTML=json1.CAKE[0].NAME;                   
                     document.getElementById("cakeWeight").innerHTML=json1.CAKE[0].MIN_WEIGHT +"-"+  json1.CAKE[0].MAX_WEIGHT + " Pounds";           
                     //document.getElementById("cakeTiers").innerHTML=json1.CAKE[0].MIN_TIERS +"-"+  json1.CAKE[0].MAX_TIERS;           
                     document.getElementById("cakePrice").innerHTML= "Rs." + json1.CAKE[0].PRICE;                   
                     document.getElementById("cakeDesc").innerHTML = json1.CAKE[0].DESCRIPTION;
                     document.getElementById("cakeVendorId").innerHTML=json1.CAKE[0].VENDOR_ID;  
                     
                     //document.getElementById("timeReq").innerHTML=json1.PRODUCT[0].TIME_REQUIRED;   
                     
                     

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
     function getUserInfo() {
         $.ajax({
             url: 'https://www.googleapis.com/oauth2/v1/userinfo?access_token=' + acToken,
             data: null,
             success: function (resp) {
                 user = resp;
                 console.log(user);
                 console.log(user.name)
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



     $(document).ready(function () {
         var userId = '<%= int.Parse(FoodChapter.SessionManager.GetUserSession()) %>';
         if (userId == "0") {
             //window.location = "home.aspx";
             document.getElementById('liLogout').style.display = "none";
             document.getElementById('lblUsername').innerHTML = "";

         }
         else {
             var uname = '<%= FoodChapter.SessionManager.GetUsernameSession() %>';
             if (uname == "0") {

             }
             else
                 document.getElementById('lblUsername').innerHTML = "Hi " + uname;
             
             document.getElementById('liLogin').style.display = "none";
         }
         //filter work
         
         $(".filterData").change(function () {
             
             if (document.getElementById('tagSearch').value.length > 0) {
                 document.getElementById('chkFoods').checked = false;
                 document.getElementById('chkCakes').checked = false;
                 document.getElementById('chkDesserts').checked = false;
                 document.getElementById('chkFrozen').checked = false;
                 document.getElementById('chkAll').checked = false;
                 searchByTag();
             }

         });

         $(".filterData1").change(function () {

             if (document.getElementById('chkAll').checked) {
                 document.getElementById('chkFoods').checked = false;
                 document.getElementById('chkCakes').checked = false;
                 document.getElementById('chkDesserts').checked = false;
                 document.getElementById('chkFrozen').checked = false;
                 showAll();
             }

         });

         $(".filterData2").change(function () {


             if (document.getElementById('chkFoods').checked) {
                 document.getElementById('chkAll').checked = false;
                 document.getElementById('chkCakes').checked = false;
                 document.getElementById('chkDesserts').checked = false;
                 document.getElementById('chkFrozen').checked = false;
                 //whereClause += "AND FOODS_SPECIALITY = 1 ";
                 showFoods();
             }

         });

         $(".filterData3").change(function () {


             if (document.getElementById('chkCakes').checked) {
                 document.getElementById('chkFoods').checked = false;
                 document.getElementById('chkAll').checked = false;
                 document.getElementById('chkDesserts').checked = false;
                 document.getElementById('chkFrozen').checked = false;
                 //whereClause += "AND CAKES_SPECIALITY = 1 ";
                 showCakes();
             }

         });

         $(".filterData4").change(function () {

             
             if (document.getElementById('chkDesserts').checked) {
                 document.getElementById('chkFoods').checked = false;
                 document.getElementById('chkCakes').checked = false;
                 document.getElementById('chkAll').checked = false;
                 document.getElementById('chkFrozen').checked = false;
                 //whereClause += "AND DESSERTS_SPECIALITY = 1 ";
                 showDesserts();
             }
             
         });

         $(".filterData5").change(function () {


             if (document.getElementById('chkFrozen').checked) {
                 document.getElementById('chkFoods').checked = false;
                 document.getElementById('chkCakes').checked = false;
                 document.getElementById('chkDesserts').checked = false;
                 document.getElementById('chkAll').checked = false;
                 //whereClause += "AND FROZEN_FOODS_SPECIALITY = 1 ";
                 showFrozen();
             }
         });








         //filter work end

         $('#interest_tabs').on('click', 'a[data-toggle="tab"]', function (e) {
             e.preventDefault();

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

         $("#btnViewMore").click(function () {
             ViewMoreItems();
         });
         
         //$(document).ajaxStop(function () {
         //        setTimeout(showAll, 5000)
         //});
         
         document.getElementById("tagSearch").value = "";
         ShowItems();

         $(document).ajaxStop(function () {
             //alert(showindex)
             if (showindex == 0)
                 settimeout(showall, 2000)
         });

         function ViewMoreItems() {
             ShowItems();
             //topCount++;
         }
         function ShowItems() {
             if (showIndex == 1 || showIndex == 0) {
                 $.ajax({
                     url: '/api/Product/GetAllProducts',
                     type: 'Get',
                     contentType: 'application/json',
                     dataType: 'json',
                     data: { 'showCount': foodCount * topCount },
                     statusCode: {
                         200: function (data) {
                             var json1 = JSON.parse(data);
                             debugger;

                             for (var i = 0; i < json1.PRODUCTS.length; i++) {
                                 var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                                 $("#filter-masonry-foods").append('<div class="masonry-grid-foods col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure redfig"><div class="beforeimg"><img id="foodsImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><a>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
                                 $("#foodsImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                             }

                             if (showIndex == 0)
                                 showAll();
                             else
                                 showFoods();
                             foodCount++;
                         },
                         500: function () {
                         }
                     },
                     jsonp: 'jsonp'
                 });
             }
             //$(document).ajaxStop(function () {
                 if (showIndex == 2 || showIndex == 0) {
                     $.ajax({
                         url: '/api/Product/GetAllCakes',
                         type: 'Get',
                         contentType: 'application/json',
                         dataType: 'json',
                         data: { 'showCount': cakeCount * topCount },
                         statusCode: {
                             200: function (data) {
                                 var json1 = JSON.parse(data);
                                 debugger;
                                 //alert(json1.PRODUCTS.length);
                                 for (var i = 0; i < json1.CAKES.length; i++) {
                                     //alert(i);    
                                     var url = json1.CAKES[i].CAKE_PHOTO;
                                     //$("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure"><img id="cakeImage' + json1.CAKES[i].CAKE_ID + '"src="../Assets/images/products/img-01.jpg" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.CAKES[i].NAME + '</h3><span><a>' + 'Rs : ' + json1.CAKES[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewCakeDetail(' + json1.CAKES[i].CAKE_ID + ')" data-toggle="modal" data-target="#cakeModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                                     //$("#cakeImage" + json1.CAKES[i].CAKE_ID).attr("src", url);
                                     $("#filter-masonry-cakes").append('<div class="masonry-grid-cakes col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure redfig"><div class="beforeimg"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src="../Assets/images/products/img-01.jpg" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.CAKES[i].NAME + '</h3><span><a>' + 'Rs : ' + json1.CAKES[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewCakeDetail(' + json1.CAKES[i].CAKE_ID + ')" data-toggle="modal" data-target="#cakeModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
                                     //$("#filter-masonry-cakes").append('<div class="masonry-grid-cakes col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src="../Assets/images/products/img-01.jpg" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.CAKES[i].NAME + '</h3><span><a>' + 'Rs : ' + json1.CAKES[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewCakeDetail(' + json1.CAKES[i].CAKE_ID + ')" data-toggle="modal" data-target="#cakeModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                                     $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);
                                 }
                                 //if (showIndex != 2 && showIndex != 0)
                                 //    hideCakes();

                                 if (showIndex == 0)
                                     showAll();
                                 else
                                     showCakes();
                                 cakeCount++;
                             },
                             500: function () {
                             }
                         },
                         jsonp: 'jsonp'
                     });
                 }
             //});
             //$(document).ajaxStop(function () {
                 if (showIndex == 3 || showIndex == 0) {
                     $.ajax({
                         url: '/api/Product/GetAllDesserts',
                         type: 'Get',
                         contentType: 'application/json',
                         dataType: 'json',
                         data: { 'showCount': dessertCount * topCount },
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

                                     //$("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><a>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                                     //$("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                                     $("#filter-masonry-desserts").append('<div class="masonry-grid-desserts col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure redfig"><div class="beforeimg"><img id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><a>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
                                     //$("#filter-masonry-desserts").append('<div class="masonry-grid-desserts col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure"><img id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><a>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                                     $("#dessertImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                                 }
                                 if (showIndex == 0)
                                     showAll();
                                 else
                                     showDesserts();

                                 //if (showIndex != 3 && showIndex != 0)
                                 //    hideDesserts();
                                 dessertCount++;
                                 //showFoods();
                                 //if (showIndex == 0)
                                 //    showAll();
                             },
                             500: function () {
                             }
                         },
                         jsonp: 'jsonp'
                     });
                 }
             //});
             //$(document).ajaxStop(function () {
                 if (showIndex == 4 || showIndex == 0) {
                     $.ajax({
                         url: '/api/Product/GetAllFrozenFoods',
                         type: 'Get',
                         contentType: 'application/json',
                         dataType: 'json',
                         data: { 'showCount': frozenCount * topCount },
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

                                     //$("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><a>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                                     //$("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                                     $("#filter-masonry-frozen").append('<div class="masonry-grid-frozen col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure redfig"><div class="beforeimg"><img id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><a>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></div></figure></div>');
                                     //$("#filter-masonry-frozen").append('<div class="masonry-grid-frozen col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure"><img id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><a>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</a></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');
                                     $("#frozenImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                                 }
                                 //if (showIndex != 4 && showIndex != 0)
                                 //    hideFrozen();

                                 if (showIndex == 0)
                                     showAll();
                                 else
                                     showFrozen();
                                 frozenCount++;
                             },
                             500: function () {
                             }
                         },
                         jsonp: 'jsonp'
                     });

                 }
             //});
             SetCartCount();
         }
     });

	</script>

       
</head>
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
         
        <li>
            <%--<div class="form-group top-search">
                  <input type="text" class="form-control top-search-feild" placeholder="Search" id="tagSearch1">
                  <i class="fa fa-search top-search-icon" aria-hidden="true" onclick="searchByTag()"></i>
            </div>--%>
        </li>
         <li id="liLogin" class="dropdown"><a href="#" data-toggle="modal" data-target="#myModal" >Login</a></li>
         <li id="liLogout" class="dropdown"><a href="home.aspx" >Logout</a></li>
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
                <div class="col-md-4 mytag">
				<strong class="inner-logo"><a href="home.aspx"><img src="../Assets/images/logo.png" alt="logo"></a></strong>
                <p>The Best Chapter In Your Life</p>
                    </div><!-- col ends here -->
                <nav class="nav-inner">
                    <div class="navbar-header">
                        <a class="side-bar-btn pull-right fa fa-bars" href="#" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"></a>
                        <a class="responsive-logo pull-left" href="index.php"><img src="logo.png" alt="logo"></a>
                        
                    </div>
                     <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul id="nav-list-inner" class="nav-list-inner">
                                    
                                    <li><a href="gallery.aspx">Gallery</a></li>
                                    <li><a href="vendors.aspx">Sellers</a></li>
                                    <li><a href="contact.aspx">contact</a></li> 
                                    <li><a href="#" data-toggle="modal" data-target="#myModal">Register</a></li>
                                    <li><a href="Cart.aspx" id="cartCount"><span class="glyphicon glyphicon-shopping-cart"></span>   </a></li>
                                    <%--<li id="liLogout"><a href="home.aspx">Logout</a></li>--%>      

                                </ul>

                   </div>
                </nav>
            </div>
        </div>
    </header>
    <!-- Header inner -->
    </header>



             <!-- Main Content -->
            <main id="main-contant" class="main-content2">

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
                        <%--<div class="filter-tags-holder">
                            <ul id="tg-filterbale-nav" class="option-set tg-filterbale-nav">
                                <li><a class="selected" href="javascript:void(0)" onclick="showAll();">All</a></li>
                                <li><a href="javascript:void(0)" onclick="showFoods();">Foods</a></li>
                                <li><a href="javascript:void(0)" onclick="showCakes();">Cakes</a></li>
                                <li><a href="javascript:void(0)" onclick="showDesserts();">Desserts</a></li>
                                <li><a href="javascript:void(0)" onclick="showFrozen();">Frozen Foods</a></li>
                                <!-- <li><a data-filter=".jusis" href="#">Juices</a></li-->
                            </ul>
                        </div>--%>
                        <!-- Filter Tags List -->
                        <div class="row">
            <div class="col-md-3 shadow-effect-4 box-shadow-4 box-shadow-6 bg-white">
				            <div class="form-group filter__search">
				                <i class="fa fa-search filter__search-icon" aria-hidden="true"></i>
                                <input type="text" id="tagSearch" class="form-control  filterData" placeholder="Search">
				 
			                </div>
				<aside class="vendor-menu__categories newwide">
                             <div class="js-sticky-element js-vendor-detail-menu-categories" data-sticky-bottom-margin="40" style="">
                                <div class="categories__title">Filter Search</div><img src="../Assets/images/preloader.gif" id="imgload" alt="loading" style="display:none;width:15px;height:15px" />
                                    <ul class="categories__list ">
                                        <li class="categories__list__item"><input type="checkbox" class="mint filterData1" name="chkAll" id="chkAll" />  All </li>
                                        <li class="categories__list__item"><input type="checkbox" class="mint filterData2" id="chkFoods"   />  Foods</li>
                                        <li class="categories__list__item"><input type="checkbox" class="mint filterData3" id="chkCakes"   />  Cakes</li>
                                        <li class="categories__list__item"><input type="checkbox" class="mint filterData4" id="chkDesserts"   />  Deserts</li>
                                        <li class="categories__list__item"><input type="checkbox" class="mint filterData5" id="chkFrozen"   />  Frozen Foods</li>
                            
                                    </ul>
                              </div><!-- Categories Menu -->
                                       
                </aside>


		    </div> <!-- col 3 ends here -->
                        <!-- Gallery Right Section Start Here -->
                      <div class="col-md-9">
                          <!-- Background-color -->
                    <!-- class="bg-white" -->      <div  style="position:relative;">
                        <!-- Menu Grid List -->
                        <div class=" row">
                            <div id="filter-masonry" class="products-grid-list">
                                
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

                              </div> <!-- background color ends here -->


                      </div>
					</div> 

                   
                        </div><!-- Container Ends here -->
                        
                    </div> <!-- Section Padding -->
                     

					<div class="view-more-gallery" id="btnViewMore"><a href="#viewmore" class="view-more">View More</a></div>
                    

                    

					</div>  <!-- foodshop v2 -->
                    <%--</div>--%>
					
                <!-- Online Food Shop v2 -->
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
                <h4 class="modal-title" id="myModalLabel">
                    Login/Registration </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-8" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active modalRL"><a href="#Login1" data-toggle="tab">Login</a></li>
                            <li class="modalRL"><a href="#vendor-Registration" data-toggle="tab">Sellers Registration</a></li>
                             <li class="modalRL"><a href="#user-Registration" data-toggle="tab">User Registration</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Login1">
                                <form role="form" class="form-horizontal" id="formLogin" action="#">
                                    <div class="form-group">
                                        <div class="col-md-2">

                                        </div>
                                        <div class="col-md-8">
                                            <select class="form-control" id="userType">
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
                                    <div class="col-sm-3">
                                        <input type="text" pattern="[0-9]{4}" title="Please enter 4 digit mobile code" class="form-control" id="txtVendorMobile1" placeholder="03.." oninput = "verifyMobileCode()" required="required"/>
                                    </div>
                                    
                                    <div class="col-sm-5">
                                        <input type="text" pattern="[0-9]{7}" title="7 digit mobile contact part" class="form-control" id="txtVendorMobile2" placeholder="768...." required="required"/>
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
                                  <div class="forcake">
                                    <div class="checkboxThree">
                                    <input type="checkbox" value="1" id="chbCakes" name="check" />
                                    <label for="chbCakes"></label>
                                     </div> <!-- new checkbox  -->
                                            <span>Cakes</span>

                                            </div>
                                     <div class="forcake">
                                     <div class="checkboxThree">
                                    <input type="checkbox" value="1" id="chbFoods" name="check" />
                                    <label for="chbFoods"></label>
                                     </div> <!-- new checkbox  -->
                                    <span>Foods</span>

                                            </div>
                                     <div class="forcake">
                                     <div class="checkboxThree">
                                    <input type="checkbox" value="1" id="chbFrozenFoods" name="check" />
                                    <label for="chbFrozenFoods"></label>
                                     </div> <!-- new checkbox  -->
                                    <span>Frozen Foods</span>

                                            </div>
                                     <div class="forcake">
                                     <div class="checkboxThree">
                                    <input type="checkbox" value="1" id="chbDesserts" name="check" />
                                    <label for="chbFoods"></label>
                                     </div> <!-- new checkbox  -->
                                    <span>Desserts</span>

                                            </div>
                                </div>
                                <div class="col-md-2"></div>
                                </div><!-- Form group end here -->
                                 <div class="form-group">
                                <label for="ProfileImage" class="col-md-2 control-label">
                                Photo</label>
                                <div class="col-sm-8">
                                <input class="img-show" type='file' id="imgInp" onchange="readURL(this);" />
                                     <p id="imgaeB64" hidden></p>
                                     <img id="vendorImage" src="" alt="" />
                                </div>
                                <div class="col-md-2"></div>
                                </div><!-- Form group end here -->

                                <div class="form-group" style="margin-top:50px;">
                                    <label for="ProfileImage" class="col-md-2 control-label">
                                    </label>
                                    <div class="col-sm-8">
                                        <label style="color:#DD0000">Enter Code Below:</label> 
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <div class="form-group" style="margin-top:20px;">
                                    <label for="ProfileImage" class="col-md-2 control-label">
                                </label>
                                    <div class="col-sm-8">
                                        <%--<span id="txtCaptchaDiv" style=" margin-top:20px; background-color:#A51D22;color:#FFF;padding:5px"></span>--%>
                                        <canvas id="myCanvas" width="240" height="70" style="border:1px solid #000000; background-color:#9c9d9c"> </canvas>
                                         <button type="button" class="btn upbutton midmar trycaptcha" id="btnFlavour" onclick="CreateVendorCaptcha();" style="margin-left:10px; margin-top:-30px; width:100px; height:30px; font-size:12px;" onclick="CreateNewFlavour();">
                                    Try Another</button>
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                               <div class="form-group">
                                    <label for="ProfileImage" class="col-md-2 control-label">
                                </label>
                                    <div class="col-sm-4">
                                        <input type="text" name="txtInput" id="txtInput" size="15" />
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>

                               
                                <div class="row">
                                    
                                  <div class="col-md-4"></div>
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn pull-right upbutton" >
                                            Register</button> </div>
                                           
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
                                        <input type="email" class="form-control" id="txtUserEmail" placeholder="Email"  required="required" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="mobile" class="col-sm-2 control-label">
                                        Mobile</label>
                                    <div class="col-sm-2">
                                        <input class="form-control" pattern="[0-9]{4}" title="Please enter 4 digit mobile code" id="txtUserMobile1" placeholder="03.." oninput = "verifyUserMobileCode()" required="required" />
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

                                <div class="form-group" style="margin-top:50px;">
                                    <label for="ProfileImage" class="col-md-2 control-label">
                                    </label>
                                    <div class="col-sm-8">
                                        <label style="color:#DD0000">Enter Code Below:</label> 
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <div class="form-group" style="margin-top:20px;">
                                    <label for="ProfileImage" class="col-md-2 control-label">
                                </label>
                                    <div class="col-sm-8">
                                        <%--<span id="txtCaptchaDiv" style=" margin-top:20px; background-color:#A51D22;color:#FFF;padding:5px"></span>--%>
                                        <canvas id="myCanvas1" width="240" height="70" style="border:1px solid #000000; background-color:#9c9d9c"> </canvas>
                                         <button type="button" class="btn upbutton midmar trycaptcha" onclick="CreateUserCaptcha();" style="margin-left:10px; margin-top:-30px; width:100px; height:30px; font-size:12px;" onclick="CreateNewFlavour();">
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
                            OR</div>
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
			
			<!-- Bootstrap Modal -->
			<!-- Product Description modal -->
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

	<!-- Success Message Modal -->
        <div class="modal fade" id="vSuccess" role="dialog" >
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
    
    		<!-- Bootstrap Modal -->










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
<!--  <script type="text/javascript"> 
    $(document).ready(function(){
        $(".vendor-menu__categories").stickySidebar({
            containerSelector: '.js-sticky-element'
        }); 
    });
</script> --> 
<script>
    function myFunction() {
        alert("No products are added yet. Keep Visiting Thank You!");
    }
</script>
    <footer id="footer">
 <div class="container">

                    <!-- Footer Columns -->
                    <div class="footer">
<img src="../Assets/../Assets/../Assets/images/logo.png" width="200px" height="" alt="Food Chapter log" style="margin-bottom: 13px;"><a class="business-info" href="tel://+923453177413">
        <p>Lhr: +92 345 3177413</p></a><a class="business-info" href="tel://+923453177413">
        <p>Pk: +92 345 3177413</p></a><a class="business-info" href="mailto:irfan@xevensolutions.com">
        <p>info@foodchapter.pk</p></a>
      <div class="social-links"><a class="icon-instagram" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="instagram logo"><img src="../Assets/../Assets/../Assets/images/logo-instagram.png" alt="Instagram logo"></a><a class="icon-twitter" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="twitter logo"><img src="../Assets/../Assets/../Assets/images/logo-twitter.png" alt="Twitter logo"></a><a class="icon-facebook" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="facebook logo"><img src="../Assets/../Assets/../Assets/images/logo-facebook.png" alt="Facebook logo"></a><a class="icon-pinterest" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="pinterest logo"><img src="../Assets/../Assets/../Assets/images/logo-pinterest.png" alt="Pinterest logo"></a></div>
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
      <div class="card-icons"><img src="../Assets/../Assets/../Assets/images/cards.png" alt="Accepted payment methods" width="200px"></div>
      <div class="legal">
        <p class="legal__copyright">© 2017 Xeven  Solutions. All rights reserved.&nbsp;<a class="legal__link" href="#" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click t&amp;cs">Privacy policy (Terms &amp; Conditions)</a></p>
      </div>
    </div>
                    <!-- Footer Columns -->

                </div>

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
        
        
            </footer>
            <!-- Footer -->

        </div>

         
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
                $('#imgload3').hide();
                return false;
            });

            $('#formLogin').submit(function () {
                $('#imgload').show();
                funAuthenticate();
                $('#imgload').hide();
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
</script>
</body>
</html>
