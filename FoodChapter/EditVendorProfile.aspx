<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Vendor.Master" AutoEventWireup="true" CodeBehind="EditVendorProfile.aspx.cs" Inherits="FoodChapter.WebPages.EditVendorProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#vendorImage')
                        .attr('src', e.target.result)
                        .width(220)
                        .height(220);
                    document.getElementById("imgaeB64").innerHTML = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
        function rreadURL(input) {
          if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
              $('#vendorPersonalImage')
                  .attr('src', e.target.result)
                  .width(220)
                  .height(220);
              document.getElementById("PersonalimgaeB64").innerHTML = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
          }
        }
        function readdURL(input) {
          if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
              $('#uploadCNIC')
                  .attr('src', e.target.result)
                  .width(220)
                  .height(220);
              document.getElementById("cnicB64").innerHTML = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
          }
        }
        var vendorId = 0;
        $(document).ready(function () {

            vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
            if (vendorId == "0")
            {
                window.location = "Home.aspx";
            }
            $.ajax({
            url: '/api/Vendors/GetVendorProfile',
            type: 'Get',
            contentType: 'application/json',
            dataType: 'json',
            data: { 'vendorId': vendorId },
            statusCode: {
                200: function (data) {
                  var json1 = JSON.parse(data);
                  console.log(data);
                    for (var i = 0; i < json1.VENDOR.length; i++) {
                        document.getElementById("txtName").value = json1.VENDOR[i].FIRST_NAME;
                        document.getElementById('txtEmail').value = json1.VENDOR[i].EMAIL;
                        document.getElementById("txtPassword").value = json1.VENDOR[i].PASSWORD;
                        document.getElementById('txtBusinessName').value = json1.VENDOR[i].BUSINESS_ENTITY_NAME;
                        document.getElementById("txtPhone1").value = json1.VENDOR[i].PERSONAL_PHONE.substring(0,4);
                        document.getElementById("txtPhone2").value = json1.VENDOR[i].PERSONAL_PHONE.substring(4, 11);

                        document.getElementById('txtPhone3').value = json1.VENDOR[i].PRIMARY_WORKSPACE_PHONE.substring(0, 4);
                        document.getElementById('txtPhone4').value = json1.VENDOR[i].PRIMARY_WORKSPACE_PHONE.substring(4, 11);

                        document.getElementById("txtPhone5").value = json1.VENDOR[i].SECONDARY_WORKSPACE_PHONE.substring(0, 4);
                        document.getElementById("txtPhone6").value = json1.VENDOR[i].SECONDARY_WORKSPACE_PHONE.substring(4, 11);

                        document.getElementById('txtMName').value = json1.VENDOR[i].MIDDLE_NAME;
                        document.getElementById("txtLName").value = json1.VENDOR[i].LAST_NAME;
                        document.getElementById('txtAddress').value = json1.VENDOR[i].PERSONAL_ADDRESS;
                        document.getElementById("txtBusinessAddress").value = json1.VENDOR[i].BUSINESS_ADDRESS;
                        document.getElementById('txtCNIC').value = json1.VENDOR[i].CNIC;
                        document.getElementById("txtDesc").value = json1.VENDOR[i].DESCRIPTION;
                        
                        if (json1.VENDOR[i].FOODS_SPECIALITY == true) {
                            chbFoods.checked = true;
                        }
                        if (json1.VENDOR[i].CAKES_SPECIALITY == true) {
                            chbCakes.checked = true;
                        }
                        if (json1.VENDOR[i].FROZEN_FOODS_SPECIALITY == true) {
                            chbFrozenFoods.checked = true;
                        }
                        //if (json1.VENDOR[i].DEALS_SPECIALITY == true) {
                        //    chbDeals.checked = true;
                        //}
                        if (json1.VENDOR[i].DESSERTS_SPECIALITY == true) {
                            chbDesserts.checked = true;
                        }
                        if (json1.VENDOR[i].DELIVERY == true)
                        {
                            chbDelivery.checked = true;
                        }
                        var url = json1.VENDOR[i].PROFILE_IMAGE;

                        $("#vendorImage").attr("src", url).width(220).height(220);

                        var urll = json1.VENDOR[i].CNIC_IMAGE;

                        $("#uploadCNIC").attr("src", urll).width(220).height(220);

                        var urlll = json1.VENDOR[i].PERSONAL_IMAGE;

                        $("#vendorPersonalImage").attr("src", urlll).width(220).height(220);

                    }
                }
            },
            jsonp: 'jsonp'
        });

    });
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
                    url: "/api/Vendors/UploadImage",
                    contentType: false,
                    processData: false,
                    data: data
                });
                ajaxRequest.done(function (xhr, textStatus) {
                    //alert('Image Uploaded successfully')
                });
            };
        }
        function UploadPersonalImage(id) {
          var data = new FormData();
          var files = $("#imgInppp").get(0).files;
          if (files.length > 0) {
            data.append("UploadedImage", files[0]);
            var uniquekey = {
              id: id
            };
            data.append("id", id);

            // Make Ajax request with the contentType = false, and procesDate = false
            var ajaxRequest = $.ajax({
              type: "POST",
              url: "/api/Vendors/UploadPersonalImage",
              contentType: false,
              processData: false,
              data: data
            });
            ajaxRequest.done(function (xhr, textStatus) {
              //alert('Image Uploaded successfully')
            });
          }
        }
        function UploadCNIC(id) {
          var data = new FormData();
          var files = $("#imgInpp").get(0).files;
          if (files.length > 0) {
            data.append("UploadedCNIC", files[0]);
            var uniquekey = {
              id: id
            };
            data.append("id", id);

            // Make Ajax request with the contentType = false, and procesDate = false
            var ajaxRequest = $.ajax({
              type: "POST",
              url: "/api/Vendors/UploadCNIC",
              contentType: false,
              processData: false,
              data: data
            });
            ajaxRequest.done(function (xhr, textStatus) {
              //alert('Image Uploaded successfully')
            });
          }
        }
        function NavigateToSite() {
            window.location = '/WebPages/ProductCatagory.aspx';
        }
        function addTagsToPanel() {
            //debugger;
            var tag = document.getElementById("productTag").value;
            $("#panelBody").append('<label style="color:black; background-color:aliceblue; margin-left:10px; height:30px;" onclick="childClick(event)">' + tag + ' &#9938;' + '</label>');

            document.getElementById("productTag").value = "";
        }
        function childClick(e) {
            document.getElementById("panelBody").removeChild(e.target);
        }
        function clearVendor() {
            document.getElementById("txtName").value = "";
            document.getElementById("txtEmail").value = "";
            document.getElementById("txtPassword").value = "";
            document.getElementById("txtBusinessName").value = "";
            document.getElementById("txtPhone").value = "";
            chbFoods.checked = false;
            chbCakes.checked = false;
            chbFrozenFoods.checked = false;
            chbDesserts.checked = false;
            //chbDeals.checked = false;
        }

        function checkIsUnique()
        {
            debugger;
            var businessEntity = document.getElementById("txtBusinessName").value;
            var phone = document.getElementById("txtPhone1").value + document.getElementById("txtPhone2").value;
            var user = {
                "BUSINESS_ENTITY_NAME": businessEntity,
                "PERSONAL_PHONE": phone,
                "VENDOR_ID" : vendorId
            };

            $.ajax({
                url: '/api/Vendors/IsUniqueVendor',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(user),
                statusCode: {
                    200: function (data) {
                        funSaveVendor();
                    },
                    500: function (data) {
                        //alert(issue);
                        //alert('Wrong email or password');
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Business Enity or Mobile Number is already exist";
                        document.getElementById("lblMessage").style.color = 'red';
                        
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function funSaveVendor() {
            
            var path;
            var images = $("#imgInp").get(0).files;
            if (images.length > 0) {

            }
            else
            {
                path = $("#vendorImage").attr("src");

            }
            var personalImagepath;
            var Personalimages = $("#imgInppp").get(0).files;
            if (Personalimages.length > 0) {

            }
            else {
              personalImagepath = $("#vendorPersonalImage").attr("src");

            }
            var cnicpath;
            var cnicImage = $("#imgInpp").get(0).files;

            if (cnicImage.length > 0) {

            }
            else {
              cnicpath = $("#uploadCNIC").attr("src");

            }
            var name = document.getElementById("txtName").value;
            var mName = document.getElementById("txtMName").value;
            var lName = document.getElementById("txtLName").value;
            var email = document.getElementById("txtEmail").value;
            var password = document.getElementById("txtPassword").value;
            var entity = document.getElementById("txtBusinessName").value;
            var mobile = document.getElementById("txtPhone1").value + document.getElementById("txtPhone2").value;
            var primPhone = document.getElementById("txtPhone3").value + document.getElementById("txtPhone4").value;
            var secPhone = document.getElementById("txtPhone5").value + document.getElementById("txtPhone6").value;

            var address = document.getElementById("txtAddress").value;
            var businessAddress = document.getElementById("txtBusinessAddress").value;
            var cnic = document.getElementById("txtCNIC").value;
            var desc = document.getElementById("txtDesc").value;
            //var secPhone = document.getElementById("txtSecPhone").value;
            var delivery = document.getElementById('chbDelivery').checked;
            var foods = document.getElementById('chbFoods').checked;
            //var deals = document.getElementById('chbDeals').checked;
            var cakes = document.getElementById('chbCakes').checked;
            var frozenFoods = document.getElementById('chbFrozenFoods').checked;
            var desserts = document.getElementById('chbDesserts').checked;

            var VENDOR_CATEGORIES = {
                cats : []
            };
            var VID = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
            var newItem;
            if (cakes == true)
            {
                newItem = {
                    "CATEGORY_ID": 13,
                    "VENDOR_ID": VID,
                };
                VENDOR_CATEGORIES.cats.push(newItem);

            }
            if (foods == true) {
                newItem = {
                    "CATEGORY_ID": 3,
                    "VENDOR_ID": VID,
                };
                VENDOR_CATEGORIES.cats.push(newItem);

            }
            if (frozenFoods == true) {
                newItem = {
                    "CATEGORY_ID": 4,
                    "VENDOR_ID": VID,
                };
                VENDOR_CATEGORIES.cats.push(newItem);

            }
            if (desserts == true) {
                newItem = {
                    "CATEGORY_ID": 5,
                    "VENDOR_ID": VID,
                };
                VENDOR_CATEGORIES.cats.push(newItem);

            }
            var vendor = {
                "VENDOR_ID": vendorId,
                "FIRST_NAME": name,
                "EMAIL": email,
                "PASSWORD": password,
                "PERSONAL_PHONE": mobile,
                "BUSINESS_ENTITY_NAME": entity,
                "FOODS_SPECIALITY": foods,
                "CAKES_SPECIALITY": cakes,
                "FROZEN_FOODS_SPECIALITY": frozenFoods,
                "VENDOR_CATEGORIES": VENDOR_CATEGORIES.cats,
                "DESSERTS_SPECIALITY": desserts,
                "PROFILE_IMAGE": path,
                "CNIC_IMAGE": cnicpath,
                "DELIVERY" : delivery,
                "MIDDLE_NAME": mName,
                "LAST_NAME": lName,
                "PRIMARY_WORKSPACE_PHONE": primPhone,
                "SECONDARY_WORKSPACE_PHONE": secPhone,
                "PERSONAL_ADDRESS": address,
                "BUSINESS_ADDRESS": businessAddress,
                "CNIC": cnic,
                "DESCRIPTION" : desc

            };

            $.ajax({
                url: '/api/Vendors/UpdateVendor',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(vendor),
                statusCode: {
                    200: function () {

                        UploadImage(vendorId);
                        UploadCNIC(vendorId);
                        UploadPersonalImage(vendorId);
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Profile updated Successfully.";
                        document.getElementById("lblMessage").style.color = '#780103';
                        location.href = "VendorDashboard.aspx";
                        
                    },
                    500: function () {
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Error occured. Vendor not added";
                        document.getElementById("lblMessage").style.color = '#780103';
                    },
                    406: function () {
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Email not Unique. Please choose another.";
                        document.getElementById("lblMessage").style.color = '#780103';
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function verifyMobileCode() {
            var code = document.getElementById("txtPhone1").value;
            if (code.substring(0, 2) != "03")
                document.getElementById("txtPhone1").value = 0;
            else {
                if (code.length > 4) {
                    document.getElementById("txtPhone2").focus();
                    var mobile = document.getElementById("txtPhone2").value;
                    if (mobile.length == 0) {
                        document.getElementById("txtPhone2").value = code.substring(4, 5);
                    }
                    document.getElementById("txtPhone1").value = code.substring(0, 4);
                }
            }
        }

        function verifyMobileCodePrim() {
            var code = document.getElementById("txtPhone3").value;
            if (code.substring(0, 2) != "03")
                document.getElementById("txtPhone3").value = 0;
            else {
                if (code.length > 4) {
                    document.getElementById("txtPhone4").focus();
                    var mobile = document.getElementById("txtPhone4").value;
                    if (mobile.length == 0) {
                        document.getElementById("txtPhone4").value = code.substring(4, 5);
                    }
                    document.getElementById("txtPhone3").value = code.substring(0, 4);
                }
            }
        }

        function verifyMobileCodeSec() {
            var code = document.getElementById("txtPhone5").value;
            if (code.substring(0, 2) != "03")
                document.getElementById("txtPhone5").value = 0;
            else {
                if (code.length > 4) {
                    document.getElementById("txtPhone6").focus();
                    var mobile = document.getElementById("txtPhone6").value;
                    if (mobile.length == 0) {
                        document.getElementById("txtPhone6").value = code.substring(4, 5);
                    }
                    document.getElementById("txtPhone5").value = code.substring(0, 4);
                }
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Back-Support -->
    <div class="Vendor-edit">

    <div id="vendorprofile" class="vendorown">
       <div class="row">
           <div class="col-md-12 col-sm-12 col-xs-12 up">
               <h3 class="col-md-12">Update Profile</h3>
           </div>
       </div>

        <div class="row rtp">
            <div class="col-md-6">
                <label for="Name" class="col-sm-3 col-md-3 control-label rlabel">Name</label>
                <div class="col-md-6 col-sm-8">
                    <input type="text" id="txtName" class="form-control  rlabel" placeholder="Name" required="required" />
                </div>
            </div>
            
      
       
            <div class="col-md-6">
                <label for="Name" class="col-sm-4 col-md-3 control-label text-details rlabel">Middle Name</label>
                <div class="col-sm-8 col-md-6">
                    <input type="text" id="txtMName" class="form-control rlabel" placeholder="Name" required="required" />
                </div>
            </div>
            
        
                <div class="col-xs-12 col-md-6">
                    <label for="Name" class="col-sm-4 col-md-3 control-label text-details rlabel">Last Name</label>
                    <div class="col-sm-8 col-md-6">
                        <input type="text" id="txtLName" class="form-control rlabel" placeholder="Name" required="required" />
                    </div>
                </div>
        </div>

        <div class="row">
            <div class="col-xs-12 mbottom col-md-6">
                <label for="email" class="col-sm-2 col-md-3 control-label rlabel">Email</label>
                <div class="col-sm-10 col-md-6" >
                    <input type="email" class="form-control" id="txtEmail" placeholder="Email" required="required" />
                </div>
            </div>
        
            <div class="col-xs-12 mbottom col-md-6">
                <label for="mobile" class="col-sm-2 col-md-3 control-label rlabel">Business Phone</label>
                
                <div class="col-sm-2 col-md-3 rtp">
                    <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtPhone1" oninput = "verifyMobileCode()" placeholder="03.." required="required" />
                </div>
                <div class="col-sm-2 col-md-3 rtp">
                    <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtPhone2" placeholder="768...." required="required" />
                </div>
            </div>
        </div>
        
        <div class="row rtp">
            <div class="col-xs-12 mbottom col-md-6">
                <label for="mobile" class="col-sm-2 col-md-3 rlabel control-label">Primary Phone <span><br />(for Notification)</span></label>
                
                <%--<div class="col-sm-8">
                    <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtPrimPhone" placeholder="Phone" required="required" />
                </div>--%>
                <div class="col-sm-2 col-md-3">
                    <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtPhone3" oninput = "verifyMobileCodePrim()" placeholder="03.." required="required" />
                </div>
                <div class="col-sm-2 col-md-3">
                    <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtPhone4" placeholder="768...." required="required" />
                </div>


            </div>
        
            <div class="col-xs-12 mbottom col-md-6">
                <label for="mobile" class="col-sm-2 col-md-3 rlabel control-label">Secondary Phone</label>
                <%--<div class="col-sm-8">
                    <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtSecPhone" placeholder="Phone" required="required" />
                </div>--%>
                <div class="col-sm-2 col-md-3">
                    <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtPhone5" oninput = "verifyMobileCodeSec()" placeholder="03.." required="required" />
                </div>
                <div class="col-sm-2 col-md-3">
                    <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtPhone6" placeholder="768...." required="required" />
                </div>
            </div>
        </div>

        <div class="row rtp">
            <div class="col-xs-12 mbottom col-md-6">
                <label for="password" class="col-sm-2 col-md-3 rlabel control-label">Password</label>
                <div class="col-sm-10 col-md-6">
                    <input type="password" class="form-control" id="txtPassword" placeholder="Password" required="required" />
                </div>
            </div>
       
            <div class="col-xs-12 mbottom col-md-6">
                <label for="business" class="col-sm-2 col-md-3 rlabel control-label">Business Name</label>
                <div class="col-sm-10 col-md-6">
                    <input type="text" class="form-control" id="txtBusinessName" placeholder="Business Entity Name" required="required" />
                </div>
            </div>
        </div>

        <div class="row rtp">
            <div class="col-xs-12 mbottom col-md-6">
                <label for="business" class="col-sm-2 col-md-3 rlabel control-label">Personal Address</label>
                <div class="col-sm-10 col-md-6">
                    <input type="text" class="form-control" id="txtAddress" placeholder="Address"  />
                </div>
            </div>
        
            <div class="col-xs-12 mbottom col-md-6">
                <label for="business" class="col-sm-2 col-md-3 rlabel control-label">Business Address</label>
                <div class="col-sm-10 col-md-6">
                    <input type="text" class="form-control" id="txtBusinessAddress" placeholder="Address"  />
                </div>
            </div>
        </div>

        <div class="row rtp">
            <div class="col-xs-12 mbottom col-md-6">
                <label for="mobile" class="col-sm-2 col-md-3 rlabel control-label">CNIC</label>
                <div class="col-sm-10 col-md-6">
                    <input type="text" pattern="[0-9]{13}" title="13 or more digit contact number" class="form-control" id="txtCNIC" placeholder="cnic" />
                </div>
            </div>
        
            <div class="col-xs-12 mbottom col-md-6">
                <label for="mobile" class="col-sm-2 col-md-3 rlabel control-label">Description</label>
                <div class="col-sm-10 col-md-6">
                <input type="text" class="form-control" id="txtDesc" placeholder="Address" />
                </div>
            </div>
        </div>

        <div class="row rtp">
            <div class="col-xs-12 mbottom col-md-6">
                <label for="business" class="col-sm-2 col-md-3 rlabel control-label">Speciality</label>
                <div class="col-sm-10 col-md-6">
                     <div class="forcake col-md-6">
                                    <div class="checkboxThree">
                                    <input type="checkbox" value="1" id="chbCakes" name="check" />
                                    <label for="chbCakes"></label>
                                     </div> <!-- new checkbox  -->
                                            <span>Cakes</span>

                                            </div>
                                     <div class="forcake">
                                     <div class="checkboxThree">
                                    <input type="checkbox" value="1" id="chbFoods" name="check" />
                                    <label for="chbFoods"></label>
                                     </div> <!-- new checkbox  -->
                                    <span>Foods</span>

                                            </div>
                                     <div class="forcake col-md-6">
                                     <div class="checkboxThree">
                                    <input type="checkbox" value="1" id="chbFrozenFoods" name="check" />
                                    <label for="chbFrozenFoods"></label>
                                     </div> <!-- new checkbox  -->
                                    <span>Frozen Foods</span>

                                            </div>
                                     <div class="forcake">
                                     <div class="checkboxThree">
                                    <input type="checkbox" value="1" id="chbDesserts" name="check" />
                                    <label for="chbDesserts"></label>
                                     </div> <!-- new checkbox  -->
                                    <span>Desserts</span>

                                            </div>
                </div>
            </div>
        
            <div class="col-xs-12 mbottom col-md-6">
                <label for="business" class="col-sm-2 col-md-3 rlabel control-label">Delivery</label>
                <div class="col-sm-10 col-md-3" style="padding-top:8px;" >
                     <div class="forcake">
                                    <div class="checkboxThree">
                                    <input type="checkbox" value="Delivery" id="chbDelivery" name="Deals" />
                                    <label for="chbDelivery"></label>
                                     </div> <!-- new checkbox  -->
                                            

                                            </div>
                </div>
            </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-6 mbottom ">
                <label for="ProfileImage" class="col-md-2 col-md-3 rlabel control-label">LOGO</label>
                <div class="col-sm-10 rtp">
                    <input class="img-show rtp pad" type='file' id="imgInp" onchange="readURL(this);" />
                    <p id="imgaeB64" hidden></p>
                    <img style="width:220px;height:220px;border-radius:50%;" id="vendorImage" src="" alt="Please Provide 300X300 Photo or above" />
                </div>
            </div>
           <div class="col-md-6 mbottom ">
                <label for="ProfileImage" class="col-md-2 col-md-3 rlabel control-label">Upload CNIC</label>
                <div class="col-sm-10 rtp">
                    <input class="img-show rtp pad" type='file' id="imgInpp" onchange="readdURL(this);" />
                    <p id="cnicB64" hidden></p>
                    <img style="width:220px;height:220px;border-radius:50%;" id="uploadCNIC" src="" alt="Please Provide 300X300 Photo or above" />
                </div>
            </div>
                <div class="col-md-6 mbottom ">
                <label for="ProfileImage" class="col-md-2 col-md-3 rlabel control-label">PHOTO</label>
                <div class="col-sm-10 rtp">
                    <input class="img-show rtp pad" type='file' id="imgInppp" onchange="rreadURL(this);" />
                    <p id="PersonalimgaeB64" hidden></p>
                    <img style="width:220px;height:220px;border-radius:50%;" id="vendorPersonalImage" src="" alt="Please Provide 300X300 Photo or above" />
                </div>
            </div>
            </div>
        </div>

        <div class="row" style="text-align:center;">
            
            <div class="col-md-3 "    style= "margin-left: 20px; ">
                <button type="button" class="btn upbutton midmar" style="margin-bottom: 20px;" onclick="checkIsUnique()">
                    Update</button>
                
            </div>
            <div class="col-sm-3 ">
                <button type="button" class="btn upbutton midmar">
                    Cancel</button>
            </div>
        </div>

        </div>


    <div class="modal fade " id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-sm modalMsg ">
                <div class="modal-content ">
                    
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-6 col-md-offset-3">
                                    
                                    <h4 style=" text-align: center" id="lblMessage">

                                    </h4>
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






        </div> <!-- vendor ends herer -->


</asp:Content>
