<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/Vendor.Master" CodeBehind="EditCake.aspx.cs" Inherits="FoodChapter.WebPages.EditCake" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <style>
        .chbox{
            margin-top : 14px;
        }
    </style>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <script>
          $(function () {

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
  </script>
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#cakeImage')
                        .attr('src', e.target.result)
                        .width(220)
                        .height(220);
                    //document.getElementById("imgaeB64").innerHTML = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
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
                    url: "/api/Product/UploadCakeImage",
                    contentType: false,
                    processData: false,
                    data: data
                });
                ajaxRequest.done(function (xhr, textStatus) {
                    // alert('Image Uploaded successfully')
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
                document.getElementById("lblMessage").style.color = 'red';
                //alert('Tag is already added')
            }
        }

        function childClick(e) {
            document.getElementById("panelBody").removeChild(e.target);
        }

        function addFlavourToPanel() {
            var flavourId = $('#Flavor').val();
            var flavourText = $('#Flavor option:selected').text();
            var flavorPrice = document.getElementById("txtFlavourPrice").value;
            var tempFlavour = document.getElementById(flavourText + "59");

            if (tempFlavour == null) {
                if (flavorPrice == "" || flavorPrice < 0) {
                    //alert('Add Positive flavour price');
                    $('#msgModal').modal('show');
                    document.getElementById("lblMessage").innerHTML = "Add Positive flavor price.";
                    document.getElementById("lblMessage").style.color = 'red';
                }
                else {
                    $("#flavorPanel").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" id=' + flavourText + "59" + ' onclick="flavourChildClick(event)">' + flavourText + ' | Rs: ' + flavorPrice + ' &#9938;' + '</label> <label hidden="hidden" >' + flavourId + '</label> ');
                    document.getElementById("txtFlavourPrice").value = "";
                }
            }
            else {
                $('#msgModal').modal('show');
                document.getElementById("lblMessage").innerHTML = "Flavor already added.";
                document.getElementById("lblMessage").style.color = 'red';
                //alert('Flavour is already added')
            }
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
                document.getElementById("lblMessage").innerHTML = "Event already added.";
                document.getElementById("lblMessage").style.color = 'red';
            }
            //alert("Event is already added");
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
                document.getElementById("lblMessage").innerHTML = "Please Enter Event.";
                document.getElementById("lblMessage").style.color = 'red';
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
                            // alert('Event Save Succesfully');
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
                document.getElementById("lblMessage").innerHTML = "Please enter Flavor.";
                document.getElementById("lblMessage").style.color = 'red';
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
                            //                            alert('Flavor Save Succesfully');
                            GetFlavors();
                            document.getElementById("txtFlavour").value = "";
                            CreateNewFlavour();
                        },
                        500: function () {
                        }
                    },
                    jsonp: 'jsonp'

                });
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
            //debugger;
            var CakeTags = document.getElementById("eventPanel").childNodes;
            //alert(CakeTags.length);
            for (var i = 0; i < CakeTags.length; i = i + 4) {
                var tableChild = CakeTags[i];
                var text = tableChild.innerText
                //alert(text);

                var tableChild = CakeTags[i + 2];

                // alert(tableChild.innerText);

                //var tag = { "CAKE_ID": newcakeId, "TAG_NAME": tableChild.innerText.split(" ")[0] }
                //tagsList[i] = tag;
            }
        }

        function populateWeights() {
            $('#ddlMinWeight').empty();
            $('#ddlMaxWeight').empty();
            var minT = document.getElementById("txtMinTiers").value;
            var maxT = document.getElementById("txtMaxTiers").value;
            for (var i = minT; i <= maxT; i++) {
                $('#ddlMinWeight').append('<option value="' + i + '">' + i + '</option>');
                $('#ddlMaxWeight').append('<option value="' + i + '">' + i + '</option>');
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
        function populateTierData() {
            $.ajax({
                url: '/api/Product/GetTierData',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'cakeId': cakeId },
                statusCode: {
                    200: function (data) {
                        // alert('populating');
                        var json2 = JSON.parse(data);
                        for (var i = 0; i < json2.CAKE_TIERS.length; i++) {
                            //$("#flavorPanel").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" onclick="flavourChildClick(event)">' + json2.CAKE_FLAVORS[i].DESCRIPTION + ' | Rs: ' + json2.CAKE_FLAVORS[i].PRICE + ' &#9938;' + '</label> <label hidden="hidden">' + json2.CAKE_FLAVORS[i].FLAVOR_ID + '</label> ');
                            $("#tierTable tbody").append('<tr><td>' + json2.CAKE_TIERS[i].TIER_ORDER + '</td><td><input type="number" min=' + 1 + ' id="tboxMin" ' + i + ' value=' + json2.CAKE_TIERS[i].MIN_WEIGHT + ' style="width:70px;"></td><td><input type="number" min=' + 1 + ' id="tboxMax" ' + i + ' value=' + json2.CAKE_TIERS[i].MAX_WEIGHT + ' style="width:70px;"></td>');

                            //                                <td>"+json2.CAKE_TIERS[i].TIER_ORDER +" </td><td>"+json2.CAKE_TIERS[i].TIER_ORDER +"</td><td></td>');
                        }
                    },
                    500: function () {
                    }
                },
            });
        }

        function LoadTierTable() {
            var minTiers = $('#txtMinTiers').val();
            var maxTiers = $('#txtMaxTiers').val();
            $("#tierTable tbody").empty();
            for (var i = 1; i <= maxTiers; i++) {
                var tableRow = "<tr><td>" + i + "</td>"
                + "<td><input type=" + "number" + " min=" + 1 + " id=" + "tboxMin" + i + " value=" + 1 + " style=" + "width:70px;" + "></td>"
                + "<td><input type=" + "number" + " min=" + 1 + " id=" + "tboxMax" + i + " value=" + 1 + " style=" + "width:70px;" + "></td>"

                tableRow = tableRow + "</tr>";
                //debugger;
                $("table").find("tbody").append(tableRow);
            }
        }

        cakeId = '<%= int.Parse(FoodChapter.SessionManager.GetCakeSession()) %>';
        if (cakeId == "0") {
            window.location = "6_login.aspx";
        }
        $(document).ready(function () {
            $(window).keydown(function (event) {
                if (event.keyCode == 13) {
                    //alert('hi');
                    event.preventDefault();
                    return false;
                }
            });
            GetEvents();
            GetFlavors();
            GetTypes();

            $('#CreateNewFlavour').hide();
            $('#CreateNewEvents').hide();

            //$('#chkCustom').change(function () {
            //    if (this.checked) {
            //        //Do stuff
            //        $('#customCake').show();
            //        //populateWeights();
            //        populateTierData();
            //    }
            //    else
            //        $('#customCake').hide();
            //});

            $('#txtMinTiers').focusout(function () {
                var minTiers = $('#txtMinTiers').val();
                var maxTiers = $('#txtMaxTiers').val();
                if (minTiers > maxTiers) {
                    $('#msgModal').modal('show');
                    document.getElementById("lblMessage").innerHTML = "Mintiers cannot be greator than maxTiers.";
                    document.getElementById("lblMessage").style.color = 'red';
                    //alert('max tiers must be greator');
                    //alert('mintiers cannot be greator than maxTiers');
                    $('#txtMinTiers').val(1);
                    $('#txtMaxTiers').val(1);
                    //              $('#ddlMinWeight').empty();
                    //            $('#ddlMaxWeight').empty();
                    //                $('#weight').hide();
                    //LoadTierTable();

                    return;
                }
                else {
                    //LoadTierTable();

                    //          $('#weight').show();
                    //        populateWeights();
                }

            });
            $('#txtMaxTiers').focusout(function () {
                var min = $('#txtMinTiers').val();
                var max = $('#txtMaxTiers').val();
                if (max < min) {
                    $('#msgModal').modal('show');
                    document.getElementById("lblMessage").innerHTML = "Mintiers cannot be greator than maxTiers.";
                    document.getElementById("lblMessage").style.color = 'red';
                    //alert('max tiers must be greator');
                    //alert('mintiers cannot be greator than maxTiers');
                    $('#txtMinTiers').val(1);
                    $('#txtMaxTiers').val(1);
                   // LoadTierTable();

                    //      $('#ddlMinWeight').empty();
                    //    $('#ddlMaxWeight').empty();
                    //  $('#weight').hide();
                    return;
                }
                else {
                   // LoadTierTable();
                    //$('#weight').show();
                    //populateWeights();
                }

            });

            LoadCakeData();

            $('#formUpdateCake').submit(function () {
                //alert('hi');
                document.getElementById("btnSave").disabled = true;
                $('#imgload').show();
                var name = document.getElementById("txtName").value;
                var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
                debugger;
                var cake = {
                    "VENDOR_ID": vendorId,
                    "CAKE_ID": cakeId,
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

                            funUpdateCake();
                        },
                        500: function (result) {
                            $('#msgModal').modal('show');
                            document.getElementById("lblMessage").innerHTML = "Cake name not unique.";
                            document.getElementById("lblMessage").style.color = 'red';
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
            function LoadCakeData() {
                $.ajax({
                    type: 'Get',
                    url: '/api/Product/SearchCakeByCakeId',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    data: { 'cakeId': cakeId },
                    statusCode: {
                        200: function (data) {
                            debugger;
                            var json1 = JSON.parse(data);
                            $('#Types').val(json1.CAKE[0].TYPE_ID);
                            document.getElementById('txtName').value = json1.CAKE[0].NAME;
                            document.getElementById('txtDesc').value = json1.CAKE[0].DESCRIPTION;
                            document.getElementById('txtTime').value = json1.CAKE[0].ESTIMATED_TIME;
                            document.getElementById('txtMinWeight').value = json1.CAKE[0].MIN_WEIGHT;
                            document.getElementById('txtMaxWeight').value = json1.CAKE[0].MAX_WEIGHT;

                            document.getElementById('txtMinTiers').value = json1.CAKE[0].MIN_TIERS;
                            document.getElementById('txtMaxTiers').value = json1.CAKE[0].MAX_TIERS;
                            document.getElementById('txtPrice').value = json1.CAKE[0].ADDITIONAL_PRICE;

                            if (json1.CAKE[0].DELIVERY == 1)
                                document.getElementById('chkDelivery').checked = true;
                            else
                                document.getElementById('chkDelivery').checked = false;

                            if (json1.CAKE[0].IS_ACTIVE == 1)
                                document.getElementById('chkActive').checked = true;
                            else
                                document.getElementById('chkActive').checked = false;

                            if (json1.CAKE[0].IS_CUSTOMIZABLE == 1) {
                                document.getElementById('chkCustom').checked = true;
                                //$('#customCake').show();
                                //populateTierData();
                                //$('#weight').show();
                                //populateWeights();

                            }
                            else {
                                //$('#customCake').hide();
                                //$('#weight').hide();
                                document.getElementById('chkCustom').checked = false;

                            }
                            var url = json1.CAKE[0].CAKE_PHOTO;
                            //alert(url);
                            $("#cakeImage").attr("src", "" + url).width(220).height(220);
                            LoadTags();
                            LoadEvents();
                            LoadFlavors();
                        },
                        500: function () {
                        }
                    },
                    jsonp: 'jsonp'
                });
            }

            function funUpdateCake() {
                var cakeFlavours = document.getElementById("flavorPanel").childNodes;
                if (cakeFlavours.length == 0) {
                    $('#msgModal').modal('show');
                    document.getElementById("lblMessage").innerHTML = "Please add atleast one falvour of the cake.";
                    document.getElementById("lblMessage").style.color = 'red';
                    //<Fc Msgs> Please add atleast one falvour of the cake
                }
                else {
                    //                var minW = $('#ddlMinWeight').val();
                    //              var maxW = $('#ddlMaxWeight').val();
                    //            if (minW > maxW) {
                    //              alert('min weight must be less than max weight');
                    //            return false;
                    //      }
                    debugger;
                    var name = document.getElementById("txtName").value;
                    var typeId = $('#Types').val();

                    var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
                    var path;
                    var images = $("#imgInp").get(0).files;
                    if (images.length > 0) {
                        //alert('file selected');
                    }
                    else {
                        path = $("#cakeImage").attr("src");

                    }

                    var description = document.getElementById('txtDesc').value;
                    var timeReq = document.getElementById("txtTime").value;
                    var price = 0;
                    var delivery = 0, active = 0, customize = 0, minTiers = 1, maxTiers = 1, minWeight = 1, maxWeight = 1;
                    var minTiers = document.getElementById("txtMinTiers").value;
                    var maxTiers = document.getElementById("txtMaxTiers").value;

                    var minWeight = document.getElementById("txtMinWeight").value;
                    var maxWeight = document.getElementById("txtMaxWeight").value;
                    if (document.getElementById('chkDelivery').checked) {
                        delivery = 1;
                    }
                    if (document.getElementById('chkActive').checked) {
                        active = 1;
                    }
                    if (document.getElementById('chkCustom').checked) {
                        customize = 1;
                    }
                    var tierPrice = document.getElementById('txtPrice').value;


                    //if (customize == 1) {
                    //    minTiers = document.getElementById("txtMinTiers").value;
                    //    maxTiers = document.getElementById("txtMaxTiers").value;
                    //    minWeight = $('#ddlMinWeight').val();
                    //    maxWeight = $('#ddlMaxWeight').val();
                    //}


                    var cake = {
                        "TYPE_ID": typeId,
                        "CAKE_ID": cakeId,
                        "VENDOR_ID": vendorId,
                        "NAME": name,
                        "MIN_WEIGHT": minWeight,
                        "MAX_WEIGHT": maxWeight,
                        "MIN_TIERS": minTiers,
                        "MAX_TIERS": maxTiers,
                        "DESCRIPTION": description,
                        "ESTIMATED_TIME": timeReq,
                        "PRICE": price,
                        "DELIVERY": delivery,
                        "IS_ACTIVE": active,
                        "IS_CUSTOMIZABLE": customize,
                        "ADDITIONAL_PRICE": tierPrice,
                        "CAKE_PHOTO": path
                    };

                    $.ajax({
                        url: '/api/Product/UpdateCake',
                        type: 'POST',
                        contentType: 'application/json',
                        dataType: 'json',
                        data: JSON.stringify(cake),
                        statusCode: {
                            200: function (data) {
                                var newCakeId = cakeId;
                                //debugger;
                                UploadImage(newCakeId);
                                var CakeTags = document.getElementById("panelBody").childNodes;
                                var tagsList = [];
                                for (var i = 0; i < CakeTags.length; i++) {
                                    var tableChild = CakeTags[i];
                                    //debugger;
                                    var tag = { "CAKE_ID": newCakeId, "TAG_NAME": tableChild.innerText.split(" ")[0] }
                                    tagsList[i] = tag;

                                }
                                //                            debugger;
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
                                                //debugger;
                                                var tableChild1 = cakeEvents[i + 2];
                                                var cEvent = { "CAKE_ID": newCakeId, "EVENT_ID": parseInt(tableChild1.innerText) };
                                                eventList[cCount] = cEvent;
                                                cCount++;
                                            }
                                            //debugger;
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
                                                        debugger;
                                                        for (var i = 0; i < cakeFlavours.length; i = i + 4) {

                                                            var tableChild2 = cakeFlavours[i + 2];
                                                            var tableChild3 = cakeFlavours[i];
                                                            var price = tableChild3.innerText.split("|")[1].split(":")[1].split(" ")[1];
                                                            var flavour = { "CAKE_ID": newCakeId, "FLAVOR_ID": parseInt(tableChild2.innerText), "PRICE": parseInt(price) }
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
                                                                    //    //alert('tier Time');
                                                                    //    debugger;
                                                                    //    var rowCount = $('#tierTable tbody tr').length;
                                                                    //    var tierList = [];
                                                                    //    for (var i = 0; i < rowCount; i++) {
                                                                    //        //var tableChild = CakeTags[i];
                                                                    //        //debugger;
                                                                    //        //alert($("#tierTable tbody tr:eq("+i+") td:eq(0)").text());
                                                                    //        //alert($("#tierTable tbody tr:eq(" + i + ") td:eq(1) input[type='number']").val());
                                                                    //        //alert($("#tierTable tbody tr:eq(" + i + ") td:eq(2) input[type='number']").val());

                                                                    //        var tier = { "CAKE_ID": newCakeId, "TIER_ORDER": $("#tierTable tbody tr:eq(" + i + ") td:eq(0)").text(), "MIN_WEIGHT": $("#tierTable tbody tr:eq(" + i + ") td:eq(1) input[type='number']").val(), "MAX_WEIGHT": $("#tierTable tbody tr:eq(" + i + ") td:eq(2) input[type='number']").val() }
                                                                    //        tierList[i] = tier;
                                                                    //    }
                                                                    //    //                            debugger;
                                                                    //    var tierJson = JSON.stringify(tierList);

                                                                    //    $.ajax({
                                                                    //        url: '/api/Product/SaveCakeTiers',
                                                                    //        type: 'POST',
                                                                    //        contentType: 'application/json; charset=utf-8',
                                                                    //        dataType: 'json',
                                                                    //        data: tierJson,
                                                                    //        statusCode: {
                                                                    //            200: function () {
                                                                    //                //                                                                            alert('done');
                                                                    //                location.href = "CakeList.aspx";

                                                                    //            },
                                                                    //            500: function () {
                                                                    //                $('#msgModal').modal('show');
                                                                    //                document.getElementById("lblMessage").innerHTML = "Tier not saved.";
                                                                    //                document.getElementById("lblMessage").style.color = 'red';
                                                                    //                //alert('Error occured. Tier not saved');
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
                                                                    document.getElementById("lblMessage").style.color = 'red';
                                                                    //alert('Error occured. flavor not saved');
                                                                }
                                                            },
                                                            jsonp: 'jsonp'
                                                        });
                                                    },
                                                    500: function () {
                                                        $('#msgModal').modal('show');
                                                        document.getElementById("lblMessage").innerHTML = "Tag not saved.";
                                                        document.getElementById("lblMessage").style.color = 'red';
                                                        //alert('Error occured. tags not saved');
                                                    }
                                                },
                                                jsonp: 'jsonp'
                                            });

                                        },
                                        500: function () {
                                            $('#msgModal').modal('show');
                                            document.getElementById("lblMessage").innerHTML = "Tag not saved.";
                                            document.getElementById("lblMessage").style.color = 'red';
                                            //alert('Error occured. tags not saved');
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
                                document.getElementById("lblMessage").style.color = 'red';
                                //alert('Error occured. cake not saved');
                            },
                            404: function (data) {
                                alert('cake error' + data);
                            }
                        },
                        jsonp: 'jsonp'
                    });
                }
            }
            function LoadTags() {
                $.ajax({
                    url: '/api/Product/GetCakeTagsByCakeId',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'cakeId': cakeId },
                    statusCode: {
                        200: function (data) {
                            var json2 = JSON.parse(data);
                            for (var i = 0; i < json2.CAKE_TAGS.length; i++) {
                                $("#panelBody").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" id=' + json2.CAKE_TAGS[i].TAG_NAME + "59" + ' onclick="childClick(event)">' + json2.CAKE_TAGS[i].TAG_NAME + ' &#9938;' + '</label>');
                            }
                        },
                        500: function () {
                        }
                    },
                });

            }
            function LoadEvents() {
                $.ajax({
                    url: '/api/Product/GetCakeEventsByCakeId',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'cakeId': cakeId },
                    statusCode: {
                        200: function (data) {
                            var json2 = JSON.parse(data);
                            for (var i = 0; i < json2.CAKE_EVENTS.length; i++) {
                                $("#eventPanel").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" id=' + json2.CAKE_EVENTS[i].DESCRIPTION + "59" + ' onclick="eventChildClick(event)">' + json2.CAKE_EVENTS[i].DESCRIPTION + ' &#9938;' + '</label> <label hidden="hidden">' + json2.CAKE_EVENTS[i].EVENT_ID + '</label> ');
                            }
                        },
                        500: function () {
                        }
                    },
                });

            }
            function LoadFlavors() {
                $.ajax({
                    url: '/api/Product/GetCakeFlavorsByCakeId',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: { 'cakeId': cakeId },
                    statusCode: {
                        200: function (data) {
                            var json2 = JSON.parse(data);
                            for (var i = 0; i < json2.CAKE_FLAVORS.length; i++) {
                                //$("#flavorPanel").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" onclick="flavourChildClick(event)">' + json2.CAKE_FLAVORS[i].DESCRIPTION + ' | Rs: ' + json2.CAKE_FLAVORS[i].PRICE + ' &#9938;' + '</label> <label hidden="hidden">' + json2.CAKE_FLAVORS[i].FLAVOR_ID + '</label> ');
                                $("#flavorPanel").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" id=' + json2.CAKE_FLAVORS[i].DESCRIPTION + "59" + ' onclick="flavourChildClick(event)">' + json2.CAKE_FLAVORS[i].DESCRIPTION + ' | Rs: ' + json2.CAKE_FLAVORS[i].PRICE + ' &#9938;' + '</label> <label hidden="hidden" >' + json2.CAKE_FLAVORS[i].FLAVOR_ID + '</label> ');
                            }
                        },
                        500: function () {
                        }
                    },
                });

            }
            function clearProduct() {
                //document.getElementById("subName").value = "";
                //document.getElementById('subDescription').value = "";
                //document.getElementById("timeReq").value = "";
                //document.getElementById('size').value = "";
                //document.getElementById('price').value = "";
            }
            function NavigateToSite() {
                window.location = '/WebPages/ProductCatagory.aspx';
            }
        });
    </script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="x_panel">
        <div class="x_title col-md-12">
          <div class="col-md-12">
            <h3 class="col-md-12">Edit CAKE</h3></div>
            <div class="clearfix"></div>
        </div>
        <!-- Title Ends Here -->
              <div class="x_content">
            <br>
            <div class="row">
                <form id="formUpdateCake" action="#">
                    <div class="col-md-12">

                        <div class="form-group col-md-6">
                          <div class="col-md-12">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subName">Type</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" id="Types">
                                </select>
                            </div>
                            </div>
                            <!-- col ends here -->
                           
                        </div>

                        <!-- form Group ends Here -->


                        <div class=" form-group col-md-6">
                            <div class="col-md-12">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subName">Name</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control" id="txtName" required="required" />

                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />

                            </div>
                            <!-- inner col ends here -->
                        </div>
                        <!-- form Group ends Here -->

                        <div class="form-group col-md-6">
                            <div class="col-md-12">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subDescription">Description</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control" id="txtDesc" required="required"/>
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>
                        <!-- form Group ends Here -->

                        <div class="form-group col-md-6">
                            <div class="col-md-12">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel rnp" for="subDescription">Time Required(hrs)</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="number" min="0" class="form-control" id="txtTime" required="required" />
                                </div>
                                <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 pad" for="subDescription"></label>--%>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>
                        <!-- form Group ends Here -->


                        <div class="form-group col-md-6">
                            <div class="col-md-12">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subDescription">Additional Price</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="1" class="form-control" id="txtPrice" required="required" />
                                </div>
                                <label class="control-label col-md-3 col-sm-3 col-xs-12 pad" for="subDescription"></label>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>



                        <div class="form-group col-md-3">
                            <div class="col-md-12">
                                <label class="control-label col-md-7 col-sm-3 col-xs-12  rlabel" for="subDescription">Delivery</label>
                                <div class="col-md-2 col-sm-6 col-xs-12 chbox rchb rrb">
                                    <input type="checkbox" class="checkbox-inline" id="chkDelivery" />
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>
                        <!-- form Group ends Here -->


                        <div class="form-group col-md-3">
                            <div class="col-md-12">
                                <label class="control-label col-md-7 col-sm-3 col-xs-12 rlabel" for="subDescription">Active</label>
                                <div class="col-md-2 col-sm-6 col-xs-12 chbox rchb rrb">
                                    <input type="checkbox" class="checkbox-inline" id="chkActive" />
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>
                        <!-- form Group ends Here -->




                        <div class=" form-group col-md-12">
                            <div class="col-md-12">
                                <label for="subDescription" class="control-label col-md-2 col-sm-3 col-xs-12 rlabel">Flavour Price</label>
                                <div class="">
                                    <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="1" class="form-control" id="txtFlavourPrice" />
                                <label class="control-label col-md-3 col-sm-3 col-xs-12 " for="subDescription">(Per Pound) (PKR)</label>
                                </div>
                                

                                <!-- col ends here -->
                                <br />
                                <br />

                            </div>

                        </div>
                        <!-- form Group ends Here -->

                        <div class="form-group col-md-6">
                            <div class="col-md-12">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subName">Flavor</label>
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
                            <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad" for="subName"></label>--%>
                          <div class="col-md-12"> 
                           <div class="col-md-4 col-sm-4 col-xs-12">
                             <div class="col-md-12">
                                <button type="button" class="btn upbutton midmar" onclick="addFlavourToPanel();">Add Flavour</button>
                            </div>
                             </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <button type="button" class="btn upbutton midmar" id="btnFlavour" onclick="CreateNewFlavour();">
                                    +</button>
                              
                            </div>
                            </div>

                        </div>





                        <div id="CreateNewFlavour" style="margin-bottom: 15px;">
                            <div class="form-group col-md-6">
                               <div class="col-md-12">
                                    <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel rplus" for="subName">New Flavor</label>
                                  </div>  
                                  <div class="col-md-12 col-sm-4 col-xs-12">
                                    <div class="col-md-12">
                                        <input type="text" class="form-control rinput" id="txtFlavour" />
                                      <button type="button" class="btn btn-sm rbtn"  onclick="SaveFlavour();">
                                            Save</button>
                                      </div>
                                    </div>

                                </div>
                            </div>

                            <%--<div class="form-group">--
                                <div class="col-md-12">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad" for="subName"></label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        


                                    </div>

                                </div>
                            </div>
                        </div>--%>


                        <div class="row form-group col-md-12">
                            <div class="">
                                <div class="panel panel-default rpanel rpanel1">
                                    <div class="panel-body" id="flavorPanel"></div>
                                </div>
                            </div>
                            <br />
                        </div>


                        <div class="row form-group col-md-12">
                          <div class="col-md-12">
                            <div class="col-md-12">
                            <label class="control-label col-md-1 col-sm-3 col-xs-12 rlabel" for="subName">Event</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" id="Events">
                                </select>
                              </div>
                            </div>
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>
                        <!-- form Group ends Here -->

                        <div class="row form-group col-md-12">
                          <div class="col-md-12">
                            <%--<label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad" for="subName"></label>--%>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <div class="col-md-12">  
                              <button type="button" class="btn upbutton midmar" onclick="addEventsToPanel();">
                                    Add Events</button>
                                </div>
                              
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <button type="button" class="btn upbutton midmar" id="btnEvent" onclick="CreateNewEvents();">
                                    +</button>
                              </div>
                            </div>

                        </div>





                        <div id="CreateNewEvents" style="margin-bottom: 15px;">
                            <div class="form-group col-md-12">
                                <div class="col-md-12">
                                    <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel rplus" for="subName">New Event</label>
                                    <div class="col-md-12 col-sm-4 col-xs-12">
                                      <div>  
                                      <input type="text" class="form-control rinput" id="txtEvent" />
                                       <button type="button" class="btn upbutton midmar rbtn" onclick="SaveEvent();">
                                            Save</button>
                                    </div>
                                      </div>

                                </div>
                            </div>
                          </div>
                            <%--<div class="form-group col-md-12">
                                <div class="col-md-12">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12 rpanel" for="subName"></label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                       


                                    </div>

                                </div>
                            </div>
                        </div>--%>


                        <div class="row form-group col-md-12">
                            <div class="col-md-6">
                              <div class="col-md-12">
                                <div class="panel panel-default rpanel col-md-12" >
                                    <div class="panel-body" id="eventPanel"></div>
                                </div>
                            </div>
                              </div>
                        </div>










                        <div class="form-group col-md-12">
                            <div class="col-md-12">
                                <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel rplus" for="cakeTag">Tag</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div>
                                        <input type="text" class="form-control rinput" id="cakeTag" />
                                        <button type="button" class="btn upbutton midmar rbtn"  onclick="addTagsToPanel();">
                                            Add Tag</button>

                                    </div>
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>
                        <!-- form Group ends Here -->

                        <div class="form-group col-md-12">
                            <div class="">
                                <div class="col-md-6 ">
                                    <div class="panel panel-default rpanel">
                                        <div class="panel-body" id="panelBody"></div>
                                    </div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                            <!-- inner col -->
                        </div>
                        <!-- form Group ends Here -->

                        <div class=" form-group col-md-12">
                            <div class="col-md-12">
                                <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel" for="subName">Min Weight</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
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
                              <div class="col-md-12">
                                <label class="control-label col-md-12 col-sm-3 col-xs-12 rlabel" for="subName">Max Weight</label>
                              
                                  <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control" id="txtMaxWeight" required="required" />

                                </div>
                                  </div>
                                <!-- col ends here -->
                                <br />
                                <br />

                            </div>
                            <!-- inner col ends here -->
                        </div>



                        <div class="row form-group col-md-12">
                            <div class="col-md-12">
                              <div class="col-md-12">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12 rlabel" for="subDescription">Customizable</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="checkbox" class="checkbox-inline" id="chkCustom" />
                                </div>
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>


                        <div class="row form-group col-md-12">
                                <div class="col-md-12">
                                    <label class="control-label col-md-12 col-sm-3 col-xs-12 " for="subDescription">Min Tiers</label>

                                    <div class="col-md-12 col-sm-6 col-xs-12">
                                        <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="1" value="1" class="form-control" id="txtMinTiers" required="required" />
                                    </div>
                                    <!-- col ends here -->
                                    <br />
                                    <br />
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad" for="subDescription"></label>
                                </div>
                            </div>
                            <!-- form Group ends Here -->


                            <div class="form-group col-md-12">
                                <div class="">
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



                        <!-- form Group ends Here -->

<%--                        <div id="customCake" class="col-md-12">
                            <div class="row form-group col-md-12">
                                <div class="col-md-12">
                                    <label class="control-label col-md-12 col-sm-3 col-xs-12 " for="subDescription">Min Tiers</label>

                                    <div class="col-md-12 col-sm-6 col-xs-12">
                                        <input type="number" onkeypress='return (event.charCode == 0 || event.charCode >= 48 && event.charCode <= 57 )' min="1" value="1" class="form-control" id="txtMinTiers" required="required" />
                                    </div>
                                    <!-- col ends here -->
                                    <br />
                                    <br />
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12 text-right pad" for="subDescription"></label>
                                </div>
                            </div>
                            <!-- form Group ends Here -->


                            <div class="form-group col-md-12">
                                <div class="">
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
                                    <div class="col-md-12 col-sm-6 col-xs-12">
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
                                    <div class="col-md-6 col-sm-6 col-xs-12">
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

                                                  <!-- form Group ends Here -->
                        
                            







                        </div>--%>

                       <div class=" form-group col-md-6">
                          <div class="">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel">Photo </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input class="img-show" type='file' id="imgInp" onchange="readURL(this);" />
                                <img id="cakeImage" class=" rimg" src="" alt="Please Upload 300X300 Dimensions Photo" />
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                            </div>
                        </div>
                        <!-- Form Group -->

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                
                                <img src="../Assets/images/preloader.gif" id="imgload" alt="loading" style="display:none;width:30px;height:30px" />
                            </div>
                        </div>

                        <%--<div class="row form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <button type="submit" id="btnSave" class="btn upbutton midmar">Save</button>
                            </div>
                        </div>--%>




                        <div class="form-group col-md-12">
                            <div class="col-md-12">
                                <div class="col-md-6">

                                    <button type="submit" id="btnSave" class="btn upbutton midmar">
                                        Save</button>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                            <!-- inner col -->
                        </div>
                        <!-- form Group ends Here -->

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
