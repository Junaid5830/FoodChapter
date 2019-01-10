<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="FoodChapter.Views.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title></title>
    <script src="../../Scripts/jquery-1.8.2.intellisense.js"></script>
    <script src="../../Scripts/jquery-1.8.2.js"></script>
    <script src="../../Scripts/jquery.unobtrusive-ajax.js"></script>
    <script src="../../Scripts/jquery.validate-vsdoc.js"></script>
    <script>
        $(document).ready(function () {

            alert("hi");
            //        $.ajax({
    //            url: "http://localhost:49493/api/Values",
    //            type: "Get",
    //            success: function (data) { 
    //                for (var i = 0; i < data.length; i++) {
    //                    $("
    //<tr></tr>

    //<td></td>
    //" + data[i].Name + "</td>
    //<td></td>
    //                    " + data[i].Address + "</td>
    //                    <td></td>
    //                    " + data[i].DOB + "</td></tr>").appendTo("#tbPerson");                   
    //                }
    //            },
    //            error: function (msg) { alert(msg); }
    //        });
        });   
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    hi i am ahsan
    </div>
    </form>
</body>
</html>
