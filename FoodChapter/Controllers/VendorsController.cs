using FoodChapter.DataCore;
using FoodChapter.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Providers.Entities;
namespace FoodChapter.Controllers
{
    public class VendorsController : ApiController
    {
        private static BusinessCoreController controller = new BusinessCoreController();
        //public static string apiKey = "AIzaSyC67qOLCwRi1_6Z8g1zKA6OQkJekYIBDz8";
        // GET api/<controller>
        [HttpGet]
        public HttpResponseMessage Test()
        {
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpGet]
        public HttpResponseMessage GetAllVendors()
        {
            try
            {
                DataSet vendors = controller.GetAllVendors();
                string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, json);
            }
            catch (Exception ex)
            {
                string json = JsonConvert.SerializeObject(ex.Message, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, json);
            }

            //return Request.CreateResponse(HttpStatusCode.OK, vendors, Configuration.Formatters.JsonFormatter);
        }

        [HttpGet]
        public HttpResponseMessage GetTopSixVendors()
        {

            DataSet vendors = controller.GetTopSixVendors();
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage GetFeaturedVendorsforGalleryFilter()
        {

            DataSet vendors = controller.GetFeaturedVendorsforGalleryFilter();
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpPost]

        // POST api/<controller>
        public HttpResponseMessage authenticateVendor([FromBody]VENDOR user)
        {
            string username = user.EMAIL.Trim();
            string password = user.PASSWORD.Trim();

            int result = controller.AuthenticateVendor(username, password);
            if (result > 0)
            {
                SessionManager.SetVendorSession(result);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            else
                return Request.CreateResponse(HttpStatusCode.Unauthorized, result);
        }

        [HttpPost]

        // POST api/<controller>
        public HttpResponseMessage SaveVendorReview([FromBody]VENDOR_REVIEW vendorReview)
        {
            vendorReview.CREATED_ON = DateTime.Now;
            bool result = controller.SaveVendorReview(vendorReview);
            if (result)
            {
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            else
                return Request.CreateResponse(HttpStatusCode.Unauthorized, result);
        }
    [HttpPost]

    // POST api/<controller>
    public HttpResponseMessage SaveInquiry([FromBody]INQUIRY inquiry)
    {
      inquiry.INQUIRY_TIME = DateTime.Now;
      bool result = controller.SaveInquiry(inquiry);
      if (result)
      {
        return Request.CreateResponse(HttpStatusCode.OK, result);
      }
      else
        return Request.CreateResponse(HttpStatusCode.Unauthorized, result);
    }

    [HttpGet]
        public HttpResponseMessage SetCaptchVendorSession(string captcha)
        {
            SessionManager.SetCaptchVendorSession(captcha);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpGet]
        public HttpResponseMessage GetCaptchVendorSession()
        {
            string captcha = SessionManager.GetCaptchVendorSession();
            return Request.CreateResponse(HttpStatusCode.OK, captcha);
        }
        [HttpPost]

        // POST api/<controller>
        public HttpResponseMessage IsUniqueVendor([FromBody]VENDOR user)
        {
            try
            {
                string businessEntity = user.BUSINESS_ENTITY_NAME.Trim();
                string phone = user.PERSONAL_PHONE.Trim();
                int result = 0;
                if (user.VENDOR_ID == 0)
                    result = controller.IsUniqueVendor(businessEntity, phone);
                else
                    result = controller.IsUniqueVendor(businessEntity, phone, user.VENDOR_ID);


                if (result > 0)
                {
                    SessionManager.SetVendorSession(result);
                    return Request.CreateResponse(HttpStatusCode.OK, result);
                }
                else
                    return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
            }
            catch(Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message + ex.InnerException);
            }
        }

        [HttpGet]
        public HttpResponseMessage SetVendorSession(int vendorId)
        {
            SessionManager.SetVendorSession(vendorId);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpGet]
        public HttpResponseMessage SetViewVendorSession(int vendorId)
        {
            SessionManager.SetViewVendorSession(vendorId);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpGet]
        public HttpResponseMessage SetCategorySession(int category)
        {
            SessionManager.SetCategorySession(category);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpPost]
        public HttpResponseMessage getVendorOrderAndProduct( SellerSearchModel whereclause)
        {
            DataSet vendors = controller.getVendorOrderAndProduct(whereclause);

            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage GetVendorRating(int vendorId)
        {
            DataSet vendors = controller.GetVendorRating(vendorId);

            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage GetVendorsReview(int vendorId)
        {
            DataSet vendors = controller.GetVendorsReview(vendorId);

            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage CheckUserOrder(int userId)
        {
            DataSet vendors = controller.CheckUserOrder(userId);

            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage RemoveAllSessions()
        {
            SessionManager.RemoveVendorSession();
            SessionManager.RemoveUserSession();
            SessionManager.RemoveVendorImageSession();
            SessionManager.RemoveProductSession();
            SessionManager.RemoveOrderIndexSession();
            SessionManager.RemoveGeOrderSession();
            SessionManager.RemoveCakeSession();
            SessionManager.RemoveUsernameSession();
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpGet]
        public HttpResponseMessage GetVendorProfile(string vendorId)
        {
            DataSet vendors = controller.GetVendorById(vendorId);
            SessionManager.SetShowVPSession(1);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

        }
        [HttpGet]
        public HttpResponseMessage GetVendorProfileByUniqueId(string uniqueId)
        {
            DataSet vendors = controller.GetVendorProfileByUniqueId(uniqueId);
            //SessionManager.SetShowVPSession(1);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

        }
        [HttpGet]
        public HttpResponseMessage GetVendorProfileByEntityName(string entity)
        {
            DataSet vendors = controller.GetVendorProfileByEntityName(entity);
            //SessionManager.SetShowVPSession(1);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

        }
        [HttpPost]
        public HttpResponseMessage saveVendor([FromBody] VENDOR vendor)
        {
            try
            {
                if (controller.uniqueEmail(2, vendor.EMAIL, 0))
                {

                    vendor.IS_ACTIVE = true;
                    vendor.CREATED_ON = DateTime.Now;
                    vendor.CREATED_BY = 0;
                    int result = controller.saveVendor(vendor);
                    if (result > 0)
                    {
                        SessionManager.SetVendorSession(result);
                        return Request.CreateResponse(HttpStatusCode.OK, result);

                    }
                    else
                        return Request.CreateResponse(HttpStatusCode.InternalServerError, 0);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotAcceptable, false);
                }
            }
            catch(Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message + "aa" + ex.InnerException.ToString());
            }
        }
        [HttpPost]
        public HttpResponseMessage SearchVendor(string vendorSearch)
        {
            DataSet vendors = controller.SearchVendor(vendorSearch);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);

            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpPost]
        public HttpResponseMessage UpdateVendor([FromBody] VENDOR vendor)
        {
            if (controller.uniqueEmail(2, vendor.EMAIL, vendor.VENDOR_ID))
            {
                vendor.UPDATED_ON = DateTime.Now;
                vendor.UPDATED_BY = int.Parse(SessionManager.GetVendorSession());
                foreach (var data in vendor.VENDOR_CATEGORIES)
                {
                    data.UPDATED_ON = vendor.UPDATED_ON;
                    data.UPDATED_BY = vendor.UPDATED_BY;
                }
                bool result = controller.updateVendor(vendor);
                if (result)
                    return Request.CreateResponse(HttpStatusCode.OK, result);
                else
                    return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.NotAcceptable, false);
            }

        }
        [HttpGet]
        public HttpResponseMessage DeleteVendor(int vednorId)
        {
            bool result = controller.DeleteVendor(vednorId);
            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }


        [HttpGet]
        public HttpResponseMessage ApprovedByAdmin(int vendorId)
        {
            int result = controller.ApprovedByAdmin(vendorId);
            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpPost]
        public void UploadImage()
        {
            var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];
            string objId = HttpContext.Current.Request.Params.GetValues("id")[0];
            //string eCat = HttpContext.Current.Request.Params.GetValues("type")[0];
            string fileName = objId + "" + httpPostedFile.FileName;
    
     
        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("../../UploadedFiles/FoodSellers"), fileName);

        var imagePath = "../UploadedFiles/FoodSellers/" + fileName;
        controller.UpdateVendorImage(objId, imagePath);
        httpPostedFile.SaveAs(fileSavePath);
      
        }
    [HttpPost]
    public void UploadPersonalImage()
    {
      var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];
      string objId = HttpContext.Current.Request.Params.GetValues("id")[0];
      //string eCat = HttpContext.Current.Request.Params.GetValues("type")[0];
      string fileName = objId + "" + httpPostedFile.FileName;

      var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("../../UploadedFiles/FoodSellers"), fileName);

      var imagePath = "../UploadedFiles/FoodSellers/" + fileName;
      controller.UpdatePersonalImage(objId, imagePath);
      httpPostedFile.SaveAs(fileSavePath);
    }
    [HttpPost]
    public void UploadCNIC()
    {
      var httpPostedFile = HttpContext.Current.Request.Files["UploadedCNIC"];
      string objId = HttpContext.Current.Request.Params.GetValues("id")[0];
      //string eCat = HttpContext.Current.Request.Params.GetValues("type")[0];
      string fileName = objId + "" + httpPostedFile.FileName;

      var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("../../UploadedFiles/Documents"), fileName);

      var imagePath = "../UploadedFiles/Documents/" + fileName;
      controller.UpdateCNICImage(objId, imagePath);
      httpPostedFile.SaveAs(fileSavePath);
    }
    [HttpGet]
        public HttpResponseMessage MarkFeatured(int vendorId)
        {
            int result = controller.MarkFeatured( vendorId);
            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);

        }
        [HttpGet]
        public HttpResponseMessage GetVendors()
        {
            try
            {
                DataSet vendors = controller.GetVendors();
                string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, json);
            }
            catch (Exception ex)
            {
                string json = JsonConvert.SerializeObject(ex.Message, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, json);
            }
        }
        [HttpGet]
        public HttpResponseMessage GetFeaturedSellers()
        {
            try
            {
                DataSet vendors = controller.GetFeaturedSellers();
                string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, json);
            }
            catch (Exception ex)
            {
                string json = JsonConvert.SerializeObject(ex.Message, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, json);
            }
        }
        [HttpGet]

        public HttpResponseMessage GetVendorProductsByPrice(int vendorId, int code)
        {
            DataSet products = controller.GetVendorProductsByPrice(vendorId, code);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]

        public HttpResponseMessage GetProductsByVendor(int vendorId)
        {
            DataSet products = controller.GetProductsByVendor(vendorId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage GetVendorCakesByPrice(int vendorId,int code)
        {
            DataSet products = controller.GetVendorCakesByPrice(vendorId,code);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
    }

}