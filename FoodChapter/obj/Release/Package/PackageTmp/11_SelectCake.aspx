<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="11_SelectCake.aspx.cs" Inherits="FoodChapter._11_SelectCake" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
    </style>
    <script>

        var productId = 0, vendorId = 0, cakeShowCount = 1;
        vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetViewVendorSession()) %>';
        $(document).ready(function () {

            Storage.prototype.setObj = function (key, obj) {
                key = 'fc' + key;
                return this.setItem(key, JSON.stringify(obj))
            };
            Storage.prototype.getObj = function (key) {
                key = 'fc' + key;
                return JSON.parse(this.getItem(key))
            };


            if (vendorId == 0)
            {
                //move to sellers page
                window.location = '3_Vendors.aspx';
            }
            else
            {
                loadCakes(vendorId);
            }


            
        });
        function loadCakes(vendorId) {
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
                        if (json1.CAKES.length == 0 && cakeShowCount ==1) {
                            //show modal and redirect to 8_vendorprofile.aspx
                        }
                        else {
                            //if (cakeShowCount == 0) {
                            //    $("#filter-masonry-cakes").empty();
                            //}
                            $("#filter-masonry-cakes").empty();
                            for (var i = 0; i < json1.CAKES.length; i++) {
                                debugger;
                                var url = json1.CAKES[i].CAKE_PHOTO;
                                $("#filter-masonry-cakes").append('<div class="my_gallery_row col-lg-3 col-md-4 col-sm-6"><img class="my_home_img img-responsive" id="cakesImage' + json1.CAKES[i].CAKE_ID + '" src="" ' + url + '" ><h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs ' + json1.CAKES[i].PRICE + '</span><div class=" hm_gallery_overlay"><a class="sm-btn1" href="javascript:void(0);" onclick="navigateToCustomize(' + json1.CAKES[i].CAKE_ID + ')"><button class="home_gallery">Customize</button><span class="fa fa-star profile checked"></span><span class="fa fa-star profile checked"></span<span class="fa fa-star profile checked"></span><span class="fa fa-star profile checked"></span><span class="fa fa-star profile "></span><span class="fa fa-star profile "></span></a></div></div>');
                                $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);

                            }
                        }
                        

                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
            
        }
        function navigateToCustomize(cakeId)
        {
            addCakeToCart(cakeId);

            
        }

        //cart region
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
                            "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,//THIS IS ITEM_TYPE
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

                        //do call functions
                        saveProductSession(cakeId);
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
        
        //cart region end

        function saveProductSession(cakeId)
        {
            $.ajax({
                url: '/api/Product/SetProductSessionToEdit',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'productId': cakeId },
                statusCode: {
                    200: function () {
                        debugger;
                        $.ajax({
                            url: '/api/Order/SetOrderIndexSession',
                            type: 'Get',
                            contentType: 'application/json',
                            dataType: 'json',
                            data: { 'orderIndex': localStorage.length },
                            statusCode: {
                                200: function () {
                                    window.location = "9_CustomizeCake.aspx";
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="gallery_pg_header_bg_ccb">

        <div class="gallery_bg fade1">
            <div class="seller_heading">
                <h1 style="margin-top: 188px;" class="sellers_pg_heading">Select Cake</h1>
            </div>
        </div>
    </div>
    <div class="startcontent">
        <img class="img_right sr_tp m_animate" src="Frontend/images/bg_1.png">
        <img class="img_left m_animate" src="Frontend/images/bg_2.png">

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="select_cake_wrap col-md-12" id="filter-masonry-cakes">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
