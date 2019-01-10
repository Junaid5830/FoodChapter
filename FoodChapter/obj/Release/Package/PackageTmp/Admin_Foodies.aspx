<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Foodies.aspx.cs" Inherits="FoodChapter.WebPages.Admin_Foodies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script>
     function deleteCall(userId) {
         //alert(userId);
         $.ajax({
             url: '/api/User/DeleteUser',
             type: 'GET',
             contentType: 'application/json',
             dataType: 'json',
             data: { 'userId': userId },
             statusCode: {
                 200: function (data) {
           //          alert('User Deleted succesfullty');
                     location.reload();
                 },
                 500: function (data) {
             //        alert('Error occured. User not Deleted');
                 }
             },
             jsonp: 'jsonp'

         });
     }

     $(document).ready(function () {
         $.ajax({
             url: '/api/User/GetAllUsers',
             type: 'Get',
             contentType: 'application/json',
             dataType: 'json',
             statusCode: {
                 200: function (data) {
                     //alert("success");
                     var json1 = JSON.parse(data);

                     for (var i = 0; i < json1.USERS.length; i++) {
                       $("#adminFoodies").append('<tr class="odd pointer"><td> '+ (i+1) +' </td><td class=" "><a href="#">' + json1.USERS[i].NAME + '</a></td><td class=" "> ' + json1.USERS[i].EMAIL + '</td><td class=" "> ' + json1.USERS[i].PHONE + '</td><td class=""><a href="javascript:void(0);" onclick="deleteCall(' + json1.USERS[i].USER_ID + ')" onclick="return confirm( Are you sure? )"><span style="margin-left: 10px;"><i class="RemoveProduct fa fa-trash-o" style="color: red;cursor: pointer;"></i></span></a></td></tr>');
                        
                     }
                     //json1.USERS.length = 0;
                     if (json1.USERS.length == 0)
                     {
                       $("#adminFoodies").append('<tr class="odd pointer"><td style="width:25%;"></td><td style="width:50%;"><h4 style="color: red;">Sorry, there is no list available</h4></td><td style="width:25%;"></td></tr>');
                     }
                 },
                 500: function () {
                 }


             },

             jsonp: 'jsonp'

         });

     });


	</script>

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title">Admin Foodies List</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table id="adminFoodies" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Sr#</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
          </div>
          <!-- /.box-body -->
        </div>
      </div>
    </div>
  </div>
  <script>
    $(document).ready(function () {
      $('#adminFoodies').DataTable();
    });
  </script>
    

</asp:Content>
