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
  <script>
    $(document).ready(function () {

     
      $('#stars li').on('mouseover', function () {
        var onStar = parseInt($(this).data('value'), 10);

        $(this).parent().children('li.star').each(function (e) {
          if (e < onStar) {
            $(this).addClass('hover');
          }
          else {
            $(this).removeClass('hover');
          }
        });

      }).on('mouseout', function () {
        $(this).parent().children('li.star').each(function (e) {
          $(this).removeClass('hover');
        });
      });


      /* 2. Action to perform on click */
      $('#stars li').on('click', function () {
        var onStar = parseInt($(this).data('value'), 10); // The star currently selected
        var stars = $(this).parent().children('li.star');

        for (i = 0; i < stars.length; i++) {
          $(stars[i]).removeClass('selected');
        }

        for (i = 0; i < onStar; i++) {
          $(stars[i]).addClass('selected');
        }

        // JUST RESPONSE (Not needed)
        var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
        var msg = "";
        if (ratingValue > 1) {
          msg = "Thanks! You rated this " + ratingValue + " stars.";
        }
        else {
          msg = "We will improve ourselves. You rated this " + ratingValue + " stars.";
        }
        responseMessage(msg);

      });


    });


    function responseMessage(msg) {
      $('.success-box').fadeIn(200);
      $('.success-box div.text-message').html("<span>" + msg + "</span>");
    }
  </script>

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
                <a href="Home.aspx">
                    <button class="cbtn_submit">Go to Home</button></a>
            </div>
        </div>
    </div>
  


<section class='rating-widget'>
  
  <!-- Rating Stars Box -->
  <div class='rating-stars text-center'>
    <ul id='stars'>
      <li class='star' title='Poor' data-value='1'>
        <i class='fa fa-star fa-fw'></i>
      </li>
      <li class='star' title='Fair' data-value='2'>
        <i class='fa fa-star fa-fw'></i>
      </li>
      <li class='star' title='Good' data-value='3'>
        <i class='fa fa-star fa-fw'></i>
      </li>
      <li class='star' title='Excellent' data-value='4'>
        <i class='fa fa-star fa-fw'></i>
      </li>
      <li class='star' title='WOW!!!' data-value='5'>
        <i class='fa fa-star fa-fw'></i>
      </li>
    </ul>
  </div>
  
  <div class='success-box'>
    <div class='clearfix'></div>
    <i class="fa fa-check"></i>
 
    <div class='text-message'></div>
    <div class='clearfix'></div>
  </div>
  
  
  
</section>



</asp:Content>
