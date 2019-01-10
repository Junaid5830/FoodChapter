<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FoodChapter.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
      $(document).ready(function () {
  

      $("#btnSend").click(function () {
                var emailData = {
                    "NAME": $("#txtName").val(),
                    "EMAIL": $("#txtEmail").val(),
                    "SUBJECT": $("#txtMsg").val()

                }
                $.ajax({
                    url: '/api/User/SendEmailToUser',
                    type: 'Get',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(emailData),
                    statusCode: {
                        200: function (result) {
                            console.log(result);
                            //print message

                        },
                        500: function (result) {
                            console.log(result);
                        }
                    },
                    jsonp: 'jsonp'
                });

            });

      });
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="tr3">
    <a style="color: white; font-family: 'Lato', sans-serif; margin-right: 20px;" href="Contact.aspx" class="my-tel">
      <img title="call" src="Frontend/images/call.png" alt="call" />+92-321-6000030</a>
  </div>
    <div class="gallery_pg_header_bg_login">
	
	
	<div class="gallery_bg fade1">
		<div class="seller_heading">
				<h1 style="margin-top: 188px;" class="sellers_pg_heading">Get to know us!</h1>
			</div>
	</div>
</div>
    
<div class="startcontent">
<img class="img_right sr_tp m_animate" src="Frontend/images/bg_1.png">
<img class="img_left m_animate" src="Frontend/images/bg_2.png">
<div class="container ">

	<div class="my_container_section">
		<div class="contact_container_wrapper col-sm-12">
			<div class="contact_left col-md-6 col-sm-12">
				
				<div class="text_contact1 col-md-12">
					<h2 class="h2_text_contact">About Us</h2>
					<p class="p_text_contact">The way to any human’s heart is through their stomach. That’s what we at Food Chapter are all about! We care, to not only tantalize your taste buds but also to make sure all the delicious goodness from Food Chapter is completely health friendly and is prepared with a touch of homely affection. 
</p><p class="p_text_contact">Experience the taste of a variety of special recipes from a long selection of our sellers who make sure to add their own flavor to traditional recipes. Select, order, customize and have your favorite foods delivered anywhere you like! </p>
					<p class="p_text_contact">We are always happy to hear from you. Get in touch and tell us what’s on your mind!</p>
					
				</div>
				<div class="text_contact2 col-md-6">
					<h2 class= "h2_text_contact rth">Phone Number</h2>
					<p class="p_text_contact"> +92-321-6000030 </p>
				</div>
				<div class="text_contact3 col-md-6"> 
					<h2 class="h2_text_contact rth">Email</h2>
					<p class="p_text_contact">info@foodchapter.pk</p>
				</div>
			</div>
			<div class="contact_right col-md-6 col-sm-12">
				<div class="wrap-contact_form">
					
					<form class="contact_form">
					<h2 class="h2_text_contact rh">Contact Us</h2>
						<div class="form_wrap" data-validate="Name is required">
							<label class="contact_label" for="name">Name</label>
							<input class="contact_input" type="text" name="name" id="txtName">
						</div>
						
						<div class="form_wrap" data-validate="Email is required">
							<label class="contact_label" for="name">Email</label>
							<input class="contact_input" type="email" name="email" id="txtEmail">
						</div>
						
						<div class="form_wrap" data-validate="Email is required">
							<label for="subject" class="contact_label" >Subject</label>
							<textarea class="contact_input" name="subject" style="height:130px" id="txtMsg"></textarea>
						</div>
						
						<button class="contact" id="btnSend">Send</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</asp:Content>
