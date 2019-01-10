<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Vendor.Master" AutoEventWireup="true" CodeBehind="UploadMultipleCakes.aspx.cs" Inherits="FoodChapter.UploadMultipleCakes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="x_panel">
        <div class="x_title">
            <h3>Add CAKES</h3>
            <div class="clearfix"></div>
        </div>
        <!-- Title Ends Here -->
        <div class="x_content">
            <br>
            <div class="row">
                <form id="formSaveCake" action="#" runat="server">
                    <div class="col-md-12">
                         <%--<input class="img-show" type='file' id="imgInp" onchange="readURL(this);" />
                        Select images: <input type="file" name="img" multiple>
                    <input type="submit">--%>
                        <asp:FileUpload ID="file_upload" class="multi" runat="server" AllowMultiple="true"/>
                        <asp:Button ID="btnUploadCakes" runat="server" Text="Upload"
                        OnClick="btnUploadCakes_Click" /><br />
                        <asp:Label ID="lblMessage" runat="server" />

                    </div>


                </form>
            </div>
            <!-- row ends here -->
        </div>
        <!-- Add Product x_content ends here -->
    </div>
</asp:Content>
