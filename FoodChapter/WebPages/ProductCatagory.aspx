<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductCatagory.aspx.cs" Inherits="FoodChapter.WebPages.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Food Chapter | Coming Soon</title>
     <!--REQUIRED STYLE SHEETS-->
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="../Assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLE CSS -->
    <link href="../Assets/newstyle/css/font-awesome.min.css" rel="stylesheet" />
    <!-- VEGAS STYLE CSS -->
    <link href="../Assets/newstyle/scripts/vegas/jquery.vegas.min.css" rel="stylesheet" />
       <!-- CUSTOM STYLE CSS -->
    <link href="../Assets/newstyle/css/style.css" rel="stylesheet" />
     <!-- GOOGLE FONT -->
     <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
     <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="../Assets/css/custom.css">
    <link rel="stylesheet" href="../Assets/css/vendor.css">

    <!-- Scripts Run through here -->
     <script src="../Scripts/jquery-1.8.2.intellisense.js"></script>
    <script src="../Scripts/jquery-ui-1.8.24.min.js"></script>
    <script src="../Scripts/jquery-1.8.2.js"></script>
    <script src="../Scripts/jquery-1.8.2.min.js"></script>
    <script src="../Scripts/jquery-ui-1.8.24.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="../Assets/js/vendor/jquery-3.2.1.js"></script>
    <script src="../Assets/js/vendor/jquery-3.2.1.min.js"></script>
    <script src="../Assets/js/vendor/jquery.js"></script>

    <!-- Start appending Vendors  here --> 
</head>
    <script>

        var catagory = 1;
        $(document).ready(function () {
            //function loadProducts() {
            //    alert("pageload event fired!");
            //}
            $('.dropdown-inverse li > a').click(function (e) {
                catagory = $(this).closest('li').index() + 1;
            });

            window.onload = function () {
                var topProducts = 0;
                $.ajax({
                    //url: '/api/Vendors/GetAllVendors',
                    url: '/api/Product/GetLatestProducts',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'topProducts' : topProducts },
                    //data: JSON.stringify(),
                    statusCode: {
                        200: function (data) {
                            //alert("success");
                            //var json1 = JSON.parse(data);

                            //for (var i = 0; i < json1.VENDORS.length; i++) {
                            //    $("#showme").append('<li> <figure class="v2-menu-img"><a href="#"><img src="../Assets/images/menu-v-2/img-01.jpg" alt="img-01"> </a></figure><div class="v2-menu-detail"><h5><a href"#">' + json1.VENDORS[i].FIRST_NAME + '</a></h5> <p>Category: Food, Cakes</p><ul class="rating-star vendor-page"><li>Rated: </li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star-half-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li></ul><span class="v-vp"><a href="#" class="sm-btn111">View Profile</a></span><span class="v-vp-order"><a href="#" class="sm-btn111">Add to Cart</a></span></div></li>');
                            //}

                            //debugger;
                        },
                        500: function () {
                        }


                    },

                    jsonp: 'jsonp'

                });


            };

        });

        function funSaveSubCatagory() {
            var name = document.getElementById("subName").value;
            var description = document.getElementById('subDescription').value;

            var subCatagory = {
                "CATAGORY_ID" : catagory,
                "SUB_CATAGORY_NAME": name,
                "DESCRIPTION": description
            };
            debugger;


            $.ajax({
                url: '/api/Product/SaveProductSubCatagory',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(subCatagory),
                statusCode: {
                    200: function () {
                        clearProduct();
                        alert('Product Catagory Save succesfullty');
                    },
                    500: function () {
                        alert('Error occured. Product Catagory not saved');
                    }


                },

                jsonp: 'jsonp'

            });
        }
        function clearProduct() {
            document.getElementById("subName").value = "";
            document.getElementById('subDescription').value = "";
        }
    </script>
    <body >
        

        <div class="container" style="margin-top: 100px;">
            

             <form class ="col col-sm-4 " id="formSaveSubCatagory">
                  <div class="col-xs-12 text-center" id="lblMessage"></div>
                <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown" style="width: 150px;" onchange="dropDownChange">Catagories
                    <span class="caret"></span></button>
                    <ul class="dropdown-menu dropdown-inverse" role="menu" aria-labelledby="menu1" id="catagoryMenu"  onchange="dropDownChange">
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Simple</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Baked</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Frozen</a></li>
                    </ul>
                </div>
                  <div class="form-group">
                    <label for="subName">Sub Catagory Name</label>
                    <input type="text" class="form-control" id="subName"/>
                  </div>
                  <div class="form-group">
                    <label for="subDescription">Description</label>
                    <input type="text" class="form-control" id="subDescription"/>
                  </div>
                  
                <button type="button" class="btn btn-primary btn-sm" onclick="funSaveSubCatagory()">
                    Save</button> 
            </form> 
        </div>

    </body>
</html>
