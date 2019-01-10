using FoodChapter.DataCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


namespace FoodChapter.Controllers
{
    public class AppController : ApiController
    {
        private static BusinessCoreController controller = new BusinessCoreController();
        private static AppCoreController appController = new AppCoreController();
        #region User


        #endregion

        #region Vendor
        [HttpGet]
        public HttpResponseMessage GetTopSixVendors()
        {

            DataSet vendors = controller.GetTopSixVendors();
            //string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, vendors);
        }
        [HttpGet]
        public HttpResponseMessage GetAllVendors()
        {
            try
            {
                DataSet vendors = controller.GetAllVendors();
                //string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, vendors);
            }
            catch (Exception ex)
            {
                //string json = JsonConvert.SerializeObject(ex.Message, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, ex.Message);
            }

            //return Request.CreateResponse(HttpStatusCode.OK, vendors, Configuration.Formatters.JsonFormatter);
        }
        #endregion
        
        #region Product
        [HttpGet]
        public HttpResponseMessage AllProducts()
        {
            DataSet products = controller.AllProducts(1);
            //string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, products);
        }
        [HttpGet]
        public HttpResponseMessage topCakes()
        {
            DataSet products = appController.topCakes();
            //string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, products);
        }
        [HttpGet]
        public HttpResponseMessage topProducts()
        {
            DataSet products = appController.topProducts();
            //string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, products);
        }
        #endregion
        
        #region Order


        #endregion

        #region User


        #endregion
    }
}
