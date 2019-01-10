<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdminViewCake.aspx.cs" Inherits="FoodChapter.AdminViewCake" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            window.location = "home.aspx";
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

     



            LoadCakeData();
        });
           
            function LoadCakeData() {
                $.ajax({
                  url: '/api/Product/SearchCakeByCakeId',
                  type: 'Get',
                  contentType: 'application/json',
                    dataType: 'json',
                    data: { 'cakeId': <%= int.Parse(FoodChapter.SessionManager.GetCakeSession()) %>   },
                    statusCode: {
                        200: function (data) {
                          var json1 = JSON.parse(data);
                          console.log(data);
                          for (var i = 0; i < json1.CAKE.length; i++) {
                            $('#Types').val(json1.CAKE[0].TYPE_ID);
                            document.getElementById('txtName').innerText = json1.CAKE[0].NAME;
                            document.getElementById('txtDesc').innerText = json1.CAKE[0].DESCRIPTION;
                            document.getElementById('txtTime').innerText = json1.CAKE[0].ESTIMATED_TIME+" hours";
                            document.getElementById('txtMinWeight').innerText = json1.CAKE[0].MIN_WEIGHT+" Pounds";
                            document.getElementById('txtMaxWeight').innerText = json1.CAKE[0].MAX_WEIGHT+" Pounds";

                            document.getElementById('txtMinTiers').innerText = json1.CAKE[0].MIN_TIERS;
                            document.getElementById('txtMaxTiers').innerText = json1.CAKE[0].MAX_TIERS;
                            document.getElementById('txtPrice').innerText = "RS. "+json1.CAKE[0].PRICE;

                           
                            var url = json1.CAKE[0].CAKE_PHOTO;
                            //alert(url);
                            $("#cakeImage").attr("src", "" + url).width(220).height(220);
                          }
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
         
           
     
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="x_panel">
        <div class="x_title col-md-12">
          <div class="col-md-12">
            <h3 class="col-md-12"> Cake Details</h3></div>
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
                                <label id="">
                                </label>
                            </div>
                            </div>
                            <!-- col ends here -->
                           
                        </div>

                        <!-- form Group ends Here -->


                        <div class=" form-group col-md-6">
                            <div class="col-md-12">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subName">Name</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <span id="txtName"></span>

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
                                    <label  id="txtDesc"></label>
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>
                        <!-- form Group ends Here -->

                        <div class="form-group col-md-6">
                            <div class="col-md-12">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel rnp" for="subDescription">Time Required</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label id="txtTime"></label>
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
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subDescription">Price</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label id="txtPrice"></label>
                                </div>
                               
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>

                        <div class="form-group col-md-6">
                            <div class="col-md-12">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subName">Flavor</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label id="flavorPanel"></label>

                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                        </div>
                        <!-- form Group ends Here -->

                        <div class="form-group col-md-6">
                          <div class="col-md-12">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subName">Event</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label id="eventPanel">
                                </label>
                              </div>
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                        </div>

                        <div class="form-group col-md-6">
                              <div class="col-md-12">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="cakeTag">Tag</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                   <label id="panelBody"></label>
                                </div>
                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />
                            </div>
                       
                       
                        <!-- form Group ends Here -->

                        <div class="form-group col-md-6">
                            <div class="col-md-12">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subName">Min Weight</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label id="txtMinWeight"></label>

                                </div>
                                <!-- col ends here -->
                                <br />
                                <br />

                            </div>
                            <!-- inner col ends here -->
                        </div>
                        <div class="form-group col-md-6">
                            
                              <div class="col-md-12">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subName">Max Weight</label>
                              
                                  <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label id="txtMaxWeight"></label>

                                </div>
                                  </div>
                                <!-- col ends here -->
                                <br />
                                <br />

                           
                            <!-- inner col ends here -->
                        </div>

                        <!-- form Group ends Here -->

                      
                            <div class="form-group col-md-6">
                                <div class="col-md-12">
                                    <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel " for="subDescription">Min Tiers</label>

                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <label id="txtMinTiers"></label>
                                    </div>
                                    <!-- col ends here -->
                                    <br />
                                    <br />
                                  
                                </div>
                            </div>
                            <!-- form Group ends Here -->


                            <div class="form-group col-md-6">
                                <div class="col-md-12">
                                    <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel" for="subDescription">Max Tiers</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <label id="txtMaxTiers" ></label>
                                    </div>
                                   
                                    <!-- col ends here -->
                                    <br />
                                    <br />
                                </div>
                            </div>
                          





                                                  <!-- form Group ends Here -->
                        <div class=" form-group col-md-12">
                          <div class="col-md-12">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12 rlabel">Photo </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                               
                                <img id="cakeImage" class=" rimg" src="" alt="Please Upload 300X300 Dimensions Photo" />
                            </div>
                            <!-- col ends here -->
                            <br />
                            <br />
                            </div>
                        </div>
                   
                       </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                
                                <img src="../Assets/images/preloader.gif" id="imgload" alt="loading" style="display:none;width:30px;height:30px" />
                            </div>
                       
                        </div>
               </form>
                    </div>
                    </div>
            </div>
            <!-- row ends here -->
        
     

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
