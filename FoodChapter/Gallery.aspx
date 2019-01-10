<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="FoodChapter.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
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

        .my_gcontent_products {
            min-height: 820px;
        }
    </style>

    <script>
        var user =<%= int.Parse(FoodChapter.SessionManager.GetUserSession())%>;
        var foodShowCount = 1, allShowCount = 0, allShowCounts = 0, frozenShowCount = 1, dessertShowCount = 1, cakeShowCount = 1;
        var foodShowGet = true, allShowGet = true, frozenShowGet = true, dessertShowGet = true, cakeShowGet = true;

        function searchByTag() {

            var tag = document.getElementById("tagSearch").value;
            if (tag == "") {
                showAll();
                return;
            }
            // reset page counters 

            foodShowCount = 1, allShowCount = 1, frozenShowCount = 1, dessertShowCount = 1, cakeShowCount = 1;
            foodShowGet = true, allShowGet = true, frozenShowGet = true, dessertShowGet = true, cakeShowGet = true;
            //
            $.ajax({

                url: '/api/Product/SearchProductByProductTag',

                type: 'Get',

                contentType: 'application/json',

                dataType: 'json',

                data: { 'productTag': tag },

                statusCode: {

                    200: function (data) {

                        var json1 = JSON.parse(data);

                        //debugger;

                        //alert(json1.PRODUCTS.length);

                        $("#filter-masonry").empty();

                        for (var i = 0; i < json1.Table.length; i++) {

                            if (json1.Table[i].CATEGORY_ID == 3) {

                                var url = json1.Table[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.Table[i].PRODUCT_ID + ')"><img id="productImage' + json1.Table[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery img-responsive"></a><h3>' + json1.Table[i].NAME + '</h3><span>' + 'Rs ' + json1.Table[i].PRICE + '</span><div class="gallery_overlay"><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.Table[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#productImage" + json1.Table[i].PRODUCT_ID).attr("src", url);

                            }

                            else if (json1.Table[i].CATEGORY_ID == 4) {

                                var url = json1.Table[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.Table[i].PRODUCT_ID + ')"><img id="dessertImage' + json1.Table[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery img-responsive"></a><h3>' + json1.Table[i].NAME + '</h3><span>' + 'Rs ' + json1.Table[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.Table[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#dessertImage" + json1.Table[i].PRODUCT_ID).attr("src", url);

                            }

                            else if (json1.Table[i].CATEGORY_ID == 5) {

                                var url = json1.Table[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.Table[i].PRODUCT_ID + ')"><img id="frozenImage' + json1.Table[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery img-responsive"></a><h3>' + json1.Table[i].NAME + '</h3><span>' + 'Rs ' + json1.Table[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);">   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#frozenImage" + json1.Table[i].PRODUCT_ID).attr("src", url);

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

                                    //debugger;

                                    //alert(json1.PRODUCTS.length);

                                    for (var i = 0; i < json1.Table.length; i++) {

                                        //alert(i);    

                                        var url = json1.Table[i].CAKE_PHOTO;

                                        $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.Table[i].CAKE_ID + ')"><img id="cakesImage' + json1.Table[i].CAKE_ID + '"src=""' + url + '" class="my_gallery"> </a><h3>' + json1.Table[i].NAME + '</h3><span>' + 'Rs ' + json1.Table[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.Table[i].CAKE_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                        $("#cakesImage" + json1.Table[i].CAKE_ID).attr("src", url);

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

            //document.getElementById("tagSearch").value = "";

        }
        function searchByVendor() {

            var name = document.getElementById("vendorSearch").value;
            if (name == "") {
                showAll();
                return;
            }
            $.ajax({

                url: '/api/Product/SearchProductByVendorName',

                type: 'Get',

                contentType: 'application/json',

                dataType: 'json',

                data: { 'name': name },

                statusCode: {

                    200: function (data) {

                        var json1 = JSON.parse(data);
                        //debugger;

                        //alert(json1.PRODUCTS.length);

                        $("#filter-masonry").empty();

                        for (var i = 0; i < json1.PRODUCTS.length; i++) {

                            //alert(i);         

                            //var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                            //alert(url);

                            if (json1.PRODUCTS[i].CATEGORY_ID == 3) {

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery img-responsive"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                            }

                            else if (json1.PRODUCTS[i].CATEGORY_ID == 4) {

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery img-responsive"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#dessertImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                            }

                            else if (json1.PRODUCTS[i].CATEGORY_ID == 5) {

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                $("#filter-masonry").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery img-responsive"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#frozenImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                            }


                        }

                        $.ajax({

                            url: '/api/Product/SearchCakeByVendorName',

                            type: 'Get',

                            contentType: 'application/json',

                            dataType: 'json',

                            data: { 'name': name },

                            statusCode: {

                                200: function (data) {

                                    var json1 = JSON.parse(data);

                                    //debugger;

                                    //alert(json1.PRODUCTS.length);

                                    for (var i = 0; i < json1.CAKES.length; i++) {

                                        //alert(i);    

                                        var url = json1.CAKES[i].CAKE_PHOTO;

                                        $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src=""' + url + '" class="my_gallery"></a> <h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs ' + json1.CAKES[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                        $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);

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

            //document.getElementById("tagSearch").value = "";

        }
        function showTopSellers() {

            $.ajax({

                url: '/api/Vendors/GetFeaturedVendorsforGalleryFilter',

                //url: '/api/Vendors/GetFeaturedSellers',

                type: 'Get',

                contentType: 'application/json',

                dataType: 'json',

                statusCode: {

                    200: function (response) {

                        var json1 = JSON.parse(response);

                        //$('slider').empty();
                        $('ul_sidebar_cat').empty();

                        for (var i = 0; i < json1.VENDORS.length; i++) {

                            //$('#detailFlavour').append('<a href="#">' + json1.CAKE_FLAVORS[i].DESCRIPTION + '</a>');

                            $(".ul_sidebar_cat").append('<li class= "sidebar_cat"><a href="javascript:void(0);" onclick="searchBySeller(' + json1.VENDORS[i].VENDOR_ID + ')">' + json1.VENDORS[i].BUSINESS_ENTITY_NAME + '</p></li>');


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
        //function addCakeToCart(cakeId) {

        //    $('#myModal').modal('show');

        //    debugger;
        //    $.ajax({

        //        url: '/api/Product/SearchCakeByCakeId',

        //        type: 'Get',

        //        contentType: 'application/json',

        //        dataType: 'json',

        //        data: { 'cakeId': cakeId },

        //        statusCode: {

        //            200: function (data) {

        //                var json1 = JSON.parse(data);

        //                subCatagoryId = 1;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;

        //                var name = json1.CAKE[0].NAME;

        //                //var description = document.getElementById('txtDesc').value;

        //                var timeReq = json1.CAKE[0].ESTIMATED_TIME;

        //                var vendorId = json1.CAKE[0].VENDOR_ID;

        //                var price = json1.CAKE[0].PRICE;

        //                var images = json1.CAKE[0].CAKE_PHOTO;

        //                var product = {

        //                    "PRODUCT_ID": cakeId,

        //                    "IS_CAKE": 1,

        //                    "NAME": name,

        //                    "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,//THIS IS ITEM_TYPE

        //                    "VENDOR_ID": vendorId,

        //                    "TIME_REQUIRED": timeReq,

        //                    //"SIZE": size,

        //                    "PRICE": price,

        //                    "QTY": 1,

        //                    "CAKE_PHOTO": images

        //                    //"DESCRIPTION": description

        //                };

        //                //

        //                var count = localStorage.length;

        //                count = count + 1;

        //                if (IsProductAlreadyExist(product) == true) {

        //                    UpdateQuantity(product)

        //                }

        //                else {

        //                    localStorage.setObj(count, JSON.stringify(product));

        //                }

        //              //  SetCartCount();

        //            },

        //            500: function () {

        //            }


        //        },

        //        jsonp: 'jsonp'


        //    });

        //}
        //function addToCart(productId) {

        //    $('#myModal').modal('show');
        //   // debugger;
        //    $.ajax({

        //        url: '/api/Product/SearchProductByProductId',

        //        type: 'Get',

        //        contentType: 'application/json',

        //        dataType: 'json',

        //        data: { 'productId': productId },

        //        statusCode: {

        //            200: function (data) {

        //                var json1 = JSON.parse(data);


        //                subCatagoryId = 2;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;

        //                var name = json1.PRODUCT[0].NAME;

        //                //var description = document.getElementById('txtDesc').value;

        //                var timeReq = json1.PRODUCT[0].TIME_REQUIRED;

        //                var vendorId = json1.PRODUCT[0].VENDOR_ID;

        //                var price = json1.PRODUCT[0].PRICE;

        //                var images = json1.PRODUCT[0].PRODUCT_PHOTO;

        //                var product = {

        //                    "PRODUCT_ID": productId,

        //                    "IS_CAKE": 0,

        //                    "NAME": name,

        //                    "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,//THIS IS ITEM TYPE

        //                    "VENDOR_ID": vendorId,

        //                    "TIME_REQUIRED": timeReq,

        //                    //"SIZE": size,

        //                    "PRICE": price,

        //                    "QTY": 1,

        //                    "PRODUCT_PHOTO": images

        //                    //"DESCRIPTION": description

        //                };

        //                //


        //                var count = localStorage.length;

        //                count = count + 1;

        //                debugger

        //                if (IsProductAlreadyExist(product) == true) {

        //                    UpdateQuantity(product)

        //                }

        //                else {

        //                    localStorage.setObj(count, JSON.stringify(product));

        //                }

        //               // SetCartCount();

        //            },

        //            500: function () {

        //            }


        //        },

        //        jsonp: 'jsonp'


        //    });


        //}
        //function IsProductAlreadyExist(product) {

        //    for (var i = 1; i <= localStorage.length; i++) {

        //        var sessionProduct = JSON.parse(localStorage.getObj(i));

        //        if (sessionProduct != null) {

        //            //alert(sessionProduct.NAME);

        //            if (sessionProduct.NAME == product.NAME) {

        //                return true;

        //            }

        //        }

        //    }

        //    return false;

        //}
        //function UpdateQuantity(product) {

        //    for (var i = 1; i <= localStorage.length; i++) {

        //        var sessionProduct = JSON.parse(localStorage.getObj(i));

        //        if (sessionProduct != null) {

        //            if (sessionProduct.NAME == product.NAME) {

        //                sessionProduct.QTY = sessionProduct.QTY + 1;

        //                localStorage.setObj(i, JSON.stringify(sessionProduct));

        //                i = localStorage.length;

        //            }

        //        }

        //    }

        //}
        //function addDetailCakeCart() {

        //    addCakeToCart(detailCakeId);

        //}
        //function addDetailCart() {

        //    addToCart(detailProductId);

        //}
        //function viewCakeDetail(cakeId) {
        //    $.ajax({
        //        url: '/api/Product/SetCakeSessionToView',
        //        type: 'Get',
        //        contentType: 'application/json',
        //        dataType: 'json',
        //        data: { 'cakeId': cakeId },
        //        statusCode: {
        //            200: function (response) {
        //                window.location = 'ProductDetails.aspx';


        //            },
        //            500: function () {
        //            }

        //        },
        //        jsonp: 'jsonp'

        //    });

        //}
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

        function printAllCakes() {
            $.ajax({

                url: '/api/Product/AllCakes',

                type: 'Get',

                contentType: 'application/json',
                data: { 'page': cakeShowCount },
                dataType: 'json',

                statusCode: {

                    200: function (data) {

                        var json1 = JSON.parse(data);
                        cakeShowGet = json1.CAKES.length > 0;
                        //debugger;
                          $('#preloader').show();

                        setTimeout(function () {
                            $('#preloader').hide();
                            //alert(json1.PRODUCTS.length);

                            for (var i = 0; i < json1.CAKES.length; i++) {

                                //alert(i);    

                                var url = json1.CAKES[i].CAKE_PHOTO;

                                $("#filter-masonry-cakes").append('<div class="my_gallery_row col-lg-4 col-md-4 col-sm-6"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src="' + url + '" class="my_gallery"> <h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs ' + json1.CAKES[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')"></a><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);

                            }
                        }, 1000);
                        //showAll();

                    },

                    500: function () {

                    }

                },

                jsonp: 'jsonp'

            });
        }
        function printFoods() {
            $.ajax({

                url: '/api/Product/GalleryProducts',

                type: 'Get',

                contentType: 'application/json',
                data: { 'category': 3, 'page': foodShowCount },

                dataType: 'json',

                statusCode: {

                    200: function (data) {

                        var json1 = JSON.parse(data);
                        foodShowGet = json1.PRODUCTS.length > 0;
                        // debugger;
                          $('#preloader').show();

                        setTimeout(function () {
                            $('#preloader').hide();
                            //alert(json1.PRODUCTS.length);

                            for (var i = 0; i < json1.PRODUCTS.length; i++) {

                                //alert(i);         

                                //var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                                //alert(url);

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                                $("#filter-masonry-foods").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="foodsImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src="' + url + '" class="my_gallery img-responsive"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                //$("#filter-masonry-foods").append('<div class="masonry-grid-foods col-lg-4 col-sm-4 col-xs-6"><figure class="product-figure"><img id="foodsImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');

                                $("#foodsImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                            }
                        }, 1000);
                       // showAll();

                    },

                    500: function () {

                    }

                },

                jsonp: 'jsonp'

            });
        }

        function showAllProductsAndCakes() {

            $.ajax({

                url: '/api/Product/GetProductsByPage',

                type: 'Get',

                contentType: 'application/json',

                dataType: 'json',

                data: { 'showCount': allShowCount },

                statusCode: {

                    200: function (data) {

                        var json1 = JSON.parse(data);
                        allShowGet = json1.PRODUCTS.length > 0;
                        debugger;
                        $('#preloader').show();

                        setTimeout(function () {
                            $('#preloader').hide();
                            //alert(json1.PRODUCTS.length);

                            //$("#filter-masonry").empty();

                            for (var i = 0; i < json1.PRODUCTS.length; i++) {

                                if (json1.PRODUCTS[i].CATEGORY_ID == 3) {

                                    var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                    $("#filter-masonry").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="productImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery img-responsive"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                    $("#productImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                                }

                                else if (json1.PRODUCTS[i].CATEGORY_ID == 4) {

                                    var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                    $("#filter-masonry").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src="' + url + '" class="my_gallery img-responsive"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                    $("#dessertImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                                }

                                else if (json1.PRODUCTS[i].CATEGORY_ID == 5) {

                                    var url = json1.PRODUCTS[i].PRODUCT_PHOTO;


                                    $("#filter-masonry").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery img-responsive"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);">   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                    $("#frozenImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);

                                }


                            }
                        }, 1000);
                        $.ajax({

                            url: '/api/Product/GetCakesByPage',

                            type: 'Get',

                            contentType: 'application/json',

                            dataType: 'json',

                            data: { 'showCount': allShowCounts },

                            statusCode: {

                                200: function (data) {

                                    var json1 = JSON.parse(data);
                                    allShowGet = json1.CAKES.length > 0;
                                    debugger;

                                    //alert(json1.PRODUCTS.length);

                                    for (var i = 0; i < json1.CAKES.length; i++) {

                                        //alert(i);    

                                        var url = json1.CAKES[i].CAKE_PHOTO;

                                        $("#filter-masonry").append('<div class="my_gallery_row col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src=""' + url + '" class="my_gallery"> </a><h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs ' + json1.CAKES[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.CAKES[i].CAKE_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                        $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);

                                    }

                                    //showSearch();

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
        }


        function printAllFrozenFoods() {

            $.ajax({

                url: '/api/Product/GalleryProducts',

                type: 'Get',

                contentType: 'application/json',
                data: { 'category': 4, 'page': frozenShowCount },

                dataType: 'json',

                statusCode: {

                    200: function (data) {

                        var json1 = JSON.parse(data);
                        frozenShowGet = json1.PRODUCTS.length > 0;
                        //   debugger;
                          $('#preloader').show();

                        setTimeout(function () {
                            $('#preloader').hide();
                            //alert(json1.PRODUCTS.length);

                            for (var i = 0; i < json1.PRODUCTS.length; i++) {

                                //alert(i);         

                                //var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                                //alert(url);

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                                $("#filter-masonry-frozen").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src="' + url + '" class="my_gallery img-responsive"></a><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                //$("#filter-masonry-frozen").append('<div class="masonry-grid-frozen col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure"><img id="frozenImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');

                                $("#frozenImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);


                            }
                        }, 1000);

                        //showAll();

                    },

                    500: function () {

                    }

                },

                jsonp: 'jsonp'

            });
        }
        function printAllDesserts() {
            $.ajax({

                url: '/api/Product/GalleryProducts',

                type: 'Get',

                contentType: 'application/json',
                data: { 'category': 5, 'page': dessertShowCount },

                dataType: 'json',

                statusCode: {

                    200: function (data) {

                        var json1 = JSON.parse(data);
                        dessertShowGet = json1.PRODUCTS.length > 0;
                          $('#preloader').show();

                        setTimeout(function () {
                            $('#preloader').hide();
                            
                            for (var i = 0; i < json1.PRODUCTS.length; i++) {

                                var url = json1.PRODUCTS[i].PRODUCT_PHOTO;

                                $("#filter-masonry-desserts").append('<div class="my_gallery_row rgallery col-lg-4 col-md-4 col-sm-6"><a href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><img id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src="' + url + '" class="my_gallery img-responsive"></a> <h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);"><a class="ghover2" href="javascript:void(0);" onclick="viewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')"></a>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                                //$("#filter-masonry-desserts").append('<div class="masonry-grid-desserts col-lg-4 col-sm-4 col-xs-6 "><figure class="product-figure"><img id="dessertImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" alt="img-01"><div class="overlay"><div class="tg-display-table"><div class="tg-display-table-cell"><div class="product-detail"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span><del>' + 'Rs : ' + json1.PRODUCTS[i].PRICE + '</del></span></div><div class="gallery-button"> <a class="sm-btn1" href="javascript:void(0);" onclick="ViewDetail(' + json1.PRODUCTS[i].PRODUCT_ID + ')" data-toggle="modal" data-target="#productModal">View Detail</a><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')">Add to Cart</a></div></div> </div></div></figure></div>');

                                $("#dessertImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);


                            }
                        }, 1000);
                        //showAll();

                    },

                    500: function () {

                    }

                },

                jsonp: 'jsonp'

            });
        }

        $(document).ready(function () {

            if (user != 0) {
                $('#myregistration').modal('show');
                document.getElementById('showModel').innerHTML = "Welcome to Food Chapter!";
            }
            showAllProductsAndCakes();
            printFoods();
            printAllCakes();
            printAllDesserts();
            printAllFrozenFoods();

            showTopSellers();

            showAll();

            $("#btnHungry").click(function () {

                $("#myModal").modal('hide');
            });

            $(".filterData").change(function () {


                if (document.getElementById('tagSearch').value.length > 0) {

                    document.getElementById('chkFoods').checked = false;

                    document.getElementById('chkCakes').checked = false;

                    document.getElementById('chkDesserts').checked = false;

                    document.getElementById('chkFrozen').checked = false;

                    document.getElementById('chkAll').checked = false;

                    document.getElementById('vendorSearch').value = "";

                    searchByTag();

                }
                else
                    showAll();


            });

            $(".filterVendor").change(function () {

                if (document.getElementById('vendorSearch').value.length > 0) {

                    document.getElementById('chkFoods').checked = false;

                    document.getElementById('chkCakes').checked = false;

                    document.getElementById('chkDesserts').checked = false;

                    document.getElementById('chkFrozen').checked = false;

                    document.getElementById('chkAll').checked = false;

                    document.getElementById('tagSearch').value = "";

                    searchByVendor();

                }
                else
                    showAll();


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

            //$("#btnFoods").click(function () {

            //    foodShowCount++;

            //    ViewDetail();


            //});

            // SetCartCount();

            $(document).ajaxStop(function () {

            });

            // Remove the spaces from the entered and generated code

        });

        $(window).scroll(function () {
            if ($(window).scrollTop() == $(document).height() - $(window).height()) {

                if (document.getElementById('chkAll').checked) {

                    if (allShowGet) {
                        allShowCount++;
                        showAllProductsAndCakes();
                        showAll();
                    }
                    if (allShowGet) {
                        allShowCounts++;
                        showAllProductsAndCakes();
                        showAll();
                    }

                    allShowCount++;
                    allShowCounts++;
                    foodShowCount++;
                    cakeShowCount++;
                    dessertShowCount++;
                    frozenShowCount++;

                    if (allShowGet) {
                        showAllProductsAndCakes();
                    }

                    if (foodShowGet) {
                        printFoods();
                    }
                    if (cakeShowGet) {
                        printAllCakes();
                    }
                    if (dessertShowGet) {
                        printAllDesserts();
                    }
                    if (frozenShowGet) {
                        printAllFrozenFoods();
                    }


                    return;
                }

                if (document.getElementById('chkFoods').checked) {
                    if (foodShowGet) {
                        foodShowCount++;
                        printFoods();
                        showFoods();
                    }
                    return;
                }

                if (document.getElementById('chkCakes').checked) {
                    if (cakeShowGet) {
                        cakeShowCount++;
                        printAllCakes();
                        showCakes();
                    }
                    return;
                }

                if (document.getElementById('chkDesserts').checked) {
                    if (dessertShowGet) {
                        dessertShowCount++;
                        printAllDesserts();
                        showDesserts();
                    }
                    return;
                }

                if (document.getElementById('chkFrozen').checked) {

                    //frozen
                    if (frozenShowGet) {
                        frozenShowCount++;
                        printAllFrozenFoods();
                        showFrozen();
                    }
                    return;
                }
                else {
                    //same case as first
                    foodShowCount++;
                    cakeShowCount++;
                    dessertShowCount++;
                    frozenShowCount++;
                    if (foodShowGet) {
                        printFoods();
                    }
                    if (cakeShowGet) {
                        printAllCakes();
                    }
                    if (dessertShowGet) {
                        printAllDesserts();
                    }
                    if (frozenShowGet) {
                        printAllFrozenFoods();
                    }

                    showAll();
                    return;
                }
            }
        });

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="gallery_pg_header_bg_gallery">


        <div class="gallery_bg fade1">
            <div class="seller_heading">
                <h2 style="margin-top: 190px;" class="sellers_pg_heading">Discover the taste of</h2>
                <h1 style="margin-bottom: -120px;" class="sellers_pg_heading">Homemade Foods</h1>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="my_container_section">
            <div class="gallery_container_wrapper">
                <div class="my_sidebar col-md-3 col-sm-12">
                    <div class="sidebar_wrapper_gallery col-md-12">
                        <div class="wrap">
                            <div class="search">
                                <input type="text" id="tagSearch" class="searchTerm filterData" placeholder="Search" />
                                <button type="submit" class="searchButton ">
                                    <img title="search this site" src="Frontend/images/search_black.png" alt="search" />
                                </button>
                            </div>
                        </div>
                        <h4 class="sidebar_type">Type</h4>
                        <label>
                            <input type="checkbox" class="mint filterData1" name="chkAll" id="chkAll" checked="checked" /><span>All</span></label><br />
                        <%--<label><input type="radio" class="mint filterData0" name="chkDelievery" id="chkDelievery" /><span>Delievery</span></label><br />--%>
                        <label>
                            <input type="checkbox" class="mint filterData2" id="chkFoods" /><span>Food</span></></label><br />
                        <label>
                            <input type="checkbox" class="mint filterData3" id="chkCakes" /><span>Cakes</span></></label><br />
                        <label>
                            <input type="checkbox" class="mint filterData4" id="chkDesserts" /><span>Desserts</span></></label><br />
                        <label>
                            <input type="checkbox" class="mint filterData5" id="chkFrozen" /><span>Frozen Food</span></label><br />


                        <input type="text" id="vendorSearch" class="sidebar_type sellers searchTerm filterVendor" placeholder="Sellers" />
                        <button type="submit" class="searchButton ">
                            <img title="search this site" src="Frontend/images/search_black.png" alt="search" />
                        </button>
                        <%--<button type="button" class="dropdown_button">
                            <img title="" src="Frontend/images/dropdown.png" alt="dropdown" />
                        </button>--%>


                        <%--<ul class="ul_sidebar_cat">
                        </ul>--%>
                    </div>
                </div>

                <img class="g_side1 m_animate" src="Frontend/images/bg_1.png" />
                <img class="g_side2 m_animate" src="Frontend/images/bg_3.png" />
                <div class="my_gcontent_products col-md-9 col-sm-12">
                    <div class="p_gallery col-md-12">

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
                    <img id="preloader" style="position: relative; left: 273px; width: 200px; display: none" src="Frontend/images/Preloader_FoodChapter.gif" alt="Alternate Text" />
                    <div class="col-md-12" style="text-align: center; margin-top: 10px;">
                        <%--<button class="gallery" <a href="javascript:void(0);" id="btnFoods">View More</a></button>--%>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <img class="g_side3 m_animate" src="Frontend/images/bg_2.png" />
    <img class="g_side4 m_animate" src="Frontend/images/bg_4.png" />
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
                                <div class="col-md-9 col-md-offset-2" style="margin-bottom: 10px;">

                                    <a href="Cart.aspx">
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

</asp:Content>
