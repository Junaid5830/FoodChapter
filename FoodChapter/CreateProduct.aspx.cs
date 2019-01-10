using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodChapter;
using FoodChapter.DataCore.Managers;
using System.IO;
namespace FoodChapter.WebPages
{
    public partial class CreateProduct : System.Web.UI.Page
    {
        MultipleUploadHelper uploadHelper = new MultipleUploadHelper();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnUploadProducts_Click(object sender, EventArgs e)
        {
            try
            {
                HttpFileCollection fileCollection = Request.Files;
                string vendorid = SessionManager.GetVendorSession();
                for (int i = 0; i < fileCollection.Count; i++)
                {
                    HttpPostedFile uploadfile = fileCollection[i];
                    string fileName = Path.GetFileName(uploadfile.FileName);
                    if (uploadfile.ContentLength > 0)
                    {
                        var imagePath = "../UploadedFiles/Products/" + vendorid + fileName;
                        string Productname = generateProductName(vendorid);
                        int result = uploadHelper.saveProduct(vendorid, Productname, imagePath);

                        uploadfile.SaveAs(Server.MapPath("UploadedFiles/Products/") + vendorid + fileName);
                        //lblMessage.Text += fileName + "Saved Successfully<br>";
                    }
                }
                Response.Redirect("VendorProducts.aspx", false);
            }
            catch(Exception ex)
            {
                lblMSg.Text = ex.Message + ex.InnerException.ToString();
            }
        }
        protected string generateProductName(string vendorId)
        {
            string Productname = vendorId + "_Product_" + DateTime.Now.Date.ToString("dd-MM-yyyy") + "_" + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + DateTime.Now.Millisecond;
            return Productname;
        }
    }
}