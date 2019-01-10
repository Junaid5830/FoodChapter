<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/Vendor.Master" CodeBehind="UpdateProduct.aspx.cs" Inherits="FoodChapter.WebPages.UpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .chbox{
            margin-top : 18px;
        }
    </style>
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

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#productImage')
                        .attr('src', e.target.result)
                        .width(150)
                        .height(200);
                    document.getElementById("imgaeB64").innerHTML = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        function addTagsToPanel() {
            var tag = document.getElementById("productTag").value;
            var tempTag = document.getElementById(tag + "59");
            if (tempTag == null) {
                $("#panelBody").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" id=' + tag + "59" + ' onclick="childClick(event)">' + tag + ' &#9938;' + '</label>');
                document.getElementById("productTag").value = "";
            }
            else {
                $('#msgModal').modal('show');
                document.getElementById("lblMessage").innerHTML = "Tag is already added.";
                document.getElementById("lblMessage").style.color = 'red';
                //alert('Tag is already added')
            }
        }
        function childClick(e) {
            document.getElementById("panelBody").removeChild(e.target);
        }
        //productId = window.location.href.split("=")[1];
        var category = 0;

        function CreateSubCatagory() {
            var x = document.getElementById("CreateSubCatagory");
            if (x.style.display === 'none') {
                x.style.display = 'block';
                document.getElementById('btnSubCatagory').innerHTML = "-";
            } else {
                x.style.display = 'none';
                document.getElementById('btnSubCatagory').innerHTML = "+";
            }
        }


        function SaveSubCatagory() {
            var eventText = document.getElementById("txtNewSubCataory").value;
            var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
            if (vendorId == "0") {
                window.location = "6_login.aspx";
            }
            if (eventText.length == 0) {
                $('#msgModal').modal('show');
                document.getElementById("lblMessage").innerHTML = "Please Enter Sub Category.";
                document.getElementById("lblMessage").style.color = 'red';
                //alert('Please Enter Sub Catgory');
            }
            else {
                //var catagory = $('#NewCategories').val(); Categories
                var catagory = $('#Categories').val();
                var name = document.getElementById("txtNewSubCataory").value;
                var subCatagory = {
                    "CATEGORY_ID": catagory,
                    "NAME": name,
                    "VENDOR_ID": vendorId
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
                            CreateSubCatagory();
                            document.getElementById("txtNewSubCataory").value = "";

                            $.ajax({
                                url: '/api/Product/GetProductSubCatagories',
                                type: 'Get',
                                contentType: 'application/json',
                                dataType: 'json',
                                data: { 'catagoryId': catagory, 'vendorId': vendorId },
                                statusCode: {
                                    200: function (data) {
                                        var json1 = JSON.parse(data);
                                        //debugger;
                                        $('#SubCategories').empty();
                                        for (var i = 0; i < json1.SUBCATEGORIES.length; i++) {
                                            $('#SubCategories').append('<option value="' + json1.SUBCATEGORIES[i].SUB_CATEGORY_ID + '">' + json1.SUBCATEGORIES[i].NAME + '</option>');
                                        }
                                    },
                                    500: function () {
                                    }
                                },
                                jsonp: 'jsonp'

                            });

                        },
                        500: function () {
                            $('#msgModal').modal('show');
                            document.getElementById("lblMessage").innerHTML = "Product Sub Category not saved.";
                            document.getElementById("lblMessage").style.color = 'red';
                            //alert('Error occured. Product Sub Catagory not saved');
                        }


                    },

                    jsonp: 'jsonp'

                });

            }
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


        $(document).ready(function () {
            $(window).keydown(function (event) {
                if (event.keyCode == 13) {
                    //alert('hi');
                    event.preventDefault();
                    return false;
                }
            });

            $('#CreateSubCatagory').hide();
            var productId = '<%= int.Parse(FoodChapter.SessionManager.GetProductSession()) %>';
                if (productId == "0") {
                    window.location = "home.aspx";
                }
                LoadProductData();

                $('#formSaveProduct').submit(function () {
                    document.getElementById("btnSave").disabled = true;
                    $('#imgload').show();
                    var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';

                    var name = document.getElementById("txtName").value;

                    var product = {
                        "PRODUCT_ID": productId,
                        "VENDOR_ID": vendorId,
                        "NAME": name
                    };
                    //alert('cat' + category);
                    //alert('subcat' + subCatagoryId);
                    debugger;
                    $.ajax({
                        url: '/api/Product/IsUniqueProduct',
                        type: 'POST',
                        contentType: 'application/json',
                        dataType: 'json',
                        data: JSON.stringify(product),
                        statusCode: {
                            200: function (result) {

                                funUpdateProduct();
                            },
                            500: function (result) {
                                $('#msgModal').modal('show');
                                document.getElementById("lblMessage").innerHTML = "Name is not Unique.";
                                document.getElementById("lblMessage").style.color = 'red';
                                //alert('Error occured. Name is not unique');
                            },
                            404: function (data) {
                                alert('product error' + data);
                            }
                        },
                        jsonp: 'jsonp'
                    });
                    return false;
                });

                $('#Categories').change(function () {
                    category = $('#Categories').val();
                    if (category == 3)
                        $('#serves').show();
                    else
                        $('#serves').hide();

                    GetSubCategories(category);

                    //e.preventDefault();
                });

                function LoadProductData() {
                    $.ajax({
                        type: 'Get',
                        url: '/api/Product/SearchProductByProductId',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: { 'productId': productId },
                        statusCode: {
                            200: function (data) {
                                $('#serves').hide();
                                var json1 = JSON.parse(data);
                                document.getElementById('txtName').value = json1.PRODUCT[0].NAME;
                                document.getElementById('txtDesc').value = json1.PRODUCT[0].DESCRIPTION;
                                document.getElementById('txtTime').value = json1.PRODUCT[0].TIME_REQUIRED;
                                document.getElementById('txtServes').value = json1.PRODUCT[0].SERVES;
                                document.getElementById('txtPrice').value = json1.PRODUCT[0].PRICE;
                                if (json1.PRODUCT[0].CATEGORY_ID == 3) {
                                    $('#serves').show();
                                    //$("#Categories option[value='4']").remove();
                                    //$("#Categories option[value='5']").remove();
                                }
                                //if (json1.PRODUCT[0].CATEGORY_ID == 4) {
                                //    //$('#serves').show();
                                //    $("#Categories option[value='5']").remove();
                                //    $("#Categories option[value='3']").remove();
                                //}
                                //if (json1.PRODUCT[0].CATEGORY_ID == 5) {
                                //    //$('#serves').show();
                                //    $("#Categories option[value='4']").remove();
                                //    $("#Categories option[value='3']").remove();
                                //}



                                if (json1.PRODUCT[0].DELIVERY == 1)
                                    document.getElementById('chkDelivery').checked = true;
                                else
                                    document.getElementById('chkDelivery').checked = false;

                                if (json1.PRODUCT[0].IS_ACTIVE == 1)
                                    document.getElementById('chkActive').checked = true;
                                else
                                    document.getElementById('chkActive').checked = false;

                                var url = json1.PRODUCT[0].PRODUCT_PHOTO;
                                $("#productImage").attr("src", "" + url).width(150).height(200);

                                LoadTags();
                                debugger;
                                document.getElementById('Categories').value = json1.PRODUCT[0].CATEGORY_ID;
                                category = json1.PRODUCT[0].CATEGORY_ID;
                                //if (category == "3") {
                                //    $('#serves').show();
                                //    $("#Categories option[value='4']").remove();
                                //    $("#Categories option[value='5']").remove();
                                //    loadSubCategories(category);
                                //}
                                //if (category == "4") {
                                //    //$('#serves').show();
                                //    $("#Categories option[value='3']").remove();
                                //    $("#Categories option[value='5']").remove();
                                //    loadSubCategories(category);
                                //}
                                //if (category == "5") {
                                //    //$('#serves').show();
                                //    $("#Categories option[value='3']").remove();
                                //    $("#Categories option[value='4']").remove();
                                //    loadSubCategories(category);
                                //}
                                $('#Categories').val(category);
                                GetSubCategories(category);
                                $('#SubCategories').val(json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID);
                                document.getElementById('SubCategories').value = json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;
                            },
                            500: function () {
                            }
                        },
                        jsonp: 'jsonp'
                    });
                }

                function funUpdateProduct() {

                    var path;
                    var images = $("#imgInp").get(0).files;
                    if (images.length > 0) {
                    }
                    else {
                        path = $("#productImage").attr("src");

                    }
                    var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
                    var subCatagoryId = $('#SubCategories').val();
                    var name = document.getElementById("txtName").value;
                    var description = document.getElementById('txtDesc').value;
                    var timeReq = document.getElementById("txtTime").value;
                    var serves = document.getElementById('txtServes').value;
                    var price = document.getElementById('txtPrice').value;
                    var delivery = 0, active = 0;
                    if (document.getElementById('chkDelivery').checked) {
                        delivery = 1;
                    }
                    if (document.getElementById('chkActive').checked) {
                        active = 1;
                    }

                    var product = {
                        "PRODUCT_ID": productId,
                        "VENDOR_ID": vendorId,
                        "PRODUCT_SUB_CATEGORY_ID": subCatagoryId,
                        "NAME": name,
                        "DESCRIPTION": description,
                        "TIME_REQUIRED": timeReq,
                        "VENDOR_ID": vendorId,
                        "PRICE": price,
                        "SERVES": serves,
                        "DELIVERY": delivery,
                        "IS_ACTIVE": active,
                        "PRODUCT_PHOTO": path
                    };

                    $.ajax({
                        url: '/api/Product/UpdateProduct',
                        type: 'POST',
                        contentType: 'application/json',
                        dataType: 'json',
                        data: JSON.stringify(product),
                        statusCode: {
                            200: function (data) {
                                var newProductId = JSON.parse(data);
                                UploadImage(newProductId);
                                var ProductTags = document.getElementById("panelBody").childNodes;
                                var tagsList = [];
                                for (var i = 0; i < ProductTags.length; i++) {
                                    var tableChild = ProductTags[i];
                                    var tag = { "PRODUCT_ID": newProductId, "TAG_NAME": tableChild.innerText.split(" ")[0] }
                                    tagsList[i] = tag;
                                }
                                var tagJson = JSON.stringify(tagsList);
                                debugger;
                                $.ajax({
                                    url: '/api/Product/SaveProductTags',
                                    type: 'POST',
                                    contentType: 'application/json; charset=utf-8',
                                    dataType: 'json',
                                    data: tagJson,// JSON.stringify(tagsList) },//JSON.stringify({ 'tagsList': tagsList }),
                                    statusCode: {
                                        200: function () {
                                            $("#panelBody").empty();
                                            location.href = 'VendorProducts.aspx';
                                            clearProduct();
                                        },
                                        500: function () {
                                            $('#msgModal').modal('show');
                                            document.getElementById("lblMessage").innerHTML = "Product not saved.";
                                            document.getElementById("lblMessage").style.color = 'red';
                                        }
                                    },
                                    jsonp: 'jsonp'
                                });
                            },
                            500: function () {
                                $('#msgModal').modal('show');
                                document.getElementById("lblMessage").innerHTML = "Product not saved.";
                                document.getElementById("lblMessage").style.color = 'red';
                            }
                        },
                        jsonp: 'jsonp'
                    });
                }

                function UploadImage(id) {
                    var data = new FormData();
                    //alert(id);
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
                            url: "/api/Product/UploadImage",
                            contentType: false,
                            processData: false,
                            data: data
                        });
                        ajaxRequest.done(function (xhr, textStatus) {
                            // alert('Image Uploaded successfully')
                        });
                    }
                }

                function LoadTags() {
                    $.ajax({
                        url: '/api/Product/GetProductTagsByProductId',
                        type: 'Get',
                        contentType: 'application/json',
                        dataType: 'json',
                        data: { 'productId': productId },
                        statusCode: {
                            200: function (data) {
                                var json2 = JSON.parse(data);
                                for (var i = 0; i < json2.PRODUCT_TAGS.length; i++) {
                                    $("#panelBody").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" id=' + json2.PRODUCT_TAGS[i].TAG_NAME + "59" + ' onclick="childClick(event)">' + json2.PRODUCT_TAGS[i].TAG_NAME + ' &#9938;' + '</label>');
                                }
                            },
                            500: function () {
                            }
                        },
                    });

                }

                function GetSubCategories(category) {
                    //category = $('#Categories').val();
                    var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
                    $.ajax({
                        url: '/api/Product/GetProductSubCatagories',
                        type: 'Get',
                        contentType: 'application/json',
                        dataType: 'json',
                        data: {
                            'catagoryId': category,
                            'vendorId': vendorId
                        },
                        statusCode: {
                            200: function (data) {
                                var json1 = JSON.parse(data);
                                $('#SubCategories').empty();
                                for (var i = 0; i < json1.SUBCATEGORIES.length; i++) {
                                    $('#SubCategories').append('<option value="' + json1.SUBCATEGORIES[i].SUB_CATEGORY_ID + '">' + json1.SUBCATEGORIES[i].NAME + '</option>');
                                    //$('#SubCategories').append('<option value="' + json1.SUBCATEGORIES[i].ID + '">' + json1.SUBCATEGORIES[i].SUB_CATAGORY_NAME + '</option>');
                                }
                            },
                            500: function () {
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

                function GetSubProducts() {
                    $.ajax({
                        type: 'POST',
                        url: '/api/Product/GetProductSubCatagories',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: category,// JSON.stringify(tagsList) },//JSON.stringify({ 'tagsList': tagsList }),
                        statusCode: {
                            200: function (data) {
                                //alert("success");
                                var json1 = JSON.parse(data);

                                for (var i = 0; i < json1.SUBCATEGORIES.length; i++) {
                                    $("#showme").append('<li> <figure class="v2-menu-img"><a href="#"><img src="../Assets/images/menu-v-2/img-01.jpg" alt="img-01"> </a></figure><div class="v2-menu-detail"><h5><a href"#">' + json1.VENDORS[i].FIRST_NAME + '</a></h5> <p>Category: Food, Cakes</p><ul class="rating-star vendor-page"><li>Rated: </li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star"></a></li><li><a href="#" class="fa fa-star-half-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li><li><a href="#" class="fa fa-star-o"></a></li></ul><span class="v-vp"><a href="#" class="sm-btn111">View Profile</a></span><span class="v-vp-order"><a href="#" class="sm-btn111">Add to Cart</a></span></div></li>');
                                }
                            },
                            500: function () {
                            }
                        },
                        jsonp: 'jsonp'
                    });
                }
            });


    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="x_panel">
        <div class="x_title col-md-12">
            <h3>Edit Product</h3>
            <div class="clearfix"></div>
        </div>
        <!-- Title Ends Here -->
        <div class="x_content">
            <br/>
            <div class="row">

                <form id="formSaveProduct" action="#">
                    <div class="col-md-12">

                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel">Category</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" id="Categories">
                                    
                                    <option value="3">Food</option>
                                    <option value="4">Frozen Food</option>
                                    <option value="5">Dessert</option>
                                </select>
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>


                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel "> Sub Category</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" id="SubCategories">
                                </select>
                                
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>

                        
                       <div class="row form-group col-md-12">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel">Add Your Sub Category</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <button type="button" class="btn upbutton midmar" id="btnSubCatagory" style="margin-left:5px;"onclick="CreateSubCatagory();">+</button>
                            </div>
                            <br />
                        </div>
                        
                        

                        <div id="CreateSubCatagory"  class=" row form-group col-md-12">
                        <%--<div class="row form-group">

                            <label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad"> Sub Category</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" id="NewCategories">
                                    <option value="0">Please Select</option>
                                    <option value="1">Food</option>
                                    <option value="2">Frozen Food</option>
                                    <option value="3">Dessert</option>
                                </select>
                       
                            </div>
                        <br /> 
                        </div>--%>
                        
                        <div class="row form-group col-md-12">
                            <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel rplus">New Sub Category</label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="text" class="form-control" id="txtNewSubCataory" />
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                            <button type="button" class="btn upbutton midmar" onclick="SaveSubCatagory();">     Save</button>
                            </div>

                        
                            <br/>
                        </div>
                        </div>
                        





                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subName">Name</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" class="form-control" id="txtName" required="required" />
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subDescription">Description</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" class="form-control" id="txtDesc" />
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel rnp" for="subDescription">Time Required(hrs)</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="0" class="form-control" id="txtTime" required="required" />
                            </div>
                            <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 pad" for="subDescription"></label>--%>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                        <div class="row form-group" id="serves">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad" for="subDescription">Serves</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="0" class="form-control" id="txtServes"  />
                            </div>
                            <label class="control-label col-md-3 col-sm-3 col-xs-12 pad" for="subDescription">(Persons)</label>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subDescription">Price(PKR)</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' class="form-control" min="1" id="txtPrice" required="required" />
                            </div>
                            <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 pad" for="subDescription"></label>--%>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                        <div class="row form-group col-md-12">
                            <label class="control-label col-md-2 col-sm-3 col-xs-12 rlabel" for="subDescription">Delivery</label>
                            <div class="col-md-6 col-sm-6 col-xs-12 chbox rchb">
                                <input type="checkbox" class="checkbox" id="chkDelivery" />
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                        <div class="row form-group col-md-12">
                            <label class="control-label col-md-2 col-sm-3 col-xs-12 rlabel" for="subDescription">Active</label>
                            <div class="col-md-6 col-sm-6 col-xs-12 chbox rchb">
                                <input type="checkbox" class="checkbox" id="chkActive" />
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->



                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel">Photo </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input class="img-show" type='file' id="imgInp" onchange="readURL(this);" />
                                <img id="productImage" class="rimg" src="" alt="Please Provide 300X300 Dimensions Photo" />
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                        <div class="row form-group col-md-12">
                            <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel rplus" for="productTag">Tag</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div>
                                    <input type="text" class="form-control rinput col-md-8 " id="productTag" />
                                    <button type="button" class="btn upbutton midmar rbtn"  onclick="addTagsToPanel();">
                                        Add Tag</button>
                                </div>
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->
                        <br />
                        <div class="row form-group">
                            <div class="col-md-6">
                                <div class="panel panel-default rpanel" >
                                    <div class="panel-body" id="panelBody"></div>
                                </div>
                            </div>
                        </div>
                        <!-- form end here -->
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                
                                <img src="../Assets/images/preloader.gif" id="imgload" alt="loading" style="display:none;width:30px;height:30px" />
                            </div>
                        </div>

                        <div class="row form-group col-md-12">
                            <div class="col-md-6 ">
                                <button type="submit" id="btnSave" class="btn upbutton midmar">Save</button>
                            </div>
                        </div>
                        <!-- form end here -->


                    </div>
                    <!-- main column ends here -->
                </form>

            </div>
            <!-- row ends here -->


        </div>
        <!-- Add Product x_content ends here -->


    </div>
    <!-- x_panel ends here -->



    <div class="modal fade " id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-sm modalMsg ">
                <div class="modal-content ">
                    
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-6 col-md-offset-3">
                                    
                                    <h5 style=" text-align: center" id="lblMessage">

                                    </h5>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    <style>
        .modal-backdrop.in{
            opacity : 0;
        }
        .modal.in .modal-dialog {
    /* -webkit-transform: translate(0,0); */
    -ms-transform: translate(0,0);
    -o-transform: translate(0,0);
    transform: translate(0,0);
    background-color: #f68c93;
    margin-top: 0px;
}
    </style>


</asp:Content>
