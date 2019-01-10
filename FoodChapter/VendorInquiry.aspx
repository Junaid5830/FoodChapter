<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Vendor.Master" AutoEventWireup="true" CodeBehind="VendorInquiry.aspx.cs" Inherits="FoodChapter.VendorInquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script>
    $(document).ready(function () {
      var vendorId = '<%= int.Parse(FoodChapter.SessionManager.GetVendorSession()) %>';
        $.ajax({
          url: '/api/Product/GetInquirtList',
          type: 'Get',
          contentType: 'application/json',
          dataType: 'json',
          data: { 'vendorId': vendorId },
          statusCode: {
            200: function (data) {
              var json1 = JSON.parse(data);
              debugger;
              console.log(json1);
              for (var i = 0; i < json1.INQUIRY.length; i++) {
                $("#inquiry").append('<tr class="odd pointer"><td>' + (i + 1) + '</td><td class=" ">' + json1.INQUIRY[i].USER_NAME + '</td><td class=" ">' + json1.INQUIRY[i].VENDOR_NAME + '</td><td class=" "> ' + json1.INQUIRY[i].INQUIRY_TIME + '</td><td class=" ">' + json1.INQUIRY[i].INQUIRY_TYPE + '</td></tr>');

              }
              $('#inquiry').DataTable();
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
          <th style="display: table-cell;" class="column-title">User </th>
          <th style="display: table-cell;" class="column-title">VendorName </th>
          <th style="display: table-cell;" class="column-title">InquiryTime </th>
          <th style="display: table-cell;" class="column-title">InquiryType </th>

        </tr>
      </thead>

      <tbody>
      </tbody>
    </table>
  </div>
</asp:Content>
