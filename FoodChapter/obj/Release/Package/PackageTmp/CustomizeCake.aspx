<%@ Page  Title="CustomizeCake" Language="C#" AutoEventWireup="true" CodeBehind="CustomizeCake.aspx.cs" Inherits="FoodChapter.WebPages.CustomizeCake" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
     <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
     <link rel="stylesheet" href="../Assets/css/flora.css">
        <link rel="stylesheet" href="../Assets/css/bootstrap.css">
        <link rel="stylesheet" href="../Assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="../Assets/css/style.css">
    <link rel="stylesheet" href="../Assets/css/custom.css">
   
        <link rel="stylesheet" href="../Assets/css/responsive.css">
        <link rel="stylesheet" href="../Assets/css/theme-elements.css">
        <link rel="stylesheet" href="../Assets/css/color.css">
        <link rel="stylesheet" href="../Assets/css/vendor-profile.css" style="stylesheet">
       
    <link rel="stylesheet" href="../Assets/css/wbn-datepicker.css">

  <link rel="stylesheet" href="../Assets/css/gallery.css">
<%--   <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
 <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
       
     <!--   <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" /> -->
<!-- <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="libs/jquery/jquery.js"><\/script>')</script>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-5002e1366084f15f"></script>
  <script src="dist/fixto.min.js"></script>

   <script src="../Assets/js/vendor/mod.js"></script>--%>

       
   
    <!-- VEGAS STYLE CSS -->

     <!-- GOOGLE FONT -->
     <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
     <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="../Assets/css/custom.css">
   
    <title>Customize Cake</title>
    <script src="../Scripts/jquery-1.8.2.intellisense.js"></script>
    <script src="../Scripts/jquery-ui-1.8.24.min.js"></script>
    <script src="../Scripts/jquery-1.8.2.js"></script>
    <script src="../Scripts/jquery-1.8.2.min.js"></script>
    <script src="../Scripts/jquery-ui-1.8.24.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
   
    <script>

        var productId = 0, tiersPrice = 0, flavourPrice = 0, totalPrice = 0, tiersFinalPrice = 0, flavourFinalPrice = 0, tableIndex = 1, maxWieght = 0;
        var cakeTierArray = [];
        productId = '<%= int.Parse(FoodChapter.SessionManager.GetProductSession()) %>';
        <%--tableIndex = '<%= int.Parse(FoodChapter.SessionManager.GetOrderIndexSession()) %>';--%>
        //alert(productId);
        function setTotalPrice() {
            document.getElementById('PriceValue').innerHTML = totalPrice; 
            document.getElementById('tiersPriceValue').innerHTML = tiersFinalPrice;
        }

        function CalculateWieghtPrice() {
            totalPrice -= flavourFinalPrice;

            var rowCount = document.getElementById('tierTable').rows.length;

            flavourFinalPrice = 0;
            //var totalWieght = 0;
            for (var i = 1; i < rowCount; i++) {
                var flavourPrice = $('#ddFlavour' + i).val().split("|")[1];
                //alert(flavourPrice);
                var weight = parseInt(document.getElementById("tbox" + i).value);

                flavourFinalPrice = flavourFinalPrice + flavourPrice * weight;
            }

            //flavourFinalPrice = flavourPrice * $('#ddWieght').val();

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
                
                document.getElementById("lblMessage").innerHTML = "Lower Tier must have weight greater than upper layer";
                document.getElementById("lblMessage").style.color = 'red';
            }
            else {

                if (checkCakeWeight() != 2) {
                    $('#msgModal').modal('show');
                    document.getElementById("lblMessage").innerHTML = "Cake weight is not equal to defiend weight";
                    document.getElementById("lblMessage").style.color = 'red';
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
                    debugger;
                    window.location = 'cart.aspx';

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


        function changeQuantity(currentIndex) {
            //var tableCells = document.getElementById('tierTable').rows.item(currentIndex).cells;
            var updateTotal = parseInt(document.getElementById("tbox" + currentIndex).value);
            var isnum = /^\d+$/.test(updateTotal);
            if (isnum != true) {
                $('#msgModal').modal('show');
                document.getElementById("lblMessage").innerHTML = "Quantity must be greater than 0";
                document.getElementById("lblMessage").style.color = 'red';
                document.getElementById("tbox" + currentIndex).value = cakeTierArray[currentIndex - 1].MIN_WEIGHT;
            }
            else {
                if (updateTotal < cakeTierArray[currentIndex - 1].MIN_WEIGHT)
                    document.getElementById("tbox" + currentIndex).value = cakeTierArray[currentIndex - 1].MIN_WEIGHT;
                else if (updateTotal > cakeTierArray[currentIndex - 1].MAX_WEIGHT)
                    document.getElementById("tbox" + currentIndex).value = cakeTierArray[currentIndex - 1].MAX_WEIGHT;
                var flavourPrice = $('#ddFlavour' + currentIndex).val().split("|")[1];
                var weight = parseInt(document.getElementById("tbox" + currentIndex).value);
                $('#subtotal' + currentIndex).text(flavourPrice * weight);
                CalculateWieghtPrice();
                if (checkCakeWeight() == 0) {
                    $('#msgModal').modal('show');
                    document.getElementById("lblMessage").innerHTML = "Cake weight increased from defined weight";
                    document.getElementById("lblMessage").style.color = 'red';
                }
                else
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
        $(document).ready(function () {
            //function loadProducts() {
            //    alert("pageload event fired!");
            //}



            function ShowTiersTableData(tierCount) {
                CalculateTiersPrice();
                $("#tierTable tbody").empty();
                for (var i = 1; i <= tierCount; i++) {
                    var tableRow = "<tr><td>" + i + "</td>"
                                    + "<td>" + cakeTierArray[i - 1].MIN_WEIGHT + " - " + cakeTierArray[i - 1].MAX_WEIGHT + " pounds </td>"
                                    + "<td><input type=" + "number" + " min=" + cakeTierArray[i - 1].MIN_WEIGHT + " id=" + "tbox" + i + " value=" + cakeTierArray[i - 1].MIN_WEIGHT + " style=" + "width:70px;" + " onchange=" + "changeQuantity(" + i + ")" + "></td>"
                                    + "<td><select class=" + '"form-control"' + " id=" + "ddFlavour" + i + " onchange=" + "changeFlavour()" + "> </select></td>"
                                    + "<td><label id="+"subtotal"+i+"><label></td>"
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
                    var tableRow = "<tr><td>" + i + "</td>"
                                    + "<td>" + cakeTierArray[i - 1].MIN_WEIGHT + " - " + cakeTierArray[i - 1].MAX_WEIGHT + " pounds </td>"
                                    + "<td><input type=" + "number" + " min=" + cakeTierArray[i - 1].MIN_WEIGHT + " id=" + "tbox" + i + " value=" + tierDetail.TIER_WEIGHT + " style=" + "width:70px;" + " onchange=" + "changeQuantity(" + i + ")" + "></td>"
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
                $('#ddWieght').empty();
                var weight = $('#ddTiers').val();
                for (var i = weight; i <= maxWieght; i++) {
                    $('#ddWieght').append('<option value="' + i + '">' + i + ' Pound' + '</option>');

                }
                ShowTiersTableData(weight);
                CalculateTiersPrice();
                //CalculateWieghtPrice();
            });

            //ShowTiersTableData(1);


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

                $.ajax({
                    //url: '/api/Vendors/GetAllVendors',
                    url: '/api/Product/GetAllCakeFlavors',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'cakeId': productId },
                    //data: JSON.stringify(),
                    statusCode: {
                        200: function (response) {
                            var json1 = JSON.parse(response);
                            $('#ddFlavour').empty();
                            for (var i = 0; i < json1.CAKE_FLAVORS.length; i++) {
                                $('#ddFlavour').append('<option value="' + json1.CAKE_FLAVORS[i].CAKE_FLAVOR_ID + '|' + json1.CAKE_FLAVORS[i].PRICE + '">' + json1.CAKE_FLAVORS[i].DESCRIPTION + ' | Rs.' + json1.CAKE_FLAVORS[i].PRICE + ' </option>');

                            }

                            //flavourPrice = $('#ddFlavour').val().split("|")[1];

                            $.ajax({
                                //url: '/api/Vendors/GetAllVendors',
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

                                        var weight = $('#ddTiers').val();
                                        ShowTiersTableData(weight);

                                        $('#ddWieght').empty();
                                        var minWeight = json2.CAKE[0].MIN_WEIGHT;
                                        maxWieght = json2.CAKE[0].MAX_WEIGHT;
                                        for (var i = minWeight; i <= maxWieght; i++) {
                                            $('#ddWieght').append('<option value="' + i + '">' + i + ' Pound' + '</option>');

                                        }


                                        var tempObj = JSON.parse(localStorage.getObj(tableIndex));
                                        if (tempObj.IS_CUSTOMIZE == 1) {
                                            i = $("#ddTiers option[value='" + tempObj.TIERS_COUNT + "']").index();
                                            $('#ddTiers').prop('selectedIndex', i);
                                            i = $("#ddWieght option[value='" + tempObj.SIZE + "']").index();
                                            $('#ddWieght').prop('selectedIndex', i);
                                            document.getElementById("txtGreetingBox").value = tempObj.GREETINGS;
                                            ShowCustomizeTableData(tempObj.CAKE_CUSTOMIZE_DETAIL);

                                        }

                                        //CalculateTiersPrice();
                                        //CalculateWieghtPrice();
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

        function funSaveSubCatagory() {
            var name = document.getElementById("subName").value;
            var description = document.getElementById('subDescription').value;

            var subCatagory = {
                "CATAGORY_ID": catagory,
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
 </head>
<body id="home">
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

        <!-- Wrapper -->
        <div class="wrapper">

            <!-- Header -->
            <header class="header-2">
            <!-- top header -->
                 <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="top-bar" id="top-bar">
        <ul class="nav navbar-nav navbar-right navinner">
         
        <li></li>
      </ul>
        </div><!-- /.navbar-collapse -->
            <!-- top header -->
               <!-- Header inner -->
    <header class="header-inner">
        <div class="container myContainer">
            <div class="row">
                <strong class="inner-logo"><a href="index.php"><img src="../Assets/../Assets/images/.png" alt="logo"></a></strong>
                <nav class="nav-inner">
                    <div class="navbar-header">
                        <a class="side-bar-btn pull-right fa fa-bars" href="#" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"></a>
                        <a class="responsive-logo pull-left" href="index.php"><img src="logo.png" alt="logo"></a>
                        
                    </div>
                     <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul id="nav-list-inner" class="nav-list-inner">
                                    <li><a href="home.aspx">Home</a></li>
                                    <li><a href="gallery.aspx">Gallery</a></li>
                                    <li><a href="Vendors.aspx">Sellers</a></li>
                                    <li><a href="contact.aspx">Contact</a></li>
                                  
                                          
                                </ul>

                   </div>
                </nav>
            </div>
        </div>
    </header>
    <!-- Header inner -->
    </header>
            <!-- Header -->
   <!-- Inner banner -->
	<section class="parallax-window inerr-banner newbg" data-parallax="scroll">
        <div class="row"> 
            <div class="col-md-2"></div>

             <form class="form-horizontal col-md-8" id="formCustomize" action="#">
                  
                <div class="form-group">
                     <label for="subName">Flavour</label>
                        <select class="form-control" id="ddFlavour">
                            
                        </select>
                </div>
                <div class="form-group">
                     <label for="subName">Tiers</label>
                        <select class="form-control" id="ddTiers">
                            
                        </select>
                </div>
                 <div class="form-group">
                     <label for="subName">Weight</label>
                        <select class="form-control" id="ddWieght">
                            
                        </select>
                </div>

                 <div class="form-group" hidden="hidden">
                     <label for="subName">Flavour</label>
                        <select class="form-control" id="ddFlavour">
                            
                        </select>
                </div>
                 
                 <div class="form-group" id="divTeirTable">
                      <div class="table-responsive">
                         <table class="table" id="tierTable">
	                        <thead>
		                        <tr style="background-color:#F6A0A5;color:white">
			                        <th scope="col">Tier Order</th>
			                        <th scope="col">Weight Range</th>
			                        <th scope="col">Weight</th>
			                        <th scope="col">Flavour</th>
			                        <th scope="col">Sub Total</th>
		                        </tr>
	                        </thead>
	                        <tbody>

	                        </tbody>
                        </table>
                    </div>
                </div>
                 
                <div class="form-group">
                    <label for="GreetingBox" >
                        Greetings Box</label>
                    <textarea class="form-control " placeholder="Greeting Box" id="txtGreetingBox" rows="5"></textarea>

                        <%--<input type="text"class="form-control" id="Address" placeholder="Mobile" required="required" />--%>
                </div>
                  
                 
                 <div class="form-group row">

                    <label for="DescriptionNote" class="control-label col-sm-11 col-xs-12 text-left pad">
                           TIERS Price : </label>
                    <div class="col-md-6 col-sm-2 col-xs-12" style="width:50px;">
                         <label for="DescriptionNote" class="control-label" id ="tiersPriceValue">
                               0 </label>
                    </div>
                </div>


                <div class="form-group row">
                    <label for="DescriptionNote" class="control-label col-sm-11 col-xs-12 text-left pad">
                           Price : </label>
                    <div class="col-md-6 col-sm-2 col-xs-12" style="width:50px;">
                         <label for="DescriptionNote" class="control-label" id ="PriceValue">
                               0 </label>
                    </div>
                </div>
                
                <button type="button" class="btn btn-primary btn-sm" onclick="funCustomizeProduct()">
                    Save Customize</button>  
            </form> 

            <div class="col-md-2"></div>



          </div> <!-- row ends here -->
    
 </section>

            	<!-- Large Signin Signup Modal -->
    		  <footer id="footer">
                <div class="container">

                    <!-- Footer Columns -->
                    <div class="footer">
<img src="../Assets/images/logo.png" width="200px" height="" alt="Food Chapter log" style="margin-bottom: 13px;"><a class="business-info" href="tel://+923453177413">
        <p>Lhr: +92 345 3177413</p></a><a class="business-info" href="tel://+923453177413">
        <p>Pk: +92 345 3177413</p></a><a class="business-info" href="mailto:irfan@xevensolutions.com">
        <p>info@foodchapter.pk</p></a>
      <div class="social-links"><a class="icon-instagram" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="instagram logo"><img src="../Assets/images/../Assets/images/logo-instagram.png" alt="Instagram logo"></a><a class="icon-twitter" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="twitter logo"><img src="../Assets/images/logo-twitter.png" alt="Twitter logo"></a><a class="icon-facebook" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="facebook logo"><img src="../Assets/images/logo-facebook.png" alt="Facebook logo"></a><a class="icon-pinterest" href="#" target="_blank" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="click social" analytics-event="pinterest logo"><img src="../Assets/images/logo-pinterest.png" alt="Pinterest logo"></a></div>
      <ul class="site-links">
        <li class="site-links__item"><a class="site-links__item__link" href="#" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click flower care">Home</a></li>
        
        <li class="site-links__item"><a class="site-links__item__link" href="#register" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click meet out florist">Register</a></li>
        <li class="site-links__item"><a class="site-links__item__link" href="#mVendors" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click workshops">Vendors</a></li>
        
       <!-- <li class="site-links__item"><a class="site-links__item__link" href="#" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click faq">FAQS</a></li>
        <li class="site-links__item"><a class="site-links__item__link" href="#" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click contact">Contact</a></li>
        <li class="site-links__item"><a class="site-links__item__link" href="#" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click reviews">Terms &amp; Conditions</a></li>
        <li class="site-links__item"><a class="site-links__item__link" href="#" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click about ">About</a></li> 
        <li class="site-links__item"><a class="site-links__item__link" href="#" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click careers">Careers</a></li> -->
      </ul>
      <div class="card-icons"><img src="../Assets/images/cards.png" alt="Accepted payment methods" width="200px"></div>
      <div class="legal">
        <p class="legal__copyright">© 2017 Xeven  Solutions. All rights reserved.&nbsp;<a class="legal__link" href="#" rel="nofollow" analytics-on="click" analytics-category="web_footer" analytics-label="footer" analytics-event="click t&amp;cs">Privacy policy (Terms &amp; Conditions)</a></p>
      </div>
    </div>
                    <!-- Footer Columns -->

                </div>
           
            </footer>
            <!-- Footer -->

        </div>
        <!-- Wrapper -->

            <script>
                function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            $('#blah')
                                .attr('src', e.target.result)
                                .width(150)
                                .height(200);
                        };

                        reader.readAsDataURL(input.files[0]);
                    }
                }
</script>




</body>




</html>