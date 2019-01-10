<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CustomizeCake.aspx.cs" Inherits="FoodChapter.CustomizeCake" %>

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
    debugger;
    var productId = 0, flavourPrice = 0, cakeweight = 0, totalPrice = 0, flavourFinalPrice = 0, tableIndex = 1, maxWieght = 0, minWeight = 0;
    var cakeTierArray = [];
    var p = '<%= FoodChapter.SessionManager.GetProductSession() %>';
    var t = '<%= FoodChapter.SessionManager.GetOrderIndexSession() %>';

    productId = parseInt(p);
    tableIndex = parseInt(t);
    $(document).ready(function () {
    
      debugger;
      $('#ddFlavour').change(function () {
        flavourPrice = $('#ddFlavour').val();
        debugger;
        CalculateWieghtPrice();
        setTotalPrice();
      });

      $('#ddWieght').change(function () {
        cakeweight = $('#ddWieght').val();
        debugger;
        CalculateWieghtPrice();
        setTotalPrice();
      });

      debugger;

      //load cake flavors
      $.ajax({
        url: '/api/Product/GetAllCakeFlavors',
        type: 'Get',
        contentType: 'application/json',
        dataType: 'json',
        data: { 'cakeId': productId },
        statusCode: {
          200: function (response) {
            var json1 = JSON.parse(response);
            debugger;
            $('#ddFlavour').empty();
            for (var i = 0; i < json1.CAKE_FLAVORS.length; i++) {
              $('#ddFlavour').append('<option value="' + json1.CAKE_FLAVORS[i].PRICE + '">' + json1.CAKE_FLAVORS[i].DESCRIPTION + ' | Rs.' + json1.CAKE_FLAVORS[i].PRICE + ' </option>');

            }
            $.ajax({
              url: '/api/Product/SearchCakeByCakeId',
              type: 'Get',
              contentType: 'application/json',
              dataType: 'json',
              data: { 'cakeId': productId },
              //data: JSON.stringify(),
              statusCode: {
                200: function (response) {
                  var json2 = JSON.parse(response);
                  debugger;
                  minWeight = json2.CAKE[0].MIN_WEIGHT;
                  maxWieght = json2.CAKE[0].MAX_WEIGHT;
                  for (var i = minWeight; i <= maxWieght; i++) {
                    $('#ddWieght').append('<option value="' + i + '">' + i + ' Pound' + '</option>');
                    
                  }
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
    });
    function setTotalPrice() {
      document.getElementById('PriceValue').innerHTML = totalPrice;
    }
    function CalculateWieghtPrice() {
      debugger;
      totalPrice = $('#ddFlavour').val() * $('#ddWieght').val();;
      setTotalPrice();
    }

    function funCustomizeProduct() {
      if ($('#ddWieght').val() == 0) {
        $('#msgModal').modal('show');
      }
      cakeDetail = [];
      debugger;
      var tempObj = JSON.parse(localStorage.getObj(tableIndex));
      //tempObj.CAKE_FLAVOR_ID = $('#ddFlavour').val().split("|")[0];
      //tempObj.TIERS_COUNT = $('#ddTiers').val();
      //alert(tempObj.TIERS_COUNT);
      tempObj.SIZE = $('#ddWieght').val();
      //alert(tempObj.SIZE);
      tempObj.GREETINGS = document.getElementById("txtGreetingBox").value;
      tempObj.PRICE = document.getElementById('PriceValue').innerHTML;
      //tempObj.IS_CUSTOMIZE = 1;
      tempObj.CAKE_CUSTOMIZE_DETAIL = cakeDetail;
      //alert(cakeDetail);
      localStorage.setObj(tableIndex, JSON.stringify(tempObj));
      window.location = 'Cart.aspx';

    }
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="gallery_pg_header_bg_ccb">

    <div class="gallery_bg fade1">
      <div class="seller_heading">
        <h1 style="margin-top: 188px;" class="sellers_pg_heading">Customize Cake</h1>
      </div>
    </div>
  </div>
  <div class="startcontent">
    <img class="img_right sr_tp m_animate" src="Frontend/images/bg_1.png">
    <img class="img_left m_animate" src="Frontend/images/bg_2.png">

    <div class="container">
      <div class="ccwrap col-md-12">
        <div class="c_left col-md-12 col-sm-12">

          <div class="c_select_wrap col-sm-12 col-md-6">
            <label>WEIGHT</label>
            <select class="c_select" id="ddWieght">
              <option value="0">--Select Wieght--</option>
            </select>
          </div>
          <div class="c_right col-md-6 col-sm-12">
            <div class="c_select_wrap">
              <label>FLAVOUR</label>
              <select class="c_select" id="ddFlavour">
                <option value="0">--Select Flavour--</option>
              </select>
            </div>
          </div>



          <div class="c_attach col-sm-12 col-md-12">
            <p>ATTACH IMAGE</p>



            <button class="rupload">Upload a file</button>
            <input type="file" id="imgInp" onchange="readURL(this);">
            <p id="imageB64" hidden></p>
            <img id="uploadCakeImage" src="Frontend/images/Sellers_08.png" alt="Please Provide 300X300 Photo or above">
            <button class="rupload" onclick="UploadImage(productId)" type="button">Save</button>
          </div>



          <div class="c_select_wrap col-md-12">
            <input type="text" class="c_text box" id="txtGreetingBox" placeholder="GREETING" />
          </div>



          <div class="c_total col-sm-12 ">
            <div class="cart_headings col-md-12">



              <%--   <div class="total_cc">

                            <div class="cf_total ">
                                <h2 class="">Additional Cost </h2>
                            </div>
                            <div class="cf_tval">
                                <span>Rs.<span id="tiersPriceValue"></span></span>
                            </div>
                            <div class="cf_total col-md-2" style="text-align: center;">
                            </div>

                        </div>--%>

              <div class="total_cc1">

                <div class="cf_total ">
                  <h2 class="">Total</h2>
                </div>
                <div class="cf_tval">
                  <span>Rs.<span id="PriceValue"></span></span>
                </div>

              </div>
            </div>
            <div class="col-md-12">
              <div class="cc_btn col-md-3" style="margin-top: 20px">
                <button class="cc" onclick="funCustomizeProduct()" type="button">DONE</button>
              </div>
              <div class="cc_btn col-md-3" style="margin-top: 20px">
                <a href="Cart.aspx">
                  <button class="cc" type="button">CANCEL</button></a>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
  <div class="container">
    <div class="modal fade" id="msgModal" aria-labelledby="myLargeModalLabel"
      aria-hidden="true">
      <div class="modal-dialog modal-lg" style="width: 400px;">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="divModel" style="text-align: center; color: #780103; font-size: 35px;"></h4>
          </div>

        </div>
      </div>
    </div>
  </div>
  <script>
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
          $('#uploadCakeImage')
              .attr('src', e.target.result)
              .width(200)
              .height(200);
          document.getElementById("imageB64").innerHTML = e.target.result;
        };

        reader.readAsDataURL(input.files[0]);
      }
    }
    function UploadImage(id) {
      debugger;
      var data = new FormData();
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
          url: "/api/Product/CustomizeUploadImage",
          contentType: false,
          processData: false,
          data: data
        });
        ajaxRequest.done(function (xhr, textStatus) {

          //show message
          $('#msgModal').modal('show');
          document.getElementById("divModel").innerHTML = "Image Uploaded successfully";
          document.getElementById("divModel").style.color = '#780103';
          //alert('Image Uploaded successfully')
        });
      };
    }
  </script>
</asp:Content>
