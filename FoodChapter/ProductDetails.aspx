<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="productDetails.aspx.cs" Inherits="FoodChapter.productDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style>
        .inquiry {
            display: none;
        }
    </style>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        var maxTime = 0, total = 0, vendorId = -1;
        $(document).ready(function () {
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
        var productId = '<%= FoodChapter.SessionManager.GetViewProductSession() %>';
        var user ='<%= int.Parse(FoodChapter.SessionManager.GetUserSession())%>';
            debugger;
            //HARD CODED 
            window.onload = function () {
                $.ajax({
                    url: '/api/Product/TopRelatedProducts',
                    type: 'Get',
                    contentType: 'application/json',
                    data: JSON.stringify(),
                    dataType: 'json',
                    statusCode: {
                        200: function (data) {
                            var json1 = JSON.parse(data);
                            console.log(json1);
                            for (var i = 0; i < json1.PRODUCTS.length; i++) {
                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                                $("#filter-masonry-foods").append('<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="foodsImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery"></a> <h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="hhover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a> <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span</div></div>');
                                $("#foodsImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                            }
                        },

                        500: function () {

                        }

                    },

                    jsonp: 'jsonp'

                });

                $.ajax({

                    url: '/api/Product/TopRelatedCakes',

                    type: 'Get',

                    contentType: 'application/json',
                    data: JSON.stringify(),
                    dataType: 'json',

                    statusCode: {

                        200: function (data) {

                            var json1 = JSON.parse(data);

                            debugger;

                            //alert(json1.PRODUCTS.length);

                            for (var i = 0; i < json1.CAKES.length; i++) {

                                //alert(i);    

                                var url = json1.CAKES[i].CAKE_PHOTO;

                                $("#filter-masonry-cakes").append('<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12"><a href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src=""' + url + '" class="my_gallery"></a>  <h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs ' + json1.CAKES[i].PRICE + '</span><div class="gallery_overlay"><a class="hhover2" href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"></a>    <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></div></div>');

                                $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);

                            }

                        },

                        500: function () {

                        }

                    },

                    jsonp: 'jsonp'

                });

                debugger;
                $.ajax({

                    url: '/api/Product/SearchProductByProductId',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'productId': productId },
                    statusCode: {
                        200: function (data) {
                            var json1 = JSON.parse(data);
                            var flag = 0;
                            for (var i = 0; i < json1.PRODUCT.length; i++) {
                                flag = 1;
                                var imrUrl = json1.PRODUCT[0].PRODUCT_PHOTO;
                                document.getElementById("cakeDetailImage").src = "" + imrUrl;
                                document.getElementById('PName').innerText = json1.PRODUCT[i].NAME;
                                document.getElementById('catName').innerText = json1.PRODUCT[i].Category;
                                document.getElementById('phone').innerText = json1.PRODUCT[i].PERSONAL_PHONE;
                                document.getElementById('VendorName').innerText = json1.PRODUCT[i].VENDOR_NAME;
                                document.getElementById('Price').innerText = 'Rs:' + json1.PRODUCT[i].PRICE;
                                document.getElementById('desc').innerText = json1.PRODUCT[i].DESCRIPTION;
                                document.getElementById('time').innerText = json1.PRODUCT[i].TIME_REQUIRED + 'hours';
                                document.getElementById('serves').innerText = json1.PRODUCT[i].SERVES;
                                //HIDE CAKE DETAILS DIV
                                $("#cakesspecs").hide();
                                $("#banner").hide();
                                $("#serves").show();
                            }
                            if (flag == 0) {
                                $("#cakesspecs").show();
                                $("#serves").hide();
                                $.ajax({
                                    url: '/api/Product/SearchCakeByCakeId',
                                    type: 'Get',
                                    contentType: 'application/json',
                                    dataType: 'json',
                                    data: { 'cakeId': productId },
                                    statusCode: {
                                        200: function (data) {
                                            var json1 = JSON.parse(data);
                                            console.log(data);
                                            subCatagoryId = 0;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;
                                            var name = json1.CAKE[0].NAME;
                                            //var description = document.getElementById('txtDesc').value;
                                            var timeReq = json1.CAKE[0].ESTIMATED_TIME;
                                            var vendorId = json1.CAKE[0].VENDOR_ID;
                                            var price = json1.CAKE[0].PRICE;
                                            $("#servehide").hide();
                                            var imrUrl = json1.CAKE[0].CAKE_PHOTO;
                                            document.getElementById("cakeDetailImage").src = "" + imrUrl;

                                            document.getElementById("PName").innerHTML = json1.CAKE[0].NAME;
                                            document.getElementById("phone").innerHTML = json1.CAKE[0].PERSONAL_PHONE;
                                            document.getElementById("VendorName").innerHTML = json1.CAKE[0].VENDOR_NAME;
                                            document.getElementById("cakeWeight").innerHTML = json1.CAKE[0].MIN_WEIGHT + " Pounds";
                                            document.getElementById("maxweight").innerHTML = json1.CAKE[0].MAX_WEIGHT + " Pounds";
                                            //document.getElementById("cakeTiers").innerHTML=json1.CAKE[0].MIN_TIERS +"-"+  json1.CAKE[0].MAX_TIERS;           
                                            document.getElementById("Price").innerHTML = "Rs:" + json1.CAKE[0].PRICE;
                                            document.getElementById("desc").innerHTML = json1.CAKE[0].DESCRIPTION;
                                            document.getElementById("tierprice").innerHTML = "RS:" + json1.CAKE[0].ADDITIONAL_PRICE;
                                            //document.getElementById("cakeVendorId").innerHTML = json1.CAKE[0].VENDOR_ID;

                                            document.getElementById("time").innerHTML = json1.CAKE[0].ESTIMATED_TIME + " Hours";



                                        },
                                        500: function () {
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


            }


        });
        function viewDetail(productId) {
            $.ajax({
                url: '/api/Product/SetProductSessionToView',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'productId': productId },
                statusCode: {
                    200: function (response) {
                        window.location = 'ProductDetails.aspx';


                    },
                    500: function () {
                    }

                },
                jsonp: 'jsonp'

            });

        }
        //function addCakeToCart(cakeId) {
        //  //$('#myModal').modal('show');

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
        //  //$('#myModal').modal('show');
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
        //  //$('#myModal').modal('show');

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

        //function addDetailCakeCart() {
        //  addCakeToCart(detailCakeId);
        //}

        //function addDetailCart() {
        //  addToCart(detailProductId);
        //}
        //function showCakes() {

        //  var x = document.getElementById("filter-masonry");

        //  x.style.display = 'none';

        //  var x = document.getElementById("filter-masonry-cakes");

        //  x.style.display = 'block';

        //  var x = document.getElementById("filter-masonry-foods");

        //  x.style.display = 'none';

        //  var x = document.getElementById("filter-masonry-desserts");

        //  x.style.display = 'none';

        //  var x = document.getElementById("filter-masonry-frozen");

        //  x.style.display = 'none';



        //}
        //function showFoods() {
        //  var x = document.getElementById("filter-masonry");
        //  x.style.display = 'none';
        //  var x = document.getElementById("filter-masonry-cakes");
        //  x.style.display = 'none';
        //  var x = document.getElementById("filter-masonry-foods");
        //  x.style.display = 'block';
        //  var x = document.getElementById("filter-masonry-desserts");
        //  x.style.display = 'none';
        //  var x = document.getElementById("filter-masonry-frozen");
        //  x.style.display = 'none';


        //}
        //function navigateToSelect(vendorId) {
        //  debugger;
        //  $.ajax({
        //    url: '/api/Vendors/SetViewVendorSession',
        //    type: 'GET',
        //    contentType: 'application/json',
        //    dataType: 'json',
        //    data: { 'vendorId': vendorId },
        //    statusCode: {
        //      200: function () {
        //        window.location = 'SelectCake.aspx';
        //      },
        //      500: function () {
        //        alert('Error occured. Vendor not available');
        //      }
        //    },
        //    jsonp: 'jsonp'

        //  });

        //}

        function InquiryData() {
            debugger;
            var inquiry = {
                "USER_ID": '<%= int.Parse(FoodChapter.SessionManager.GetUserSession())%>',
          "OBJECT_ID": '<%= FoodChapter.SessionManager.GetViewProductSession() %>',
                "INQUIRY_TYPE_ID": 1
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
                    },
                    500: function (data) {
                        //show message
                    }
                },
                jsonp: 'jsonp'

            });
        }

    </script>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gallery_pg_header_bg_gallery">


        <div class="gallery_bg fade1">
            <div class="seller_heading">

                <h1 style="margin-top: 188px;" class="sellers_pg_heading">Product Details</h1>
            </div>
        </div>
    </div>
    <div class="startcontent">
        <img class="img_right sr_tp m_animate" src="Frontend/images/sellers_bg5.png">
        <img class="img_profile_lside m_animate" src="Frontend/images/sellers_bg2.png">
        <div class="container">

            <div class="pd_wrapper col-md-12">
                <div class="product_img  col-md-6">
                    <div class="p_img">
                        <img id="cakeDetailImage" src="" class="img-responsive" style="width: 500px; float: right;">
                    </div>
                    <div class="p_thumbnail">
                        <img src="Frontend/images/product-thumbnail.png">
                        <img src="Frontend/images/product-thumbnail.png">
                        <img src="Frontend/images/product-thumbnail.png">
                    </div>

                </div>
                <div class="p_desc col-md-6">
                    <h1 class="p_head" id="PName"></h1>
                    <h1 class="p_price" id="Price"></h1>
                    <div class="p_rating">
                        <span class="fa fa-star checked hm_fa_star"></span>
                        <span class="fa fa-star checked hm_fa_star"></span>
                        <span class="fa fa-star checked hm_fa_star"></span>
                        <span class="fa fa-star hm_fa_star"></span>
                        <span class="fa fa-star hm_fa_star"></span>
                    </div>
                    <div class="desc_text">
                        <p id="desc"></p>
                    </div>

                    <div class="p_quantity col-md-2" style="height: 100px;">
                        <input type="text" name="name" value="1" class="quantity_input">
                        <button class="minus-btn" type="button" name="button">
                            <img src="Frontend/images/minus.png" alt="" class="minus_img">
                        </button>
                        <button class="plus-btn" type="button" name="button">
                            <img src="Frontend/images/plus.png" alt="" class="plus_img">
                        </button>
                    </div>
                    <div class="p_addtocart">
                        <%-- <script>                                                      
			" <button type=" + "button" + " class=" + "abovebtn" + " onclick=addToCart(" + json1.PRODUCTS[i].PRODUCT_ID + ")> Add to Cart</button>"
			</script>--%>
                        <button id="inquiry" onclick="InquiryData()">Inquiry</button>
                    </div>

                    <div class="p_tags">
                        <div class="inquiry" style="padding: 30px; background-color: #f4f4f4; border-radius: 10px">
                            <h4 class="p_tags_txt">Phone: <span id="phone"></span></h4>
                        </div>

                        <div class="p_tags">
                            <h4 id="servehide" class="p_tags_txt">Serving: <span id="serves"></span></h4>
                            <h4 class="p_tags_txt">Category: <span id="catName">Cakes</span></h4>
                            <h4 class="p_tags_txt">Time required for preparation: <span id="time"></span></h4>
                            <h4 class="p_tags_txt">Vendor: <span id="VendorName"></span></h4>
                            <div id="cakesspecs" class="p_tags1">
                                <h4 class="p_tags_txt">Min Weight: <span id="cakeWeight"></span></h4>
                                <h4 class="p_tags_txt">Max Weight: <span id="maxweight"></span></h4>
                                <h4 class="p_tags_txt">Additional Price: <span id="tierprice"></span></h4>
                            </div>
                        </div>
                    </div>
                    <div class="product_customize" id="banner">

                        <div class="c_btn_wrap col-md-12 col-sm-12">
                            <a href="javascript:void(0);" onclick="navigateToSelect(vendorId)">
                                <button>
                                    <img src="Frontend/images/customize_btn.png" style="width: 100%; margin-top: 50px; display: none" />

                                </button>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="related_products">
                    <h1 class="prelated_head col-md-12">Related Products</h1>
                    <div class=" row">
                        <div id="filter-masonry" class="products-grid-list">
                        </div>
                        <div id="filter-masonry-foods" class="filter-masonry-foods">
                        </div>
                        <div id="filter-masonry-cakes" class="products-grid-list-cakes">
                        </div>
                        <div id="filter-masonry-desserts" class="products-grid-list-desserts">
                        </div>
                        <div id="filter-masonry-frozen" class="products-grid-list-frozen">
                        </div>
                    </div>
                    <%--	<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12">
							<img src="Frontend/images/gallery_1.png" class="my_gallery">
							
							<h3>Lorium Ipsum</h3>
							<span>Rs 50</span>
							<div class="hm_gallery_overlay">
								<button class="gallery">Add to cart</button>
							</div>
						</div>
						<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12">
							<img src="Frontend/images/gallery_2.png" class="my_gallery">
							
							<h3>Lorium Ipsum</h3>
							<span>Rs 50</span>
							<div class="hm_gallery_overlay">
								<button class="gallery">Add to cart</button>
							</div>
						</div>
						<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12">
							<img src="Frontend/images/gallery_3.png" class="my_gallery">
							
							<h3>Lorium Ipsum</h3>
							<span>Rs 50</span>
							<div class="hm_gallery_overlay">
								<button class="gallery">Add to cart</button>
							</div>
						</div>
						<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12">
							<img src="Frontend/images/gallery_4.png" class="my_gallery">
							
							<h3>Lorium Ipsum</h3>
							<span>Rs 50</span>
							<div class="hm_gallery_overlay">
								<button class="gallery">Add to cart</button>
							</div>
						</div>
					</div>--%>
                </div>
                <%--<img class="img_profile_rside m_animate" src="Frontend/images/sellers_bg3.png">--%>
            </div>
        </div>


        <script>

            $("#inquiry").click(function () {
                $('.inquiry').toggle();
            });

        </script>
</asp:Content>
