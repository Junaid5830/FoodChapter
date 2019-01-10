<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="10_checkout.aspx.cs" Inherits="FoodChapter._10_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px white inset;
        }
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
    <script>

        

        $(document).ready(function () {

            Storage.prototype.setObj = function (key, obj) {
                key = 'fc' + key;
                return this.setItem(key, JSON.stringify(obj))
            };

            Storage.prototype.getObj = function (key) {
                key = 'fc' + key;
                return JSON.parse(this.getItem(key))
            };

            //1. get user session and load details.
            var isCustomer = 0, total = 0;
            var userId = '<%= int.Parse(FoodChapter.SessionManager.GetUserSession()) %>';
            if (parseInt(userId) > 0) {
                loadUserData(userId);
                isCustomer = 1;
            }

            //2. load cart bill detail
            calculateTotal(total);


            //3. Place order button and order management
            //register customer if not
            
            //create order
            //customer_id,Greetings,amount,shipping,discount, total_bill, email, contact,address
            //then order details
            //order id,vendor id, item_id,item_type,qty,is_delv,is_rej,rej_Reason,discount



              $('#formPlaceOrder').click(function () {
                var frmSubmit = true;
                var message = '';
                var txtName = $('#txtName');
                var txtEmail = $('#txtEmail');
                var txtMob = $('#txtMob');
                var txtAddress = $('#txtAddress');
                if (txtName.val() === '') {
                  frmSubmit = false;
                  message += 'Name is required!<br>';
                }
                if (txtEmail.val() === '') {
                  frmSubmit = false;
                  message += 'Email is required!<br>';
                }
                if (txtMob.val() === '') {
                  frmSubmit = false;
                  message += 'Mobile is required!<br>';
                }
                if (txtAddress.val() === '') {
                  frmSubmit = false;
                  message += 'Address is required!<br>';
                }
                if (frmSubmit) {
                    funPlaceOrder(isCustomer, userId);
                } else {
                  $('#divModel').html(message);
                  $('#myregistration').modal('show');
                }
                return false;
            });


            

        });

        function loadUserData(userId) {
            $.ajax({
                url: '/api/User/GetUserById',
                type: 'Get',
                contentType: 'application/json',
                data: { "userId": parseInt(userId) },
                dataType: 'json',
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        $('#txtName').val(json1.USERS[0].NAME);
                        $('#txtEmail').val(json1.USERS[0].EMAIL);
                        $('#txtMob').val(json1.USERS[0].PHONE);

                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function funPlaceOrder(isCustomer, userId) {
            if (getCartCount() == 0) {
                //add modal with message and then redirect it too gallery
                window.location = '2_gallery.aspx';

            }
            else
                funSaveOrderDetail(isCustomer, userId);
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

        function fcStartIndex() {
            for (var i = 1; i <= localStorage.length; i++) {
                var sessionProduct = JSON.parse(localStorage.getObj(i));
                if (sessionProduct != null) {
                    return i;
                }
            }
        }

        function clearOrder() {
            document.getElementById("txtName").value = "";
            document.getElementById('txtMob').value = "";
            document.getElementById("txtEmail").value = "";
            document.getElementById('txtAddress').value = "";
        }

        function sendOrderEmail(OrderId)
        {
            // add more details such as shipping charges,discount
            debugger;
            var payment = document.getElementById("finalTotal").innerHTML;
            var orderDate = new Date();
            var email = document.getElementById("txtEmail").value;
            $.ajax({
                url: '/api/Order/SendEmailToUser',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'emailData': email + '|' + OrderId + '|' + payment + '|' + orderDate },
                statusCode: {
                    200: function () {
                        clearOrder();
                        window.location = 'thankyou.aspx';

                    },
                    500: function () {
                    }
                },
                jsonp: 'jsonp'
            });
        }

        function saveCakeDetail(cakeDetailList, OrderId)
        {
            $.ajax({
                url: '/api/Product/SaveCakeCustomizeDetail',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: cakeDetailList,
                statusCode: {
                    200: function () {

                        localStorage.clear();
                        //session set for thank you page

                        $.ajax({
                            url: '/api/Order/SetOrderSession',
                            type: 'Get',
                            contentType: 'application/json',
                            dataType: 'json',
                            data: { 'orderId': OrderId },
                            statusCode: {
                                200: function () {
                                    var payment = document.getElementById("finalTotal").innerHTML;

                                    $.ajax({
                                        url: '/api/Order/SetOrderPaymentSession',
                                        type: 'Get',
                                        contentType: 'application/json',
                                        dataType: 'json',
                                        data: { 'payment': payment },
                                        statusCode: {
                                            200: function () {
                                                var orderDate = new Date();
                                                $.ajax({
                                                    url: '/api/Order/SetOrderPaymentDate',
                                                    type: 'Get',
                                                    contentType: 'application/json',
                                                    dataType: 'json',
                                                    data: { 'orderDate': orderDate },
                                                    statusCode: {
                                                        200: function () {
                                                            //send notification
                                                            clearOrder();
                                                            sendOrderEmail(OrderId);
                                                            
                                                            


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
                                },
                                500: function () {
                                }
                            },
                            jsonp: 'jsonp'
                        });


                    },
                    500: function () {
                        // <"FC msgs> //Error occured. Order is not saved
                    }
                },
                jsonp: 'jsonp'
            });

        }

        function funSaveOrderDetail(isCustomer, userId) {
            //check if user credentials exist or not also check if user is logged in or not


            //order fields to be populated from here
            //customer_id,Greetings,amount,shipping,discount, total_bill, email, contact,address
            var orderDetails = {
                orderItems: []
            };
            debugger;
            var customerId = 0;
            if (isCustomer > 0)
            {
                customerId = userId;
            }
            var order = {
                "CUSTOMER_NAME": $('#txtName').val(),
                "CUSTOMER_ID": customerId,
                "GREETINGS": $('#subject').val(),
                "EMAIL": $('#txtEmail').val(),
                "CONTACT_NO": $('#txtMob').val(),
                "ADDRESS": $('#txtAddress').val(),
                "TOTAL_AMOUNT": parseFloat($('#subTotal').html()),
                "TOTAL_DISCOUNT": 0.0,// add field later
                "SHIPPING_CHARGES": parseFloat($('#shipping').html()),
                "FINAL_BILL": parseFloat($('#finalTotal').html())
            };

            var fcIndex = fcStartIndex();

            $.ajax({
                url: '/api/Order/SaveOrder',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(order),
                statusCode: {
                    200: function (response) {
                        var OrderId = parseInt(response);
                        var orderDetail = [];
                        var cakeDetail = [];
                        var detailCount = 0;


                        for (var i = fcIndex; i <= localStorage.length; i++) {
                            var tempObj = JSON.parse(localStorage.getObj(i));
                            if (tempObj != null) {
                                var product = {
                                    "ITEM_ID": tempObj.PRODUCT_ID,
                                    "VENDOR_ID": tempObj.VENDOR_ID,
                                    "ORDER_ID": OrderId,
                                    "QUANTITY": tempObj.QTY,
                                    "ITEM_TYPE": tempObj.PRODUCT_SUB_CATEGORY_ID,
                                    //"CAKE_FLAVOR_ID": tempObj.CAKE_FLAVOR_ID,
                                    //"TIERS_COUNT": tempObj.TIERS_COUNT,
                                    //"SIZE": tempObj.SIZE,
                                    //"GREETINGS": tempObj.GREETINGS,
                                    //"IS_CUSTOMIZE": tempObj.IS_CUSTOMIZE
                                };
                                orderDetail[i - fcIndex] = product;
                                debugger;

                                //store cake customization detaol
                                if (tempObj.IS_CUSTOMIZE == 1) {
                                    var cakeDetailObj = tempObj.CAKE_CUSTOMIZE_DETAIL;
                                    for (var k = 0; k < cakeDetailObj.length; k++) {
                                        var customDetail = {
                                            "CAKE_ID": tempObj.PRODUCT_ID,
                                            "ORDER_ID": OrderId,
                                            "CAKE_FLAVOUR_ID": cakeDetailObj[k].CAKE_FALVOUR_ID,
                                            "TIER_ORDER": cakeDetailObj[k].TIER_ORDER,
                                            "TIER_WEIGHT": cakeDetailObj[k].TIER_WEIGHT,
                                            "FLAVOUR_PRICE": cakeDetailObj[k].FLAVOUR_PRICE
                                        };
                                        cakeDetail[detailCount] = customDetail;
                                        detailCount++;
                                    }

                                }


                            }
                        }

                        var productListJson = JSON.stringify(orderDetail); // order products
                        var cakeDetailList = JSON.stringify(cakeDetail); //  save Customization of cake 

                        $.ajax({
                            url: '/api/Order/SaveOrderDetail',
                            type: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            data: productListJson,
                            statusCode: {
                                200: function () {
                                    
                                    debugger;
                                    saveCakeDetail(cakeDetailList,OrderId);

                                },
                                500: function () {
                                  // <"FC msgs> //Error occured. Order is not saved
                                  $('#myregistration').modal('show');
                                  document.getElementById('divModel').innerHTML = "Error occured. Order is not saved";
                                  document.getElementById('divModel').style.color = "#780103";
                                }
                            },

                            jsonp: 'jsonp'

                        });

                        


                        
                    },
                    500: function (response) {
                        // <"FC msgs> //Error occured. Order is not saved
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
                <h1 style="margin-top: 185px;" class="sellers_pg_heading">Checkout</h1>
            </div>

        </div>
    </div>

  <div class="startcontent">
<img class="img_right sr_tp m_animate" src="Frontend/images/bg_1.png"/>
<img class="img_left m_animate" src="Frontend/images/bg_2.png"/>
    <div class="container ">
        <div class="checkout_wrap">
            <div class="checkout_left col-md-6 col-sm-12">
                <div class="wrapcheckout_form">

                    <div class="col-md-12">
                        <h2 class="checkout_heading">Billing Details</h2>
                    </div>

                    <div class="checkout_form_wrap col-md-12" data-validate="Name is required">
                        <input class="checkout_input" type="text" name="txtName" id="txtName" placeholder="FIRST NAME" />
                        <span class="login_placeholder" data-placeholder="FIRST NAME"></span>
                    </div>
                    <div class="checkout_form_wrap col-md-12" data-validate="Email is required">
                        <input class="checkout_input" type="text" name="txtEmail" id="txtEmail" placeholder="EMAIL" />
                        <span class="login_placeholder" data-placeholder="EMAIL"></span>
                    </div>

                    <div class="checkout_form_wrap col-md-12" data-validate="Mobile is required">
                        <input class="checkout_input" type="text" name="txtMob" id="txtMob" placeholder="MOBILE NUMBER" />
                        <span class="login_placeholder" data-placeholder="MOBILE NUMBER"></span>
                    </div>

                    <div class="checkout_form_wrap col-md-12" data-validate="Street Address is required">
                        <textarea class="login_placeholder login_input" id="txtAddress" name="txtAddress" placeholder="ADDRESS" style="height: 100px;    border: 0; border-bottom: 1px dashed #b9abab; width: 100%; "></textarea>
                    </div>



                </div>
                <div class="cart_total col-md-12">
                    <div class="cart_total_wrap">
                        <h2 class="cart_head">Cart Total</h2>
                        <p class="sub_total_head">Sub Total</p>
                        <span class="sub_total_price">Rs. </span><span class="sub_total_price" id="subTotal"></span>
                        <hr class="total_hr" />
                    </div>
                </div>

                <div class="shipping col-md-12">
                    <div class="shipping_wrap ">
                        <p class="sub_total_head">Shipping</p>
                        <span class="sub_total_price">Rs. </span><span class="sub_total_price" id="shipping">200</span>
                        <hr class="total_hr" />
                    </div>
                </div>

                <div class="shipping col-md-12">
                    <div class="shipping_wrap ">
                        <p class="left_total_head">Total</p>
                        <span class="sb_total">Rs. </span><span class="sb_total" id="finalTotal"></span>
                        <hr class="total_hr" />
                    </div>
                </div>
				<label style="font-size:18px;" class="col-md-12" ><i>*Payment method is Cash on Delivery</i></label>
                <div class="proceed_btn_wrap col-md-12">
                    <div class="">
                        <button id="formPlaceOrder" class="cbtn_submit">SUBMIT</button>
                    </div>
                </div>
            </div>
            <div class="checkout_right col-md-6 col-sm-12">
                <div class="checkout_right_wrap">
                    <div class="ccadd col-md-12">
                        <h2 class="checkout_heading">Additional Information</h2>
                    </div>
                    <div class="co_add">
                        <div class="checkout_form_wrap col-md-12" data-validate="Note is optional">
                            <textarea class="login_placeholder login_input" id="subject" name="ORDER NOTES" placeholder="ORDER NOTES" style="height: 100px"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<img class="img_right  bottom sr_tp m_animate"  src="Frontend/images/bg_3.png"/>
</div>
       <div class="container">
        <div class="modal fade" id="myregistration" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" style="width:400px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="divModel" style="text-align: center; color:#780103; font-size:35px;">
                        
                        </h4>
                    </div>

                </div>
            </div>
        </div>
</div>
</asp:Content>
