<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Vendors.aspx.cs" Inherits="FoodChapter.Vendors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Vendors</title>
    <style>
        .navbar-inverse {
            background-color: transparent;
            border: none;
        }

            .navbar-inverse .navbar-nav > .active > a, .navbar-inverse .navbar-nav > .active > a:focus, .navbar-inverse .navbar-nav > .active > a:hover {
                background-color: transparent;
            }

        .container-fluid1 {
            margin: 0 auto;
            float: none;
            margin-top: 30px;
        }

        .sellers_container {
            min-height: 1200px;
        }
    </style>
    <script>
        var page = 1;

        $(window).scroll(function () {
            if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                console.log(++page);
                //$("body").append('<div class="big-box"><h1>Page ' + page + '</h1></div>');
                var data = {
                    "all": true,
                    "key": document.getElementById('txtSearch').value,
                    "delivery": document.getElementById('chkDelivered').checked,
                    "cake": document.getElementById('chkCakes').checked,
                    "food": document.getElementById('chkFoods').checked,
                    "dessert": document.getElementById('chkDesserts').checked,
                    "frozen": document.getElementById('chkFrozen').checked,
                    "page": page


                };
                LoadVendorData(data);
            }
        });
        $(document).ready(function () {
            //SetCartCount();
            $(document).ajaxStop(function () {

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
            var data1 = {
                "all": true,
                "key": '',
                "delivery": false,
                "cake": false,
                "food": false,
                "dessert": false,
                "frozen": false,
                "page": page


            };
            debugger;
            LoadVendorData(data1);
            $(".filterData").change(function () {
                page = 1;
                var data = {
                    "all": true,
                    "key": document.getElementById('txtSearch').value,
                    "delivery": document.getElementById('chkDelivered').checked,
                    "cake": document.getElementById('chkCakes').checked,
                    "food": document.getElementById('chkFoods').checked,
                    "dessert": document.getElementById('chkDesserts').checked,
                    "frozen": document.getElementById('chkFrozen').checked,
                    "page": page


                };

                LoadVendorData(data);
            });

        });

        function Inquiry(vendorId) {
            var inquiry = {
                "USER_ID": '<%= int.Parse(FoodChapter.SessionManager.GetUserSession())%>',
                   "OBJECT_ID": vendorId,
                   "INQUIRY_TYPE_ID": 2
               };
               debugger;
               $.ajax({
                   url: '/api/Vendors/SaveInquiry',
                   type: 'Post',
                   contentType: 'application/json',
                   dataType: 'json',
                   data: JSON.stringify(inquiry),
                   statusCode: {
                       200: function (data) {
                           //show message
                       },
                       500: function (data) {
                           //show message
                       }
                   },
                   jsonp: 'jsonp'

               });
           }
           function getWhereClause(delv) {
               var data = {
                   "all": true,
                   "key": document.getElementById('txtSearch').value,
                   "delivery": document.getElementById('chkDelivered').checked,
                   "cake": document.getElementById('chkCakes').checked,
                   "food": document.getElementById('chkFoods').checked,
                   "dessert": document.getElementById('chkDesserts').checked,
                   "frozen": document.getElementById('chkFrozen').checked,
                   "page": page


               };
               LoadVendorData(data);
           }
           //function SetCartCount() {
           //  document.getElementById('cartCount').innerHTML = '<img title="" src="Frontend/images/cart.png" alt="cart" /> ' + getCartCount();

           //}

           //function getCartCount() {
           //  var cartCount = 0;
           //  for (var i = 1; i <= localStorage.length; i++) {
           //    var sessionProduct = JSON.parse(localStorage.getObj(i));
           //    if (sessionProduct != null) {
           //      cartCount++;
           //    }
           //  }
           //  return cartCount;
           //}
           //function addCakeToCart(cakeId) {
           //  $('#myModal').modal('show');

           //  $.ajax({
           //    url: '/api/Product/SearchCakeByCakeId',
           //    type: 'Get',
           //    contentType: 'application/json',
           //    dataType: 'json',
           //    data: { 'cakeId': cakeId },
           //    statusCode: {
           //      200: function (data) {
           //        var json1 = JSON.parse(data);
           //        subCatagoryId = 1;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;
           //        var name = json1.CAKE[0].NAME;
           //        //var description = document.getElementById('txtDesc').value;
           //        var timeReq = json1.CAKE[0].ESTIMATED_TIME;
           //        var vendorId = json1.CAKE[0].VENDOR_ID;
           //        var price = json1.CAKE[0].PRICE;
           //        var images = json1.CAKE[0].CAKE_PHOTO;
           //        var product = {
           //          "PRODUCT_ID": cakeId,
           //          "IS_CAKE": 1,
           //          "NAME": name,
           //          "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,
           //          "VENDOR_ID": vendorId,
           //          "TIME_REQUIRED": timeReq,
           //          //"SIZE": size,
           //          "PRICE": price,
           //          "QTY": 1,
           //          "CAKE_PHOTO": images
           //          //"DESCRIPTION": description
           //        };
           //        //
           //        var count = localStorage.length;
           //        count = count + 1;
           //        if (IsProductAlreadyExist(product) == true) {
           //          UpdateQuantity(product)
           //        }
           //        else {
           //          localStorage.setObj(count, JSON.stringify(product));
           //        }
           //        SetCartCount();
           //      },
           //      500: function () {
           //      }

           //    },
           //    jsonp: 'jsonp'

           //  });
           //}
           //function addToCart2(productId) {
           //  $('#myModal').modal('show');
           //  $.ajax({
           //    url: '/api/Product/SearchProductByProductId',
           //    type: 'Get',
           //    contentType: 'application/json',
           //    dataType: 'json',
           //    data: { 'productId': productId },
           //    statusCode: {
           //      200: function (data) {
           //        var json1 = JSON.parse(data);

           //        subCatagoryId = 2;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;
           //        var name = json1.PRODUCT[0].NAME;
           //        //var description = document.getElementById('txtDesc').value;
           //        var timeReq = json1.PRODUCT[0].TIME_REQUIRED;
           //        var vendorId = json1.PRODUCT[0].VENDOR_ID;
           //        var price = json1.PRODUCT[0].PRICE;
           //        var images = json1.PRODUCT[0].PRODUCT_PHOTO;
           //        var product = {
           //          "PRODUCT_ID": productId,
           //          "IS_CAKE": 0,
           //          "NAME": name,
           //          "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,
           //          "VENDOR_ID": vendorId,
           //          "TIME_REQUIRED": timeReq,
           //          //"SIZE": size,
           //          "PRICE": price,
           //          "QTY": 1,
           //          "PRODUCT_PHOTO": images
           //          //"DESCRIPTION": description
           //        };
           //        //

           //        var count = localStorage.length;
           //        count = count + 1;
           //        debugger
           //        if (IsProductAlreadyExist(product) == true) {
           //          UpdateQuantity(product)
           //        }
           //        else {
           //          localStorage.setObj(count, JSON.stringify(product));
           //        }
           //        SetCartCount();
           //      },
           //      500: function () {
           //      }

           //    },
           //    jsonp: 'jsonp'

           //  });

           //}
           //function addToCart(productId) {
           //  debugger;
           //  $('#myModal').modal('show');

           //  $.ajax({

           //    url: '/api/Product/SearchProductByProductId',

           //    type: 'Get',

           //    contentType: 'application/json',

           //    dataType: 'json',

           //    data: { 'productId': productId },

           //    statusCode: {

           //      200: function (data) {

           //        var json1 = JSON.parse(data);


           //        subCatagoryId = 2;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;

           //        var name = json1.PRODUCT[0].NAME;

           //        //var description = document.getElementById('txtDesc').value;

           //        var timeReq = json1.PRODUCT[0].TIME_REQUIRED;

           //        var vendorId = json1.PRODUCT[0].VENDOR_ID;

           //        var price = json1.PRODUCT[0].PRICE;

           //        var images = json1.PRODUCT[0].PRODUCT_PHOTO;

           //        var product = {

           //          "PRODUCT_ID": productId,

           //          "IS_CAKE": 0,

           //          "NAME": name,

           //          "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,//THIS IS ITEM TYPE

           //          "VENDOR_ID": vendorId,

           //          "TIME_REQUIRED": timeReq,

           //          //"SIZE": size,

           //          "PRICE": price,

           //          "QTY": 1,

           //          "PRODUCT_PHOTO": images

           //          //"DESCRIPTION": description

           //        };

           //        //


           //        var count = localStorage.length;

           //        count = count + 1;

           //        debugger

           //        if (IsProductAlreadyExist(product) == true) {

           //          UpdateQuantity(product)

           //        }

           //        else {

           //          localStorage.setObj(count, JSON.stringify(product));

           //        }

           //        SetCartCount();

           //      },

           //      500: function () {

           //      }


           //    },

           //    jsonp: 'jsonp'


           //  });


           //}
           //function IsProductAlreadyExist(product) {

           //  for (var i = 1; i <= localStorage.length; i++) {

           //    var sessionProduct = JSON.parse(localStorage.getObj(i));

           //    if (sessionProduct != null) {

           //      //alert(sessionProduct.NAME);

           //      if (sessionProduct.NAME == product.NAME) {

           //        return true;

           //      }

           //    }

           //  }

           //  return false;

           //}

           //function UpdateQuantity(product) {

           //  for (var i = 1; i <= localStorage.length; i++) {

           //    var sessionProduct = JSON.parse(localStorage.getObj(i));

           //    if (sessionProduct != null) {

           //      if (sessionProduct.NAME == product.NAME) {

           //        sessionProduct.QTY = sessionProduct.QTY + 1;

           //        localStorage.setObj(i, JSON.stringify(sessionProduct));

           //        i = localStorage.length;

           //      }

           //    }

           //  }

           //}

           //Storage.prototype.setObj = function (key, obj) {
           //  key = 'fc' + key;
           //  return this.setItem(key, JSON.stringify(obj))
           //};

           //Storage.prototype.getObj = function (key) {
           //  key = 'fc' + key;
           //  return JSON.parse(this.getItem(key))
           //};
           function ViewCall(vendorId) {
               $.ajax({
                   url: '/api/Vendors/GetVendorProfile',
                   type: 'Get',
                   contentType: 'application/json',
                   dataType: 'json',
                   data: { 'vendorId': vendorId },
                   statusCode: {
                       200: function (data) {
                           var json1 = JSON.parse(data);
                           if (json1.VENDOR.length > 0) {
                               var id = json1.VENDOR[0].BUSINESS_ENTITY_NAME;
                               window.location = "VendorProfile.aspx?id=" + id;
                           }
                       }
                   },
                   jsonp: 'jsonp'
               });
           }

           function LoadVendorData(whereClause) {

               $.ajax({
                   url: '/api/Vendors/getVendorOrderAndProduct',
                   type: 'Post',
                   contentType: 'application/json',
                   dataType: 'json',
                   data: JSON.stringify(whereClause),
                   statusCode: {
                       200: function (data) {

                           if (page == 1)
                               $('.my_sellers_pg').remove();

                           var json1 = JSON.parse(data);
                           console.log(json1);
                           if (json1.VENDORS.length == 0) {
                               page--;
                           }
                           else {
                               $('#preloader').show();

                               setTimeout(function () {
                                   $('#preloader').hide();

                                   for (var i = 0; i < json1.VENDORS.length; i++) {
                                       var dataCategories = " ";
                                       if (json1.VENDORS[i].FOODS_SPECIALITY == true) {
                                           dataCategories += "Foods,";
                                       }
                                       if (json1.VENDORS[i].CAKES_SPECIALITY == true) {
                                           dataCategories += "Cakes,";
                                       }
                                       if (json1.VENDORS[i].FROZEN_FOODS_SPECIALITY == true) {
                                           dataCategories += "Frozen Foods,";
                                       }
                                       if (json1.VENDORS[i].DEALS_SPECIALITY == true) {
                                           dataCategories += "Deals,";
                                       }
                                       if (json1.VENDORS[i].DESSERTS_SPECIALITY == true) {
                                           dataCategories += "Desserts";
                                       }

                                       dataCategories = dataCategories.slice(0, dataCategories.length - 1);
                                       //alert(dataCategories);
                                       var deliveryImage = "";
                                       var delv;
                                       if (json1.VENDORS[i].DELIVERY == true) {
                                           delv = 1;
                                           deliveryImage = "../Assets/images/img/deliver.png";
                                       }
                                       else {
                                           delv = 0;
                                           deliveryImage = "../Assets/images/img/no.png";

                                       }

                                       var orders = json1.VENDORS[i].VENDOR_ORDERS;
                                       var items = json1.VENDORS[i].VENDOR_ITEMS;


                                       $(".sellers_container").append('<div class="my_sellers_pg col-md-12"><div class="sellers_pg_wrapper col-md-2"><a href="javascript:void(0);" onclick="ViewCall(' + json1.VENDORS[i].VENDOR_ID + ')"><img style="width:100px; height:100px;border-radius:50%;" src=' + json1.VENDORS[i].PROFILE_IMAGE + '></div></a><div class="sellers_pg_wrapper col-md-7"><h3  class="seller_name"><a href="javascript:void(0);" onclick="ViewCall(' + json1.VENDORS[i].VENDOR_ID + ')">' + json1.VENDORS[i].BUSINESS_ENTITY_NAME + '</a></h3><h4 class="seller_info">Category: ' + dataCategories + '</h4><h4 class="seller_info">Orders Delivered: <span id="orders">' + json1.VENDORS[i].VENDOR_ORDERS + '</span>  &nbsp;|  Items: <span id="items">' + json1.VENDORS[i].VENDOR_ITEMS + '</span> |<a href="javascript:void(0);" onclick="getWhereClause(' + delv + ')"></a><span class="s_delievery"> Delivery: Yes</span></h4></div><div class="sellers_pg_wrapp col-md-3"><a href="javascript:void(0);"  class="sm-btn111" onclick="ViewCall(' + json1.VENDORS[i].VENDOR_ID + ')"><button class="s_view_profile" onclick="Inquiry(' + json1.VENDORS[i].VENDOR_ID + ')">View Profile</button></a><a href="javascript:void(0);" class="sm-btn111" onclick="ViewCall(' + json1.VENDORS[i].VENDOR_ID + ')"> <button id="btnInquriy" class="s_read_more onclick="Inquiry(' + json1.VENDORS[i].VENDOR_ID + ')">SEE MENU</button></a></div></div>');

                                   }
                               }, 1000);
                           }

                           $('#imgload').hide();
                       },
                       500: function () {
                       }
                   },
                   jsonp: 'jsonp'
               });
           }

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="gallery_pg_header_bg_sellers">


        <div class="seller_bg fade1">
            <div class="seller_heading">
                <h2 style="margin-top: 170px;" class="sellers_pg_heading">Meet our Professionals</h2>
                <h1 style="margin-bottom: -120px;" class="sellers_pg_heading">Our Top Sellers</h1>
            </div>
        </div>


    </div>

    <div class="startcontent">
        <img class="img_right sr_tp m_animate" src="Frontend/images/sellers_bg5.png">
        <img class="sellers_left1 m_animate" src="Frontend/images/sellers_bg2.png">
        <div class="container">
            <div class="my_container_section">
                <div class="container_wrapper">
                    <div class="my_sidebar col-md-3 col-sm-12">
                        <div class="sidebar_wrapper col-md-12">
                            <div class="wrap">
                                <div class="search">
                                    <input type="text" id="txtSearch" class="searchTerm filterData" placeholder="Search">
                                    <button type="submit" class="searchButton ">
                                        <img title="search this site" src="Frontend/images/search_black.png" alt="search" />
                                    </button>
                                </div>
                            </div>
                            <h4 class="sidebar_type">Type</h4>

                            <label>
                                <input type="checkbox" class="mint filterData " name="chkDelivered" id="chkAll" /><span>All</span></label><br />
                            <label>
                                <input type="checkbox" class="mint filterData" name="chkDelivered" id="chkDelivered" /><span>Delivery</span></label><br />
                            <label>
                                <input type="checkbox" name="chkDelivered" id="chkFoods" class="mint filterData" /><span>Food</span></label><br />
                            <label>
                                <input type="checkbox" name="chkDelivered" id="chkCakes" class="mint filterData" /><span>Cakes</span></label><br />
                            <label>
                                <input type="checkbox" name="chkDelivered" id="chkDesserts" class="mint filterData" /><span>Desserts</span></label><br />
                            <label>
                                <input type="checkbox" name="chkDelivered" id="chkFrozen" class="mint filterData" /><span>Frozen Food</span></label><br />

                        </div>
                    </div>
                    <div class="sellers_container col-md-9 col-sm-12">
                    </div>
                    <img id="preloader" style="position: relative; left: 273px; width: 200px; display: none" src="Frontend/images/Preloader_FoodChapter.gif" alt="Alternate Text" />
                </div>
            </div>
        </div>

        <img class="sellers_right2 m_animate" src="Frontend/images/sellers_bg7.png" />
        <img class="sellers_left2 m_animate" src="Frontend/images/sellers_bg4.png" />
</asp:Content>
