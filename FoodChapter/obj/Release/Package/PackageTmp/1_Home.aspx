<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="1_Home.aspx.cs" Inherits="FoodChapter._1_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        #navbar a.active {
            color: white;
            padding-left: 0px;
            padding-right: 0px;
            padding-bottom: 0px;
            background: transparent;
            border-bottom: 1px dashed white;
        }

        .slider {
            width: 100%;
            margin: 0 auto;
        }

        .cat_img3 span, .cat_img1 span {
            -webkit-transition: -webkit-transform .6s ease-in-out;
            -ms-transition: -ms-transform .6s ease-in-out;
            transition: transform .6s ease-in-out;
        }

            .cat_img3 span:hover, .cat_img1 span:hover {
                transform: rotateY(360deg);
                -ms-transform: rotateY(360deg);
                -webkit-transform: rotateY(360deg);
                background-color: #aa6902;
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
    <title>Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Page Body--%>
    <div class="slideshow-container">

        <img src="Frontend/images/slider_v1.png" class="slider-img1 sm" />
        <img src="Frontend/images/slider_v2.png" class="slider-img2 sm" />
        <img src="Frontend/images/slider_v3.png" class="slider-img3 sm" />
        <img src="Frontend/images/slider_v4.png" class="slider-img4 sm" />
        <img src="Frontend/images/slider_v5.png" class="slider-img5 sm" />
        <img src="Frontend/images/slider_v6.png" class="slider-img6 sm" />
        <img src="Frontend/images/slider_v7.png" class="slider-img7 sm" />

        <div class="mySlides fade1 block">
            <img src="Frontend/images/banner.jpg" style="width: 100%" class="rslide img-parallax" data-speed="-1">
        </div>

        <div class="mySlides fade1">
            <img src="Frontend/images/banner2.jpg" style="width: 100%" class="rslide img-parallax" data-speed="-1">
        </div>
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>

    </div>
    <div class="startcontent">
        <img class="img_right sr_tp m_animate" src="Frontend/images/bg_1.png">
        <img class="img_left m_animate" src="Frontend/images/bg_2.png">

        <div class="container">
            <div class="my_content_wrapper">
                <div class="content">
                    <div class="my_content_cat col-sm-12">
                        <div class="my_content_wrap">
                            <h2 class="home_h2 red_heading">Take a look at our</h2>
                            <a href="2_gallery.aspx">
                                <div class="cat_img1 col-md-4 col-sm-4">
                                    <span>Food
                                        <br>
                                        Store</span>
                                    <img src="Frontend/images/foodstore_tile_bg.png" style="width: 100%;">
                                </div>
                            </a>
                            <a href="3_Vendors.aspx">
                                <div class="cat_img1 col-md-4 cat_center col-sm-4">
                                    <span>Sellers</span>
                                    <img src="Frontend/images/sellers_tile_bg.png" style="width: 100%;">
                                </div>
                            </a>
                            <a href="3_Vendors.aspx">
                                <div class="cat_img3 col-md-4 col-sm-4">
                                    <span>Caterers</span>
                                    <img src="Frontend/images/caterers_tile_bg.png" style="width: 100%;">
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="my-content-section col-md-12 col-sm-12">
                        <h3 class="home_h3">Discover the taste of</h3>
                        <h2 class="home_h2">Homemade Food</h2>
                        <div class="my-content col-md-12">
                            <a class="selected active" data-filter="" href="javascript:void(0)" onclick="showAll();">All</a>
                            <a data-filter=".desi" href="javascript:void(0)" onclick="showFoods();">Foods</a>
                            <a data-filter=".cakes" href="javascript:void(0)" onclick="showCakes();">Cakes</a>
                            <a data-filter=".desserts" href="javascript:void(0)" onclick="showDesserts();">Desserts</a>
                            <a data-filter=".frozen" href="javascript:void(0)" onclick="showFrozen();">Frozen Foods</a>
                        </div>

                        <div class="my_content_products col-md-12 col-sm-12">

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

                            <%--<div class="hm_view_more col-md-12" style="text-align: center;">
              <a href="2_gallery.aspx"><button class="gallery">View more</button></a>
            </div>--%>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <img class="img_right  bottom sr_tp m_animate" src="Frontend/images/bg_3.png">
    </div>
    <div class="seller-section">
        <div class="my-sellers-section col-lg-12 col-md-12 col-sm-12" style="background-image: url('Frontend/images/seller_bg.png');">
            <div class="my-sellers">
                <div class="my_sellers_wrapper">
                    <img src="Frontend/images/sellers_v1.png" alt="img" class="s_img">
                    <img src="Frontend/images/seller_v2.png" alt="img" class="s_img_1">
                    <img src="Frontend/images/slider_v4.png" alt="img" class="s_img_2">
                    <img src="Frontend/images/seller_v4.png" alt="img" class="s_img_3">
                    <img src="Frontend/images/dots.png" alt="img" class="s_img_4 featured_sellers_transition">
                    <h3>Let the best Chefs & Bakers </h3>
                    <h2>from Pakistan serve you</h2>
                </div>
                <div class="home_seller_wrapper">

                    <div class="slider1">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="marketing_set">
        <img src="Frontend/images/marketing_section.png" class="img-responsive" style="width: auto; margin: 0 auto;">
    </div>




    <img class="hm_btmleft m_animate" src="Frontend/images/bg_4.png">
    <%--FrontEnd Scripts--%>

    <div class="container">
        <div class="modal fade" id="myModal" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title rmodal_head">Added to Cart!
                        
                        </h4>
                    </div>
                    <div class="modal-body  modal-body2">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-8 col-md-offset-2" style="margin-bottom: 10px;">

                                    <a href="http://foodchapter.pk/5_cart.aspx">
                                        <button class="rmodal_btn rm_1" style="width: 45%;">Go to Cart</button></a>
                                    <a href="javascript:void(0);">
                                        <button class="rmodal_btn" style="float: right;" id="btnHungry">Still Hungry!</button></a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script>

    $(document).ready(function () {
      if ($(window).width() < 767) {
        $('.slider').slick({
          slidesToShow: 1,
          slidesToScroll: 1,
          dots: true,
          infinite: true,
          cssEase: 'linear',


        });
      }
      else {
        $('.slider').slick({
          slidesToShow: 3,
          slidesToScroll: 1,
          dots: true,
          infinite: true,
          cssEase: 'linear',
        });
      }

      $("#btnHungry").click(function () {

          $("#myModal").modal('hide');
      });
    });

    function sliderScripts()
    {
      if ($(window).width() < 767) {
        $('.slider').slick({
          slidesToShow: 1,
          slidesToScroll: 1,
          dots: true,
          infinite: true,
          cssEase: 'linear',


        });
      }
      else {
        $('.slider').slick({
          slidesToShow: 3,
          slidesToScroll: 1,
          dots: true,
          infinite: true,
          cssEase: 'linear',
        });
      }

      var slideIndex = 1;
      showSlides(slideIndex);

      function plusSlides(n) {
        showSlides(slideIndex += n);
      }

      function currentSlide(n) {
        showSlides(slideIndex = n);
      }

    }


  </script>

  <script>
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
      showSlides(slideIndex += n);
    }

    function currentSlide(n) {
      showSlides(slideIndex = n);
    }

    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      if (n > slides.length) { slideIndex = 1 }
      if (n < 1) { slideIndex = slides.length }
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex - 1].style.display = "block";
      dots[slideIndex - 1].className += " active";
    }
  </script>

    <%--Backend script from HomePage--%>
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

                                $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desi"><figure class="product-figure"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Place Order</a></div></div> </div></div></figure></div>');
                                $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                            }
                            else if (json1.PRODUCTS[i].CATAGORY_ID == 2) {
                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                                $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 frozen"><figure class="product-figure"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Place Order</a></div></div> </div></div></figure></div>');
                                $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                            }
                            else if (json1.PRODUCTS[i].CATAGORY_ID == 3) {
                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                                $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 desserts"><figure class="product-figure"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Place Order</a></div></div> </div></div></figure></div>');
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
                                        $("#filter-masonry").append('<div class="masonry-grid col-lg-4 col-sm-4 col-xs-6 cakes"><figure class="product-figure"><img id="cakeImage' + json1.CAKES[i].CAKE_ID + '"src="../Assets/images/products/img-01.jpg" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.CAKES[i].NAME + '</h3><span><del>' + 'Rs ' + json1.CAKES[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);"><a class="hhover" href="javascript:void(0);" onclick="addToCart(' + json1.CAKES[i].CAKE_ID + ')"></a><a class="hhover2" href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div> </div></div></figure></div>');
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
                        $('.slider1').empty();
                        for (var i = 0; i < json1.VENDORS.length; i++) {
                            //$('#detailFlavour').append('<a href="#">' + json1.CAKE_FLAVORS[i].DESCRIPTION + '</a>');
                             $(".slider1").append('<div class="col-md-2 col-sm-5 my_bg_sell"><a href="javascript:void(0);" onclick="ViewCall(' + json1.VENDORS[i].VENDOR_ID + ')"><img class="img-responsive" src=' + json1.VENDORS[i].PROFILE_IMAGE + '></a><a href="javascript:void(0);" onclick="ViewCall(' + json1.VENDORS[i].VENDOR_ID + ')"><p>' + json1.VENDORS[i].BUSINESS_ENTITY_NAME + '</p></a><a href="javascript:void(0);" onclick="ViewCall(' + json1.VENDORS[i].VENDOR_ID + ')"><div class="tr1"><span class="fa fa-star checked hm_fa_star"></span><span class="fa fa-star checked hm_fa_star"></span><span class="fa fa-star checked hm_fa_star"></span><span class="fa fa-star checked hm_fa_star"></span><span class="fa fa-star hm_fa_star"></span></div></a></div>');
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

        function addCakeToCart(cakeId) {
            $('#myModal').modal('show');

            $.ajax({
                url: '/api/Product/SearchCakeByCakeId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'cakeId': cakeId },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        subCatagoryId = 1;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;
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

        function addToCart2(productId) {
            $('#myModal').modal('show');
            $.ajax({
                url: '/api/Product/SearchProductByProductId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'productId': productId },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);

                        subCatagoryId = 2;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;
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
        function addToCart(productId) {

            $('#myModal').modal('show');
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


                        subCatagoryId = 2;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;

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

                            "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,//THIS IS ITEM TYPE

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




    function ViewCall(vendorId) {
      $.ajax({
        url: '/api/Vendors/GetVendorProfile',
        type: 'Get',
        contentType: 'application/json',
        dataType: 'json',
        data: { 'vendorId': vendorId },
        statusCode: {
          200: function (data) {
            debugger;
            var json1 = JSON.parse(data);
            if (json1.VENDOR.length > 0) {
              var id = json1.VENDOR[0].UNIQUE_ID;
              window.location = "8_VendorProfile.aspx?id=" + id;
            }
          }
        },
        jsonp: 'jsonp'
      });
    }
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


        Storage.prototype.setObj = function (key, obj) {
            key = 'fc' + key;
            return this.setItem(key, JSON.stringify(obj))
        };

        Storage.prototype.getObj = function (key) {
            key = 'fc' + key;
            return JSON.parse(this.getItem(key))
        };

        function SetCartCount() {
            document.getElementById('cartCount').innerHTML = '<img title="" src="Frontend/images/cart.png" alt="cart" /> ' + getCartCount();

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
                        var url = 'productDetails.aspx';
                        window.location = url;
                        //var imrUrl = json1.PRODUCT[0].PRODUCT_PHOTO;
                        //document.getElementById("productDetailImage").src = "" + imrUrl;

                        //document.getElementById("productName").innerHTML = json1.PRODUCT[0].NAME;
                        //document.getElementById("productServes").innerHTML = json1.PRODUCT[0].SERVES;
                        //document.getElementById("productPrice").innerHTML = "Rs." + json1.PRODUCT[0].PRICE;
                        //document.getElementById("productDesc").innerHTML = json1.PRODUCT[0].DESCRIPTION;
                        //document.getElementById("timeReq").innerHTML = json1.PRODUCT[0].TIME_REQUIRED;
                        //document.getElementById("vendorId").innerHTML = json1.PRODUCT[0].VENDOR_ID;



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
                        $(".filter-masonry-foods").append('<div class="my_gallery_row col-lg-3 col-md-4 col-sm-6"><img class="my_home_img img-responsive" id="foodsImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class=" hm_gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="hhover" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a><a class="hhover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');
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
                        //alert(url);
                        $("#filter-masonry-cakes").append('<div class="my_gallery_row col-lg-3 col-md-4 col-sm-6"><img class="my_home_img img-responsive" id="cakesImage' + json1.CAKES[i].CAKE_ID + '" src="" ' + url + '" ><h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs ' + json1.CAKES[i].PRICE + '</span><div class=" hm_gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="hhover" href="javascript:void(0);" onclick="addToCart(' + json1.CAKES[i].CAKE_ID + ')"></a><a class="hhover2" href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');
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
                        $("#filter-masonry-frozen").append('<div class="my_gallery_row col-lg-3 col-md-4 col-sm-6"><img class="my_home_img img-responsive"  id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class=" hm_gallery_overlay"> <a class="sm-btn1" href="javascript:void(0);"><a class="hhover" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a><a class="hhover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');
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
                        $("#filter-masonry-desserts").append('<div class="my_gallery_row col-lg-3 col-md-4 col-sm-6"><img class="my_home_img img-responsive" id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class=" hm_gallery_overlay"> <a class="sm-btn1" href="javascript:void(0);"><a class="hhover" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a><a class="hhover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');
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
        $(document).ready(function () {
            showTopSellers();
            showAll();

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

</asp:Content>
