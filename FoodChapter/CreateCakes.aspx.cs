using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodChapter.DataCore.Managers;
namespace FoodChapter.WebPages
{
    public partial class CreateCakes : System.Web.UI.Page
    {
        MultipleUploadHelper uploadHelper = new MultipleUploadHelper();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnUploadCakes_Click(object sender, EventArgs e)
        {
            HttpFileCollection fileCollection = Request.Files;
            string vendorid = SessionManager.GetVendorSession();
            for (int i = 0; i < fileCollection.Count; i++)
            {
                HttpPostedFile uploadfile = fileCollection[i];
                string fileName = Path.GetFileName(uploadfile.FileName);
                if (uploadfile.ContentLength > 0)
                {
                    var imagePath = "../UploadedFiles/Cakes/" + vendorid + fileName;
                    string cakename = generateCakeName(vendorid);
                    int result = uploadHelper.saveCake(vendorid, cakename, imagePath);

                    uploadfile.SaveAs(Server.MapPath("UploadedFiles/Cakes/") + vendorid + fileName);
                    //lblMessage.Text += fileName + "Saved Successfully<br>";
                }
            }
            Response.Redirect("CakeList.aspx", false);
        }
        protected string generateCakeName(string vendorId)
        {
            string cakename = vendorId + "_Cake_" + DateTime.Now.Date.ToString("dd-MM-yyyy") + "_" + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + DateTime.Now.Millisecond;
            return cakename;
        }
    }
}