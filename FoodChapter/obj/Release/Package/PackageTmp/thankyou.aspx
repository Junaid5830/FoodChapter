<%@ Page MasterPageFile="~/Layout.Master" Language="C#" AutoEventWireup="true" CodeBehind="thankyou.aspx.cs" Inherits="FoodChapter.WebPages.thankyou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .navbar-inverse {
            background-color: transparent;
            border: none;
        }

            .navbar-inverse .navbar-nav > .active > a, .navbar-inverse .navbar-nav > .active > a:focus, .navbar-inverse .navbar-nav > .active > a:hover {
                background-color: transparent;
            }

        .container-fluid1 {
            margin: 0 auto;
            float: none;
            margin-top: 30px;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="seller_heading">
        <h1 style="margin-top:190px;" class="sellers_pg_heading">Thank You!</h1>
    </div>

    <%--</div>
	</div>
</div>--%>

    <div class="gallery_pg_header_bg_cart">


        <div class="gallery_bg fade1">
            <!--<img src="images/Gallery_01.png" style="width:100%">-->
        </div>


    </div>
    <div class="ty_main">
        <img class="img_right sr_tp m_animate" src="images/bg_1.png">
        <img class="img_left m_animate" src="images/bg_2.png">

        <div class="container">
            <div class="ty_container">
                <h2 class="h_ty">Hope you enjoy the food!</h2>
                <h3 class="sb_ty">Let us know what you think. Your feedback is always welcome.</h3>
                <a href="1_home.aspx">
                    <button class="cbtn_submit">Go to Home</button></a>
            </div>
        </div>
    </div>

</asp:Content>
