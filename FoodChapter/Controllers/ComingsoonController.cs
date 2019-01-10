using FoodChapter.DataCore;
using FoodChapter.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FoodChapter.Controllers
{
    public class ComingsoonController : ApiController
    {
        private static BusinessCoreController controller = new BusinessCoreController();
        //[HttpGet]
        //public HttpResponseMessage GetAllVendors()
        //{
        //    DataSet vendors = controller.GetAllVendors();
        //    string json=JsonConvert.SerializeObject(vendors, Formatting.Indented);
        //    return Request.CreateResponse(HttpStatusCode.OK, json);
        //}
        //[HttpGet]
        //public HttpResponseMessage GetVendorProfile(string id)
        //{
        //    DataSet vendors = controller.GetVendorById(id);
        //    string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
        //    return Request.CreateResponse(HttpStatusCode.OK, json);

        //}
        //[HttpPost]
        //public HttpResponseMessage AuthenticateVendor([FromBody]VENDOR vendor)
        //{
        //    string username = vendor.EMAIL.Trim();
        //    string password = vendor.PASSWORD.Trim();
             
        //    int result = controller.AuthenticateVendor(username, password);
        //    if (result>0)
        //        return Request.CreateResponse(HttpStatusCode.OK, result);
        //    else
        //        return Request.CreateResponse(HttpStatusCode.Unauthorized, result);
        //}
        //[HttpPost]
        //public HttpResponseMessage SearchVendor(string vendorSearch)
        //{
        //    DataSet vendors = controller.SearchVendor(vendorSearch);
        //    string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);

        //    return Request.CreateResponse(HttpStatusCode.OK, json);
        //}
        
    }
}
