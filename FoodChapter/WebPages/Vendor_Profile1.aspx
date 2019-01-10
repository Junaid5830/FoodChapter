<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vendor_Profile1.aspx.cs" Inherits="FoodChapter.WebPages.gallery" %>

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
    <script>
        
</script>
 <script>

     function showFoods()
     {
         var x = document.getElementsByClassName("desi");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'block';
         }
         x = document.getElementsByClassName("cakes");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
         x = document.getElementsByClassName("desserts");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
         x = document.getElementsByClassName("frozen");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
         
     }

     function showAll()
     {
         var x = document.getElementsByClassName("desi");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'block';
         }
         x = document.getElementsByClassName("cakes");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'block';
         }
         x = document.getElementsByClassName("desserts");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'block';
         }
         x = document.getElementsByClassName("frozen");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'block';
         }
     }

     function showCakes()
     {
         var x = document.getElementsByClassName("desi");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
         x = document.getElementsByClassName("cakes");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'block';
         }
         x = document.getElementsByClassName("desserts");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
         x = document.getElementsByClassName("frozen");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
     }

     function showDesserts()
     {
         var x = document.getElementsByClassName("desi");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
         x = document.getElementsByClassName("cakes");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
         x = document.getElementsByClassName("desserts");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'block';
         }
         x = document.getElementsByClassName("frozen");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
     }

     function showFrozen()
     {
         var x = document.getElementsByClassName("desi");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
         x = document.getElementsByClassName("cakes");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
         x = document.getElementsByClassName("desserts");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'none';
         }
         x = document.getElementsByClassName("frozen");
         for(var i = 0; i < x.length; i++)
         {
             x[i].style.display = 'block';
         }
     }

     $(document).ready(function () {
         $(".view-more-gallery").click(function () {
             $(".view-more-hide").show();
         });

         vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
     });

     var detailCakeId = 0, detailProductId = 0;
     function SetCartCount()
     {
         document.getElementById('cartCount').innerHTML = '<span class="glyphicon glyphicon-shopping-cart"></span>' + getCartCount();            
     }

     function getCartCount()
     {
         var cartCount = 0;
         for (var i = 1; i <= localStorage.length; i++) {
             var sessionProduct = JSON.parse(localStorage.getObj(i));
             if (sessionProduct != null) {
                 cartCount++;
             }
         }
         return cartCount;
     }

     function addDetailCakeCart()
     {
         addCakeToCart(detailCakeId);
     }

     function addDetailCart()
     {
         addToCart(detailProductId);
     }

     function addCakeToCart(cakeId)
     {

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

     function IsProductAlreadyExist(product) {
         for (var i = 1; i <= localStorage.length; i++) {
             var sessionProduct = JSON.parse(localStorage.getObj(i));
             //alert(sessionProduct.NAME);
             if (sessionProduct.NAME == product.NAME) {
                 return true;
             }
         }
         return false;
     }


     function UpdateQuantity(product) {
         for (var i = 1; i <= localStorage.length; i++) {
             var sessionProduct = JSON.parse(localStorage.getObj(i));
             if (sessionProduct.NAME == product.NAME) {
                 sessionProduct.QTY = sessionProduct.QTY + 1;
                 localStorage.setObj(i, JSON.stringify(sessionProduct));
                 i = localStorage.length;
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
                     document.getElementById("productDetailImage").src = "../UploadedFiles/" + imrUrl;

                     document.getElementById("productName").innerHTML=json1.PRODUCT[0].NAME;                   
                     document.getElementById("productServes").innerHTML=json1.PRODUCT[0].SERVES;                   
                     document.getElementById("productPrice").innerHTML= "Rs." + json1.PRODUCT[0].PRICE;                   
                     document.getElementById("productDesc").innerHTML=json1.PRODUCT[0].DESCRIPTION;                   
                     document.getElementById("timeReq").innerHTML=json1.PRODUCT[0].TIME_REQUIRED;   
                     
                     

                 },
                 500: function () {
                 }

             },
             jsonp: 'jsonp'

         });
     }

     function ViewCakeDetail(cakeId)
     {
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
                     document.getElementById("cakeDetailImage").src = "../UploadedFiles/" + imrUrl;

                     document.getElementById("cakeName").innerHTML=json1.CAKE[0].NAME;                   
                     document.getElementById("cakeWeight").innerHTML=json1.CAKE[0].MIN_WEIGHT +"-"+  json1.CAKE[0].MAX_WEIGHT + " Pounds";           
                     document.getElementById("cakeTiers").innerHTML=json1.CAKE[0].MIN_TIERS +"-"+  json1.CAKE[0].MAX_TIERS;           
                     document.getElementById("cakePrice").innerHTML= "Rs." + json1.CAKE[0].PRICE;                   
                     document.getElementById("productDesc").innerHTML=json1.CAKE[0].DESCRIPTION;                  
                     //document.getElementById("timeReq").innerHTML=json1.PRODUCT[0].TIME_REQUIRED;   
                     
                     

                 },
                 500: function () {
                 }

             },
             jsonp: 'jsonp'

         });
     }

     $(document).ready(function () {
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

         //var vendorId = 1;

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
                         document.getElementById('vendorName').innerText = json1.VENDOR[i].FIRST_NAME;
                         document.getElementById('vendorModalLabel').innerText = json1.VENDOR[i].FIRST_NAME;
                         
                         var imrUrl = json1.VENDOR[i].PROFILE_IMAGE;
                         document.getElementById("vendorProfileImage").src = "" + imrUrl;
                         document.getElementById("vendorModalImage").src = "" + imrUrl;
                         document.getElementById('vendorModalEmail').innerHTML = json1.VENDOR[i].EMAIL;
                         document.getElementById("vendorModalCell").innerHTML = json1.VENDOR[i].PERSONAL_PHONE;

                         var spFoods = document.getElementById("spFooods");
                         var spCakes = document.getElementById("spCakes");
                         var spDeals = document.getElementById("spDeals");
                         var spDesserts = document.getElementById("spDesserts");
                         var spFrozen = document.getElementById("spFrozen");
                        
                         //document.getElementById("txtPassword").value = json1.VENDOR[i].PASSWORD;
                         document.getElementById("vendorBio").innerHTML  = json1.VENDOR[i].DESCRIPTION;
                         //if (json1.VENDOR[i].FOODS_SPECIALITY == true) {
                         //    chbFoods.checked = true;
                         //}
                         if (json1.VENDOR[i].FOODS_SPECIALITY == true) {
                             spFoods.style.display = 'block';
                         }
                         else
                         {
                             spFoods.style.display = 'none';
                         }

                         if (json1.VENDOR[i].FROZEN_FOODS_SPECIALITY == true) {
                             spFrozen.style.display = 'block';
                         }
                         else
                         {
                             spFrozen.style.display = 'none';
                         }

                         if (json1.VENDOR[i].DEALS_SPECIALITY == true) {
                             spDeals.style.display = 'block';
                         }
                         else
                         {
                             spDeals.style.display = 'none';
                         }

                         if (json1.VENDOR[i].DESSERTS_SPECIALITY == true) {
                             spDesserts.style.display = 'block';
                         }
                         else
                         {
                             spDesserts.style.display = 'none';
                         }

                         if (json1.VENDOR[i].CAKES_SPECIALITY == true) {
                             spCakes.style.display = 'block';
                         }
                         else
                         {
                             spCakes.style.display = 'none';
                         }
                         
                         //var url = json1.VENDOR[i].PROFILE_IMAGE;
                       
                         //$("#vendorImage").attr("src", "../UploadedFiles/" + url).width(150).height(200);
                    
                     }
                 }
             },
             jsonp: 'jsonp'
         });

         $.ajax({
             url: '/api/Product/SearchProductByVendorId',
             type: 'Get',
             contentType: 'application/json',
             dataType: 'json',
             data: {'vendorId': vendorId},
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

                         $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desi"><figure class="product-figure"><img id="productImage'+json1.PRODUCTS[i].PRODUCT_ID+'" src="../UploadedFiles/"' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table theme-border"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>'+'Rs : '+json1.PRODUCTS[i].PRICE+'</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Place Order</a></div></div> </div></div></figure></div>');
                         $("#productImage"+json1.PRODUCTS[i].PRODUCT_ID).attr("src", "../UploadedFiles/" + url);

                     }
                     
                     $.ajax({
                         url: '/api/Product/SearchFrozenFoodsByVendorId',
                         type: 'Get',
                         contentType: 'application/json',
                         dataType: 'json',
                         data: {'vendorId': vendorId},
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

                                     $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 frozen"><figure class="product-figure"><img id="productImage'+json1.PRODUCTS[i].PRODUCT_ID+'" src="../UploadedFiles/"' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table theme-border"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>'+'Rs : '+json1.PRODUCTS[i].PRICE+'</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Place Order</a></div></div> </div></div></figure></div>');
                                     $("#productImage"+json1.PRODUCTS[i].PRODUCT_ID).attr("src", "../UploadedFiles/" + url);

                                 }
                             },
                             500: function () {
                             }
                         },
                         jsonp: 'jsonp'
                     });

                     $.ajax({
                         url: '/api/Product/SearchDessertsByVendorId',
                         type: 'Get',
                         contentType: 'application/json',
                         dataType: 'json',
                         data: {'vendorId': vendorId},
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

                                     $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desserts"><figure class="product-figure"><img id="productImage'+json1.PRODUCTS[i].PRODUCT_ID+'" src="../UploadedFiles/"' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table theme-border"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>'+'Rs : '+json1.PRODUCTS[i].PRICE+'</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Place Order</a></div></div> </div></div></figure></div>');
                                     $("#productImage"+json1.PRODUCTS[i].PRODUCT_ID).attr("src", "../UploadedFiles/" + url);

                                 }
                             },
                             500: function () {
                             }
                         },
                         jsonp: 'jsonp'
                     });

                     SetCartCount();
                     $.ajax({
                         url: '/api/Product/SearchCakeByVendorId',
                         type: 'Get',
                         contentType: 'application/json',
                         dataType: 'json',
                         data: {'vendorId': vendorId},
                         statusCode: {
                             200: function (data) {
                                 var json1 = JSON.parse(data);
                                 debugger;
                                 //alert(json1.PRODUCTS.length);
                                 for (var i = 0; i < json1.CAKES.length; i++) {
                                     //alert(i);    
                                     var url = json1.CAKES[i].CAKE_PHOTO;                                     
                                     $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 cakes"><figure class="product-figure"><img id="cakeImage'+json1.CAKES[i].CAKE_ID+'"src="../Assets/images/products/img-01.jpg" alt="img-01"><div class="overlay"><div class="tg-display-table theme-border"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.CAKES[i].NAME + '</h3><span><del>'+'Rs : '+json1.CAKES[i].PRICE+'</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewCakeDetail(' + json1.CAKES[i].CAKE_ID + ')" data-toggle="modal" data-target="#cakeModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')">Place Order</a></div></div> </div></div></figure></div>');
                                     $("#cakeImage"+json1.CAKES[i].CAKE_ID).attr("src", "../UploadedFiles/" + url);
                                 }
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

     });

	</script>

       
</head>
<body id="home">
      <!-- Preloader -->
       div id="preloader">
            <div id="status">
                <img src="../Assets/../Assets/images/load1.gif" alt="preloader">
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
                <strong class="inner-logo"><a href="index.php"><img src="../Assets/../Assets/images/logo.png" alt="logo"></a></strong>
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
                                    <li><a href="#" data-toggle="modal" data-target="#myModal" >Register</a></li> 
                                    <li><a href="Cart.aspx" id="cartCount"><span class="glyphicon glyphicon-shopping-cart"></span>   </a></li>
                                          

                                </ul>

                   </div>
                </nav>
            </div>
        </div>
    </header>
    <!-- Header inner -->
    </header>



            <section class="parallax-window inerr-banner newbg" data-parallax="scroll">
		
<div class="theme-border-holder">
            <div class="shadow-effect-2 box-shadow-2">
			<div class="theme-border-2 shadow-effect box-shadow theme-border">
            <div class="shadow-effect-3 box-shadow-3">
				<div class="inner-banner-heading">
					<div class="heading-holder">
						<img id="vendorProfileImage" src="../Assets/images/products/img-01.jpg" alt="img-01"/>
						<div class="details-holder">
							<h4 id="vendorName"></h4>
							<div class="profile-category">Category: Hotal &amp; Restuarent</div>
							<div class="view-detail-div"><a href="" data-toggle="modal" data-target="#detailModal" class="view-detail">View profile</a></div>
							

					</div>
				</div>
			</div>
            </div> <!-- Shadow effect 3 -->
            
		</div>
        </div> <!-- Shadow 2 effect -->
	</section>
             <!-- Main Content -->
            <main id="main-contant">



                <!-- Online Food Shop v2 -->
                <div class="home-gallery-background">
				  <div class="section-padding gallery-mask">
                    <div class="container">

                        <!-- Main Heading -->
                        
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
                               <%-- <div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desi">
                                    <figure class="product-figure">
                                        <img src="../Assets/images/products/img-01.jpg" alt="img-01">
                                        <div class="overlay">
                                            <div class="tg-display-table theme-border">
                                                <div class="tg-display-table-cell">
                                                    <div class="product-detail">
                                                        <h3>Volestias Swanti</h3>
                                                        <span><del>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
                                                        <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal">View Detail</a>
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
                                                        <span><del>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
												       <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal">View Detail</a>
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
                                        <img src="../Assets/images/products/img-03.jpg" alt="img-03">
                                        <div class="overlay">
                                            <div class="tg-display-table theme-border">
                                                <div class="tg-display-table-cell">
                                                    <div class="product-detail">
                                                        <h3>Volestias Swanti</h3>
                                                        <span><del>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
                                                        <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal">View Detail</a>
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
                                        <img src="../Assets/images/products/img-04.jpg" alt="img-04">
                                        <div class="overlay">
                                            <div class="tg-display-table theme-border">
                                                <div class="tg-display-table-cell">
                                                    <div class="product-detail">
                                                        <h3>Volestias Swanti</h3>
                                                        <span><del>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
                                                        <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal">View Detail</a>
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
                                        <img src="../Assets/images/products/img-05.jpg" alt="img-05">
                                        <div class="overlay">
                                            <div class="tg-display-table theme-border">
                                                <div class="tg-display-table-cell">
                                                    <div class="product-detail">
                                                        <h3>Volestias Swanti</h3>
                                                        <span><del>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
                                                        <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal">View Detail</a>
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
                                                        <span><del>$10.37</del> $12.00</span>
                                                    </div>
													<div class="gallery-button">
                                                        <a class="sm-btn1" href="#" data-toggle="modal" data-target="#productModal">View Detail</a>
														<a class="sm-btn1" href="placeorder.php">Place Order</a>
												    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </div>--%>
                                <!-- Product Figure -->
                            </div>
                        </div>
                        <!-- Menu Grid List -->
					</div>

                   
                        </div>
                        <!-- Menu Grid List -->
                    </div>
                     

					<div class="view-more-gallery"><a href="#viewmore" class="view-more">View More</a></div>
                     

                    

					</div>
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
                            <li class="modalRL"><a href="#vendor-Registration" data-toggle="tab">Seller Registration</a></li>
                             <li class="modalRL"><a href="#user-Registration" data-toggle="tab">User Registration</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Login1">
                                <form role="form" class="form-horizontal" id="formLogin">
                                    <div class="form-group">
                                        <div class="col-md-2">

                                        </div>
                                        <div class="col-md-8">
                                            <select class="form-control" id="userType">
                                                <%--<option value="0">Please Select</option>--%>
                                                <option value="2">Foodies</option>
                                                <option value="3">Sellers</option>
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
                                        <a style="color: #ff8c93 !important;" class="forget pull-right" href="javascript:;">Forgot your password?</a>
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
                               <!-- <select multiple name="Multiselect" id="multi">
                                             <option value="volvo">Foods</option>
                                             <option value="saab">Cakes</option>
                                              <option value="opel">Frozen Foods</option>
                                             <option value="audi">Deals</option>
                                             </select> -->

                                            <input type="checkbox" name="vehicle" id="chbCakes" value="Cakes" checked class="mint" /> Cakes
                                            <input type="checkbox" name="vehicle" id="chbFoods" value="Foods"  class="mint" /> Foods
                                            <input type="checkbox" name="vehicle" id="chbFrozenFoods" value="frozen Foods"  class="mint" /> Frozen Foods
                                            <input type="checkbox" name="vehicle" id="chbDesserts" value="Desserts"  class="mint" /> Desserts
                                            <%--<input type="checkbox" name="vehicle" id="chbDeals" value="Deals"  class="mint" /> Deals--%>
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
                                     <div class="col-md-6 col-sm-6 mycustom"><a href=""><i class="fa fa-facebook-square" aria-hidden="true"></i></a></div>
                                <div class="col-md-6 col-sm-6 mycustom"><a href=""><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></div>
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


    <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg detailm">
        <div class="modal-content">
            <div class="modal-header ">
                <h4 class="modal-title uptitle" id="vendorModalLabel"><i class="fa fa-times pull-right mean" data-dismiss="modal" aria-hidden="true"></i></h4>
            </div>
            <div class="modal-body">
               <div class="info-block" id="infoTag">
							<div class="row">
							<div class="col-md-3">
							<img id="vendorModalImage" src="../Assets/images/products/img-01.jpg" alt="img-01"/>
							</div>
							<div class="col-md-8">
							<div class="row" style="margin-left:100px;">
							<div class="col-md-12 vendor-detail-up">
								
								<h5>Email:</h5><span><a href="mailto:tahirabbaskhan@gmail.com" id="vendorModalEmail">tahirabbaskhan@gmail.com</a></span> 
								</div>
								<div class="col-md-12 vendor-detail-up">
								<h5>Cell: </h5><span><a href="telto:0300-000-0001" id="vendorModalCell">0300-000-0001</a></span>
								</div>
								<div class="col-md-12 tick">
								<h5>Speciality:</h5>
								<div class="col-md-4">
								          <div id="spFooods"><i class="fa fa-check" aria-hidden="true" ></i><span>Foods</span></div>
								          <div id="spCakes"><i class="fa fa-check" aria-hidden="true" ></i><span>Cakes</span></div>
								          <div id="spDeals"><i class="fa fa-check" aria-hidden="true" ></i><span>Deals</span></div>
								          <div id="spDesserts"><i class="fa fa-check" aria-hidden="true" ></i><span>Desserts</span></div>
								          <div id="spFrozen"><i class="fa fa-check" aria-hidden="true" ></i><span>Frozen Foods</span></div>
								          
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
								<div class="col-md-12"><h5>Biography:</h5>
								<p id="vendorBio">
									
								</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
								</div>



								</div> <!-- inner row ends here -->
								</div>
							</div> <!-- row ends here -->
                                <button type="button" class="btn pull-button upbutton pull-right" data-dismiss="modal">CLOSE ME</button>

						</div><!-- infoTag ends here -->
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
												<span id="productName"></span>
												<div style="margin-top:10px;">
													<a href="#" class="profile-btn">Vendor Profile</a>
												</div>
												<div style="margin-top:10px;"><span class="align-left">Serves: </span><span class="align-left" id="productServes"></span></div>
												<div>
												<div style="margin-top:10px;"><span class="align-left">Time Required: </span><span class="align-left" id="timeReq"></span></div>												    
												</div>
												
												<span class="modal-order-btn">
													<span class=""id="productPrice"></span>
													<a href="javascript:void(0);" onclick="addDetailCart()" class="sm-btn11">Order</a>
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
													<a href="#" class="profile-btn">Vendor Profile</a>
												</div>
												<div><span class="align-left">Weight: </span><span class="align-left" id="cakeWeight"></span></div>
												<div>
												<div class="dropdown">
                                                  <button class="dropbtn">Flavour</button>
                                                        <div class="dropdown-content">
                                                         <a href="#">staberry</a>
                                                         <a href="#">vanilla</a>
                                                        <a href="#">chocalte</a>
                                                        </div>
                                                </div>
												</div>
												<div style="margin-top:10px;">
													<div><span class="align-left">Tiers: </span><span class="align-left" id="cakeTiers"></span></div>

												</div>
												<span class="modal-order-btn">
													<span class=""id="cakePrice"></span>
													<a href="javascript:void(0);" onclick="addDetailCakeCart()" class="sm-btn11">Order</a>
												</span>
												<div>
													<span id="">Description: </span><span id="caketDesc"></span>
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
        
        
        <script>
           
            </footer>
            <!-- Footer -->

        </div>
</body>
</html>
