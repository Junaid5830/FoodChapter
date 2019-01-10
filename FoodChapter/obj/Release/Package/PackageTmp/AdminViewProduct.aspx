<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdminViewProduct.aspx.cs" Inherits="FoodChapter.AdminViewProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%--  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>

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
                          console.log(data);
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


       


        $(document).ready(function () {
          $(window).keydown(function (event) {
            if (event.keyCode == 13) {
              //alert('hi');
              event.preventDefault();
              return false;
            
            }
          });
                      
          $('#CreateSubCatagory').hide();
          <%--var productId = '<%= int.Parse(FoodChapter.SessionManager.GetProductSession()) %>';
                if (productId == "0") {
                    window.location = "home.aspx";
                }--%>
          LoadProductData();

             

          $('#Categories').change(function () {
            category = $('#Categories').val();
            if (category == 3)
              $('#serves').show();
            else
              $('#serves').hide();

            GetSubCategories(category);

            //e.preventDefault();
          });

          function LoadProductData(){

          $.ajax({
            type: 'Get',
            url: '/api/Product/SearchProductByProductId',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            data: { 'productId': <%= int.Parse(FoodChapter.SessionManager.GetProductSession()) %>  },
            statusCode: {
              200: function (data) {
                $('#serves').hide();
                var json1 = JSON.parse(data);
                console.log(data);
                document.getElementById('txtName').innerText = json1.PRODUCT[0].NAME;
                document.getElementById('txtDesc').innerText = json1.PRODUCT[0].DESCRIPTION;
                document.getElementById('txtTime').innerText = json1.PRODUCT[0].TIME_REQUIRED+" hours";
                document.getElementById('txtServes').innerText = json1.PRODUCT[0].SERVES;
                document.getElementById('txtPrice').innerText = "RS. "+json1.PRODUCT[0].PRICE;
                if (json1.PRODUCT[0].CATEGORY_ID == 3) {
                  $('#serves').show();
                 
                }
                var url = json1.PRODUCT[0].PRODUCT_PHOTO;
                $("#productImage").attr("src", "" + url).width(150).height(200);

                LoadTags();
               
                document.getElementById('Categories').innerText = json1.PRODUCT[0].CATEGORY_ID;
                category = json1.PRODUCT[0].CATEGORY_ID;
                    
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

                function LoadTags() {
                    $.ajax({
                        url: '/api/Product/GetProductTagsByProductId',
                        type: 'Get',
                        contentType: 'application/json',
                        dataType: 'json',
                        data: { 'productId':  <%= int.Parse(FoodChapter.SessionManager.GetProductSession()) %> },
                        statusCode: {
                            200: function (data) {
                              var json2 = JSON.parse(data);
                              console.log(data);
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
            <h3> Product Details</h3>
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
                                <label id="Categories">
                                  
                                </label>
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>


                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel "> Sub Category</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label  id="SubCategories">
                                </label>
                                
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>

                        
                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subName">Name</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label id="txtName" ></label>
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subDescription">Description</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label id="txtDesc"></label>
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel rnp" for="subDescription">Time Required</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label id="txtTime"></label>
                            </div>
                            <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 pad" for="subDescription"></label>--%>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                        <div class="row form-group col-md-6" id="serves">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel rnp" for="subDescription">Serves</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label id="txtServes"></label>
                            </div>
                            <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 pad" for="subDescription">(Persons)</label>--%>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subDescription">Price</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label id="txtPrice"></label>
                            </div>
                            <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 pad" for="subDescription"></label>--%>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->


                       
                        <!-- Form Group -->



                     
                        <!-- Form Group -->


                        <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel rplus" for="productTag">Tag</label>
                            <label id="panelBody"></label>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- Form Group -->
                        <br />
                          <div class="row form-group col-md-6">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel">Photo </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              
                                <img id="productImage" class="rimg" src="" alt="Please Provide 300X300 Dimensions Photo" />
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- form end here -->
                    <%--    <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                
                                <img src="../Assets/images/preloader.gif" id="imgload" alt="loading" style="display:none;width:30px;height:30px" />
                            </div>
                        </div>

                        <div class="row form-group col-md-12">
                            <div class="col-md-6 ">
                                <button type="submit" id="btnSave" class="btn upbutton midmar">Save</button>
                            </div>
                        </div>--%>
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
