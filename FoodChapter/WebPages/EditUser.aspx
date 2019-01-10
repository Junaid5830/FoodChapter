<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="FoodChapter.WebPages.EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Food Chapter | Coming Soon</title>
     <!--REQUIRED STYLE SHEETS-->
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="../Assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLE CSS -->
    <link href="../Assets/newstyle/css/font-awesome.min.css" rel="stylesheet" />
    <!-- VEGAS STYLE CSS -->
    <link href="../Assets/newstyle/scripts/vegas/jquery.vegas.min.css" rel="stylesheet" />
       <!-- CUSTOM STYLE CSS -->
    <link href="../Assets/newstyle/css/style.css" rel="stylesheet" />
     <!-- GOOGLE FONT -->
     <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
     <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="../Assets/css/custom.css">
    <link rel="stylesheet" href="../Assets/css/vendor.css">

    <!-- Scripts Run through here -->
     <script src="../Scripts/jquery-1.8.2.intellisense.js"></script>
    <script src="../Scripts/jquery-ui-1.8.24.min.js"></script>
    <script src="../Scripts/jquery-1.8.2.js"></script>
    <script src="../Scripts/jquery-1.8.2.min.js"></script>
    <script src="../Scripts/jquery-ui-1.8.24.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="../Assets/js/vendor/jquery-3.2.1.js"></script>
    <script src="../Assets/js/vendor/jquery-3.2.1.min.js"></script>
    <script src="../Assets/js/vendor/jquery.js"></script>

    <script>
    
        var userId = 2;
        window.onload = function () {
            userId = window.location.href.split("=")[1];
            $.ajax({
                //url: '/api/Vendors/GetAllVendors',
                url: '/api/User/GetUserById',
                type: 'Get',
                contentType: 'application/json',
                dataType: 'json',
                data: { 'userId': userId },
                //data: JSON.stringify(),
                statusCode: {
                    200: function (data) {
                        var json1 = JSON.parse(data);
                        debugger;
                        for (var i = 0; i < json1.USERS.length; i++) {
                            document.getElementById("txtUserName").value = json1.USERS[i].NAME;
                            document.getElementById('txtUserEmail').value = json1.USERS[i].EMAIL;
                            document.getElementById("txtUserMobile").value = json1.USERS[i].PHONE;
                            document.getElementById('txtUserPassword').value = json1.USERS[i].PASSWORD;
                        }

                        
                        //debugger;
                    },
                    500: function () {
                    }


                },

                jsonp: 'jsonp'

            });

           
        }

        $(document).ready(function () {
            $('#formSaveUser').submit(function () {
                funSaveUser();
                return false;
            });

        });

        function funSaveUser() {
            debugger;
            var name = document.getElementById("txtUserName").value;
            var email = document.getElementById('txtUserEmail').value;
            var mobile = document.getElementById("txtUserMobile").value;
            var password = document.getElementById('txtUserPassword').value;

            var user = {
                "USER_ID": userId,
                "NAME": name,
                "EMAIL": email,
                "PHONE": mobile,
                "PASSWORD": password
            };
            debugger;


            $.ajax({
                url: '/api/User/updateUser',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(user),
                statusCode: {
                    200: function () {
                        clearUser();
                        alert('User updated Succesfully');

                    },
                    500: function () {
                        alert('Error occured. User not updated');
                    }


                },

                jsonp: 'jsonp'

            });
        }

        function clearUser() {
            document.getElementById("txtUserName").value = "";
            document.getElementById("txtUserEmail").value = "";
            document.getElementById("txtUserPassword").value = "";
            document.getElementById("txtUserMobile").value = "";
        }
    </script>
</head>
    
<body>
    <form role="form" class="form-horizontal col col-sm-4" id="formSaveUser" style="margin-left:100px; margin-top:100px;" action="#">
    <div class="form-group">
        <label for="email" >
            Name</label>
                                        
                <input type="text" class="form-control" id="txtUserName" placeholder="Name" required="required" />
                                           
                                        
    </div>
    <div class="form-group">
        <label for="email" >
            Email</label>
            <input type="email" class="form-control" id="txtUserEmail" placeholder="Email"  required="required" />
    </div>
    <div class="form-group">
        <label for="mobile">
            Mobile</label>
            <input class="form-control" type="text" pattern="[0-9]{11}" title="11 or more digit contact number" id="txtUserMobile" placeholder="Mobile" required="required" />
    </div>
    <div class="form-group">
        <label for="password" >
            Password</label>
            <input type="password" class="form-control" id="txtUserPassword" placeholder="Password" required="required" />
    </div>

         <button type="submit" class="btn btn-primary btn-sm" >
                Save</button> 

        
    </form>
</body>
</html>