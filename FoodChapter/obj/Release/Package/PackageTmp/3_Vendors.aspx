<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="3_Vendors.aspx.cs" Inherits="FoodChapter._3_Vendors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Vendors</title>
  <style>

.navbar-inverse
{
    background-color:transparent;
    border:none;
}
.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover
{
    background-color:transparent;
}

.container-fluid1
{
    margin: 0 auto;
    float: none;
    margin-top: 30px;
}

</style>
    <script>
        var page = 1;

        $(window).scroll(function () {
            if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                console.log(++page);
                //$("body").append('<div class="big-box"><h1>Page ' + page + '</h1></div>');
                var data = {
                    "all": true,
                    "key": document.getElementById('txtSearch').value,
                    "delivery": document.getElementById('chkDelivered').checked,
                    "cake": document.getElementById('chkCakes').checked,
                    "food": document.getElementById('chkFoods').checked,
                    "dessert": document.getElementById('chkDesserts').checked,
                    "frozen": document.getElementById('chkFrozen').checked,
                    "page" :page


                };
                LoadVendorData(data);
            }
        });
        $(document).ready(function () {
            var data1 = {
                "all": true,
                "key": '',
                "delivery": false,
                "cake": false,
                "food": false,
                "dessert": false,
                "frozen": false,
                "page": page


            };
            debugger;
            LoadVendorData(data1);
            $(".filterData").change(function () {
                page = 1;
                var data = {
                    "all": true,
                    "key": document.getElementById('txtSearch').value,
                    "delivery": document.getElementById('chkDelivered').checked,
                    "cake": document.getElementById('chkCakes').checked,
                    "food": document.getElementById('chkFoods').checked,
                    "dessert": document.getElementById('chkDesserts').checked,
                    "frozen": document.getElementById('chkFrozen').checked,
                    "page": page


                };
                
                LoadVendorData(data);
            });

        });
        function getWhereClause(delv) {
            var data = {
                "all": true,
                "key": document.getElementById('txtSearch').value,
                "delivery": document.getElementById('chkDelivered').checked,
                "cake": document.getElementById('chkCakes').checked,
                "food": document.getElementById('chkFoods').checked,
                "dessert": document.getElementById('chkDesserts').checked,
                "frozen": document.getElementById('chkFrozen').checked,
                "page": page


            };
            LoadVendorData(data);
        }

        function ViewCall(vendorId) {
            $.ajax({
                url: '/api/Vendors/GetVendorProfile',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'vendorId': vendorId },
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        if (json1.VENDOR.length > 0) {
                            var id = json1.VENDOR[0].UNIQUE_ID;
                            window.location = "8_VendorProfile.aspx?id=" + id;
                        }
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function LoadVendorData(whereClause) {

            $.ajax({
                url: '/api/Vendors/getVendorOrderAndProduct',
                type: 'Post',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(whereClause),
                statusCode: {
                    200: function (data) {
                        debugger;
                        if(page == 1)
                            $('.my_sellers_pg').remove();

                        var json1 = JSON.parse(data);
                        if (json1.VENDORS.length == 0)
                        {
                            page--;
                        }
                        else
                        {
                            for (var i = 0; i < json1.VENDORS.length; i++) {
                                var dataCategories = " ";
                                if (json1.VENDORS[i].FOODS_SPECIALITY == true) {
                                    dataCategories += "Foods,";
                                }
                                if (json1.VENDORS[i].CAKES_SPECIALITY == true) {
                                    dataCategories += "Cakes,";
                                }
                                if (json1.VENDORS[i].FROZEN_FOODS_SPECIALITY == true) {
                                    dataCategories += "Frozen Foods,";
                                }
                                if (json1.VENDORS[i].DEALS_SPECIALITY == true) {
                                    dataCategories += "Deals,";
                                }
                                if (json1.VENDORS[i].DESSERTS_SPECIALITY == true) {
                                    dataCategories += "Desserts";
                                }

                                dataCategories = dataCategories.slice(0, dataCategories.length - 1);
                                //alert(dataCategories);
                                var deliveryImage = "";
                                var delv;
                                if (json1.VENDORS[i].DELIVERY == true) {
                                    delv = 1;
                                    deliveryImage = "../Assets/images/img/deliver.png";
                                }
                                else {
                                    delv = 0;
                                    deliveryImage = "../Assets/images/img/no.png";

                                }

                                var orders = json1.VENDORS[i].VENDOR_ORDERS;
                                var items = json1.VENDORS[i].VENDOR_ITEMS;

                                $(".sellers_container").append('<div class="my_sellers_pg col-md-12"><div class="sellers_pg_wrapper col-md-2"><a href="javascript:void(0);" onclick="ViewCall(' + json1.VENDORS[i].VENDOR_ID + ')"><img style="width:100px;" src=' + json1.VENDORS[i].PROFILE_IMAGE + '></div></a><div class="sellers_pg_wrapper col-md-7"><h3  class="seller_name"><a href="javascript:void(0);" onclick="ViewCall(' + json1.VENDORS[i].VENDOR_ID + ')">' + json1.VENDORS[i].BUSINESS_ENTITY_NAME + '</a></h3><h4 class="seller_info">Category: ' + dataCategories + '</h4><h4 class="seller_info">Orders Delivered: <span id="orders">' + json1.VENDORS[i].VENDOR_ORDERS + '</span>  &nbsp;|  Items: <span id="items">' + json1.VENDORS[i].VENDOR_ITEMS + '</span> |<a href="javascript:void(0);" onclick="getWhereClause(' + delv + ')"></a><span class="s_delievery"> Delivery: Yes</span></h4></div><div class="sellers_pg_wrapp col-md-3"><a href="javascript:void(0);" class="sm-btn111" onclick="ViewCall(' + json1.VENDORS[i].VENDOR_ID + ')"><button class="s_view_profile">View Profile</button></a><a href="javascript:void(0);" class="sm-btn111" onclick="ViewCall(' + json1.VENDORS[i].VENDOR_ID + ')"> <button class="s_read_more">SEE MENU</button></a></div></div>');
                            }
                        }
                        
                        $('#imgload').hide();
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }

    </script>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="gallery_pg_header_bg_sellers">
	
	
	<div class="seller_bg fade1">
		<div class="seller_heading">
				<h2 style="margin-top: 170px;" class="sellers_pg_heading">Meet our Professionals</h2>
				<h1 style="margin-bottom: -120px;" class="sellers_pg_heading">Our Top Sellers</h1>
			</div>
	</div>


</div>
    
<div class="startcontent">
<img class="img_right sr_tp m_animate" src="Frontend/images/sellers_bg5.png">
<img class="sellers_left1 m_animate" src="Frontend/images/sellers_bg2.png">
<div class="container">
	<div class="my_container_section">
		<div class="container_wrapper">
			<div class="my_sidebar col-md-3 col-sm-12">
				<div class="sidebar_wrapper col-md-12">
					<div class="wrap">
					   <div class="search">
						  <input type="text" id="txtSearch"  class="searchTerm filterData" placeholder="Search">
						  <button type="submit" class="searchButton ">
							<img title="search this site" src="Frontend/images/search_black.png" alt="search" />
						 </button>
					   </div>
					</div>
					<h4 class="sidebar_type">Type</h4>
         
						<label><input type="checkbox" class="mint filterData " name="chkDelivered" id="chkAll" /><span>All</span></label><br />
						<label><input type="checkbox" class="mint filterData" name="chkDelivered" id="chkDelivered" /><span>Delivery</span></label><br />
						<label><input type="checkbox" name="chkDelivered" id="chkFoods"  class="mint filterData" /><span>Foods</span></label><br />
						<label><input type="checkbox" name="chkDelivered" id="chkCakes"  class="mint filterData" /><span>Cakes</span></label><br />
						<label><input type="checkbox" name="chkDelivered" id="chkDesserts"  class="mint filterData" /><span>Desserts</span></label><br />
						<label><input type="checkbox" name="chkDelivered" id="chkFrozen"  class="mint filterData" /><span>Frozen Foods</span></label><br />
				
				</div>
			</div>
			<div class="sellers_container col-md-9 col-sm-12">
				
			</div>
		</div>
	</div>
</div>
    
<img class="sellers_right2 m_animate" src="Frontend/images/sellers_bg7.png">
<img class="sellers_left2 m_animate" src="Frontend/images/sellers_bg4.png">
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


    <script>

        function clearUser() {

            document.getElementById("txtUserName").value = "";
            document.getElementById("txtUserEmail").value = "";
            document.getElementById("txtUserPassword").value = "";
            document.getElementById("txtUserMobile").value = "";

        }
        function clearVendor() {
            document.getElementById("txtVendorName").value = "";
            document.getElementById("txtVendorEmail").value = "";
            document.getElementById("txtVendorPassword").value = "";
            document.getElementById("txtVendorMobile").value = "";
            document.getElementById("txtVendorDescription").value = "";
            document.getElementById("txtVendorEntity").value = "";
            chbFoods.checked = false;
            chbCakes.checked = true;
            chbFrozenFoods.checked = false;
            chbDesserts.checked = false;
            chbDeals.checked = false;
        }

        function funSaveVendor() {
            //e.preventDefault();
            var name = document.getElementById("txtVendorName").value;
            var email = document.getElementById("txtVendorEmail").value;
            var password = document.getElementById("txtVendorPassword").value;
            var entity = document.getElementById("txtVendorEntity").value;
            var mobile = document.getElementById("txtVendorMobile").value;
            //var vendorImg = document.getElementById("imgaeB64").innerHTML;
            //var vendorImg = document.getElementById("vendorImage").getAttribute('src');
            //Uint8Array.from(atob(vendorImg), c => c.charCodeAt(0))
            //var imgBytes = _base64ToArrayBuffer(vendorImg.split(',')[1]);

            var description = document.getElementById('txtVendorDescription').value;
            var foods = document.getElementById('chbFoods').checked;
            var deals = document.getElementById('chbDeals').checked;
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
                "DEALS_SPECIALITY": deals,
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
                        clearVendor();
                        $('#msgModal').modal('show');

                        document.getElementById("lblMessage").innerHTML = "Vendor Saved Successfully.";
                        document.getElementById("lblMessage").style.color = 'green';
                        e.preventDefault();

                        //location.reload();
                    },
                    500: function () {
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Error occured. Vendor not added";
                        document.getElementById("lblMessage").style.color = 'red';
                        e.preventDefault();
                    },
                    406: function () {
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Email not Unique. Please choose another.";
                        document.getElementById("lblMessage").style.color = 'red';
                        e.preventDefault();
                    }
                },
                jsonp: 'jsonp'
            });
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
                    url: "/api/Vendors/UploadImage",
                    contentType: false,
                    processData: false,
                    data: data
                });
                ajaxRequest.done(function (xhr, textStatus) {
                    //alert('Image Uploaded successfully')
                });
            }
        }
        function funAuthenticate() {
            var email = document.getElementById("txtEmail").value;
            var password = document.getElementById("txtPassword").value;

            var userType = $('#userType').val();
            //if (userType == 0) {
            //    // <"FC msgs> //Please select a type
            //}
            //else
            if (userType == 2) {
                var user = {
                    "EMAIL": email,
                    "PASSWORD": password
                };

                $.ajax({
                    url: '/api/User/authenticateUser',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(user),
                    statusCode: {
                        200: function (data) {
                            location.href = 'gallery.aspx';
                        },
                        401: function () {
                            $('#msgModal').modal('show');
                            document.getElementById("lblMessage").innerHTML = "Wrong email or password";
                            document.getElementById("lblMessage").style.color = 'red';
                        }
                    },
                    jsonp: 'jsonp'
                });
            }
            else {
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

                            location.href = 'VendorProfile.aspx';
                        },
                        401: function (data) {
                            $('#msgModal').modal('show');
                            //alert('Wrong email or password');
                            document.getElementById("lblMessage").innerHTML = "Wrong email or password";
                            document.getElementById("lblMessage").style.color = 'red';
                        }
                    },
                    jsonp: 'jsonp'
                });
            }
        }

        function _base64ToArrayBuffer(base64) {
            var binary_string = window.atob(base64);
            //alert("a");
            var len = binary_string.length;
            var bytes = new Uint8Array(len);
            for (var i = 0; i < len; i++) {
                bytes[i] = binary_string.charCodeAt(i);
            }
            return bytes.buffer;
        }

        function funSaveUser() {

            var name = document.getElementById("txtUserName").value;
            var email = document.getElementById("txtUserEmail").value;
            var password = document.getElementById("txtUserPassword").value;
            var mobile = document.getElementById("txtUserMobile").value;

            var user = {
                "USER_TYPE": 1,
                "NAME": name,
                "EMAIL": email,
                "PASSWORD": password,
                "PHONE": mobile
            };
            $.ajax({
                url: '/api/User/saveUser',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(user),
                statusCode: {
                    200: function () {
                        clearUser();
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "User Saved Successfully.";
                        document.getElementById("lblMessage").style.color = 'green';
                        e.preventDefault();
                        //location.reload();
                    },
                    500: function () {
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Error occured. User not added";
                        document.getElementById("lblMessage").style.color = 'red';
                        e.preventDefault();

                    },
                    406: function () {
                        $('#msgModal').modal('show');
                        document.getElementById("lblMessage").innerHTML = "Email not Unique. Please choose another.";
                        document.getElementById("lblMessage").style.color = 'red';
                        e.preventDefault();

                    }
                },
                jsonp: 'jsonp'
            });
            //e.preventDefault();
        }
    </script>
</asp:Content>
