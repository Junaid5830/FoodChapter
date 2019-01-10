<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Vendor.aspx.cs" Inherits="FoodChapter.WebPages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script>

     $(document).ready(function () {
         //alert("ahsan");
         $.ajax({
             url: '/api/Vendors/GetVendors',
             type: 'Get',
             contentType: 'application/json',
             dataType: 'json',
             statusCode: {
                 200: function (data) {
                     //alert("success");
                     var json1 = JSON.parse(data);

                     for (var i = 0; i < json1.VENDORS.length; i++) {
                         $("#adminvendor").append('<tr class="odd pointer"><td>'+ (i+1) +' </td><td class=" ">' + json1.VENDORS[i].FIRST_NAME + '</td><td class=" "><a href="#">' + json1.VENDORS[i].BUSINESS_ENTITY_NAME + '</a></td><td class=" "> ' + json1.VENDORS[i].EMAIL + '</td><td class=" "> ' + json1.VENDORS[i].PERSONAL_PHONE + '</td><td class=" "> ' + json1.VENDORS[i].IS_FEATURED + '</td><td class=" "> ' + json1.VENDORS[i].STATUS + '</td><td><a href="javascript:void(0);" onclick="ApprovedCall(' + json1.VENDORS[i].VENDOR_ID + ')"<span style="margin-left:10px;"><i class=" fa fa-check" style="color: green;cursor: pointer;"></i></span></a></td><td class=" last"><a href="javascript:void(0);" onclick="deleteCall(' + json1.VENDORS[i].VENDOR_ID + ')" onclick="return confirm( Are you sure? )"><span style="margin-left:10px;"><i class="RemoveProduct fa fa-trash-o" style="color: red;cursor: pointer;"></i><span></a></td></tr>');
                         
                     }
                     if (json1.VENDORS.length == 0) {
                       $("#adminvendor").append('<tr class="odd pointer"><td style="width:25%;"></td><td style="width:50%;"><h4 style="color: red;">Sorry, there is no list available</h4></td><td style="width:25%;"></td></tr>');
                         //$("#tblFoodies").append('<tr class="odd pointer"><td style="width:25%;"></td><td style="width:50%;"><h4 style="color: red;">Sorry, there is no list available</h4></td><td style="width:25%;"></td></tr>');
                     }

                     debugger;
                 },
                 500: function () {
                 }


             },

             jsonp: 'jsonp'

         });

     });


     function deleteCall(vendorId) {
         $.ajax({
             url: '/api/Vendors/DeleteVendor',
             type: 'GET',
             contentType: 'application/json',
             dataType: 'json',
             data: { 'vednorId': vendorId },
             statusCode: {
                 200: function () {
                     //clearProduct();
                     //alert('Product Deleted succesfullty');
                     location.reload();
                 },
                 500: function () {
                     //alert('Error occured. Product not Deleted');
                 }
             },
             jsonp: 'jsonp'

         });
     }
     function ApprovedCall(vendorId) {
         debugger;
         $.ajax({
             url: '/api/Vendors/ApprovedByAdmin',
             type: 'Get',
             contentType: 'application/json',
             dataType: 'json',
             data: { 'vendorId': vendorId },
             statusCode: {
                 200: function () {
                     //clearProduct();
                     //alert('Product Deleted succesfullty');
                     location.reload();
                 },
                 500: function () {
                     //alert('Error occured. Product not Deleted');
                 }
             },
             jsonp: 'jsonp'

         });
     }


     function mark(val, vendorId) {
        // alert(val);
         //alert(vendorId);
         //return;
         $.ajax({
             url: '/api/Vendors/MarkFeatured',
             type: 'GET',
             contentType: 'application/json',
             dataType: 'json',
             data: {
                 'val' : val,
                 'vendorId': vendorId
             },
             statusCode: {
                 200: function () {
                     //clearProduct();
                     //alert('Product Deleted succesfullty');
                     location.reload();
                 },
                 500: function () {
                     //alert('Error occured. Product not Deleted');
                 }
             },
             jsonp: 'jsonp'

         });
     }
     function EditCall(vendorId) {

         $.ajax({
             url: '/api/Vendors/SetVendorSession',
             type: 'GET',
             contentType: 'application/json',
             dataType: 'json',
             data: { 'vendorId': vendorId },
             statusCode: {
                 200: function () {
                     //clearProduct();
                     window.location = "ViewVendorProfile.aspx";
                     //alert('Product Update succesfullty');
                 },
                 500: function () {
                     //alert('Error occured. Product not Deleted');
                 }
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
            <h3 class="box-title">Admin Foodies List</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table id="adminvendor" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Sr#</th>
                  <th>Name</th>
                  <th>Business Entity</th>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Featured</th>
                  <th>Status</th>
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
      $('#adminvendor').DataTable();
    });
  </script>
</asp:Content>
