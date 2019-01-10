<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_User.aspx.cs" Inherits="FoodChapter.Admin_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script>

     $(document).ready(function () {
       updateData();
       $('#SubmitButton').on('click', function () {
         var catInput = $('#Email');
         var catpass = $('#Password');
         if (catInput.val() !== '' || catpass.val() !== '') {
           SaveCategory();
         } else {
           alert('Please input value');
         }
       });

     });
     function deleteCall(userId) {
       alert(userId);
       $.ajax({
         url: '/api/User/DeleteAdminUser',
         type: 'GET',
         contentType: 'application/json',
         dataType: 'json',
         data: { 'userId': userId },
         statusCode: {
           200: function (data) {
             //     alert('User Deleted succesfullty');
             location.reload();
           },
           500: function (data) {
             //        alert('Error occured. User not Deleted');
           }
         },
         jsonp: 'jsonp'

       });
     }

     function updateData() {

       $.ajax({
         url: '/api/User/GetAllAdmins',
         type: 'Get',
         contentType: 'application/json',
         dataType: 'json',
         statusCode: {
           200: function (data) {
             //alert("success");
             var json1 = JSON.parse(data);
             console.log(json1);
             //debugger;
             for (var i = 0; i < json1.ADMINS.length; i++) {
               $("#adminUser").append('<tr class="odd pointer"><td>'+ (i+1) +' </td><td class=" "><a href="#">' + json1.ADMINS[i].EMAIL + '</a></td><td class=" "><a href="#">' + json1.ADMINS[i].PASSWORD + '</a></td><td class=""><a href="javascript:void(0);" onclick="deleteCall(' + json1.ADMINS[i].ADMIN_ID + ')" onclick="return confirm( Are you sure? )"><span style="margin-left: 10px;"><i class="RemoveProduct fa fa-trash-o" style="color: red;cursor: pointer;"></i></span></a></td></tr>');

             }
             //json1.USERS.length = 0;
             if (json1.ADMINS.length == 0) {
               $("#adminUser").append('<tr class="odd pointer"><td style="width:25%;"></td><td style="width:50%;"><h4 style="color: red;">Sorry, there is no list available</h4></td><td style="width:25%;"></td></tr>');
             }
           },
           500: function () {
           }


         },

         jsonp: 'jsonp'

       });
     }

     function SaveCategory() {

       debugger;

       var cat = document.getElementById('Email').value;
       var pas = document.getElementById('Password').value;
       var cake = {
         "EMAIL": cat,
         "PASSWORD": pas,
       };
       $.ajax({
         url: '/api/User/SaveAdminUser',
         type: 'POST',
         contentType: 'application/json',
         dataType: 'json',
         data: JSON.stringify(cake),
         statusCode: {
           200: function (result) {
             var newcakeId = JSON.parse(result);
             console.log(result);
             updateData();
           },
         },
         jsonp: 'jsonp'
       });
     }
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div>
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title">Admin User</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <div class="form-group">
              <form id="adminuser">
              <div class="col-md-12">
                <div class="col-md-6">
                  <label class="input-height">Email</label>
                  <input type="text" class="form-control" id="Email" required="required" />

                </div>
                <div class="col-md-6">
                  <label class="input-height">Password</label>
                  <input type="text" class="form-control" id="Password" required="required" />

                </div>
              </div>
              <div class="col-md-12">
                <div class="col-md-3 pull-right">
                  <button type="button" id="CancelButton" class="btn btn-warning pull-right">Cancel </button>
                  <button type="submit" id="SubmitButton" class="btn btn-primary pull-right" style="margin-right: 5px;">Save</button>
                </div>
              </div>
                </form>
            </div>


          </div>
        </div>
      </div>
    </div>
  </div>
  <div>
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title">Admin User List</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table id="adminUser" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Sr#</th>
                  <th>Email</th>
                   <th>Password</th>
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
      $('#adminUser').DataTable();
    });
  </script>
 
</asp:Content>
