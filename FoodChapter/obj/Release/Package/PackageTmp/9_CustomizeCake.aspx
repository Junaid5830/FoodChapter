<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="9_CustomizeCake.aspx.cs" Inherits="FoodChapter._9_CustomizeCake" %>

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
        var productId = 0, tiersPrice = 0, flavourPrice = 0, totalPrice = 0, tiersFinalPrice = 0, flavourFinalPrice = 0, tableIndex = 1, maxWieght = 0, minWeight = 0;
        var cakeTierArray = [];
        var p = '<%= FoodChapter.SessionManager.GetProductSession() %>';
        var t = '<%= FoodChapter.SessionManager.GetOrderIndexSession() %>';

        productId = parseInt(p);
        tableIndex = parseInt(t);
        $(document).ready(function () {

            function ShowTiersTableData(tierCount,minW,maxW) {
                //CalculateTiersPrice();
                $("#tierTable tbody").empty();
                for (var i = 1; i <= tierCount; i++) {
                    var tableRow = "<tr><td class=" + '"tier cc_h"' + "><span class=" + '"cc_text"' + ">" + i + "</span></td>"
                                    //+ "<td class=" + '"+ Weight Range cc_h"' + "data-title=" + '"Price"' + "><span class=" + '"cc_text"' + ">" + cakeTierArray[i - 1].MIN_WEIGHT + " - " + cakeTierArray[i - 1].MAX_WEIGHT + " pounds </span></td>"
                                    + "<td class=" + '"+ Weight Range cc_h "' + "data-title=" + '"Price"' + "><input class=" + '"cc_ip"' + "   type=" + "number" + " id=" + "tbox" + i + " value=" + minW + " style=" + "width:70px;" + " onchange=" + "changeQuantity(" + i + "," + minW + "," + maxW + ")" + "> </td>"
                                    + "<td><select class=" + '"form-control cc_select"' + " id=" + "ddFlavour" + i + " onchange=" + "changeFlavour()" + "> </select></td>"
                                    + "<td><span class=" + '"cc_text"' + " id=" + "subtotal" + i + "><label></td>"
                    tableRow = tableRow + "</tr>";
                    $("table").find("tbody").append(tableRow);
                    var flavorId = '#ddFlavour' + i;
                    $('#ddFlavour' + i).html($('#ddFlavour').html());
                    var flavourPrice = $('#ddFlavour' + i).val().split("|")[1];
                    var weight = parseInt(document.getElementById("tbox" + i).value);
                    $('#subtotal' + i).text(flavourPrice * weight);

                }
                CalculateWieghtPrice();

            }

            function ShowCustomizeTableData(cakeDetail) {
                CalculateTiersPrice();
                $("#tierTable tbody").empty();
                var tierCount = $('#ddTiers').val();
                debugger;
                for (var i = 1; i <= tierCount; i++) {
                    var tierDetail = cakeDetail[i - 1];
                    var tableRow = "<tr><td class=" + '"tier cc_h"' + "><span class=" + '"cc_text"' + ">" + i + "</span></td>"
                                    + "<td>" + cakeTierArray[i - 1].MIN_WEIGHT + " - " + cakeTierArray[i - 1].MAX_WEIGHT + " pounds </td>"
                                    + "<td><input type=" + "number" + " min=" + cakeTierArray[i - 1].MIN_WEIGHT + " id=" + "tbox" + i + " value=" + tierDetail.TIER_WEIGHT + " style=" + "width:70px;" + " onchange=" + "changeQuantity(" + i + "," + minW + "," + maxW + ")" + "></td>"
                                    + "<td><select class=" + '"form-control"' + " id=" + "ddFlavour" + i + " onchange=" + "changeFlavour()" + "> </select></td>"
                    tableRow = tableRow + "</tr>";
                    debugger;
                    $("table").find("tbody").append(tableRow);
                    var flavorId = '#ddFlavour' + i;
                    $('#ddFlavour' + i).html($('#ddFlavour').html());
                    var k = $("#ddFlavour option[value='" + tierDetail.CAKE_FALVOUR_ID + '|' + tierDetail.FLAVOUR_PRICE + "']").index();
                    $('#ddFlavour' + i).prop('selectedIndex', k);


                }
                CalculateWieghtPrice();

            }

            $('#ddFlavour').change(function () {
                flavourPrice = $('#ddFlavour').val().split("|")[1];
                CalculateWieghtPrice();
                setTotalPrice();
            });

            $('#ddWieght').change(function () {
                CalculateWieghtPrice();
            });

            $('#ddTiers').change(function () {
                //$('#ddWieght').empty();
                var tierCount = $('#ddTiers').val();
                //for (var i = weight; i <= maxWieght; i++) {
                //    $('#ddWieght').append('<option value="' + i + '">' + i + ' Pound' + '</option>');

                //}
                ShowTiersTableData(tierCount,minWeight,maxWieght);
                //CalculateTiersPrice();
                //CalculateWieghtPrice();
            });

            debugger;
            //populate  tier cake object
            $.ajax({
                url: '/api/Product/GetCakeTierDetail',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'cakeId': productId },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;

                        for (var i = 0; i < json1.CAKE_TIERS.length; i++) {
                            //alert(i);    
                            var cakeObject = { "TIER_ORDER": json1.CAKE_TIERS[i].TIER_ORDER, "MIN_WEIGHT": json1.CAKE_TIERS[i].MIN_WEIGHT, "MAX_WEIGHT": json1.CAKE_TIERS[i].MAX_WEIGHT }
                            cakeTierArray[i] = cakeObject;
                        }
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });

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
                        $('#ddFlavour').empty();
                        for (var i = 0; i < json1.CAKE_FLAVORS.length; i++) {
                            $('#ddFlavour').append('<option value="' + json1.CAKE_FLAVORS[i].CAKE_FLAVOR_ID + '|' + json1.CAKE_FLAVORS[i].PRICE + '">' + json1.CAKE_FLAVORS[i].DESCRIPTION + ' | Rs.' + json1.CAKE_FLAVORS[i].PRICE + ' </option>');

                        }

                        //load cake tiers
                        $.ajax({
                            url: '/api/Product/SearchCakeByCakeId',
                            type: 'Get',
                            contentType: 'application/json',
                            dataType: 'json',
                            data: { 'cakeId': productId },
                            //data: JSON.stringify(),
                            statusCode: {
                                200: function (response) {
                                    $('#ddTiers').empty();
                                    var json2 = JSON.parse(response);
                                    var minTiers = json2.CAKE[0].MIN_TIERS, maxTiers = json2.CAKE[0].MAX_TIERS;
                                    tiersPrice = json2.CAKE[0].PRICE_PER_TIER;
                                    for (var i = minTiers; i <= maxTiers; i++) {
                                        $('#ddTiers').append('<option value="' + i + '">' + i + ' Tiers' + '</option>');

                                    }

                                    //load weight
                                    minWeight = json2.CAKE[0].MIN_WEIGHT;
                                    maxWieght = json2.CAKE[0].MAX_WEIGHT;
                                    var tierCount = $('#ddTiers').val();
                                    $('#ddWieght').empty();

                                    for (var i = minWeight; i <= maxWieght; i++) {
                                        $('#ddWieght').append('<option value="' + i + '">' + i + ' Pound' + '</option>');

                                    }

                                    ShowTiersTableData(tierCount,minWeight,maxWieght);

                                    

                                    //load customize table data
                                    var tempObj = JSON.parse(localStorage.getObj(tableIndex));
                                    if (tempObj.IS_CUSTOMIZE == 1) {
                                        i = $("#ddTiers option[value='" + tempObj.TIERS_COUNT + "']").index();
                                        $('#ddTiers').prop('selectedIndex', i);
                                        i = $("#ddWieght option[value='" + tempObj.SIZE + "']").index();
                                        $('#ddWieght').prop('selectedIndex', i);
                                        document.getElementById("txtGreetingBox").value = tempObj.GREETINGS;
                                        ShowCustomizeTableData(tempObj.CAKE_CUSTOMIZE_DETAIL);
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
            document.getElementById('tiersPriceValue').innerHTML = tiersFinalPrice;
        }

        function CalculateWieghtPrice() {
            debugger;
            totalPrice = 0;
            //totalPrice -= flavourFinalPrice;

            var rowCount = document.getElementById('tierTable').rows.length;

            flavourFinalPrice = 0;
            //var totalWieght = 0;
            for (var i = 1; i < rowCount; i++) {
                var flavourPrice = $('#ddFlavour' + i).val().split("|")[1];
                //alert(flavourPrice);
                var weight = parseInt(document.getElementById("tbox" + i).value);
                $('#subtotal' + i).text(flavourPrice * weight);
                flavourFinalPrice = flavourFinalPrice + flavourPrice * weight;
            }

            //flavourFinalPrice = flavourPrice * $('#ddWieght').val();
            debugger;
            totalPrice += flavourFinalPrice;
            setTotalPrice();

        }

        function CalculateTiersPrice() {
            totalPrice -= tiersFinalPrice;

            tiersFinalPrice = tiersPrice * ($('#ddTiers').val() - 1);
            totalPrice += tiersFinalPrice;
            setTotalPrice();
        }

        function funCustomizeProduct() {
            var cakeDetail = [];
            var isCorrectOrder = 1, maxCWeight = 0;
            debugger;

            var rowCount = document.getElementById('tierTable').rows.length;
            for (var i = 1; i < rowCount; i++) {
                var flavourPrice = $('#ddFlavour' + i).val().split("|")[1];
                var flavourId = $('#ddFlavour' + i).val().split("|")[0];
                //alert(flavourPrice);
                var weight = parseInt(document.getElementById("tbox" + i).value);
                if (maxCWeight == 0)
                    maxCWeight = weight;
                else {
                    if (weight > maxCWeight)
                        isCorrectOrder = 0;
                }
                var tierDetail = { "CAKE_FALVOUR_ID": flavourId, "TIER_ORDER": i, "TIER_WEIGHT": weight, "FLAVOUR_PRICE": flavourPrice };
                cakeDetail[i - 1] = tierDetail;

            }
            if (isCorrectOrder == 0) {
                $('#msgModal').modal('show');

                document.getElementById("divModel").innerHTML = "Lower Tier must have weight greater than upper layer";
                document.getElementById("divModel").style.color = '#780103';
            }
            else {

                if (checkCakeWeight() != 2) {
                    $('#msgModal').modal('show');
                    document.getElementById("divModel").innerHTML = "Cake weight is not equal to defined weight";
                    document.getElementById("divModel").style.color = '#780103';
                }
                else {
                    debugger;
                    var tempObj = JSON.parse(localStorage.getObj(tableIndex));
                    //tempObj.CAKE_FLAVOR_ID = $('#ddFlavour').val().split("|")[0];
                    tempObj.TIERS_COUNT = $('#ddTiers').val();
                    //alert(tempObj.TIERS_COUNT);
                    tempObj.SIZE = $('#ddWieght').val();
                    //alert(tempObj.SIZE);
                    tempObj.GREETINGS = document.getElementById("txtGreetingBox").value;
                    tempObj.PRICE = document.getElementById('PriceValue').innerHTML;
                    tempObj.IS_CUSTOMIZE = 1;
                    tempObj.CAKE_CUSTOMIZE_DETAIL = cakeDetail;
                    //alert(cakeDetail);
                    localStorage.setObj(tableIndex, JSON.stringify(tempObj));
                    window.location = '5_cart.aspx';

                }
            }
        }

        Storage.prototype.getObj = function (key) {
            key = 'fc' + key;
            return JSON.parse(this.getItem(key))
        };


        Storage.prototype.setObj = function (key, obj) {
            key = 'fc' + key;
            return this.setItem(key, JSON.stringify(obj))
        };


        function changeQuantity(currentIndex,minW,maxW) {
            //var tableCells = document.getElementById('tierTable').rows.item(currentIndex).cells;
            var updateTotal = parseInt(document.getElementById("tbox" + currentIndex).value);
            var isnum = /^\d+$/.test(updateTotal);
            if (isnum != true) {
                $('#msgModal').modal('show');
                document.getElementById("divModel").innerHTML = "Quantity must be greater than 0";
                document.getElementById("divModel").style.color = '#780103';
                document.getElementById("tbox" + currentIndex).value = minW;
            }
            else {
                //if (updateTotal < minW)
                //    document.getElementById("tbox" + currentIndex).value = minW;
                //else 
                if (updateTotal > maxW)
                    document.getElementById("tbox" + currentIndex).value = maxW;
                var flavourPrice = $('#ddFlavour' + currentIndex).val().split("|")[1];
                var weight = parseInt(document.getElementById("tbox" + currentIndex).value);
                $('#subtotal' + currentIndex).text(flavourPrice * weight);
                CalculateWieghtPrice();
                //if (checkCakeWeight() == 0) {
                //    $('#msgModal').modal('show');
                //    document.getElementById("divModel").innerHTML = "Cake weight increased from defined weight";
                //    document.getElementById("divModel").style.color = 'red';
                //}
                //else
                    CalculateWieghtPrice();
            }

        }

        function checkCakeWeight() {
            var rowCount = document.getElementById('tierTable').rows.length;
            var totalWieght = 0;
            for (var i = 1; i < rowCount; i++) {
                totalWieght += parseInt(document.getElementById("tbox" + i).value);
            }

            var definedWeight = $('#ddWieght').val();
            if (definedWeight == totalWieght)
                return 2;
            if (definedWeight > totalWieght)
                return 1;
            else
                return 0;
        }

        function changeFlavour() {
            CalculateWieghtPrice();
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
                <div class="c_left col-md-6 col-sm-12">
                    
                    <div class="c_select_wrap">
                        <label>WEIGHT</label>
                        <select class="c_select" id="ddWieght">
                            <%--<option value="WEIGHT">WEIGHT</option>--%>
                        </select>
                    </div>
                   <div class="c_select_wrap">
                        <label>TIER</label>
                        <select class="c_select" id="ddTiers">
                            <%--<option value="TIER">TIER</option>--%>
                        </select>
                    </div>


                    <%--<div class="c_select_wrap">
                    <label>SHAPE</label>
                    <select class="c_select">
                        <option value="SHAPE">SHAPE</option>
                        <option value="ROUND">ROUND</option>
                        <option value="SQUARE">SQUARE</option>
                        <option value="RECTANGLE">RECTANGLE</option>
                    </select>
                </div>--%>

                    <div class="c_attach">
                        <p>ATTACH IMAGE</p>
                        <%--<img src="Frontend/images/Sellers_08.png" style="width: 70px;" class="col-md-5" />

                        <h4 class="col-md-2">image.jpg</h4>
                        <img src="Frontend/images/cancel.png" class="c_cancel col-md-1" />
                        <h5 class="col-md-6">PLEASE SELECT</h5>--%>

                        
                        
    <button class="rupload">Upload a file</button>
                        <input type="file" id="imgInp" onchange="readURL(this);">
                           <p id="imageB64" hidden></p>
                        <img id="uploadCakeImage" src="Frontend/images/Sellers_08.png" alt="Please Provide 300X300 Photo or above">
                        <button class="rupload" onclick="UploadImage(productId)" type="button">Save</button>
                    </div>
                <div class="c_right col-md-6 col-sm-12">
                    <div class="c_select_wrap">
                        <label>FLAVOUR</label>
                        <select class="c_select" id="ddFlavour">
                        </select>
                    </div>

                    <%--<div class="c_select_wrap">
                    <label>COLOUR</label>
                    <select class="c_select">
                        <option value="COLOR">COLOR</option>
                        <option value="BROWN">BROWN</option>
                        <option value="BLUE">BLUE</option>
                        <option value="WHITE">WHITE</option>
                    </select>
                </div>--%>

                    <%--<div class="c_select_wrap">
                    <label>TEXT</label>
                    <input type="text" class="c_text" placeholder="TEXT">
                </div>--%>

                    <div class="c_select_wrap">
                        <input type="text" class="c_text box" id="txtGreetingBox" placeholder="GREETING BOX" />
                    </div>

                </div>

                <div class="c_total col-md-12">
                    <div class="cart_headings col-md-12">

                        <table class="cart_headings" cellspacing="0" id="tierTable">
                            <thead>
                                <tr>


                                    <th class="product-name ">Tier Order</th>
                                    <%--<th class="product-price">Weight Range</th>--%>
                                    <th class="product-quantity ">Weight</th>
                                    <th class="product-subtotal ">Flavor</th>
                                    <%--<th class="product-subtotal ">Shape</th>--%>
                                    <th class="product-subtotal ">Sub Total</th>
                                </tr>
                            </thead>
                            <tbody class="cart_det">
                                <tr>
                                    <%--                                    <td class="tier cc_h">
                                        <span class="cc_text">1</span>
                                    </td>

                                    <td class="Weight Range cc_h" data-title="Price">
                                        <span class="cc_text">2-4</span>						</td>

                                    <td class="Weight cc_h" data-title="Quantity">
                                        <span class="cc_text">2</span>
                                    </td>

                                    <td class="Flavor" data-title="Price">
                                        <span class="cc_text">Chocolate</span>						</td>


                                    <td class="Shape" data-title="Price">
                                        <span class="cc_text">Round</span>						</td>

                                    <td class="Subtotal" data-title="Price">
                                        <span class="cc_text">Rs. 900</span>						</td>--%>
                                </tr>

                            </tbody>

                        </table>

                        <div class="total_cc">

                            <div class="cf_total ">
                                <h2 class="">Additional Cost </h2>
                            </div>
                            <div class="cf_tval">
                                <span>Rs.<span id="tiersPriceValue"></span></span>
                            </div>
                            <div class="cf_total col-md-2" style="text-align: center;">
                            </div>

                        </div>

                        <div class="total_cc1">

                            <div class="cf_total ">
                                <h2 class="">Total</h2>
                            </div>
                            <div class="cf_tval">
								<span>Rs.<span id="PriceValue"></span></span>
                            </div>

                        </div>
                        <div class="cc_btn" style=" margin-top: 20px">
                            <button class="cc" onclick="funCustomizeProduct()" type="button">DONE</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
         <div class="container">
        <div class="modal fade" id="msgModal" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" style="width:400px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="divModel" style="text-align: center; color:#780103; font-size:35px;">
                        
                        </h4>
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
