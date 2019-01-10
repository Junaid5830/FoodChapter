<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="FoodChapter.WebPages.EditProduct" %>

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
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

      <script>
          $(function () {

              var availableTags = [];
              $.ajax({
                  url: '/api/Product/GetProductTagsByProductId',
                  type: 'Get',
                  contentType: 'application/json',
                  dataType: 'json',
                  data: { 'productId': -1 },
                  statusCode: {
                      200: function (data) {
                          var json2 = JSON.parse(data);
                          debugger;
                          for (var i = 0; i < json2.PRODUCT_TAGS.length; i++) {
                              availableTags[i] = json2.PRODUCT_TAGS[i].TAG_NAME;
                          }
                          $("#productTag").autocomplete({
                              source: availableTags
                          });
                      },
                      500: function () {
                      }


                  },

                  jsonp: 'jsonp'

              });

          });
  </script>
    <script>

        var catagory = 1, subCatagoryId = 2, vendorId = 4, productId = 0;
        $(document).ready(function () {
            $('#formSaveSubCatagory').submit(function () {
                funSaveProduct();
                return false;
            });
            //function loadProducts() {
            //    alert("pageload event fired!");
            //}

            //$('#subCatagoryMenu').on("change", function () {
            //    var value = $(this).val();
            //    var text = $(this).find('option:selected').text();

            //});

            //$('#subCatagoryMenu').click(function (e) {
            //    e.preventDefault();
            //    //alert(document.getElementById("subCatagoryMenu").value);
            //    var selectedText = $('#subCatagoryMenu').find(":selected").html(); //$('#subCatagoryMenu option:selected').text();
            //    alert(selectedText);
            //    alert$(('#subCatagoryMenu').children().selected);
            //    alert($(this).find(":selected").val());
            //    //catagory = $(this).closest('li').index() + 1;
            //});
            $('.dropdown-inverse1 li > a').click(function (e) {
                e.stopPropagation();
                catagory = $(this).closest('li').index() + 1;
                alert(catagory);
            });
            //$('#subCatagoryMenu').click(function (e) {
            //    alert('ks');
            //    alert($('#subCatagoryMenu').prop('selectedIndex'));
            //});
            $('.dropdown-inverse0 li > a').click(function (e) {
                catagory = $(this).closest('li').index() + 1;

                $.ajax({
                    url: '/api/Product/GetProductSubCatagories',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'catagoryId': catagory },
                    statusCode: {
                        200: function (data) {
                            $('#subCatagoryMenu').children().remove();
                            var json1 = JSON.parse(data);

                            for (var i = 0; i < json1.PRODUCT_SUB_CATAGORY.length; i++) {
                                $("#subCatagoryMenu").append('<li role="presentation"><a role="menuitem" tabindex="-1" href="#">' + json1.PRODUCT_SUB_CATAGORY[i].SUB_CATAGORY_NAME + ' </a> </li>');
                            }
                        },
                        500: function () {
                        }


                    },

                    jsonp: 'jsonp'

                });
            });

            window.onload = function () {
                productId = window.location.href.split("=")[1];
                $.ajax({
                    //url: '/api/Vendors/GetAllVendors',
                    url: '/api/Product/SearchProductByProductId',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'productId': productId },
                    //data: JSON.stringify(),
                    statusCode: {
                        200: function (data) {
                            var json1 = JSON.parse(data);
                            debugger;
                            for (var i = 0; i < json1.PRODUCT.length; i++) {
                                document.getElementById("subName").value = json1.PRODUCT[i].NAME;
                                document.getElementById('subDescription').value = json1.PRODUCT[i].DESCRIPTION;
                                document.getElementById("timeReq").value = json1.PRODUCT[i].TIME_REQUIRED;
                                document.getElementById('size').value = json1.PRODUCT[i].SIZE;
                                document.getElementById('price').value = json1.PRODUCT[i].PRICE;
                            }

                            $.ajax({
                                url: '/api/Product/GetProductTagsByProductId',
                                type: 'Get',
                                contentType: 'application/json',
                                dataType: 'json',
                                data: { 'productId': productId },
                                statusCode: {
                                    200: function (data) {
                                        var json2 = JSON.parse(data);
                                        debugger;
                                        for (var i = 0; i < json2.PRODUCT_TAGS.length; i++) {
                                            $("#panelBody").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" onclick="childClick(event)">' + json2.PRODUCT_TAGS[i].TAG_NAME + ' &#9938;' + '</label>');

                                        }

                                    },
                                    500: function () {
                                    }


                                },

                                jsonp: 'jsonp'

                            });
                            //debugger;
                        },
                        500: function () {
                        }


                    },

                    jsonp: 'jsonp'

                });


            };

        });

        function funSaveProduct() {
            var subCatagoryId = $('#SubCategories').val();
            var name = document.getElementById("subName").value;
            var description = document.getElementById('subDescription').value;
            var timeReq = document.getElementById("timeReq").value;
            var size = document.getElementById('size').value;
            var price = document.getElementById('price').value;
            alert('a');
            alert(productId);
            var product = {
                "PRODUCT_ID": productId,
                "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,
                "VENDOR_ID": vendorId,
                "TIME_REQUIRED": timeReq,
                "SIZE": size,
                "PRICE": price,
                "NAME": name,
                "DESCRIPTION": description
            };
            debugger;


            $.ajax({
                url: '/api/Product/UpdateProduct',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(product),
                statusCode: {
                    200: function () {
                        clearProduct();
                        var ProductTags = document.getElementById("panelBody").childNodes;
                        var tagsList = [];
                        for (var i = 0; i < ProductTags.length; i++) {
                            var tableChild = ProductTags[i];
                            var tag = { "PRODUCT_ID": productId, "TAG_NAME": tableChild.innerText.split(" ")[0] }
                            tagsList[i] = tag;
                        }
                        var tagJson = JSON.stringify(tagsList);
                        debugger;
                        $.ajax({
                            url: '/api/Product/UpdateProductTags',
                            type: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            data: tagJson,// JSON.stringify(tagsList) },//JSON.stringify({ 'tagsList': tagsList }),
                            statusCode: {
                                200: function () {
                                    $("#panelBody").empty();
                                    //document.getElementById("panelBody").removeChild;
                                    alert('Product updated succesfullty');

                                },
                                500: function () {
                                    alert('Error occured. Product not saved');
                                }


                            },

                            jsonp: 'jsonp'

                        });

                    },
                    500: function () {
                        alert('Error occured. Product not updated');
                    }


                },

                jsonp: 'jsonp'

            });
        }
        
        function clearProduct() {
            document.getElementById("subName").value = "";
            document.getElementById('subDescription').value = "";
            document.getElementById("timeReq").value = "";
            document.getElementById('size').value = "";
            document.getElementById('price').value = "";
        }
        function NavigateToSite() {
            window.location = '/WebPages/ProductCatagory.aspx';
        }
        function addTagsToPanel() {
            debugger;
            var tag = document.getElementById("productTag").value;
            $("#panelBody").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" onclick="childClick(event)">' + tag + ' &#9938;' + '</label>');

            document.getElementById("productTag").value = "";
        }

        

        function childClick(e)
        {
            document.getElementById("panelBody").removeChild(e.target);
            
        }
        
    </script>
    <body >
        

        <div class="container" style="margin-top: 100px;">
            

             <form class ="col col-sm-4 " id="formSaveSubCatagory"  action="#">
                  <%--<div class="col-xs-12 text-center" id="lblMessage"></div>--%>
                <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown" style="width: 180px; " >Catagories
                    <span class="caret"></span></button>
                    <ul class="dropdown-menu dropdown-inverse0" role="menu" aria-labelledby="menu1" id="catagoryMenu">
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Simple</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Baked</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Frozen</a></li>
                    </ul>
                </div>
                 <div>
                     <div class="dropdown">
                     <button class="btn btn-default dropdown-toggle" type="button" id="submenu1" data-toggle="dropdown" style="width: 180px; margin-top: 20px;" >SubCatagories
                        <span class="caret"></span></button>
                        <ul class="dropdown-menu dropdown-inverse1"  role="menu" aria-labelledby="menu2" id="subCatagoryMenu">
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">a</a></li>
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">b</a></li>
                          <%--<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Baked</a></li>
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Frozen</a></li>--%>
                        </ul>

                         <button type="button" class="btn btn-primary btn-sm" style="margin-left: 20px; margin-top: 20px;" id="addSubCat" onclick="NavigateToSite()">
                    Add SubCatagory</button>
                    </div>

                      
                </div>
                  <div class="form-group">
                    <label for="subName"> Name</label>
                    <input type="text" class="form-control" id="subName" required="required"/>
                  </div>
                  <div class="form-group">
                    <label for="subDescription">Description</label>
                    <input type="text" class="form-control" id="subDescription" required="required"/>
                  </div>
                  
                 <div class="form-group">
                    <label for="subDescription">Time Required</label>
                    <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="0" class="form-control" id="timeReq" required="required" />
                  </div>
                 
                 <div class="form-group">
                    <label for="subDescription">Size</label>
                    <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="0" class="form-control" id="size" required="required"/>
                  </div>
                 
                 <div class="form-group">
                    <label for="subDescription">Price</label>
                    <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="0" class="form-control" id="price" required="required"/>
                  </div>

                 <div class="form-group">
                    <label for="productTag">Tag</label>
                     <div>
                        <input type="text" class="form-control " id="productTag" />
                         <button type="button" class="btn btn-primary btn-sm" style="margin-top: 15px;" onclick="addTagsToPanel()">
                        Add Tag</button> 
                    </div>
                  </div>

                 <div class="panel panel-default" style="height:200px;">
                    <div class="panel-body" id="panelBody"></div>
                  </div>
                <button type="submit" class="btn btn-primary btn-sm" >
                    Save</button> 
                 
            </form> 
        </div>

    </body>
</html>
