<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="VendorLogin.aspx.cs" Inherits="FoodChapter.foodiesLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px white inset;
        }
.container-fluid1
{
    margin: 0 auto;
    float: none;
    margin-top: 30px;
}

.navbar-inverse
{
    background-color:transparent;
    border:none;
}
.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover
{
    background-color:transparent;
}



</style>
  
    <script>
    
       


        $(document).ready(function () {
            
          $('#formLogin').submit(function () {

            
                funAuthenticate();
               
                return false;
            });

        });


    </script>
  <script>
    function Validation(){
      document.getElementById('txtEmail').innerHTML = 'Please Enter a Email!';
      document.getElementById('txtPassword').innerHTML = 'Please Enter a Password!';
    }
    </script>
    <script>

        function clearVendor() {
            document.getElementById("txtVendorName").value = "";
            document.getElementById("txtVendorEmail").value = "";
            document.getElementById("txtVendorPassword").value = "";
            document.getElementById("txtVendorMobile1").value = "";
            document.getElementById("txtVendorMobile2").value = "";
            document.getElementById("txtInput").value = "";
            document.getElementById("txtVendorDescription").value = "";
            document.getElementById("txtVendorEntity").value = "";
            chbFoods.checked = false;
            chbCakes.checked = true;
            chbFrozenFoods.checked = false;
            chbDesserts.checked = false;
            CreateVendorCaptcha();
            //chbDeals.checked = false;
        }

        function funSaveVendor() {
            //e.preventDefault();
            var name = document.getElementById("txtVendorName").value;
            var email = document.getElementById("txtVendorEmail").value;
            var password = document.getElementById("txtVendorPassword").value;
            var entity = document.getElementById("txtVendorEntity").value;
            var mobile = document.getElementById("txtVendorMobile1").value + document.getElementById("txtVendorMobile2").value;
            //var vendorImg = document.getElementById("imgaeB64").innerHTML;
            //var vendorImg = document.getElementById("vendorImage").getAttribute('src');
            //Uint8Array.from(atob(vendorImg), c => c.charCodeAt(0))
            //var imgBytes = _base64ToArrayBuffer(vendorImg.split(',')[1]);

            var description = document.getElementById('txtVendorDescription').value;
            var foods = document.getElementById('chbFoods').checked;
            //var deals = document.getElementById('chbDeals').checked;
            var cakes = document.getElementById('chbCakes').checked;
            var frozenFoods = document.getElementById('chbFrozenFoods').checked;
            var desserts = document.getElementById('chbDesserts').checked;
            //alert(name);
            debugger;
            var vendor = {
                "FIRST_NAME": name,
                "EMAIL": email,
                "PASSWORD": password,
                "PERSONAL_PHONE": mobile,
                "DESCRIPTION": description,
                "BUSINESS_ENTITY_NAME": entity,
                "FOODS_SPECIALITY": foods,
                "CAKES_SPECIALITY": cakes,
                "FROZEN_FOODS_SPECIALITY": frozenFoods,
                //"DEALS_SPECIALITY": deals,
                "DESSERTS_SPECIALITY": desserts
                //"VENDRO_PHOTO": imgBytes
            };
            $.ajax({
                url: '/api/Vendors/saveVendor',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(vendor),
                statusCode: {
                    200: function (data) {
                        var vendorId = JSON.parse(data);
                        UploadImage(vendorId);
                        location.href = "VendorDashboard.aspx";
                        clearVendor();
                        document.getElementById("error").innerHTML = "";
                        document.getElementById("success").innerHTML = "Vendor Saved Successfully.";
                        document.getElementById("success").style.color = 'green';
                        e.preventDefault();

                        //location.reload();
                    },
                    500: function (data) {
                        //document.getElementById("success").innerHTML = "";
                        //document.getElementById("error").innerHTML = "Error occured. Vendor not added";
                        //document.getElementById("error").style.color = 'red';
                        e.preventDefault();
                    },
                    406: function () {
                        //document.getElementById("success").innerHTML = "";
                        //document.getElementById("error").innerHTML = "Email not Unique. Please choose another.";
                        //document.getElementById("error").style.color = 'red';
                        e.preventDefault();
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function funAuthenticate() {
            var email = document.getElementById("txtEmail").value;
            var password = document.getElementById("txtPassword").value;

                var user = {
                    "EMAIL": email,
                    "PASSWORD": password
                };

                $.ajax({
                    url: '/api/Vendors/authenticateVendor',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(user),
                    statusCode: {
                        200: function (data) {
                            var id = JSON.parse(data);
                            //alert(id);

                            location.href = 'VendorDashboard.aspx';
                        },
                        401: function (data) {
                            $('#myregistration').modal('show');
                         
                        }
                    },
                    jsonp: 'jsonp'
                });
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="gallery_pg_header_bg_login">
	<div class="gallery_bg fade1">
	<div class="seller_heading">
				<h1 style="margin-top: 188px;" class="sellers_pg_heading">Vendor Login</h1>
    </div>
	</div>
     
</div>
<div class="startcontent">
<img class="img_right sr_tp m_animate" src="Frontend/images/bg_1.png">
<img class="img_left m_animate" src="Frontend/images/bg_2.png">
 <div class="wrapper">
        <div class="top-bar" id="top-bar">
            <div class="loginbg" style="text-align:center;">
                <div class="container">
                    <div class="row rowfm">
                        <div class="col-md-3"></div>
                        <div class="col-md-6 col-sm-6 col-xs-12 FormLogin">
                            <h1 style="text-align: center; display: block;" class="product-name h_ty" id="LoginHeading">LOGIN</h1>

                            <div class="col-xs-12 text-center">
                                <label id="lblMessage"></label>
                            </div>

                            <form id="formLogin" class="loginfm  col-md-12 col-sm-4 ">
                                <div class="form-group">
                                    <label for="email" class="control-label contact_label" style="width:100%;text-align:left;">
                                        Email</label>
                                    <input type="email" class="ad_input" id="txtEmail" placeholder="Email" required="Email is required" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="control-label contact_label" style="width:100%;text-align:left;">
                                        Password</label>
                                    <input type="password" class="ad_input" id="txtPassword" placeholder="Password" required="password is required" />
                                </div>
                                <div class="row">
                                </div>
                                <button type="submit" class="cbtn_submit" id="login">
                                    LOGIN</button>

                            </form>
                        </div>
                        <div class="col-md-3"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
  </div>
      <div class="container">
        <div class="modal fade" id="myregistration" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" style="width:400px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" style="text-align: center; color:#780103; font-size:35px;">Please Enter Correct Email or Password!
                        
                        </h4>
                    </div>

                </div>
            </div>
        </div>
</div>
</asp:Content>
