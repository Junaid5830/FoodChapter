<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdminInquiry.aspx.cs" Inherits="FoodChapter.AdminInquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script>
    $(document).ready(function () {
       $.ajax({
         url: '/api/User/GetAdminInquirtList',
         type: 'Get',
         contentType: 'application/json',
         dataType: 'json',
         statusCode: {
           200: function (data) {
             //alert("success");
             var json1 = JSON.parse(data);
             console.log(json1);
             //debugger;
             for (var i = 0; i < json1.INQUIRY.length; i++) {
               $("#inquiry").append('<tr class="odd pointer"><td>' + (i + 1) + ' </td><td class=" ">' + json1.INQUIRY[i].OBJECT_NAME + '</td></td><td class=" ">' + json1.INQUIRY[i].INQUIRY_TIME + '</td></td><td class=" ">' + json1.INQUIRY[i].INQUIRY_TYPE + '</td></tr>');
              
             } $("#inquiry").DataTable();
             //json1.USERS.length = 0;
             if (json1.INQUIRY.length == 0) {
               $("#inquiry").append('<tr class="odd pointer"><td style="width:25%;"></td><td style="width:50%;"><h4 style="color: red;">Sorry, there is no list available</h4></td><td style="width:25%;"></td></tr>');
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
  <div class="x_title">
    <h3>List CAKES</h3>
    <div class="clearfix"></div>
  </div>
  <div class="table-responsive">
    <table class="table table-striped jambo_table bulk_action" id="inquiry">
      <thead>
        <tr class="headings">

          <th style="display: table-cell;" class="column-title">Sr# </th>
          <th style="display: table-cell;" class="column-title">Product/Vendor </th>
          <th style="display: table-cell;" class="column-title">InquiryTime </th>
          <th style="display: table-cell;" class="column-title">InquiryType </th>

        </tr>
      </thead>

      <tbody>
      </tbody>
    </table>
  </div>
</asp:Content>
