<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="FoodChapter.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


  <script>
      var catId = 0;
    $(document).ready(function () {
     
        $('#updatecategory').hide();
     
      
      GetAllCategories();
      $('#SubmitButton').click( function () {
        var catInput = $('#txtCategory');
        if (catInput.val() !== '') {
            funSaveCategory();
       
          location.reload();
        } else {
          alert('Please input value');
        }
      });

      $('#updatecategory').on('click', function () {
        var catInput = $('#txtCategory');
        if (catInput.val() !== '') {
          editCall(catId);
          
        } else {
          alert('Please input value');
        }
      });

     
    });

    function LoadProductData(catId2) {
        catId = catId2;
      $.ajax({
        type: 'Get',
        url: '/api/User/GetCategoryById',
        dataType: 'json',
        data: { 'catId': catId },
        statusCode: {
          200: function (data) {
            var json1 = JSON.parse(data);
            document.getElementById('txtCategory').value = json1.CATEGORY[0].DESCRIPTION;
            $('#updatecategory').show();
            $('#SubmitButton').hide();
          },
          500: function () {
          
          }
        },
        jsonp: 'jsonp'
      });
    }
    function deleteCall(userId) {
      //alert(userId);
      $.ajax({
        url: '/api/User/DeleteCategory',
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
    function editCall(catId) {
        debugger;
      var category = {
        "CATEGORY_ID": catId,
        "DESCRIPTION": document.getElementById('txtCategory').value,

      };
      $.ajax({
        url: '/api/User/EditCategory',
        type: 'POST',
        contentType: 'application/json',
        dataType: 'json',
        data: JSON.stringify(category),
        statusCode: {
          200: function (data) {
            
            location.reload();
          },
          500: function (data) {
            //        alert('Error occured. User not Deleted');
          }
        },
        jsonp: 'jsonp'

      });
    }
    function GetAllCategories() {

      $.ajax({
        url: '/api/User/GetAllCategories',
        type: 'Get',
        contentType: 'application/json',
        dataType: 'json',
        statusCode: {
          200: function (data) {
            //alert("success");
            var json1 = JSON.parse(data);
            console.log(json1);
            //debugger;
            for (var i = 0; i < json1.CATEGORY.length; i++) {
              $("#cat").append('<tr class="odd pointer"><td class="a-center "><div style="position: relative;" class="icheckbox_flat-green"><div class="icheckbox_flat-green" style="position: relative;"><input style="position: absolute; opacity: 0;" class="flat" name="table_records" type="checkbox"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div><ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div></td><td class=" "><a href="#">' + json1.CATEGORY[i].DESCRIPTION + '</a></td><td class=""><a href="javascript:void(0);" onclick="deleteCall(' + json1.CATEGORY[i].CATEGORY_ID + ')" onclick="return confirm( Are you sure? )"><span style="margin-left: 10px;"><i class="RemoveProduct fa fa-trash-o" style="color: red;cursor: pointer;"></i></span></a><td class=""><a href="javascript:void(0);" onclick="LoadProductData(' + json1.CATEGORY[i].CATEGORY_ID + ')">  <span style="margin-left: -250px;"><i class="EditCategory fa fa-edit" style="color: #337ab7;cursor: pointer;"></i></a></td></tr>');

            }
            //json1.USERS.length = 0;
            if (json1.CATEGORY.length == 0) {
              $("#cat").append('<tr class="odd pointer"><td style="width:25%;"></td><td style="width:50%;"><h4 style="color: red;">Sorry, there is no list available</h4></td><td style="width:25%;"></td></tr>');
            }
          },
          500: function () {
          }


        },

        jsonp: 'jsonp'

      });
    }

    function funSaveCategory() {
    
        debugger;

        var cat = document.getElementById('txtCategory').value;
        var category = {
          "DESCRIPTION": cat,
 
        };
        $.ajax({
          url: '/api/User/saveCategories',
          type: 'POST',
          contentType: 'application/json',
          dataType: 'json',
          data: JSON.stringify(category),
          statusCode: {
            200: function (result) {
              GetAllCategories();
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
            <h3 class="box-title">Categories</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <div class="form-group">
              <form id="category">
              <div class="col-md-12">
                <%--<div class="col-md-6">
                  <label class="input-height">Email</label>
                  <input type="text" class="form-control" id="Email" required="required" />

                </div>--%>
                <div class="col-md-6">
                  <label class="input-height">Category Name* </label>
                  <input type="text" class="form-control" id="txtCategory" required="required" />

                </div>
              </div>
              <div class="col-md-12">
                <div class="col-md-3 pull-right">
                  <button type="button" id="CancelButton" class="btn btn-warning pull-right">Cancel </button>
                  <button type="button" id="SubmitButton" class="btn btn-primary pull-right" style="margin-right: 5px;">Save</button>
                <button type="button" id="updatecategory" class="btn btn-default pull-right" style="margin-right: 5px;">Update</button>
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
            <h3 class="box-title">Categories</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table id="cat" class="table table-bordered table-striped">
              <thead>
                <tr>
                 <th>Sr#</th>
                  <th id="cate">Categories Name</th>
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
      $('#cat').DataTable();
    });
  </script>
</asp:Content>
