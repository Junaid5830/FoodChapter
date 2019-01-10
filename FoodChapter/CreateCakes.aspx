<%@ Page Title="" MasterPageFile="~/MasterPages/Vendor.Master" Language="C#" AutoEventWireup="true" CodeBehind="CreateCakes.aspx.cs" Inherits="FoodChapter.WebPages.CreateCakes" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 
   <style>
        .chbox{
            margin-top : 4px;
        }
        .pinkbtn{
            background-color:#780103;
            color:white;
            line-height:0px;
            border-radius: 5px;
    height: 46px;
    width: 160px;
    text-transform: uppercase;
    letter-spacing: 2px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        var category = 0;
        $(document).ready(function () {
            $(window).keydown(function (event) {
                if (event.keyCode == 13) {
                    //alert('hi');
                    event.preventDefault();
                    return false;
                }
            });
            var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
            if (vendorId == "0") {
                window.location = "Home.aspx";
            }
            GetEvents();
            GetFlavors();
            GetTypes();

            $('#customCake').hide();
            $('#CreateNewFlavour').hide();
            $('#CreateNewEvents').hide();

            //$('#chkCustom').change(function () {
            //    if (this.checked) {
            //        $('#customCake').show();
            //        LoadTierTable();
            //    }
            //    else {
            //        $('#customCake').hide();
            //    }
            //});

            //$('#txtMinTiers').focusout(function () {
            //    var minTiers = $('#txtMinTiers').val();
            //    var maxTiers = $('#txtMaxTiers').val();
            //    if (minTiers > maxTiers) {
            //        $('#msgModal').modal('show');
            //        document.getElementById("lblMessage").innerHTML = "Mintiers cannot be greator than maxTiers";
            //        document.getElementById("lblMessage").style.color = '#780103';
            //        $('#txtMinTiers').val(1);
            //        $('#txtMaxTiers').val(1);
                   

            //        return;
            //    }
            //    else {
                   
            //    }

            //});

            //$('#txtMaxTiers').focusout(function () {
            //    var min = $('#txtMinTiers').val();
            //    var max = $('#txtMaxTiers').val();
            //    if (max < min) {

            //        $('#msgModal').modal('show');
            //        document.getElementById("lblMessage").innerHTML = "Mintiers cannot be greator than maxTiers";
            //        document.getElementById("lblMessage").style.color = '#780103';
            //        $('#txtMinTiers').val(1);
            //        $('#txtMaxTiers').val(1);
            
            //        return;
            //    }
            //    else {
                   
            //    }

            //});

            $('#formSaveCake').submit(function () {
                //document.getElementById("btnSave").disabled = true;
                //$('#imgload').show();
                var files = $("#imgInp").get(0).files;
                if (files.length == 0) {
                    $('#msgModal').modal('show');
                    document.getElementById("lblMessage").innerHTML = "Please Upload Image";
                    document.getElementById("lblMessage").style.color = '#780103';
                    //document.getElementById("btnSave").disabled = false;
                    //$('#imgload').hide();
                    return false;
                }
                var name = document.getElementById("txtName").value;
                var cake = {
                    "VENDOR_ID": vendorId,
                    "NAME": name
                };
                $.ajax({
                    url: '/api/Product/IsUniqueCake',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(cake),
                    statusCode: {
                        200: function (result) {
                            funSaveCake();
                        },
                        500: function (result) {
                            $('#msgModal').modal('show');
                            document.getElementById("lblMessage").innerHTML = "Name not unique";
                            document.getElementById("lblMessage").style.color = '#780103';
                            //alert('Error occured. Not unique name');
                        },
                        404: function (data) {
                            alert('cake error' + data);
                        }
                    },
                    jsonp: 'jsonp'
                });
                return false;
            });

            function funSaveCake() {
                var cakeFlavours = document.getElementById("flavorPanel").childNodes;
                if (cakeFlavours.length == 0) {
                    $('#msgModal').modal('show');
                    document.getElementById("lblMessage").innerHTML = "Please add atleast one flavour";
                    document.getElementById("lblMessage").style.color = '#780103';
                }
                else {
                    debugger;
                    var name = document.getElementById("txtName").value;
                    var typeId = $('#Types').val();
                    var minWeight = document.getElementById("txtMinWeight").value;
                    var maxWeight = document.getElementById("txtMaxWeight").value;

                    //var minTiers = document.getElementById("txtMinTiers").value;
                    //var maxTiers = document.getElementById("txtMaxTiers").value;
                    var description = document.getElementById('txtDesc').value;
                    var timeReq = document.getElementById("txtTime").value;
                    //var price = document.getElementById('txtPrice').value;  
                    var price = 0;
                    var delivery = 0, active = 0, customize = 0;
                    if (document.getElementById('chkDelivery').checked) {
                        delivery = 1;
                    }
                    //if (document.getElementById('chkActive').checked) {
                    //    active = 1;
                    //}
                    //if (document.getElementById('chkCustom').checked) {
                    //    customize = 1;
                    //}
//                    var tierPrice = document.getElementById('txtPriceTiers').value;
                    var tierPrice = document.getElementById('txtPrice').value;
                    var cake = {
                        "TYPE_ID": typeId,
                        "VENDOR_ID": vendorId,
                        "NAME": name,
                        "MIN_WEIGHT": minWeight,
                        "MAX_WEIGHT": maxWeight,
                        //"MIN_TIERS": minTiers,
                        //"MAX_TIERS": maxTiers,
                        "DESCRIPTION": description,
                        "ESTIMATED_TIME": timeReq,
                        "PRICE": price,
                        "DELIVERY": delivery,
                        "IS_ACTIVE": active,
                        //"IS_CUSTOMIZABLE": customize,
                        "ADDITIONAL_PRICE": tierPrice
                    };
                    $.ajax({
                        url: '/api/Product/SaveCake',
                        type: 'POST',
                        contentType: 'application/json',
                        dataType: 'json',
                        data: JSON.stringify(cake),
                        statusCode: {
                            200: function (result) {
                                var newcakeId = JSON.parse(result);
                                UploadImage(newcakeId);
								
                                var CakeTags = document.getElementById("panelBody").childNodes;
                                var tagsList = [];
                                for (var i = 0; i < CakeTags.length; i++) {
                                    var tableChild = CakeTags[i];
                                    var tag = { "CAKE_ID": newcakeId, "TAG_NAME": tableChild.innerText.split(" ")[0] }
                                    tagsList[i] = tag;
                                }
                                var tagJson = JSON.stringify(tagsList);
                                $.ajax({
                                    url: '/api/Product/SaveCakeTags',
                                    type: 'POST',
                                    contentType: 'application/json; charset=utf-8',
                                    dataType: 'json',
                                    data: tagJson,
                                    statusCode: {
                                        200: function () {
                                            var cakeEvents = document.getElementById("eventPanel").childNodes;
                                            var eventList = [];
                                            var cCount = 0;
                                            for (var i = 0; i < cakeEvents.length; i = i + 4) {
                                                var tableChild1 = cakeEvents[i + 2];
                                                var cEvent = { "CAKE_ID": newcakeId, "EVENT_ID": parseInt(tableChild1.innerText) };
                                                eventList[cCount] = cEvent;
                                                cCount++;
                                            }
                                            var eventJson = JSON.stringify(eventList);
                                            $.ajax({
                                                url: '/api/Product/SaveCakeEvents',
                                                type: 'POST',
                                                contentType: 'application/json; charset=utf-8',
                                                dataType: 'json',
                                                data: eventJson,
                                                statusCode: {
                                                    200: function () {
                                                        var cakeFlavours = document.getElementById("flavorPanel").childNodes;
                                                        var flavourList = [];
                                                        var fCount = 0;
                                                        for (var i = 0; i < cakeFlavours.length; i = i + 4) {

                                                            var tableChild2 = cakeFlavours[i + 2];
                                                            var tableChild3 = cakeFlavours[i];
                                                            var price = tableChild3.innerText.split("|")[1].split(":")[1].split(" ")[1];
                                                            var flavour = { "CAKE_ID": newcakeId, "FLAVOR_ID": parseInt(tableChild2.innerText), "PRICE": parseInt(price) }
                                                            flavourList[fCount] = flavour;
                                                            fCount++;
                                                        }
                                                        var flavourJson = JSON.stringify(flavourList);

                                                        $.ajax({
                                                            url: '/api/Product/SaveCakeFlavours',
                                                            type: 'POST',
                                                            contentType: 'application/json; charset=utf-8',
                                                            dataType: 'json',
                                                            data: flavourJson,
                                                            statusCode: {
                                                                200: function () {
                                                                    location.href = "CakeList.aspx";
                                                                    //$("#panelBody").empty();
                                                                    //$("#flavorPanel").empty();
                                                                    //$("#eventPanel").empty();
                                                                    //if (document.getElementById('chkCustom').checked) {
                                                                    //    debugger;
                                                                    //    var rowCount = $('#tierTable tbody tr').length;
                                                                    //    var tierList = [];
                                                                    //    for (var i = 0; i < rowCount; i++) {
                                                                    //        var tier = { "CAKE_ID": newcakeId, "TIER_ORDER": $("#tierTable tbody tr:eq(" + i + ") td:eq(0)").text(), "MIN_WEIGHT": $("#tierTable tbody tr:eq(" + i + ") td:eq(1) input[type='number']").val(), "MAX_WEIGHT": $("#tierTable tbody tr:eq(" + i + ") td:eq(2) input[type='number']").val() }
                                                                    //        tierList[i] = tier;
                                                                    //    }
                                                                    //    var tierJson = JSON.stringify(tierList);

                                                                    //    $.ajax({
                                                                    //        url: '/api/Product/SaveCakeTiers',
                                                                    //        type: 'POST',
                                                                    //        contentType: 'application/json; charset=utf-8',
                                                                    //        dataType: 'json',
                                                                    //        data: tierJson,
                                                                    //        statusCode: {
                                                                    //            200: function () {

                                                                    //                location.href = "CakeList.aspx";

                                                                    //            },
                                                                    //            500: function () {
                                                                    //                $('#msgModal').modal('show');
                                                                    //                document.getElementById("lblMessage").innerHTML = "Tier not saved.";
                                                                    //                document.getElementById("lblMessage").style.color = 'red';
                                                                    //            }
                                                                    //        }
                                                                    //    });
                                                                    //}
                                                                    //else {
                                                                    //    location.href = "CakeList.aspx";
                                                                    //}
                                                                },
                                                                500: function () {
                                                                    $('#msgModal').modal('show');
                                                                    document.getElementById("lblMessage").innerHTML = "Flavor not saved.";
                                                                    document.getElementById("lblMessage").style.color = '#780103';
                                                                }
                                                            },
                                                            jsonp: 'jsonp'
                                                        });
                                                    },
                                                    500: function () {
                                                        $('#msgModal').modal('show');
                                                        document.getElementById("lblMessage").innerHTML = "Tag not saved.";
                                                        document.getElementById("lblMessage").style.color = '#780103';
                                                    }
                                                },
                                                jsonp: 'jsonp'
                                            });

                                        },
                                        500: function () {
                                            $('#msgModal').modal('show');
                                            document.getElementById("lblMessage").innerHTML = "Tag not saved.";
                                            document.getElementById("lblMessage").style.color = '#780103';
                                        },
                                        404: function (data) {
                                            alert('tag error' + data);
                                        }
                                    },
                                    jsonp: 'jsonp'
                                });
                            },
                            500: function (result) {
                                $('#msgModal').modal('show');
                                document.getElementById("lblMessage").innerHTML = "Cake not saved.";
                                document.getElementById("lblMessage").style.color = '#780103';
                            },
                            404: function (data) {
                                alert('cake error' + data);
                            }
                        },
                        jsonp: 'jsonp'
                    });

                }
            }

            //function NavigateToSite() {
            //    window.location = '/WebPages/ProductCatagory.aspx';
            //}
        });

        $(function () {
            document.getElementById('chkActive').checked = true;
            var availableTags = [];
            $.ajax({
                url: '/api/Product/GetCakeTagsByCakeId',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'cakeId': -1 },
                statusCode: {
                    200: function (data) {
                        var json2 = JSON.parse(data);
                        for (var i = 0; i < json2.CAKE_TAGS.length; i++) {
                            availableTags[i] = json2.CAKE_TAGS[i].TAG_NAME;
                        }
                        $("#cakeTag").autocomplete({
                            source: availableTags
                        });
                    },
                    500: function () {
                    }
                },
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#cakeImage')
					
					.attr('src', e.target.result)
                        .width(150)
                        .height(200);
                };

                reader.readAsDataURL(input.files[0]);
				$('#hideoptimizepicmsg').hide();
            }
        }
        function UploadImage(id) {
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
                    url: "/api/Product/UploadCakeImage",
                    contentType: false,
                    processData: false,
                    data: data
                });
                ajaxRequest.done(function (xhr, textStatus) {
                    //alert('Image Uploaded successfully')
                });
            }
        }
        function addTagsToPanel() {

            var tag = document.getElementById("cakeTag").value;
            var tempTag = document.getElementById(tag + "59");
            if (tempTag == null) {
                $("#panelBody").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" id=' + tag + "59" + ' onclick="childClick(event)">' + tag + ' &#9938;' + '</label>');
                document.getElementById("cakeTag").value = "";
            }
            else {
                $('#msgModal').modal('show');
                document.getElementById("lblMessage").innerHTML = "Tag is already added.";
                document.getElementById("lblMessage").style.color = '#780103';
                //alert('Tag is already added')
            }
        }
        function addFlavourToPanel() {
            var flavourId = $('#Flavor').val();
            var flavourText = $('#Flavor option:selected').text();
            var flavorPrice = document.getElementById("txtFlavourPrice").value;
            var tempFlavour = document.getElementById(flavourText + "59");

            if (tempFlavour == null) {
                if (flavorPrice == "" || flavorPrice < 0) {
                   // alert('Add Positive flavour price');
                  $('#msgModal').modal('show');
                    document.getElementById("lblMessage").innerHTML = "Add Positive flavour price.";
                    document.getElementById("lblMessage").style.color = '#780103';
                }
                else {
                    $("#flavorPanel").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" id=' + flavourText + "59" + ' onclick="flavourChildClick(event)">' + flavourText + ' | Rs: ' + flavorPrice + ' &#9938;' + '</label> <label hidden="hidden" >' + flavourId + '</label> ');
                    document.getElementById("txtFlavourPrice").value = "";
                }
            }
            else {
                $('#msgModal').modal('show');
                document.getElementById("lblMessage").innerHTML = "Flavour is already added";
                document.getElementById("lblMessage").style.color = '#780103';
                //alert('Flavour is already added')
            }
        }
        function CreateNewEvents() {
            var x = document.getElementById("CreateNewEvents");
            if (x.style.display === 'none') {
                x.style.display = 'block';
                document.getElementById('btnEvent').innerHTML = "-";
            } else {
                x.style.display = 'none';
                document.getElementById('btnEvent').innerHTML = "+";
            }
        }

        function CreateNewFlavour() {
            var x = document.getElementById("CreateNewFlavour");
            if (x.style.display === 'none') {
                x.style.display = 'block';
                document.getElementById('btnFlavour').innerHTML = "-";
            } else {
                x.style.display = 'none';
                document.getElementById('btnFlavour').innerHTML = "+";
            }
        }

        function SaveEvent() {
            var eventText = document.getElementById("txtEvent").value;

            if (eventText.length == 0) {
                $('#msgModal').modal('show');
                document.getElementById("lblMessage").innerHTML = "Please Enter Event";
                document.getElementById("lblMessage").style.color = '#780103';

                //alert('Please Enter Event');
            }
            else {
                var events = { "DESCRIPTION": eventText }
                $.ajax({
                    url: '/api/Product/SaveEvent',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(events),
                    statusCode: {
                        200: function (data) {
                            //alert('Event Save Succesfully');
                            GetEvents();
                            document.getElementById("txtEvent").value = "";
                            CreateNewEvents();
                        },
                        500: function () {
                        }
                    },
                    jsonp: 'jsonp'

                });
            }
        }

        function SaveFlavour() {
            var flavorText = document.getElementById("txtFlavour").value;

            if (flavorText.length == 0) {
                $('#msgModal').modal('show');
                document.getElementById("lblMessage").innerHTML = "Please Enter Flavor";
                document.getElementById("lblMessage").style.color = '#780103';
                //alert('Please Enter Flavor');
            }
            else {
                var flavor = { "DESCRIPTION": flavorText }
                $.ajax({
                    url: '/api/Product/SaveFlavour',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(flavor),
                    statusCode: {
                        200: function (data) {
                            //alert('Flavor Save Succesfully');
                            GetFlavors();
                            document.getElementById("txtFlavour").value = "";
                            CreateNewFlavour();
                        },
                        500: function () {
                          debugger;
                          $('#msgModal').modal('show');
                          document.getElementById("lblMessage").innerHTML = "Flavor Save Succesfully";
                          document.getElementById("lblMessage").style.color = '#780103';
                        }
                    },
                    jsonp: 'jsonp'

                });
            }
        }
        function childClick(e) {
            document.getElementById("panelBody").removeChild(e.target);
        }
        function addEventsToPanel() {
            var eventId = $('#Events').val();
            var eventText = $('#Events option:selected').text();
            var eventTemp = document.getElementById(eventText + "59");
            if (eventTemp == null) {
                $("#eventPanel").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" id=' + eventText + "59" + ' onclick="eventChildClick(event)">' + eventText + ' &#9938;' + '</label> <label hidden="hidden">' + eventId + '</label> ');
            }
            else {
                $('#msgModal').modal('show');
                document.getElementById("lblMessage").innerHTML = "Event is already added";
                document.getElementById("lblMessage").style.color = '#780103';
                //alert("Event is already added");
            }
        }
        function flavourChildClick(e) {
            var cakeFalvours = document.getElementById("flavorPanel").childNodes;
            for (var i = 0; i < cakeFalvours.length; i = i + 4) {
                var tableChild1 = cakeFalvours[i];
                if (tableChild1.innerText == e.target.innerText) {
                    var tableChild2 = cakeFalvours[i + 1];
                    var tableChild3 = cakeFalvours[i + 2];
                    var tableChild4 = cakeFalvours[i + 3];

                    document.getElementById("flavorPanel").removeChild(tableChild1);
                    document.getElementById("flavorPanel").removeChild(tableChild2);
                    document.getElementById("flavorPanel").removeChild(tableChild3);
                    document.getElementById("flavorPanel").removeChild(tableChild4);
                }
            }
        }

        function eventChildClick(e) {
            var cakeEvents = document.getElementById("eventPanel").childNodes;
            for (var i = 0; i < cakeEvents.length; i = i + 4) {
                var tableChild1 = cakeEvents[i];
                if (tableChild1.innerText == e.target.innerText) {
                    var tableChild2 = cakeEvents[i + 1];
                    var tableChild3 = cakeEvents[i + 2];
                    var tableChild4 = cakeEvents[i + 3];

                    document.getElementById("eventPanel").removeChild(tableChild1);
                    document.getElementById("eventPanel").removeChild(tableChild2);
                    document.getElementById("eventPanel").removeChild(tableChild3);
                    document.getElementById("eventPanel").removeChild(tableChild4);
                }
            }
        }
        function funShowIds() {
            var CakeTags = document.getElementById("eventPanel").childNodes;
            for (var i = 0; i < CakeTags.length; i = i + 4) {
                var tableChild = CakeTags[i];
                var text = tableChild.innerText
                var tableChild = CakeTags[i + 2];
            }
        }

        function GetEvents() {
            var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
            $.ajax({
                url: '/api/Product/GetAllEvents?VendorId=' + vendorId,
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        $('#Events').empty();
                        for (var i = 0; i < json1.EVENTS.length; i++) {
                            $('#Events').append('<option value="' + json1.EVENTS[i].EVENT_ID + '">' + json1.EVENTS[i].DESCRIPTION + '</option>');
                        }
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'

            });

        }
        function GetTypes() {
            $.ajax({
                url: '/api/Product/GetAllTypes',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        //debugger;
                        $('#Types').empty();
                        for (var i = 0; i < json1.TYPES.length; i++) {
                            $('#Types').append('<option value="' + json1.TYPES[i].CAKE_TYPE_ID + '">' + json1.TYPES[i].DESCRIPTION + '</option>');
                        }
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'

            });

        }

        function GetFlavors() {
            var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
            $.ajax({
                url: '/api/Product/GetAllFlavors?VendorId=' + vendorId,
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        $('#Flavor').empty();
                        for (var i = 0; i < json1.FLAVORS.length; i++) {
                            $('#Flavor').append('<option value="' + json1.FLAVORS[i].FLAVOR_ID + '">' + json1.FLAVORS[i].DESCRIPTION + '</option>');
                        }
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'

            });

        }

        //function LoadTierTable() {
        //    var minTiers = $('#txtMinTiers').val();
        //    var maxTiers = $('#txtMaxTiers').val();
        //    $("#tierTable tbody").empty();
        //    for (var i = 1; i <= maxTiers; i++) {
        //        var tableRow = "<tr><td>" + i + "</td>"
        //        + "<td><input type=" + "number" + " min=" + 1 + " id=" + "tboxMin" + i + " value=" + 1 + " style=" + "width:70px;" + "></td>"
        //        + "<td><input type=" + "number" + " min=" + 1 + " id=" + "tboxMax" + i + " value=" + 1 + " style=" + "width:70px;" + "></td>"

        //        tableRow = tableRow + "</tr>";
        //        $("table").find("tbody").append(tableRow);
        //    }
        //}

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="x_panel col-md-12">
        <div class="x_title col-md-12">
            <h3>Add CAKE</h3>
            <div class="clearfix"></div>
        </div>
        <!-- Title Ends Here -->
        <div class="x_content">
            <br>
           <%-- <div class="row" style="margin-bottom: 20px;">
                <form id="form1" action="#" runat="server">
                    <div class="col-md-12" style="padding:15px">
                        <div class="col-md-4">
                            <label>PLEASE Upload your files (QUICK upload) : </label>
                        </div>
                        <div class="col-md-3">
                            <asp:FileUpload ID="file_upload" class="multi" runat="server" AllowMultiple="true"/>
                        </div>
                        <div class="col-md-3">
                            <asp:Button ID="btnUploadCakes" runat="server" Text="Upload" CssClass=" form-control pinkbtn "  OnClick="btnUploadCakes_Click" />
                            
                        </div>
                        <div class="col-md-2"></div>
                        <br />
                    </div>
                </form>
            </div>--%>

            <%--<div class="row">
                <div class="col-md-12 text-center text-capitalize">
                    OR
                </div>
            </div>--%>


            <div class="row">
                <form id="formSaveCake" action="#">
                  <div class="form-group">
                    <div class="col-md-12">
                      <div class="col-md-6">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12 pad rlabel" for="subName">Type</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" id="Types">
                                </select>
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                       

                        <!-- form Group ends Here -->
                        </div>
                        <div class="col-md-6">
                            
                                <label class="control-label col-md-3 col-sm-3 col-xs-12 pad rlabel" for="subName">Name</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control" id="txtName" required="required" />

                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />

                            
                            <!-- inner col ends here -->
                        </div>

                        
                    </div>
                        <!-- form Group ends Here -->

                        <div class="col-md-12">
                            <div class="col-md-6">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12 pad rlabel" for="subDescription">Description</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea class="form-control" id="txtDesc" required="required"></textarea>
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                       
                        <!-- form Group ends Here -->

                       
                            <div class="col-md-6">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12 pad rlabel" for="subDescription">Time Req. (hr)</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="number" min="0" class="form-control" id="txtTime" required="required" />
                                </div>
                                <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 pad" for="subDescription">(hours)</label>--%>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                      
                         </div>
                        <!-- form Group ends Here -->


                        <div class="col-md-12">
                            <div class="col-md-6">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12 pad rlabel" for="subDescription">Additional Price</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="1" class="form-control" id="txtPrice" required="required" />
                                </div>
                                <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 pad" for="subDescription">(PKR)</label>--%>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                     
                        <!-- form Group ends Here -->
                        <div class="col-md-6">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12  pad rlabel">Photo </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input class="img-show" type='file' id="imgInp" onchange="readURL(this);" required="required" size="30" />
                                <img id="cakeImage" src="" />
                            </div>
							<%--<label id="hideoptimizepicmsg">Picture Must be max 300Kb</label> <a target="_blank" href="https://imageresize.org/">Compress Photo here</a>--%>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        </div>
                        <!-- Form Group -->


                        <div class="col-md-12">
                            <div class="col-md-6">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12 pad rlabel" for="subDescription">Delivery</label>
                                <div class="col-md-6 col-sm-6 col-xs-12 chbox">
                                    <input type="checkbox" class="checkbox-inline  " id="chkDelivery" />
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                       
                        <!-- form Group ends Here -->


                        
                            <div class="col-md-6">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12  pad rlabel" for="subDescription">Active</label>
                                <div class="col-md-6 col-sm-6 col-xs-12 chbox">
                                    <input type="checkbox" class="checkbox-inline" id="chkActive" />
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        
                           </div>
                        <!-- form Group ends Here -->




                        <div class="col-md-12">
                            <div class="col-md-6">
                                <label for="subDescription" class="control-label col-md-3 col-sm-3 col-xs-12 rlabel pad">Flavour Price</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="1" class="form-control" id="txtFlavourPrice" />
                                </div>
                                <label class="control-label col-md-3 col-sm-3 col-xs-12 pad" for="subDescription">(Per Pound) (PKR)</label>

                                <!-- col ends here -->
                                <br />
                                <br />

                            </div>
					  </div>
                        
                        <!-- form Group ends Here -->

                      
                          <div class="col-md-12">
							  <div class="col-md-6">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12 rlabel  pad" for="subName">Flavour</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" id="Flavor">
                                    </select>

                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
							  </div>
                          </div>
                        <!-- form Group ends Here -->

                        <div class="row form-group col-md-12">
                           <div class="col-md-6">
							
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <button type="button" class="btn upbutton midmar" onclick="addFlavourToPanel();">Add Flavour</button>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <button type="button" class="btn upbutton midmar" id="btnFlavour" onclick="CreateNewFlavour();">
                                    +</button>

                            </div>

                        </div>
					  </div>





                        <div id="CreateNewFlavour">
                            <div class="form-group col-md-12">
                                <div class="col-md-12">
                                    <label class="control-label col-md-12 col-sm-3 col-xs-12 pad rlabel" for="subName">New Flavour</label>
                                    <div class="col-md-5 col-sm-4 col-xs-12" style="padding-left:0px">
                                        <input type="text" class="form-control" id="txtFlavour" style="float:left" />
                                      <button type="button" class="btn  btn-sm" style="margin:0 35px; height:34px; float:right;" onclick="SaveFlavour();">
                                            Save</button>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad" for="subName"></label>--%>
                                    <div class="col-md-12 col-sm-4 col-xs-12">
                                        


                                    </div>

                                </div>
                            </div>
                        </div>
                     </div>

                        <div class="row form-group">
                            <div class="col-md-4 ">
                                <div class="panel panel-default" style="height: 200px;    margin: 0 28px; height: 100px; width: 390px;">
                                    <div class="panel-body" id="flavorPanel"></div>
                                </div>
                            </div>
                            <br />
                        </div>


                        <div class="row form-group col-md-12 ">
                            <label class="control-label col-md-1 col-sm-3 col-xs-12 rlabel" style="font-size: 17px;
    font-family: 'Lato',sans-serif;
    text-transform: uppercase;
    font-weight: bolder;
    margin-top: 30px;
    margin-left: 12px;" for="subName">Event</label>
                            <div class="col-md-6 col-sm-6 col-xs-12" style="margin-top: 30px;">
                                <select class="form-control rselect" id="Events">
                                </select>

                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- form Group ends Here -->
                        <div class="row form-group col-md-12">
                            <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad" for="subName"></label>--%>
                          <div class="col-md-12">  
                          <div class="col-md-4 col-sm-4 col-xs-12">
                                <button type="button" class="btn upbutton midmar" onclick="addEventsToPanel();">
                                    Add Events</button>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <button type="button" class="btn upbutton midmar" id="btnEvent" onclick="CreateNewEvents();">
                                    +</button>

                            </div>
                            </div>

                        </div>





                        <div id="CreateNewEvents" style="margin-bottom: 15px;">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel" for="subName">New Event</label>
                                    <div class="col-md-5 col-sm-4 col-xs-12">
                                        <input type="text" class="form-control rinput" style="float:left;" id="txtEvent" />
                                      <button type="button" class="btn upbutton midmar rbtn" style="float: right;
    margin: 0 30px;
    height: 34px;"  onclick="SaveEvent();">
                                            Save</button>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad rlabel" for="subName"></label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        


                                    </div>

                                </div>
                            </div>
                        </div>


                        <div class="row form-group">
                            <div class="col-md-6">
                                <div class="panel panel-default" style="margin: 0 28px;
    height: 100px;
    width: 390px;">
                                    <div class="panel-body" id="eventPanel"></div>
                                </div>
                            </div>
                        </div>










                        <div class="form-group">
                            <div class="col-md-12">
                                <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel" for="cakeTag">Tag</label>
                                <div class="col-md-5 col-sm-6 col-xs-12">
                                    <div>
                                        <input type="text" class="form-control " style="float:left;" id="cakeTag" />
                                        <button type="button" class="btn upbutton midmar" style="float: right;
    height: 34px;" onclick="addTagsToPanel();">
                                            Add Tag</button>

                                    </div>
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>
                        <!-- form Group ends Here -->

                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="col-md-6 ">
                                    <div class="panel panel-default" style="height: 100px;
    width: 390px;">
                                        <div class="panel-body" id="panelBody"></div>
                                    </div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                            <!-- inner col -->
                        </div>
                        <!-- form Group ends Here -->

                        <div class=" form-group">
                            <div class="col-md-12">
                                <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel" for="subName">Min Weight</label>
                                <div class="col-md-5 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control" id="txtMinWeight" required="required" />

                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />

                            </div>
                            <!-- inner col ends here -->
                        </div>
                        <div class="row form-group col-md-12">
                            <div class="col-md-12">
                                <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel" for="subName">Max Weight</label>
                                <div class="col-md-5 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control" id="txtMaxWeight" required="required" />

                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />

                            </div>
                            <!-- inner col ends here -->
                        </div>


                      <%--  <div class="row form-group col-md-12">
                            <div class="col-md-12">
                                <label class="control-label col-md-2 col-sm-3 col-xs-12 rlabel" for="subDescription">Customizable</label>
                                <div class="col-md-6 col-sm-6 col-xs-12 chbox">
                                    <input type="checkbox" class="checkbox-inline" id="chkCustom" />
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>--%>
                        <!-- form Group ends Here -->

                  <%--    <div class="row form-group col-md-12">
                                <div class="col-md-12">
                                    <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel" for="subDescription">Min Tiers</label>

                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="1" value="1" class="form-control" id="txtMinTiers" required="required" />
                                    </div>
                                    <!-- col ends here -->
                                    <br />
                                    <br />
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad rlabel" for="subDescription"></label>
                                </div>
                            </div>--%>
                            <!-- form Group ends Here -->


                  <%--          <div class="form-group">
                                <div class="col-md-12">
                                    <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel" for="subDescription">Max Tiers</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="1" value="1" class="form-control" id="txtMaxTiers" required="required" />
                                    </div>
                                    <!-- col ends here -->
                                    <br />
                                    <br />
                                </div>
                            </div>--%>

                       <%-- <div id="customCake">
                            <div class="row form-group col-md-12">
                                <div class="col-md-12">
                                    <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel" for="subDescription">Min Tiers</label>

                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="1" value="1" class="form-control" id="txtMinTiers" required="required" />
                                    </div>
                                    <!-- col ends here -->
                                    <br />
                                    <br />
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad rlabel" for="subDescription"></label>
                                </div>
                            </div>
                            <!-- form Group ends Here -->


                            <div class="form-group">
                                <div class="col-md-12">
                                    <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel" for="subDescription">Max Tiers</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="1" value="1" class="form-control" id="txtMaxTiers" required="required" />
                                    </div>
                                    <!-- col ends here -->
                                    <br />
                                    <br />
                                </div>
                            </div>
                            <!-- form Group ends Here -->




                            <div class="form-group">
                                <div class="col-md-12">
                                    <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel" for="subDescription">Price Per Tier</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="1" value="1" class="form-control" id="txtPriceTiers" required="required" />
                                    </div>
                                    <!-- col ends here -->
                                    <br />
                                    <br />
                                </div>
                            </div>
                            <!-- form Group ends Here -->




                             <div class="form-group" id="divTierTable">
                                <div class="table col-md-12">
                                    <%--<div class="col-md-6 col-sm-6 col-xs-12">
                                        <table class="table" id="tierTable">
                                        <thead>
                                            <tr>
                                                <th scope="col">Tier Order</th>
                                                <th scope="col">Min Weight</th>
                                                <th scope="col">Max Weight</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                            </div>
                            







                        </div>

                       --%>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                
                                <img src="../Assets/images/preloader.gif" id="imgload" alt="loading" style="display:none;width:30px;height:30px" />
                            </div>
                        </div>






                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="col-md-6 ">

                                    <button type="submit" id="btnSave" class="btn upbutton midmar">
                                        Save</button>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                            <!-- inner col -->
                        </div>
                        <!-- form Group ends Here -->

                    <!-- main column ends here -->

                </form>
            </div>
            <!-- row ends here -->
        </div>
        <!-- Add Product x_content ends here -->
    </div>
    <!-- x_panel ends here -->

    <div class="container">
        <div class="modal fade" id="msgModal" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" style="width:400px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 id="lblMessage"  class="modal-title" style="text-align: center; color:#780103; font-size:16px;">
                        
                        </h4>
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
