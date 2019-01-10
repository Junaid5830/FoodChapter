<%@ Page Title="Vendor Profile Details" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ViewVendorProfile.aspx.cs" Inherits="FoodChapter.WebPages.ViewVendorProfile" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#vendorImage')
                        .attr('src', e.target.result)
                        .width(150)
                        .height(200);
                    document.getElementById("imgaeB64").innerHTML = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
        var vendorId = 0;
        //    var catagory = 1, subCatagoryId = 2, vendorId = 4, productId = 0;
        $(document).ready(function () {

            vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
        $.ajax({
            //url: '/api/Vendors/GetAllVendors',
            url: '/api/Vendors/GetVendorProfile',
            type: 'Get',
            contentType: 'application/json',
            dataType: 'json',
            data: { 'vendorId': vendorId },
            //data: JSON.stringify(),
            statusCode: {
                200: function (data) {
                    var json1 = JSON.parse(data);
                    debugger;
                    for (var i = 0; i < json1.VENDOR.length; i++) {
                        document.getElementById("txtName").value = json1.VENDOR[i].FIRST_NAME;
                        document.getElementById('txtEmail').value = json1.VENDOR[i].EMAIL;
                        document.getElementById("txtPassword").value = json1.VENDOR[i].PASSWORD;
                        document.getElementById('txtBusinessName').value = json1.VENDOR[i].BUSINESS_ENTITY_NAME;
                        document.getElementById("txtPhone").value = json1.VENDOR[i].PERSONAL_PHONE;

                        document.getElementById('txtMName').value = json1.VENDOR[i].MIDDLE_NAME;
                        document.getElementById("txtLName").value = json1.VENDOR[i].LAST_NAME;
                        document.getElementById('txtAddress').value = json1.VENDOR[i].PERSONAL_ADDRESS;
                        document.getElementById("txtBusinessAddress").value = json1.VENDOR[i].BUSINESS_ADDRESS;
                        document.getElementById('txtCNIC').value = json1.VENDOR[i].CNIC;
                        document.getElementById("txtDesc").value = json1.VENDOR[i].DESCRIPTION;
                        document.getElementById('txtPrimPhone').value = json1.VENDOR[i].PRIMARY_WORKSPACE_PHONE;
                        document.getElementById("txtSecPhone").value = json1.VENDOR[i].SECONDARY_WORKSPACE_PHONE;
                        if (json1.VENDOR[i].FOODS_SPECIALITY == true) {
                            chbFoods.checked = true;
                        }
                        if (json1.VENDOR[i].CAKES_SPECIALITY == true) {
                            chbCakes.checked = true;
                        }
                        if (json1.VENDOR[i].FROZEN_FOODS_SPECIALITY == true) {
                            chbFrozenFoods.checked = true;
                        }
                        if (json1.VENDOR[i].DEALS_SPECIALITY == true) {
                            chbDeals.checked = true;
                        }
                        if (json1.VENDOR[i].DESSERTS_SPECIALITY == true) {
                            chbDesserts.checked = true;
                        }
                        var url = json1.VENDOR[i].PROFILE_IMAGE;

                        $("#vendorImage").attr("src", url).width(150).height(200);

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

        function NavigateToSite() {
            window.location = '/WebPages/ProductCatagory.aspx';
        }
        function addTagsToPanel() {
            debugger;
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
            chbCakes.checked = true;
            chbFrozenFoods.checked = false;
            chbDesserts.checked = false;
            chbDeals.checked = false;
        }

        function funSaveVendor() {
            //var img = document.getElementById('vendorImage');
            var path;
            var images = $("#imgInp").get(0).files;
            if (images.length > 0) {
                //alert('file selected');
            }
            else
            {
                path = $("#vendorImage").attr("src");

            }
            //alert(path);
            var name = document.getElementById("txtName").value;
            var mName = document.getElementById("txtMName").value;
            var lName = document.getElementById("txtLName").value;
            var email = document.getElementById("txtEmail").value;
            var password = document.getElementById("txtPassword").value;
            var entity = document.getElementById("txtBusinessName").value;
            var mobile = document.getElementById("txtPhone").value;
            var primPhone = document.getElementById("txtPrimPhone").value;
            var secPhone = document.getElementById("txtSecPhone").value;

            var address = document.getElementById("txtAddress").value;
            var businessAddress = document.getElementById("txtBusinessAddress").value;
            var cnic = document.getElementById("txtCNIC").value;
            var desc = document.getElementById("txtDesc").value;
            var secPhone = document.getElementById("txtSecPhone").value;

            var foods = document.getElementById('chbFoods').checked;
            var deals = document.getElementById('chbDeals').checked;
            var cakes = document.getElementById('chbCakes').checked;
            var frozenFoods = document.getElementById('chbFrozenFoods').checked;
            var desserts = document.getElementById('chbDesserts').checked;
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
                "DEALS_SPECIALITY": deals,
                "DESSERTS_SPECIALITY": desserts,
                "PROFILE_IMAGE": path,

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
                        location.reload();
                        document.getElementById("lblMessage").innerHTML = "Vendor Saved Successfully.";
                        document.getElementById("lblMessage").style.color = 'green';
                    },
                    500: function () {
                        document.getElementById("lblMessage").innerHTML = "Error occured. Vendor not added";
                        document.getElementById("lblMessage").style.color = 'red';
                    },
                    406: function () {
                        document.getElementById("lblMessage").innerHTML = "Email not Unique. Please choose another.";
                        document.getElementById("lblMessage").style.color = 'red';
                    }
                },
                jsonp: 'jsonp'
            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row">
            <div class="col-xs-12 text-center">
                Vendor Profile
            </div>
            <div class="col-xs-12 text-center" id="lblMessage">
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label for="Name" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-8">
                    <input type="text" id="txtName" class="form-control" placeholder="Name" required="required" />
                </div>
            </div>
            
        </div>
        <div class="row">
            <div class="col-xs-12">
                <label for="Name" class="col-sm-2 control-label">Middle Name</label>
                <div class="col-sm-8">
                    <input type="text" id="txtMName" class="form-control" placeholder="Name" required="required" />
                </div>
            </div>
            
        </div>
        <div class="row">
                <div class="col-xs-12">
                    <label for="Name" class="col-sm-2 control-label">Last Name</label>
                    <div class="col-sm-8">
                        <input type="text" id="txtLName" class="form-control" placeholder="Name" required="required" />
                    </div>
                </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label for="email" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="txtEmail" placeholder="Email" required="required" />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label for="mobile" class="col-sm-2 control-label">Phone</label>
                <div class="col-sm-8">
                    <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtPhone" placeholder="Phone" required="required" />
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12">
                <label for="mobile" class="col-sm-2 control-label">Primary Phone</label>
                <div class="col-sm-8">
                    <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtPrimPhone" placeholder="Phone" required="required" />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label for="mobile" class="col-sm-2 control-label">Secondary Phone</label>
                <div class="col-sm-8">
                    <input type="text" pattern="[0-9]{11}" title="11 or more digit contact number" class="form-control" id="txtSecPhone" placeholder="Phone" required="required" />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label for="password" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" id="txtPassword" placeholder="Password" required="required" />
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12">
                <label for="business" class="col-sm-2 control-label">Business Name</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="txtBusinessName" placeholder="Business Entity Name" required="required" />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label for="business" class="col-sm-2 control-label">Personal Address</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="txtAddress" placeholder="Address"  />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label for="business" class="col-sm-2 control-label">Business Address</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="txtBusinessAddress" placeholder="Address"  />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label for="mobile" class="col-sm-2 control-label">CNIC</label>
                <div class="col-sm-8">
                    <input type="text" pattern="[0-9]{13}" title="13 or more digit contact number" class="form-control" id="txtCNIC" placeholder="cnic" />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label for="mobile" class="col-sm-2 control-label">Description</label>
                <div class="col-sm-8">
                <input type="text" class="form-control" id="txtDesc" placeholder="Address" />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label for="business" class="col-sm-2 control-label">Speciality</label>
                <div class="col-sm-8">
                    <input type="checkbox" name="Cakes" id="chbCakes" value="Cakes" class="mint" />
                    Cakes
                <input type="checkbox" name="foods" id="chbFoods" value="Foods" class="mint" />
                    Foods
                <input type="checkbox" name="Frozen Foods" id="chbFrozenFoods" value="frozen Foods" class="mint" />
                    Frozen Foods
                <input type="checkbox" name="vehicle" id="chbDesserts" value="Deals" class="mint" />
                    Desserts
                <input type="checkbox" name="Deals" value="Deals" id="chbDeals" class="mint" />
                    Deals
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label for="ProfileImage" class="col-md-2 control-label">Photo</label>
                <div class="col-sm-8">
                    <input class="img-show" type='file' id="imgInp" onchange="readURL(this);" />
                    <p id="imgaeB64" hidden></p>
                    <img id="vendorImage" src="" alt="Your Photo Here" />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
            </div>
            <div class="col-sm-3">
                <button type="button" class="btn btn-primary btn-sm" onclick="funSaveVendor()">
                    Update</button>
            </div>
            <div class="col-md-3">
                <button type="button" class="btn btn-danger btn-sm">
                    Cancel</button>
            </div>
            <div class="col-sm-3">
            </div>
        </div>



</asp:Content>
