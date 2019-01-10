<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FoodChapter.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

.navbar-inverse
{
    background-color:transparent;    border:none;
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
<script type="text/javascript">
        var maxTime = 0, total = 0, userId = 0;
        userId = '<%= int.Parse(FoodChapter.SessionManager.GetUserSession()) %>';

  $(document).ready(function () {
  
          SetCartCount();
            var userId = '<%= int.Parse(FoodChapter.SessionManager.GetUserSession()) %>';
            debugger;
            if (getCartCount() == 0)
            {
                window.location = 'Gallery.aspx';
            }
            LoadDetails();
           

            $('#checkoutBtn').click(function () {

            var userId = '<%= int.Parse(FoodChapter.SessionManager.GetUserSession()) %>';
            debugger;
            if (getCartCount() == 0)
            {
                window.location = 'Gallery.aspx';
            }

            });

       
            $('.minus-btn').on('click', function (e) {
                debugger;
                var $this = $(this);
                var $input = $this.closest('td').find('input');
                var value = parseInt($input.val());

                var $gridRowPrice = $(this).parent().parent().closest('td').next().find('span');
                //var totalgridPrice = parseFloat($gridRowPrice.text());

                var $Price = $(this).parent().parent().closest('td').prev().find('span');
                var itemPrice = parseFloat($Price.text());
                var unity = 0;
                if (value > 1) {
                    value = value - 1;
                } else {
                    value = 1;
                    unity = 1;
                }

                $input.val(value);
                $gridRowPrice.text(value * itemPrice);
                var idx = $input.attr('id');
                var index = idx.substring(4, idx.length);
                if(unity == 1)
                    changeQuantity(index, itemPrice, -1);
                else
                    changeQuantity(index, itemPrice, 0);
            });

            $('.plus-btn').on('click', function (e) {
                //e.preventDefault();
                debugger;
                var $this = $(this);
                var $input = $this.closest('td').find('input');
                var value = parseInt($input.val());

                var $gridRowPrice = $(this).parent().parent().closest('td').next().find('span');

                //var totalgridPrice = parseFloat($gridRowPrice.text());

                var $Price = $(this).parent().parent().closest('td').prev().find('span');
                var itemPrice = parseFloat($Price.text());

                if (value < 100) {
                    value = value + 1;
                } else {
                    value = 100;
                }

                $input.val(value);

                $gridRowPrice.text(value * itemPrice);

                //updating session storage
                var idx = $input.attr('id');
                var index = idx.substring(4, idx.length);
                changeQuantity(index,itemPrice,1);
            });

        });

        function LoadDetails()
        {
            $("#cartTable tbody").empty();
            
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                  debugger;
                  if (sessionProduct.IS_CAKE == 1)
                  {
                      var tableRow = "<tr class=" + " junaid" + ">" + "<td class=" + " productname" + " style =" + " width:45%;" + "><img" + " class=" + " pic" + " src= " + sessionProduct.CAKE_PHOTO + ">" + "<span> " + sessionProduct.NAME + " </span><button type=" + "button" + " class=" + "rcustomize" + " onclick=CustomizeItem(" + i + ")> Customize</button>" + "</td>"
                                                + "<td class=" + " product_price" + " style=" + " width:20%;>" + "<span>" + sessionProduct.PRICE + "</span>" + "</td>"
                                                + "<td class=" + " " + "product-quantity" + "  ><div class=" + " quantity" + "><input type=" + "text" + " class=" + "quantity_input" + " min=" + 1 + " id=" + "tbox" + i + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity(" + i + ")" + ">" + "<button class=" + "minus-btn" + " " + "type=" + "button" + " " + "name=" + "button>" + "<img src=Frontend/images/minus.png " + "class=" + " " + "minus_img>" + "</button>" + "<button class=" + "plus-btn" + " " + "type=" + "button" + " " + "name=" + "button>" + "<img src=Frontend/images/plus.png " + "class=" + " " + "minus_img>" + "</button></div></td>"

                                                //+ "<td><input type=" + "number" + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity("+i+")" + "></td>"
                                                //+ "<td>" + sessionProduct.QTY + "</td>"
                                              //  + "<td>" + sessionProduct.PRICE + "</td>"
                                                + "<td class=" + " product_price>" + "<span>" + parseInt(sessionProduct.PRICE, 10) * parseInt(sessionProduct.QTY, 10) + "</span>" + "</td>"
                                                + "<td> <button " + " class=" + "abovebtn" + " onclick=RemoveItem(" + i + ")>" + "<img src=Frontend/images/cancel.png>" + "</button> " + "</td>";

                  }
                  else
                  {
                      var tableRow = "<tr class=" + " junaid" + ">" + "<td class=" + " productname" + " style =" + " width:45%;" + "><img" + " class=" + " pic" + " src= " + sessionProduct.PRODUCT_PHOTO + ">" + "<span> " + sessionProduct.NAME + " </span>" + "</td>"
                                                + "<td class=" + " product_price" + " style=" + " width:20%;>" + "<span>" + sessionProduct.PRICE + "</span>" + "</td>"
                                                + "<td class=" + " " + "product-quantity" + "  ><div class=" + " quantity" + "><input type=" + "text" + " class=" + "quantity_input" + " min=" + 1 + " id=" + "tbox" + i + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity(" + i + ")" + ">" + "<button class=" + "minus-btn" + " " + "type=" + "button" + " " + "name=" + "button>" + "<img src=Frontend/images/minus.png " + "class=" + " " + "minus_img>" + "</button>" + "<button class=" + "plus-btn" + " " + "type=" + "button" + " " + "name=" + "button>" + "<img src=Frontend/images/plus.png " + "class=" + " " + "minus_img>" + "</button></div></td>"

                                                //+ "<td><input type=" + "number" + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity("+i+")" + "></td>"
                                                //+ "<td>" + sessionProduct.QTY + "</td>"
                                              //  + "<td>" + sessionProduct.PRICE + "</td>"
                                                + "<td class=" + " product_price>" + "<span>" + parseInt(sessionProduct.PRICE, 10) * parseInt(sessionProduct.QTY, 10) + "</span>" + "</td>"
                                                + "<td> <button " + " class=" + "abovebtn" + " onclick=RemoveItem(" + i + ")>" + "<img src=Frontend/images/cancel.png>" + "</button> " + "</td>";
                  }
                //if (sessionProduct.IS_CAKE == 1)
                //    tableRow = tableRow + "<td> <button type=" + "button" + " class=" + "abovebtn refresh_btn" + " onclick=CustomizeItem(" + i + ")> Customize</button> " + "</td>";
                //else
                //    tableRow = tableRow + "<td></td>";

                  //total = 0;
                    tableRow = tableRow + "</tr>"
                    $("table").find("tbody").append(tableRow);
                    total += parseInt(sessionProduct.PRICE, 10) * parseInt(sessionProduct.QTY, 10);
                    if (parseInt(sessionProduct.TIME_REQUIRED) > maxTime)
                        maxTime = parseInt(sessionProduct.TIME_REQUIRED);
                }
            }

            //document.getElementById("orderTime").innerHTML = maxTime;// add later
            document.getElementById("subTotal").innerHTML = total;
            document.getElementById("finalTotal").innerHTML = total + parseInt(document.getElementById("shipping").innerText);
        }

        function LoadDetailsAfterRemove() {
            $("#cartTable tbody").empty();

            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                    debugger;
                    if (sessionProduct.IS_CAKE == 1) {
                        var tableRow = "<tr class=" + " junaid" + ">" + "<td class=" + " productname" + " style =" + " width:45%;" + "><img" + " class=" + " pic" + " src= " + sessionProduct.CAKE_PHOTO + ">" + "<span> " + sessionProduct.NAME + " </span><button type=" + "button" + " class=" + "rcustomize" + " onclick=CustomizeItem(" + i + ")> Customize</button>" + "</td>"
                                                  + "<td class=" + " product_price" + " style=" + " width:20%;>" + "<span>" + sessionProduct.PRICE + "</span>" + "</td>"
                                                  + "<td class=" + " " + "product-quantity" + "  ><div class=" + " quantity" + "><input type=" + "text" + " class=" + "quantity_input" + " min=" + 1 + " id=" + "tbox" + i + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity(" + i + ")" + ">" + "<button class=" + "minus-btn" + " " + "type=" + "button" + " " + "name=" + "button>" + "<img src=Frontend/images/minus.png " + "class=" + " " + "minus_img>" + "</button>" + "<button class=" + "plus-btn" + " " + "type=" + "button" + " " + "name=" + "button>" + "<img src=Frontend/images/plus.png " + "class=" + " " + "minus_img>" + "</button></div></td>"

                                                  //+ "<td><input type=" + "number" + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity("+i+")" + "></td>"
                                                  //+ "<td>" + sessionProduct.QTY + "</td>"
                                                //  + "<td>" + sessionProduct.PRICE + "</td>"
                                                  + "<td class=" + " product_price>" + "<span>" + parseInt(sessionProduct.PRICE, 10) * parseInt(sessionProduct.QTY, 10) + "</span>" + "</td>"
                                                  + "<td> <button " + " class=" + "abovebtn" + " onclick=RemoveItem(" + i + ")>" + "<img src=Frontend/images/cancel.png>" + "</button> " + "</td>";

                    }
                    else {
                        var tableRow = "<tr class=" + " junaid" + ">" + "<td class=" + " productname" + " style =" + " width:45%;" + "><img" + " class=" + " pic" + " src= " + sessionProduct.PRODUCT_PHOTO + ">" + "<span> " + sessionProduct.NAME + " </span>" + "</td>"
                                                  + "<td class=" + " product_price" + " style=" + " width:20%;>" + "<span>" + sessionProduct.PRICE + "</span>" + "</td>"
                                                  + "<td class=" + " " + "product-quantity" + "  ><div class=" + " quantity" + "><input type=" + "text" + " class=" + "quantity_input" + " min=" + 1 + " id=" + "tbox" + i + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity(" + i + ")" + ">" + "<button class=" + "minus-btn" + " " + "type=" + "button" + " " + "name=" + "button>" + "<img src=Frontend/images/minus.png " + "class=" + " " + "minus_img>" + "</button>" + "<button class=" + "plus-btn" + " " + "type=" + "button" + " " + "name=" + "button>" + "<img src=Frontend/images/plus.png " + "class=" + " " + "minus_img>" + "</button></div></td>"

                                                  //+ "<td><input type=" + "number" + " value=" + sessionProduct.QTY + " onchange=" + "changeQuantity("+i+")" + "></td>"
                                                  //+ "<td>" + sessionProduct.QTY + "</td>"
                                                //  + "<td>" + sessionProduct.PRICE + "</td>"
                                                  + "<td class=" + " product_price>" + "<span>" + parseInt(sessionProduct.PRICE, 10) * parseInt(sessionProduct.QTY, 10) + "</span>" + "</td>"
                                                  + "<td> <button " + " class=" + "abovebtn" + " onclick=RemoveItem(" + i + ")>" + "<img src=Frontend/images/cancel.png>" + "</button> " + "</td>";
                    }
                    //if (sessionProduct.IS_CAKE == 1)
                    //    tableRow = tableRow + "<td> <button type=" + "button" + " class=" + "abovebtn refresh_btn" + " onclick=CustomizeItem(" + i + ")> Customize</button> " + "</td>";
                    //else
                    //    tableRow = tableRow + "<td></td>";

                    //total = 0;
                    tableRow = tableRow + "</tr>"
                    $("table").find("tbody").append(tableRow);
                    
                }
            }

            //document.getElementById("orderTime").innerHTML = maxTime;// add later
            
        }



        function changeQuantity(currentIndex,itemPrice,flag)
        {
            debugger;
            var fcIndex = fcStartIndex();
            var newIndex = currentIndex - fcIndex + 1;
            var tableCells = document.getElementById('cartTable').rows.item(newIndex).cells;
            
//            var updateTotal = parseInt(document.getElementById("tbox" + currentIndex).value) * parseInt($('#cartTable tr:eq(' + newIndex + ') td:eq(3)').text());
            var updateTotal =  parseInt($('#cartTable tr:eq(' + newIndex + ') td:eq(3)').text());
            //var isnum = /^\d+$/.test(updateTotal);
            //if (isnum != true) {
            //    // <"FC msgs> //Item quantity must be greater than 0.
            //    document.getElementById("tbox" + newIndex).value = 1;

            //    updateTotal = parseInt(document.getElementById("tbox" + newIndex).value) * parseInt($('#cartTable tr:eq(' + newIndex + ') td:eq(3)').text());
            //}
            
            //total -= parseInt(tableCells.item(4).innerHTML);
            //tableCells.item(4).innerHTML = updateTotal;
            //total += parseInt(tableCells.item(4).innerHTML);
            if(flag == 1)
                total += itemPrice;
            else if(flag == 0)
                total -= itemPrice;
            else
            {

            }

            document.getElementById("subTotal").innerHTML = total;
            document.getElementById("finalTotal").innerHTML = total + parseInt(document.getElementById("shipping").innerText);

            var tempObj = JSON.parse(localStorage.getObj(currentIndex));
            tempObj.QTY = parseInt(document.getElementById("tbox" + newIndex).value);
            localStorage.setObj(currentIndex, JSON.stringify(tempObj));
        }

        function CustomizeItem(customizeIndex)
        {
            var tempObj = JSON.parse(localStorage.getObj(customizeIndex));
            debugger;
            $.ajax({
                url: '/api/Product/SetProductSessionToEdit',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'productId': tempObj.PRODUCT_ID },
                statusCode: {
                    200: function () {
                        $.ajax({
                            url: '/api/Order/SetOrderIndexSession',
                            type: 'Get',
                            contentType: 'application/json',
                            dataType: 'json',
                            data: { 'orderIndex': customizeIndex },
                            statusCode: {
                              200: function () {
                                    window.location = "CustomizeCake.aspx";
                                },
                                500: function () {
                                }
                            },
                            jsonp: 'jsonp'
                        });
                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });

           

            
            win.focus();
        }

        function RemoveItem(removeIndex) {
          debugger;
         
            var fcIndex = fcStartIndex();
            var rowNum = removeIndex - fcIndex + 1;
            var tableCells = document.getElementById('cartTable').rows.item(removeIndex - fcIndex + 1).cells;
            //removeIndex++;
            //total -= parseInt(tableCells.item(3).innerHTML);
            total -= parseInt($('#cartTable tr:eq(' + rowNum + ') td:eq(3)').text());
            if (total == 0)
            {
                document.getElementById("shipping").innerHTML = 0;
                document.getElementById("finalTotal").innerHTML = 0;
            }
            else
                document.getElementById("finalTotal").innerHTML = total + parseInt(document.getElementById("shipping").innerText);
            
            document.getElementById("subTotal").innerHTML = total;
            for (var i = 1; i < localStorage.length; i++)
            {
                if (i >= removeIndex)
                {
                    var tempObj = JSON.parse(localStorage.getObj(i+1));
                    localStorage.setObj(i, JSON.stringify(tempObj));
                }
            }
            document.getElementById('cartTable').deleteRow(removeIndex - fcIndex + 1);
            localStorage.removeItem('fc' + localStorage.length);
            LoadDetailsAfterRemove();
            setTimeout(function (){ getCartCount();location.reload(); }, 0);
        }

        function fcStartIndex()
        {
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                    return i;
                }
            }
        }
        
        Storage.prototype.setObj = function (key, obj) {
            key = 'fc' + key;
            return this.setItem(key, JSON.stringify(obj))
        };

        Storage.prototype.getObj = function (key) {
            key = 'fc' + key;
            return JSON.parse(this.getItem(key))
        };
        function SetCartCount() {

          document.getElementById('cartCount').innerHTML = '<img title="" src="Frontend/images/cart.png" alt="cart" /> ' + getCartCount();

        }
        function getCartCount() {
         
            var cartCount = 0;
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                    cartCount++;
                }
            }
            return cartCount;
        }

        function calculateTotal(total) {
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {

                    total += parseInt(sessionProduct.PRICE, 10) * parseInt(sessionProduct.QTY, 10);
                    //if (parseInt(sessionProduct.TIME_REQUIRED) > maxTime)
                    //    maxTime = parseInt(sessionProduct.TIME_REQUIRED);
                }
            }
            document.getElementById("subTotal").innerHTML = total;
            document.getElementById("finalTotal").innerHTML = total + parseInt(document.getElementById("shipping").innerText);

        }
    </script>	


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="gallery_pg_header_bg_cart">
	
	
	<div class="gallery_bg fade1">
        <div class="seller_heading">
				<h1 style="margin-top: 188px;" class="sellers_pg_heading">Cart</h1>
			</div>
	</div>
</div>
   <div class="startcontent">
<img class="img_right sr_tp m_animate" src="Frontend/images/bg_1.png">
<img class="img_left m_animate" src="Frontend/images/bg_2.png">
<div class="container">
<div class="cart_pg_wrap">
    	<div class="container_section">
		
		<div class="cart_container col-md-12 col-sm-12">
			<div class="cart_wrapper col-md-12 col-sm-12">
			   
    			    <table class="cart_headings"id="cartTable">
            		    <thead>
            			<tr>
            				

            				<th class="product-name">Product</th>
            				<th class="product-price">Price</th>
            				<th class="product-quantity">Quantity</th>
            				<th class="product-subtotal">Total</th>
            				<th class="product-remove">&nbsp;</th>
            			</tr>
            	   	    </thead>
            	   	    <tbody class="cart_det">
			
			        </tbody>
            	   	 </table>
            	   
        </div>
        <div class="update_cart col-md-6">
				
					<%--<input type="text" placeholder="COUPON CODE" class="coupon_input"/>
					<button class="coupon_btn">APPLY</button>--%>
				
			</div>
			<div class="jrefresh col-md-6">
			<%--<button class="refresh_btn">REFRESH CART</button>--%>
			</div>
			<div class="cart_total col-md-12">
				<div class="cart_total_wrap">
					<h2 class="cart_head">Cart Total</h2>
					<p class="sub_total_head">Sub Total</p>
					<span class="sub_total_price" >Rs.</span><span class="sub_total_price"  id="subTotal"></span>
					<hr class="total_hr"/>
				</div>
			</div>
			
			<div class="shipping col-md-12">
				<div class="shipping_wrap ">
					<p class="sub_total_head">Shipping</p>
					<span class="sub_total_price" >Rs.</span><span class="sub_total_price"  id="shipping">200</span>
					<hr class="total_hr"/>
				</div>
			</div>
			
			<div class="shipping col-md-12">
				<div class="shipping_wrap ">
					<p class="sub_total_head">Total</p>
					<span class="sub_total_price" >Rs:</span><span class="sub_total_price"  id="finalTotal"></span>
					<hr class="total_hr"/>
				</div>
			</div>
			
			<div class="proceed_btn_wrap col-md-12">
				<div>
					<a id="checkoutBtn" href="Checkout.aspx"><button class="proceed_btn">PROCEED TO CHECKOUT</button></a>
				</div>
			</div>

    </div>
   </div> 
   </div>
  </div>

	
						
	</div>

</asp:Content>
