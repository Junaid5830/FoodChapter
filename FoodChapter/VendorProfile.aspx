<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="VendorProfile.aspx.cs" Inherits="FoodChapter.VendorProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Frontend/ratings/rating.min.css" />
    <link rel="stylesheet" href="Frontend/ratings/rotate.css" />
    <style>
        .container-fluid1 {
            margin: 0 auto;
            float: none;
            margin-top: 30px;
        }

        .my_gallery_row:hover .hm_gallery_overlay {
            display: block;
        }

        img.my_gallery {
            width: 100%;
        }

        .navbar-inverse {
            background-color: transparent;
            border: none;
        }

            .navbar-inverse .navbar-nav > .active > a, .navbar-inverse .navbar-nav > .active > a:focus, .navbar-inverse .navbar-nav > .active > a:hover {
                background-color: transparent;
            }

        /* Popup container - can be anything you want */
        .popup {
            position: relative;
            display: inline-block;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

            /* The actual popup */
            .popup .popuptext {
                visibility: hidden;
                width: 160px;
                background-color: #555;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 8px 0;
                position: absolute;
                z-index: 1;
                bottom: 125%;
                left: 50%;
                margin-left: -80px;
            }

                /* Popup arrow */
                .popup .popuptext::after {
                    content: "";
                    position: absolute;
                    top: 100%;
                    left: 50%;
                    margin-left: -5px;
                    border-width: 5px;
                    border-style: solid;
                    border-color: #555 transparent transparent transparent;
                }

            /* Toggle this class - hide and show the popup */
            .popup .show {
                visibility: visible;
                -webkit-animation: fadeIn 1s;
                animation: fadeIn 1s;
            }

        /* Add animation (fade in the popup) */
        @-webkit-keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .success-box {
            margin: 50px 0;
            padding: 10px 10px;
            text-align: center;
        }

            .success-box img {
                margin-right: 10px;
                display: inline-block;
                vertical-align: top;
            }

            .success-box > div {
                vertical-align: top;
                display: inline-block;
                color: #888;
            }



        /* Rating Star Widgets Style */
        .rating-stars ul {
            list-style-type: none;
            padding: 0;
            -moz-user-select: none;
            -webkit-user-select: none;
        }

            .rating-stars ul > li.star {
                display: inline-block;
            }

                /* Idle State of the stars */
                .rating-stars ul > li.star > i.fa {
                    font-size: 2.5em; /* Change the size of the stars */
                    color: #ccc; /* Color on idle state */
                }

                /* Hover state of the stars */
                .rating-stars ul > li.star.hover > i.fa {
                    color: #FFCC36;
                }

                /* Selected state of the stars */
                .rating-stars ul > li.star.selected > i.fa {
                    color: #FF912C;
                }
    </style>

    <%--google map api integration--%>
    <%--    <script>
        // Initialize and add the map
        function initMap() {
            // The location of Uluru
            var uluru = { lat: -25.344, lng: 131.036 };
            // The map, centered at Uluru
            var map = new google.maps.Map(
                document.getElementById('map'), { zoom: 4, center: uluru });
            // The marker, positioned at Uluru
            var marker = new google.maps.Marker({ position: uluru, map: map });
        }
    </script>--%>
    <%--<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
    </script>--%>
    <script src="http://maps.google.com/maps/api/js?sensor=false"
        type="text/javascript"></script>
    <script>
        var detailCakeId = 0, detailProductId = 0;
        var cakeShowCount = 0, foodShowCount = 0, frozenShowCount = 0, dessertsShowCount = 0, userRating = 5, userId = 0;
        userId = '<%= int.Parse(FoodChapter.SessionManager.GetUserSession())%>';


        $(document).ready(function () {

            var urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has("id")) {
                $.ajax({
                    url: '/api/Vendors/GetVendorProfileByEntityName',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'entity': urlParams.get("id") },
                    statusCode: {
                        200: function (data) {
                            var json1 = JSON.parse(data);
                            if (json1.VENDOR.length > 0) {
                                vendorId = json1.VENDOR[0].VENDOR_ID;
                                //debugger;
                                loadVendorData(vendorId);
                                ShowVendorReviews();
                                showAll();
                                //ShowVendorRating(vendorId);
                            }
                            else {
                                location.href = "Home.aspx";
                            }
                        },
                        500: function () {
                            location.href = "Home.aspx";

                        }
                    },
                    jsonp: 'jsonp'
                });

            }
            else {
                location.href = "Home.aspx";
            }
            showTopSellers();


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
            $('#saveReview').on('click', function () {

                var catInput = $('#textReview');
                if (catInput.val() !== '') {
                    SaveReview();
                } else {
                    myFunction();
                }
            });

            $(".pricefilter1").change(function () {


                if (document.getElementById('chk1').checked) {

                    document.getElementById('chk2').checked = false;

                    document.getElementById('chk3').checked = false;

                    document.getElementById('chk4').checked = false;

                    filterByPrice(1, vendorId);

                }
                showAll();

            });


            $(".pricefilter2").change(function () {



                if (document.getElementById('chk2').checked) {

                    document.getElementById('chk1').checked = false;

                    document.getElementById('chk3').checked = false;

                    document.getElementById('chk4').checked = false;

                    filterByPrice(2, vendorId);

                }
                showAll();

            });


            $(".pricefilter3").change(function () {



                if (document.getElementById('chk3').checked) {

                    document.getElementById('chk2').checked = false;

                    document.getElementById('chk1').checked = false;

                    document.getElementById('chk4').checked = false;

                    filterByPrice(3, vendorId);

                }

                showAll();
            });


            $(".pricefilter4").change(function () {



                if (document.getElementById('chk4').checked) {

                    document.getElementById('chk2').checked = false;

                    document.getElementById('chk3').checked = false;

                    document.getElementById('chk1').checked = false;

                    filterByPrice(4, vendorId);

                }
                showAll();
            });


            $(".filterData").change(function () {

                debugger;
                if (document.getElementById('tagSearch').value.length > 0) {

                    document.getElementById('chk2').checked = false;

                    document.getElementById('chk3').checked = false;

                    document.getElementById('chk1').checked = false;

                    document.getElementById('chk4').checked = false;



                    searchByTag(vendorId);

                }


            });

            //  $.ajax({
            //      url: '/api/Vendors/GetProductsByVendor',
            //      type: 'Get',
            //      contentType: 'application/json',
            //      dataType: 'json',
            //      data: { 'vendorId': vendorId },
            //      statusCode: {
            //          200: function (data) {
            //              debugger;
            //              var json1 = JSON.parse(data);

            //              for (var i = 0; i < json1.PRODUCTS.length; i++) {

            //                  if (json1.PRODUCTS[i].CATEGORY_ID == 3) {

            //                      var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


            //                      $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

            //                      $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

            //                  }

            //                  else if (json1.PRODUCTS[i].CATEGORY_ID == 4) {

            //                      var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


            //                      $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><img id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

            //                      $("#dessertImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

            //                  }

            //                  else if (json1.PRODUCTS[i].CATEGORY_ID == 5) {

            //                      var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


            //                      $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><img id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

            //                      $("#frozenImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

            //                  }
            //              }


            //              //$.ajax({

            //              //    url: '/api/Vendors/GetVendorCakesByPrice',
            //              //    type: 'Get',
            //              //    contentType: 'application/json',
            //              //    dataType: 'json',
            //              //    data: { 'vendorId': parseInt(vendorId), 'code': priceCode },

            //              //    statusCode: {

            //              //        200: function (data) {

            //              //            var json1 = JSON.parse(data);

            //              //            debugger;

            //              //            //alert(json1.PRODUCTS.length);

            //              //            for (var i = 0; i < json1.CAKES.length; i++) {

            //              //                //alert(i);    

            //              //                var url = json1.CAKES[i].CAKE_PHOTO;

            //              //                $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src=""' + url + '" class="my_gallery"> <h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs ' + json1.CAKES[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover" href="javascript:void(0);" onclick="addToCart(' + json1.CAKES[i].CAKE_ID + ')"></a><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

            //              //                $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);

            //              //            }

            //              //            showAll();

            //              //        },

            //              //        500: function () {

            //              //        }

            //              //    },

            //              //    jsonp: 'jsonp'

            //              //});


            //          }
            //      },
            //      jsonp: 'jsonp'
            //  //});


        });

        function showMarker(address) {

            var map = new google.maps.Map(document.getElementById('map'), {
                mapTypeId: google.maps.MapTypeId.TERRAIN,
                zoom: 6
            });

            var geocoder = new google.maps.Geocoder();

            geocoder.geocode({
                'address': address
            },
                function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        new google.maps.Marker({
                            position: results[0].geometry.location,
                            map: map
                        });
                        map.setCenter(results[0].geometry.location);
                    }
                    else {
                        // Google couldn't geocode this request. Handle appropriately.
                    }
                });
        }

        function searchByTag(vendorId) {

            var tag = document.getElementById("tagSearch").value;

            $.ajax({

                url: '/api/Product/SearchVendorProductByProductTag',

                type: 'Get',

                contentType: 'application/json',

                dataType: 'json',

                data: { 'productTag': tag, 'vendorId': parseInt(vendorId) },

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

                            if (json1.PRODUCTS[i].CATEGORY_ID == 3) {

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                            }

                            else if (json1.PRODUCTS[i].CATEGORY_ID == 5) {

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#dessertImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                            }

                            else if (json1.PRODUCTS[i].CATEGORY_ID == 4) {

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#frozenImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                            }


                        }

                        $.ajax({

                            url: '/api/Product/SearchVendorCakesByCakeTag',

                            type: 'Get',

                            contentType: 'application/json',

                            dataType: 'json',

                            data: { 'cakeTag': tag, 'vendorId': parseInt(vendorId) },

                            statusCode: {

                                200: function (data) {

                                    var json1 = JSON.parse(data);

                                    debugger;

                                    //alert(json1.PRODUCTS.length);

                                    for (var i = 0; i < json1.CAKES.length; i++) {

                                        //alert(i);    

                                        var url = json1.CAKES[i].CAKE_PHOTO;

                                        $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src=""' + url + '" class="my_gallery"> </a><h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs ' + json1.CAKES[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                        $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);

                                    }

                                    showAll();

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

            //document.getElementById("tagSearch").value = "";

        }
        function filterByPrice(priceCode, vendorId) {
            debugger;
            $.ajax({
                url: '/api/Vendors/GetVendorProductsByPrice',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId, 'code': priceCode },
                statusCode: {
                    200: function (data) {
                        debugger;
                        $("#filter-masonry").empty();
                        var json1 = JSON.parse(data);

                        for (var i = 0; i < json1.PRODUCTS.length; i++) {

                            //alert(i);         

                            //var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                            //alert(url);

                            if (json1.PRODUCTS[i].CATEGORY_ID == 3) {

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                            }

                            else if (json1.PRODUCTS[i].CATEGORY_ID == 4) {

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#dessertImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                            }

                            else if (json1.PRODUCTS[i].CATEGORY_ID == 5) {

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#frozenImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                            }
                        }


                        $.ajax({

                            url: '/api/Vendors/GetVendorCakesByPrice',
                            type: 'Get',
                            contentType: 'application/json',
                            dataType: 'json',
                            data: { 'vendorId': parseInt(vendorId), 'code': priceCode },

                            statusCode: {

                                200: function (data) {

                                    var json1 = JSON.parse(data);

                                    debugger;

                                    //alert(json1.PRODUCTS.length);

                                    for (var i = 0; i < json1.CAKES.length; i++) {

                                        //alert(i);    

                                        var url = json1.CAKES[i].CAKE_PHOTO;

                                        $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src=""' + url + '" class="my_gallery"> </a><h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs ' + json1.CAKES[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                        $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);

                                    }

                                    showAll();

                                },

                                500: function () {

                                }

                            },

                            jsonp: 'jsonp'

                        });


                    }
                },
                jsonp: 'jsonp'
            });
        }
        function loadVendorData(vendorId) {
            $.ajax({
                url: '/api/Vendors/GetVendorProfile',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;
                        for (var i = 0; i < json1.VENDOR.length; i++) {
                            document.getElementById('vendorName').innerText = json1.VENDOR[i].BUSINESS_ENTITY_NAME;

                            var imrUrl = json1.VENDOR[i].PROFILE_IMAGE;
                            document.getElementById("vendorProfileImage").src = "" + imrUrl;
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
                            debugger;
                            $('#spDeals1').hide();
                            if (json1.VENDOR[i].FOODS_SPECIALITY == false) {
                                //chbFoods.checked = true;
                                $('#spFooods1').hide();
                            }
                            if (json1.VENDOR[i].CAKES_SPECIALITY == false) {
                                $('#spCakes1').hide();//chbCakes.checked = true;
                            }
                            if (json1.VENDOR[i].FROZEN_FOODS_SPECIALITY == false) {
                                $('#spFrozen1').hide();
                                //chbFrozenFoods.checked = true;
                            }
                            if (json1.VENDOR[i].DESSERTS_SPECIALITY == false) {
                                $('#spDesserts1').hide();//chbDesserts.checked = true;
                            }
                            //if (json1.VENDOR[i].DELIVERY == true) {
                            //    chbDelivery.checked = true;
                            //}

                            showMarker(json1.VENDOR[i].PERSONAL_ADDRESS)


                            document.getElementById("vendorBio").innerHTML = json1.VENDOR[i].DESCRIPTION;

                        }
                    }
                },
                jsonp: 'jsonp'
            });

            //load sub categories 
            $.ajax({
                url: '/api/Product/GetProductSubCatagories',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: {
                    'catagoryId': 3,
                    'vendorId': parseInt(vendorId)
                },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        //debugger;
                        $('#SubCategories').empty();
                        for (var i = 0; i < json1.SUBCATEGORIES.length; i++) {
                            $('#Foodsul').append('<li class="categories__list__item"> <a href="javascript:void(0);" onclick="GetFoods2(' + json1.SUBCATEGORIES[i].ID + ')">' + json1.SUBCATEGORIES[i].NAME + '</a></li>');


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
                data: { 'catagoryId': 4, 'vendorId': parseInt(vendorId) },
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
                data: { 'catagoryId': 5, 'vendorId': parseInt(vendorId) },
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

            //loading vendor products

            GetCakes(vendorId);
            GetFoods(vendorId);
            GetDesserts(vendorId);
            GetFrozenFoods(vendorId);

        }
        function showTopSellers() {
            $.ajax({
                //url: '/api/Vendors/GetAllVendors',
                url: '/api/Vendors/GetFeaturedVendorsforGalleryFilter',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                statusCode: {
                    200: function (response) {
                        var json1 = JSON.parse(response);
                        $('slider').empty();
                        for (var i = 0; i < json1.VENDORS.length; i++) {
                            //$('#detailFlavour').append('<a href="#">' + json1.CAKE_FLAVORS[i].DESCRIPTION + '</a>');
                            $(".ul_sidebar_cat").append('<li class= "sidebar_cat">' + i + 1 + '. <a href="javascript:void(0);" onclick="loadSeller(' + json1.VENDORS[i].VENDOR_ID + ')"><span> ' + json1.VENDORS[i].BUSINESS_ENTITY_NAME + '</span></a></li>');

                        }

                    },
                    500: function () {
                    }

                },
                jsonp: 'jsonp'

            });

        }
        function navigateToSelect(vendorId) {
            debugger;
            $.ajax({
                url: '/api/Vendors/SetViewVendorSession',
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId },
                statusCode: {
                    200: function () {
                        window.location = 'CustomizeCake.aspx';
                    },
                    500: function () {
                        alert('Error occured. Vendor not available');
                    }
                },
                jsonp: 'jsonp'

            });

        }
        //function ShowRating() {
        //    var el = document.querySelector('#el');
        //    var currentRating = 0;
        //    var maxRating = 5;
        //    var callback = function (rating) { alert(rating); };
        //    var myRating = rating(el, currentRating, maxRating, callback);
        //    myRating.setRating(5);
        //}
        function loadSeller(vendorId) {
            debugger;
            //$(".chkseller :checkbox:not(:checked)").attr('disabled', true);
            loadVendorData(vendorId);
        }

        function myFunction() {
            document.getElementById('reviewError').innerHTML = 'Please Add a Review!';
        }

        function SaveReview() {

            var review = document.getElementById('textReview').value;
            console.log(userId);
            if (userId == 0) {
                document.getElementById('reviewError').innerHTML = 'Please Login First to submit your review.';
                document.getElementById('reviewError').style.color = 'red';
            }
            else {
                var vendorReview = {
                    "VENDOR_ID": vendorId,
                    "CUSTOMER_ID": userId,
                    "RATING": userRating,
                    "REVIEW": review
                };
                console.log(vendorReview);
                $.ajax({
                    url: '/api/Vendors/SaveVendorReview',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(vendorReview),
                    statusCode: {
                        200: function (result) {
                            ShowVendorReviews();
                            document.getElementById('textReview').value = "";
                            //showStarsWithRating('el2', 5);
                            document.getElementById('reviewError').innerHTML = 'Your review is saved succesfully. Thank you For your review';
                            document.getElementById('reviewError').style.color = 'green';
                        },
                        401: function (data) {
                            console.log(data);
                            document.getElementById('reviewError').innerHTML = 'Unable to save your review.';
                            document.getElementById('reviewError').style.color = 'red';
                        }
                    }
                });
            }
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
                        $("#showReview").empty();
                        var json2 = JSON.parse(data);
                        console.log(json2);
                        var ratingValue = 0;

                        //ratingValue = json2.VENDOR_REVIEW[0].RATING;
                        for (var i = 0; i < json2.VENDOR_REVIEW.length; i++) {
                            //var ratingValue = json2.VENDOR_REVIEW[i].RATING;

                            var review = '<label style="font-size:20px;">' + (json2.VENDOR_REVIEW[i].NAME || "Anonymous") + '</label><div class="row"><p class="col-md-10" >' + json2.VENDOR_REVIEW[i].REVIEW + '</p><div id="el' + i + json2.VENDOR_REVIEW[i].USER_ID + '" class="col-md-2" style="width:55px;margin-left:100px;color:black;pointer-events:none;"></div></div><hr/>';

                            $("#showReview").append(review);
                            //showStarsWithRating('el' + i + json2.VENDOR_REVIEW[i].USER_ID, ratingValue);

                        }
                    },
                    500: function () {
                    }
                },
            });
        }
        //function ShowRating() {
        //    var el = document.querySelector('#el');
        //    var currentRating = 0;
        //    var maxRating = 5;
        //    var callback = function (rating) { alert(rating); };
        //    var myRating = rating(el, currentRating, maxRating, callback);
        //    myRating.setRating(5);
        //}
        //function showStars(id) {

        //    var el = document.querySelector('#' + id);
        //    var currentRating = 0;
        //    var maxRating = 5;
        //    //var callback = function (rating) { alert(rating); };
        //    var callback = function (rating) { userRating = rating };
        //    var myRating = rating(el, currentRating, maxRating, callback);
        //    myRating.setRating(5);
        //}

        function ShowReview() {
            document.getElementById('addReview').style.display = 'block';
        }

        //function ShowVendorRating(vendorId) {
        //    $.ajax({
        //        url: '/api/Vendors/GetVendorRating',
        //        type: 'Get',
        //        contentType: 'application/json',
        //        dataType: 'json',
        //        data: { 'vendorId': vendorId },
        //        statusCode: {
        //            200: function (data) {
        //                var json2 = JSON.parse(data);
        //                var ratingValue = 0;
        //                if (json2.RATING[0] != null)
        //                    ratingValue = json2.VENDOR_REVIEW[0].RATING;
        //                if (ratingValue == null || ratingValue == 0)
        //                    showStarsWithRating('el3', 5);
        //                else
        //                    showStarsWithRating('el3', ratingValue);
        //            },
        //            500: function () {
        //            }
        //        },
        //    });
        //}


        //function showStarsWithRating(id, ratingValue) {

        //    document.getElementById(id).innerHTML = "";
        //    var el = document.querySelector('#' + id);
        //    var currentRating = ratingValue;
        //    var maxRating = 5;
        //    //var callback = function (rating) { alert(rating); };
        //    var callback = function (rating) { };
        //    //var myRating = rating(el, currentRating, maxRating, callback);
        //    //myRating.setRating(5);
        //}

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
        function showAll() {

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

        //cart region
        //function addCakeToCart(cakeId) {

        //  $('#myModal').modal('show');

        //  debugger;
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

        //          "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,//THIS IS ITEM_TYPE

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


        //function addToCart(productId) {

        //  $('#myModal').modal('show');
        //  debugger;
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

        //cart region end



        //load product data region

        function viewCakeDetail(cakeId) {
            $.ajax({
                url: '/api/Product/SetCakeSessionToView',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'cakeId': cakeId },
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


        //region load list of products
        function GetCakes(vendorId) {
            debugger;
            $.ajax({
                url: '/api/Product/SearchCakeByVendorId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId, 'showCount': cakeShowCount * 12 },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        console.log(json1);
                        if (json1.CAKES.length == 0) {
                            $("#btnCakes").hide();
                        }
                        else {
                            $("#btnCakes").show();
                        }
                        if (cakeShowCount == 0) {
                            $("#filter-masonry-cakes").empty();
                        }
                        for (var i = 0; i < json1.CAKES.length; i++) {
                            debugger;
                            var url = json1.CAKES[i].CAKE_PHOTO;
                            $("#filter-masonry-cakes").append('<div class="my_gallery_row col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"><img class="my_gallery img-responsive" id="cakesImage' + json1.CAKES[i].CAKE_ID + '" src=" ' + url + '" ></a> <h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs ' + json1.CAKES[i].PRICE + '</span><div class=" gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');
                            $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);

                            //$(".my_products_wrapper").append('<div class="my_gallery_row col-lg-4 col-md-3 col-sm-12"><img id="cakeImage' + json1.CAKES[i].CAKE_ID + '"src=""' + url + '" class="my_gallery"> <h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs : ' + json1.CAKES[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')"><button class="gallery">Add to Cart</button>   <span class="fa fa-star profile checked"></span><span class="fa fa-star profile checked"></span><span class="fa fa-star profile checked"></span><span class="fa fa-star profile "></span><span class="fa fa-star profile "></span></a></div></div>');


                            //$("#cakeImage" + json1.CAKES[i].CAKE_ID).attr("src", url);
                        }

                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
            //SetCartCount();
        }

        function GetDesserts(vendorId) {
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
                        if (dessertsShowCount == 0) {
                            $("#filter-masonry-desserts").empty();
                        }

                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                            $("#filter-masonry-desserts").append('<div class="my_gallery_row col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img class="my_gallery img-responsive" id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src="' + url + '"class="my_gallery"></a> <h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"> <a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');
                            $("#dessertImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);


                        }

                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function GetFoods(vendorId) {
            $.ajax({
                url: '/api/Product/SearchProductByVendorId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId, 'showCount': foodShowCount * 12 },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);

                        if (json1.PRODUCTS.length == 0) {
                            $("#btnFoods").hide();
                        }
                        else {
                            $("#btnFoods").show();
                        }
                        if (foodShowCount == 0) {
                            $("#filter-masonry-foods").empty();
                        }
                        for (var i = 0; i < json1.PRODUCTS.length; i++) {

                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                            $("#filter-masonry-foods").append('<div class="my_gallery_row col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img class="my_gallery img-responsive" id="foodsImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src="' + url + '"class="my_gallery"><h3>' + json1.PRODUCTS[i].NAME + '</h3></a><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"> <a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');
                            $("#foodsImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                        }

                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function GetFrozenFoods(vendorId) {
            debugger;
            $.ajax({
                url: '/api/Product/SearchFrozenFoodsByVendorId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId, 'showCount': frozenShowCount * 12 },
                statusCode: {
                    200: function (data) {
                        showCakes();
                        var json1 = JSON.parse(data);
                        debugger;
                        console.log(json1);
                        if (json1.PRODUCTS.length == 0) {
                            $("#btnFrozen").hide();
                        }
                        else {
                            $("#btnFrozen").show();
                        }
                        if (dessertsShowCount == 0) {
                            $("#filter-masonry-frozen").empty();
                        }

                        for (var i = 0; i < json1.PRODUCTS.length; i++) {
                            var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                            $("#filter-masonry-frozen").append('<div class="my_gallery_row col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img class="my_gallery img-responsive" id="foodsImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src="' + url + '"class="my_gallery"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class=" gallery_overlay"> <a class="sm-btn1" href="javascript:void(0);"><a class="phover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');
                            $("#frozenImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                        }
                        $('.pricefilter1').trigger('click');
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
                            $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

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
                            $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                        }
                        //  frozenShowCount++;
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }
          //load product data region end

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gallery_pg_header_bg_profile">

        <div class="gallery_bg fade1">
            <div class="seller_heading">
                <h1 style="margin-top: 188px;" class="sellers_pg_heading">Profile</h1>
            </div>
        </div>
    </div>

    <div class="startcontent">
        <img class="img_right sr_tp m_animate" src="Frontend/images/sellers_bg5.png">
        <img class="img_profile_lside m_animate" src="Frontend/images/sellers_bg2.png">
        <div class="container">
            <div class="p_container_wrap col-md-12">
                <div class="profile_sect1">
                    <div class="pg_wrapper col-md-3">
                        <img style="width: 200px; height: 200px; border-radius: 50%;" id="vendorProfileImage" src="Frontend/images/home_seller2.png" />
                    </div>

                    <div class="sellers_pg_wrapper col-md-6">
                        <h3 id="vendorName" class="n_profile"></h3>
                        <h4 class="spdetails">Email: <span id="vendorEmail"></span></h4>
                        <h4 class="spdetails">Call: <span id="vendorCell"></span></h4>
                        <span class="s_delievery">We serve:</span>
                        <div class="view-detail-div spdetails spbold">
                            <div id="spFooods1" class="viewchain"><span>Foods</span></div>
                            <div id="spCakes1" class="viewchain"><span>Cakes</span></div>
                            <div id="spDeals1" class="viewchain"><span>Deals</span></div>
                            <div id="spDesserts1" class="viewchain"><span>Desserts</span></div>
                            <div id="spFrozen1" class="viewchain"><span>Frozen Foods</span></div>

                        </div>

                    </div>

                    <div class="sellers_pg_wrapper btn_profile col-md-3">

                        <span class="fa fa-star checked sptop"></span>
                        <span class="fa fa-star checked sptop"></span>
                        <span class="fa fa-star checked sptop"></span>
                        <span class="fa fa-star sptop"></span>
                        <span class="fa fa-star sptop"></span>
                        <%--<div class="spbtn">
                        <button>Subscribe</button>
                    </div>--%>
                    </div>
                </div>
                <div class="profile_sect2 col-md-12">
                    <div class="col-md-12">
                        <h3 class="biohead">Our Story</h3>
                        <p class="biotext" id="vendorBio"></p>
                    </div>

                </div>

                <%--     <div class="custom_btn col-md-12">
          <div class="c_btn_wrap col-md-12 col-sm-12">
            <a href="javascript:void(0);" onclick="navigateToSelect(vendorId)">
              <button>
                <img src="Frontend/images/customize_btn.png" style="width: 100%;" />

              </button>
            </a>
          </div>
        </div>--%>

                <div class="profile_sect3 col-md-12">
                    <div class="profile_sect3_wrap col-md-12">
                        <h3 class="p_order">Or order from our</h3>
                        <h2 class="p_order">Menu</h2>
                        <div class="my-content col-md-12">
                            <a data-filter=".desi" href="javascript:void(0)" onclick="showFoods();">Food</a>
                            <a data-filter=".cakes" href="javascript:void(0)" onclick="showCakes();">Cakes</a>
                            <a data-filter=".desserts" href="javascript:void(0)" onclick="showDesserts();">Desserts</a>
                            <a data-filter=".frozen" href="javascript:void(0)" onclick="showFrozen();">Frozen Food</a>
                        </div>
                    </div>
                </div>
                <div class="my_container_section_p">
                    <div class="col-md-3 col-sm-12">
                        <div class="sidebar_wrapper_gallery col-md-12">
                            <div class="wrap">
                                <div class="search">
                                    <input type="text" id="tagSearch" class="searchTerm filterData" placeholder="Search" />
                                    <button type="submit" class="searchButton ">
                                        <img title="search this site" src="Frontend/images/search_black.png" alt="search" />
                                    </button>
                                </div>
                            </div>
                            <h4 class="sidebar_type">Price</h4>
                            <label>
                                <input type="checkbox" class=" pricefilter1" name="chk0" id="chk1" /><span>Any</span></label><br />
                            <label>
                                <input type="checkbox" class=" pricefilter2" id="chk2" /><span>0-500</span></label><br />
                            <label>
                                <input type="checkbox" class=" pricefilter3" id="chk3" /><span>500-1500</span></label><br />
                            <label>
                                <input type="checkbox" class=" pricefilter4" id="chk4" /><span>>1500</span></label><br />

                        </div>
                    </div>


                    <div class="my_content_products col-md-9 col-sm-12">
                        <div id="filter-masonry" class="products-grid-list">
                        </div>
                        <div id="filter-masonry-foods" class="filter-masonry-foods">
                        </div>
                        <div id="filter-masonry-cakes" class="products-grid-list-cakes">
                        </div>
                        <div id="filter-masonry-desserts" class="products-grid-list-desserts">
                        </div>
                        <div id="filter-masonry-frozen" class="products-grid-list-frozen">
                            <%--<div class="col-md-12" style="text-align: center; width: 100%; float: left; margin-top: 30px;">
                            <div class="view-more-gallery">
                                <a href="javascript:void(0);" id="btnCakes" class="view-more">
                                    <button class="gallery">View More</button></a>
                            </div>
                        </div>--%>
                        </div>

                    </div>



                    <div class="profile_sect4 col-md-12">
                        <div class="profile_sect4_wrap col-md-12">
                            <div class="rev_heading col-md-9 col-sm-6">
                                <h2>Reviews</h2>
                            </div>
                            <%--  <div class="p_proceed_checkout col-md-3 col-sm-6">
                                <a href="javascript:void(0);" onclick="ShowReview();" id="btnAddReview">
                                    <button>WRITE A REVIEW</button></a>

                            </div>--%>
                        </div>

                        <div class="profile_review_body col-md-12" id="addReview">
                            <div class="row col-md-12">
                                <div class="col-md-12">
                                    <textarea class="profile_review_body form-control " style="height: 200px; border: none !important; border-bottom: 1px dashed #ccc !important; font-family: 'Quicksand',sans-serif; height: 34px !important; box-shadow: none;"
                                        placeholder="Write Review Here" id="textReview" rows="5" required="required"></textarea>
                                </div>
                                <section class='rating-widget'>
                                    <div class="rev_heading col-md-3">
                                        <h2>Ratings</h2>
                                    </div>
                                    <!-- Rating Stars Box -->
                                    <div class='rating-stars text-center col-md-6' style="margin-top: 70px;">
                                        <ul id='stars'>
                                            <li class='star' title='Poor' data-value='1'>
                                                <i class='fa fa-star fa-fw'></i>
                                            </li>
                                            <li class='star' title='Fair' data-value='2'>
                                                <i class='fa fa-star fa-fw'></i>
                                            </li>
                                            <li class='star' title='Good' data-value='3'>
                                                <i class='fa fa-star fa-fw'></i>
                                            </li>
                                            <li class='star' title='Excellent' data-value='4'>
                                                <i class='fa fa-star fa-fw'></i>
                                            </li>
                                            <li class='star' title='WOW!!!' data-value='5'>
                                                <i class='fa fa-star fa-fw'></i>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class='success-box col-md-12'>
                                        <div class='clearfix'></div>
                                        <i id="tick" style="color: #3fd53f; font-size: 25px;" class="fa fa-check check"></i>

                                        <div class='text-message'></div>
                                        <div class='clearfix'></div>
                                    </div>



                                </section>
                                <%-- <div id="el2" class="col-md-2" style="width:55px;margin-left:100px;color:black;">
                                                    <script>showStars('el2');</script>
                                                </div>--%>
                            </div>
                            <div class="col-md-offset-10" style="position: relative; top: -90px;">
                                <a href="javascript:void(0);" id="saveReview" class="p_proceed_checkout">
                                    <button>SAVE</button></a>
                            </div>
                            <label id="reviewError"></label>
                            <%--<hr style="border-top: 1px dashed #ccc !important">--%>
                        </div>
                        <div id="showReview">
                            <label style="font-size: 20px;"></label>
                            <div class="row">
                                <p class="col-md-10"></p>
                                <%-- <div id="el1" class="col-md-2" style="width: 55px; margin-left: 100px; color: red;">
                                        <script>showStars('el1');</script>
                                    </div>--%>
                            </div>
                        </div>


                    </div>
                </div>
            </div>



            <img class="img_profile_rside m_animate" src="Frontend/images/sellers_bg3.png">
        </div>

        <img class="img_profile_lside2 m_animate" src="Frontend/images/sellers_bg4.png">

        <img src="Frontend/images/Profile_03.png" class="mappic img-responsive" />
        <!--The div element for the map -->
        <div id="map">
        </div>
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

                                        <a href="Cart.aspx">
                                            <button class="rmodal_btn rm_1" style="width: 45%;">Go to Cart</button></a>
                                        <a href="javascript:void(0);">
                                            <button class="rmodal_btn" style="float: right" id="btnHungry">Still Hungry!</button></a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var myContentSection = $('.my-content > a');
            myContentSection.click(function () {
                debugger;
                myContentSection.removeClass('active');
                $(this).addClass('active');
            });
            $(document).ready(function () {

                $("#tick").hide();

                $('#stars li').on('mouseover', function () {
                    var onStar = parseInt($(this).data('value'), 10);

                    $(this).parent().children('li.star').each(function (e) {
                        if (e < onStar) {
                            $(this).addClass('hover');
                        }
                        else {
                            $(this).removeClass('hover');
                        }
                    });

                }).on('mouseout', function () {

                    $(this).parent().children('li.star').each(function (e) {
                        $(this).removeClass('hover');
                    });
                });


                /* 2. Action to perform on click */
                $('#stars li').on('click', function () {
                    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
                    var stars = $(this).parent().children('li.star');

                    for (i = 0; i < stars.length; i++) {
                        $(stars[i]).removeClass('selected');
                    }

                    for (i = 0; i < onStar; i++) {
                        $(stars[i]).addClass('selected');
                    }
                    $("#tick").show();
                    // JUST RESPONSE (Not needed)
                    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
                    var msg = "";
                    if (ratingValue > 1) {
                        msg = "Thanks! You rated this " + ratingValue + " stars.";
                    }
                    else {
                        msg = "We will improve ourselves. You rated this " + ratingValue + " stars.";
                    }
                    responseMessage(msg);

                });


            });


            function responseMessage(msg) {

                $('.success-box').fadeIn(200);
                $('.success-box div.text-message').html("<span>" + msg + "</span>");
            }
        </script>
</asp:Content>
