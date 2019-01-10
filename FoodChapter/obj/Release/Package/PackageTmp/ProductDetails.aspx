<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="productDetails.aspx.cs" Inherits="FoodChapter.productDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script>
     var maxTime = 0, total = 0, vendorId = -1;
        $(document).ready(function () {
            var productId = '<%= FoodChapter.SessionManager.GetViewProductSession() %>';
            
          //HARD CODED 
          var categoryId=3;
          var vendorId = 9;

          window.onload = function () {
            $.ajax({
              url: '/api/Product/TopRelatedProducts',
              type: 'Get',
              contentType: 'application/json',
              data: { 'categoryId': categoryId },
              dataType: 'json',
              statusCode: {
                200: function (data) {
                  var json1 = JSON.parse(data);
                  for (var i = 0; i < json1.PRODUCTS.length; i++) {
                    var url = json1.PRODUCTS[i].PRODUCT_PHOTO;
                    $("#filter-masonry-foods").append('<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12"><img id="foodsImage' + json1.PRODUCTS[i].PRODUCT_ID + '" src=""' + url + '" class="my_gallery"><h3>' + json1.PRODUCTS[i].NAME + '</h3><span>' + 'Rs ' + json1.PRODUCTS[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);" onclick="addToCart(' + json1.PRODUCTS[i].PRODUCT_ID + ')"><button class="gallery">Add to Cart</button>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');
                    $("#foodsImage" + json1.PRODUCTS[i].PRODUCT_ID).attr("src", url);
                  }
                

                },

                500: function () {

                }

              },

              jsonp: 'jsonp'

            });

            $.ajax({

              url: '/api/Product/TopRelatedCakes',

              type: 'Get',

              contentType: 'application/json',
              data :{'categoryId':categoryId},
              dataType: 'json',
             
              statusCode: {

                200: function (data) {

                  var json1 = JSON.parse(data);

                  debugger;

                  //alert(json1.PRODUCTS.length);

                  for (var i = 0; i < json1.CAKES.length; i++) {

                    //alert(i);    

                    var url = json1.CAKES[i].CAKE_PHOTO;

                    $("#filter-masonry-cakes").append('<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12"><img id="cakesImage' + json1.CAKES[i].CAKE_ID + '"src=""' + url + '" class="my_gallery"> <h3>' + json1.CAKES[i].NAME + '</h3><span>' + 'Rs ' + json1.CAKES[i].PRICE + '</span><div class="gallery_overlay"><a class="sm-btn1" href="javascript:void(0);" onclick="addCakeToCart(' + json1.CAKES[i].CAKE_ID + ')"><button class="gallery">Add to Cart</button>   <span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar checked"></span><span class="fa fa-star gallerystar "></span><span class="fa fa-star gallerystar "></span></a></div></div>');

                    $("#cakesImage" + json1.CAKES[i].CAKE_ID).attr("src", url);

                  }

               

                },

                500: function () {

                }

              },

              jsonp: 'jsonp'

            });

            debugger;
            $.ajax({

              url: '/api/Product/SearchProductByProductId',
              type: 'Get',
              contentType: 'application/json',
              dataType: 'json',
              data: {'productId': productId},
              statusCode: {
                200: function (data) {
                  var json1 = JSON.parse(data);
                  var flag = 0;
                    for (var i = 0; i < json1.PRODUCT.length; i++) {
                        flag = 1;
                        var imrUrl = json1.PRODUCT[0].PRODUCT_PHOTO;
                        document.getElementById("cakeDetailImage").src = "" + imrUrl;
                        document.getElementById('PName').innerText = json1.PRODUCT[i].NAME;
                        document.getElementById('Price').innerText = 'RS:'+ json1.PRODUCT[i].PRICE;
                        document.getElementById('desc').innerText = json1.PRODUCT[i].DESCRIPTION;
                        document.getElementById('time').innerText = json1.PRODUCT[i].TIME_REQUIRED+'min';
                        document.getElementById('serves').innerText = json1.PRODUCT[i].SERVES;
                        //HIDE CAKE DETAILS DIV
                        $("#cakesspecs").hide();
                        $("#serves").show();
                    }
                    if(flag == 0)
                    {
                        $("#cakesspecs").show();
                        $("#serves").hide();
                        $.ajax({
                            url: '/api/Product/SearchCakeByCakeId',
                            type: 'Get',
                            contentType: 'application/json',
                            dataType: 'json',
                            data: { 'cakeId': productId },
                            statusCode: {
                                200: function (data) {
                                    var json1 = JSON.parse(data);
                                    console.log(data);
                                    subCatagoryId = 0;//json1.PRODUCT[0].PRODUCT_SUB_CATEGORY_ID;
                                    var name = json1.CAKE[0].NAME;
                                    //var description = document.getElementById('txtDesc').value;
                                    var timeReq = json1.CAKE[0].ESTIMATED_TIME;
                                    var vendorId = json1.CAKE[0].VENDOR_ID;
                                    var price = json1.CAKE[0].PRICE;

                                    var imrUrl = json1.CAKE[0].CAKE_PHOTO;
                                    document.getElementById("cakeDetailImage").src = "" + imrUrl;

                                    document.getElementById("PName").innerHTML = json1.CAKE[0].NAME;
                                    document.getElementById("cakeWeight").innerHTML = json1.CAKE[0].MIN_WEIGHT + " Pounds";
                                    document.getElementById("maxweight").innerHTML = json1.CAKE[0].MAX_WEIGHT + " Pounds";
                                    //document.getElementById("cakeTiers").innerHTML=json1.CAKE[0].MIN_TIERS +"-"+  json1.CAKE[0].MAX_TIERS;           
                                    document.getElementById("Price").innerHTML = "Rs:" + json1.CAKE[0].PRICE;
                                    document.getElementById("desc").innerHTML = json1.CAKE[0].DESCRIPTION;
                                    document.getElementById("mintier").innerHTML = json1.CAKE[0].MIN_TIERS;
                                    document.getElementById("maxtier").innerHTML = json1.CAKE[0].MAX_TIERS;
                                    document.getElementById("tierprice").innerHTML = "RS:" + json1.CAKE[0].ADDITIONAL_COST;
                                    //document.getElementById("cakeVendorId").innerHTML = json1.CAKE[0].VENDOR_ID;

                                    document.getElementById("time").innerHTML = json1.CAKE[0].ESTIMATED_TIME + " Hours";



                                },
                                500: function () {
                                }

                            },
                            jsonp: 'jsonp'

                        });
                    }
                    
              
                   
                },
                500: function () {
                }

              },
              jsonp: 'jsonp'

            });
               
         
          }

     
        });
       
       function showCakes() {

         var x = document.getElementById("filter-masonry");

         x.style.display = 'none';

         var x = document.getElementById("filter-masonry-cakes");

         x.style.display = 'block';

         var x = document.getElementById("filter-masonry-foods");

         x.style.display = 'none';

         var x = document.getElementById("filter-masonry-desserts");

         x.style.display = 'none';

         var x = document.getElementById("filter-masonry-frozen");

         x.style.display = 'none';



       }
       function showFoods() {
         var x = document.getElementById("filter-masonry");
         x.style.display = 'none';
         var x = document.getElementById("filter-masonry-cakes");
         x.style.display = 'none';
         var x = document.getElementById("filter-masonry-foods");
         x.style.display = 'block';
         var x = document.getElementById("filter-masonry-desserts");
         x.style.display = 'none';
         var x = document.getElementById("filter-masonry-frozen");
         x.style.display = 'none';


       }
       function navigateToSelect(vendorId) {
           debugger;
           $.ajax({
               url: '/api/Vendors/SetViewVendorSession',
               type: 'GET',
               contentType: 'application/json',
               dataType: 'json',
               data: { 'vendorId': vendorId },
               statusCode: {
                   200: function () {
                       window.location = '11_SelectCake.aspx';
                   },
                   500: function () {
                       alert('Error occured. Vendor not available');
                   }
               },
               jsonp: 'jsonp'

           });

       }
       
    </script>
    <style>
        .container-fluid1 {
            margin: 0 auto;
            float: none;
            margin-top: 30px;
        }

        .navbar-inverse {
            background-color: transparent;
            border: none;
        }

            .navbar-inverse .navbar-nav > .active > a, .navbar-inverse .navbar-nav > .active > a:focus, .navbar-inverse .navbar-nav > .active > a:hover {
                background-color: transparent;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="gallery_pg_header_bg_gallery">


        <div class="gallery_bg fade1">
            <div class="seller_heading">
                
                <h1 style="margin-top: 188px;" class="sellers_pg_heading">Product Details</h1>
            </div>
        </div>
    </div>
  <div class="startcontent">
<img class="img_right sr_tp m_animate" src="Frontend/images/sellers_bg5.png">
<img class="img_profile_lside m_animate" src="Frontend/images/sellers_bg2.png">
	<div class="container">
		
		<div class="pd_wrapper col-md-12">
			<div class="product_img  col-md-6">
				<div class="p_img">
					<img id="cakeDetailImage" src="">
				</div>
				<div class="p_thumbnail">
					<img src="Frontend/images/product-thumbnail.png">
					<img src="Frontend/images/product-thumbnail.png">
					<img src="Frontend/images/product-thumbnail.png">
				</div>
				
			</div>
			<div class="p_desc col-md-6">
				<h1 class="p_head" id="PName"></h1>
				<h1 class="p_price" id="Price"></h1>
				<div class="p_rating">
					<span class="fa fa-star checked hm_fa_star"></span>								
					<span class="fa fa-star checked hm_fa_star"></span>
					<span class="fa fa-star checked hm_fa_star"></span>
					<span class="fa fa-star hm_fa_star"></span>
					<span class="fa fa-star hm_fa_star"></span>
				</div>
				<div class="desc_text" >
					<p id="desc"></p>
				</div>
				
				<div class="p_quantity col-md-2" style="height:100px;">
                    <input type="text" name="name" value="1" class="quantity_input">
    				<button class="minus-btn" type="button" name="button">
    					<img src="Frontend/images/minus.png" alt="" class="minus_img">
    				</button>	
    				<button class="plus-btn" type="button" name="button">
    					<img src="Frontend/images/plus.png" alt="" class="plus_img">
    				</button>
                </div>
				<div class="p_addtocart">
				<button onclick="addToCart()">Add to Cart</button>
				</div>
				
				<div class="p_tags">
					<h4 class="p_tags_txt">Serving: <span id="serves"></span></h4>
					<h4 class="p_tags_txt">Category: <span> Cakes</span></h4>
					<h4 class="p_tags_txt">Time required for preparation: <span id="time"></span></h4>
					<h4 class="p_tags_txt">Vendor: <span> John Doe</span></h4>
				</div>
			</div>
			<div class="product_customize" id="cakesspecs">
				<div class="p_tags1">
					<h4 class="p_tags_txt col-md-4" >Min Weight: <span id="cakeWeight"></span></h4>
					<h4 class="p_tags_txt col-md-6">Max Weight: <span id="maxweight"></span></h4>
					<h4 class="p_tags_txt col-md-4" >Min Tier: <span id="mintier"> </span></h4>
					<h4 class="p_tags_txt col-md-6" >Max Tier: <span id="maxtier"></span></h4>
					<h4 class="p_tags_txt col-md-6" >Additional: <span id="tierprice"></span></h4>
				</div>
				<div class="c_btn_wrap col-md-12 col-sm-12">
						<a href="javascript:void(0);" onclick="navigateToSelect(vendorId)">
                            <button>
                                <img src="Frontend/images/customize_btn.png" style="width: 100%;" />

                            </button>
                        </a>
					</div>
			</div>
			</div>
			
			<div class="related_products">
					<h1 class="prelated_head col-md-12">Related Products</h1>	
           <div class=" row">
              <div id="filter-masonry" class="products-grid-list">
              </div>
              <div id="filter-masonry-foods" class="filter-masonry-foods">
              </div>
              <div id="filter-masonry-cakes" class="products-grid-list-cakes">
              </div>
              <div id="filter-masonry-desserts" class="products-grid-list-desserts">
              </div>
              <div id="filter-masonry-frozen" class="products-grid-list-frozen">
              </div>
            </div>
			<%--	<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12">
							<img src="Frontend/images/gallery_1.png" class="my_gallery">
							
							<h3>Lorium Ipsum</h3>
							<span>Rs 50</span>
							<div class="hm_gallery_overlay">
								<button class="gallery">Add to cart</button>
							</div>
						</div>
						<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12">
							<img src="Frontend/images/gallery_2.png" class="my_gallery">
							
							<h3>Lorium Ipsum</h3>
							<span>Rs 50</span>
							<div class="hm_gallery_overlay">
								<button class="gallery">Add to cart</button>
							</div>
						</div>
						<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12">
							<img src="Frontend/images/gallery_3.png" class="my_gallery">
							
							<h3>Lorium Ipsum</h3>
							<span>Rs 50</span>
							<div class="hm_gallery_overlay">
								<button class="gallery">Add to cart</button>
							</div>
						</div>
						<div class="my_gallery_row col-lg-3 col-md-3 col-sm-12">
							<img src="Frontend/images/gallery_4.png" class="my_gallery">
							
							<h3>Lorium Ipsum</h3>
							<span>Rs 50</span>
							<div class="hm_gallery_overlay">
								<button class="gallery">Add to cart</button>
							</div>
						</div>
					</div>--%>
		</div>
		<img class="img_profile_rside m_animate" src="Frontend/images/sellers_bg3.png">
		
	</div>
	</div>
  <div class="container">
        <div class="modal fade" id="myModal" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title rmodal_head">Added to Cart!
                        
                        </h4>
                    </div>
                    <div class="modal-body  modal-body2">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-9 col-md-offset-2" style="margin-bottom:10px;">
                                    
									<a href="5_cart.aspx"><button class="rmodal_btn rm_1" style="width: 45%;">Go to Cart</button></a>
                  <a href="2_gallery.aspx"><button class="rmodal_btn style="float: right;" id="btnHungry">Still Hungry!</button></a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
