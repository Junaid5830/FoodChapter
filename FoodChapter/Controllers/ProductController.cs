using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Script.Serialization;
//using Utilities;
using FoodChapter.DataCore;
using FoodChapter.DataCore.Managers;
//using PushSharp.Apple;
//using MySql.Data.MySqlClient;
using System.Net.Mail;
using FoodChapter.Models;
using System.Threading;

namespace FoodChapter.Controllers
{
    //    [EnableCors("AllowAllHeaders")]
    public class ProductController : ApiController
    {
        private static BusinessCoreController controller = new BusinessCoreController();
        [HttpPost]


        public HttpResponseMessage SearchProductByName(string productSearch, int productType)
        {
            DataSet products = controller.SearchProductByName(productSearch, productType);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]

        public HttpResponseMessage SearchProductByProductId(int productId)
        {
            DataSet products = controller.SearchProductByProductId(productId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]

        public HttpResponseMessage GetCakeTierDetail(int cakeId)
        {
            DataSet products = controller.GetCakeTierDetail(cakeId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpPost]

        public HttpResponseMessage SearchProductByProductType(int ProductType)
        {
            DataSet products = controller.SearchProductByProductType(ProductType);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }


        [HttpGet]

        public HttpResponseMessage GetCakeDetail(int cakeId)
        {
            int orderId = int.Parse(SessionManager.GeOrderSession());
            DataSet products = controller.GetCakeDetail(orderId, cakeId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]

        public HttpResponseMessage SearchProductsByCriterias(int active, int delivery, int catagory, int vendorId)
        {
            DataSet products = controller.SearchProductsByCriterias(active, delivery, catagory, vendorId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]

        public HttpResponseMessage SearchCakesByCriterias(int active, int delivery, int vendorId)
        {
            DataSet products = controller.SearchCakesByCriterias(active, delivery, vendorId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage GetLatestProducts(int topProducts)
        {
            DataSet products = controller.GetLatestProducts(topProducts);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage GetProductSubCatagories(int catagoryId, int vendorId)
        {
            DataSet subCatagories = controller.GetProductSubCatagories(catagoryId, vendorId);
            string json = JsonConvert.SerializeObject(subCatagories, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpPost]
        public HttpResponseMessage SaveProductSubCatagory([FromBody] SUB_CATEGORIES subCatagory)
        {
            subCatagory.CREATED_ON = DateTime.Now;
            bool result = controller.SaveProductSubCatagory(subCatagory);
            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }


        [HttpPost]
        public HttpResponseMessage SaveProduct([FromBody] PRODUCT product)
        {
            product.CREATED_ON = DateTime.Now;
            int result = controller.SaveProduct(product);
            if (result > 0)
            {

                return Request.CreateResponse(HttpStatusCode.OK, result);

            }
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }

        [HttpPost]
        public HttpResponseMessage IsUniqueProduct([FromBody] PRODUCT product)
        {
            int result = 0;
            if (product.PRODUCT_ID == 0)
                result = controller.IsUniqueProduct(product.NAME, product.VENDOR_ID);
            else
                result = controller.IsUniqueProduct(product.NAME, product.VENDOR_ID, product.PRODUCT_ID);


            if (result > 0)
            {

                return Request.CreateResponse(HttpStatusCode.OK, result);

            }
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }

        [HttpPost]
        public HttpResponseMessage SaveFlavour([FromBody] FLAVOR flavor)
        {
            //product.CREATED_ON = DateTime.Now;
            bool result = controller.SaveFlavour(flavor);
            if (result)
            {

                return Request.CreateResponse(HttpStatusCode.OK, result);

            }
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }

        [HttpPost]
        public HttpResponseMessage SaveEvent([FromBody] EVENT events)
        {
            bool result = controller.SaveEvent(events);
            if (result)
            {

                return Request.CreateResponse(HttpStatusCode.OK, result);

            }
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }

        [HttpPost]
        public HttpResponseMessage UpdateProduct([FromBody] PRODUCT product)
        {
            product.CREATED_ON = DateTime.Now;
            int result = controller.UpdateProduct(product);
            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }

        [HttpPost]
        public HttpResponseMessage SaveProductTags(List<PRODUCT_TAGS> tagsList)
        {
            int count = 0;
            foreach (PRODUCT_TAGS tag in tagsList)
            {
                bool result = controller.SaveProductTag(tag);
                if (result)
                    count++;
            }
            if (count == tagsList.Count())
                return Request.CreateResponse(HttpStatusCode.OK, true);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, false);
        }

        [HttpPost]
        public HttpResponseMessage SaveCakeTiers(List<CAKE_TIERS> cakeList)
        {
            int count = 0;
            foreach (CAKE_TIERS tier in cakeList)
            {
                bool result = controller.SaveCakeTier(tier);
                if (result)
                    count++;
            }
            if (count == cakeList.Count())
                return Request.CreateResponse(HttpStatusCode.OK, true);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, false);
        }

        [HttpPost]
        public HttpResponseMessage SaveCakeEvents(List<CAKE_EVENTS> eventList)
        {
            int count = 0;
            foreach (CAKE_EVENTS cEvent in eventList)
            {
                bool result = controller.SaveCakeEvents(cEvent);
                if (result)
                    count++;
            }
            if (count == eventList.Count())
                return Request.CreateResponse(HttpStatusCode.OK, true);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, false);
        }

        [HttpPost]
        public HttpResponseMessage SaveCakeFlavours(List<CAKE_FLAVORS> flavourList)
        {
            int? min_price = flavourList[0].PRICE;
            int count = 0;
            foreach (CAKE_FLAVORS flavour in flavourList)
            {
                if (flavour.PRICE < min_price)
                    min_price = flavour.PRICE;

                bool result = controller.SaveCakeFlavour(flavour);
                if (result)
                    count++;
            }
            if (count == flavourList.Count())
            {
                if (controller.updateCakePrice(flavourList[0].CAKE_ID, min_price) > 0)
                    return Request.CreateResponse(HttpStatusCode.OK, true);
                else
                    return Request.CreateResponse(HttpStatusCode.InternalServerError, false);
            }
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, false);
        }
        [HttpPost]
        public HttpResponseMessage UpdateProductTags(List<PRODUCT_TAGS> tagsList)
        {
            controller.DeleteProductTag((int)tagsList[0].PRODUCT_ID);
            int count = 0;
            foreach (PRODUCT_TAGS tag in tagsList)
            {
                bool result = controller.SaveProductTag(tag);
                if (result)
                    count++;
            }
            if (count == tagsList.Count())
                return Request.CreateResponse(HttpStatusCode.OK, true);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, false);
        }

        [HttpPost]
        public HttpResponseMessage DeleteProductTags(int tagId)
        {
            bool result = controller.DeleteProductTag(tagId);
            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpGet]
        public HttpResponseMessage GetProductTagsByProductId(int productId)
        {
            DataSet tags = controller.GetProductTagsByProductId(productId);
            string json = JsonConvert.SerializeObject(tags, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]

        public HttpResponseMessage SearchProductByProductTag(string productTag)
        {
            DataSet products = controller.SearchProductByProductTag(productTag);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]

        public HttpResponseMessage SearchVendorProductByProductTag(string productTag, int vendorId)
        {
            DataSet products = controller.SearchVendorProductByProductTag(productTag, vendorId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]

        public HttpResponseMessage SearchProductByVendorName(string name)
        {
            DataSet products = controller.SearchProductByVendorName(name);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage SearchCakeByVendorName(string name)
        {
            DataSet products = controller.SearchCakeByVendorName(name);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]

        public HttpResponseMessage SearchCakesByCakeTag(string cakeTag)
        {
            DataSet products = controller.SearchCakesByCakeTag(cakeTag);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]

        public HttpResponseMessage SearchVendorCakesByCakeTag(string cakeTag, int vendorId)
        {
            DataSet products = controller.SearchVendorCakesByCakeTag(cakeTag, vendorId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }


        [HttpGet]

        public HttpResponseMessage DeleteProduct(int productId)
        {
            bool result = controller.DeleteProduct(productId);
            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpGet]
        public HttpResponseMessage GetAllEvents(string VendorId)
        {

            DataSet vendors = controller.GetAllEvents(VendorId);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

        }
        [HttpGet]
        public HttpResponseMessage GetAllFlavors(string VendorId)
        {

            DataSet vendors = controller.GetAllFlavors(VendorId);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

        }
        
        [HttpGet]
        public HttpResponseMessage GetProductsByPage(int showCount)
        {
            DataSet vendors = controller.GetProductsByPage(showCount);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage GetCakesByPage(int showCount)
        {
            DataSet vendors = controller.GetCakesByPage(showCount);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage GetAllProducts(int showCount)
        {

            DataSet vendors = controller.GetAllProducts(showCount);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

        }
        [HttpGet]
        public HttpResponseMessage GetAllDesserts(int showCount)
        {

            DataSet vendors = controller.GetAllDesserts(showCount);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

        }
        [HttpGet]
        public HttpResponseMessage GetAllFrozenFoods(int showCount)
        {

            DataSet vendors = controller.GetAllFrozenFoods(showCount);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

        }
        [HttpGet]
        public HttpResponseMessage GetAllCakes(int showCount)
        {
            DataSet vendors = controller.GetAllCakes(showCount);
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

        }

        [HttpGet]
        public HttpResponseMessage SetProductSessionToEdit(int productId)
        {
            SessionManager.SetProductSession(productId);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpGet]
        public HttpResponseMessage SetCakeSessionToEdit(int cakeId)
        {
            SessionManager.SetCakeSession(cakeId);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpGet]
        public HttpResponseMessage SetProductSessionToView(int productId)
        {
            //SessionManager.RemoveViewCakeSession();
            SessionManager.SetViewProductSession(productId);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpGet]
        public HttpResponseMessage SetCakeSessionToView(int cakeId)
        {
           // SessionManager.RemoveViewProductSession();
            SessionManager.SetViewCakeSession(cakeId);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpPost]
        public void UploadImage()
        {
            var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];
            string objId = HttpContext.Current.Request.Params.GetValues("id")[0];
            string fileName = objId + "" + httpPostedFile.FileName;

            var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("../../UploadedFiles/Products"), fileName);

            var imagePath = "../UploadedFiles/Products/" + fileName;
            controller.UpdateProductImage(objId, imagePath);
            httpPostedFile.SaveAs(fileSavePath);
        }
        public void UploadCakeImage()
        {
            var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];
            string objId = HttpContext.Current.Request.Params.GetValues("id")[0];
            string fileName = objId + "" + httpPostedFile.FileName;

            var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("../../UploadedFiles/Cakes"), fileName);

            var imagePath = "../UploadedFiles/Cakes/" + fileName;
            controller.UpdateCakeImage(objId, imagePath);
            httpPostedFile.SaveAs(fileSavePath);
        }
        public void CustomizeUploadImage()
        {
            var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];
            string objId = HttpContext.Current.Request.Params.GetValues("id")[0];
            string fileName = objId + "" + httpPostedFile.FileName;

            var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("../../UploadedFiles/Customized"), fileName);

            var imagePath = "../UploadedFiles/Customized/" + fileName;
            controller.UpdateCustomizedImage(objId, imagePath);
            httpPostedFile.SaveAs(fileSavePath);
        }

        [HttpGet]
        public HttpResponseMessage GetAllTypes()
        {

            DataSet vendors = controller.GetAllTypes();
            string json = JsonConvert.SerializeObject(vendors, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

        }
        [HttpGet]
        public HttpResponseMessage GetAllCakeFlavors(int cakeId)
        {

            DataSet cakeFlavours = controller.GetAllCakeFlavors(cakeId);
            string json = JsonConvert.SerializeObject(cakeFlavours, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

        }
        [HttpPost]
        public HttpResponseMessage SaveCake([FromBody] CAKE cake)
        {
            cake.CREATED_ON = DateTime.Now;
            int result = controller.SaveCake(cake);
            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }

        [HttpPost]
        public HttpResponseMessage IsUniqueCake([FromBody] CAKE cake)
        {
            int result = 0;
            if (cake.CAKE_ID == 0)
                result = controller.IsUniqueCake(cake.NAME, (int)cake.VENDOR_ID);
            else
                result = controller.IsUniqueCake(cake.NAME, (int)cake.VENDOR_ID, cake.CAKE_ID);

            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }

        [HttpPost]
        public HttpResponseMessage SaveCakeTags(List<CAKE_TAGS> tagsList)
        {
            int count = 0;
            foreach (CAKE_TAGS tag in tagsList)
            {
                bool result = controller.SaveCakeTag(tag);
                if (result)
                    count++;
            }
            if (count == tagsList.Count())
                return Request.CreateResponse(HttpStatusCode.OK, true);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, false);
        }

        [HttpPost]
        public HttpResponseMessage SaveCakeCustomizeDetail(List<CAKE_CUSTOMIZE_DETAIL> cakeDetailList)
        {
            int count = 0;
            //Thread t1 = new Thread(delegate()
            //{
            foreach (CAKE_CUSTOMIZE_DETAIL detail in cakeDetailList)
            {
                bool result = controller.SaveCakeCustomizeDetail(detail);
                if (result)
                    count++;
            }
            //});
            //t1.Start();

            if (count == cakeDetailList.Count())
                return Request.CreateResponse(HttpStatusCode.OK, true);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, false);
        }

        [HttpGet]

        public HttpResponseMessage SearchCakeByCakeId(int cakeId)
        {
            DataSet products = controller.SearchCakeByCakeId(cakeId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage GetCakeTagsByCakeId(int cakeId)
        {
            DataSet tags = controller.GetCakeTagsByCakeId(cakeId);
            string json = JsonConvert.SerializeObject(tags, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage GetCakeEventsByCakeId(int cakeId)
        {
            DataSet tags = controller.GetCakeEventsByCakeId(cakeId);
            string json = JsonConvert.SerializeObject(tags, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage GetCakeFlavorsByCakeId(int cakeId)
        {
            DataSet tags = controller.GetCakeFlavorsByCakeId(cakeId);
            string json = JsonConvert.SerializeObject(tags, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpPost]
        public HttpResponseMessage UpdateCake([FromBody] CAKE cake)
        {
            cake.CREATED_ON = DateTime.Now;
            int result = controller.UpdateCake(cake);
            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpGet]

        public HttpResponseMessage DeleteCake(int cakeId)
        {
            bool result = controller.DeleteCake(cakeId);
            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpGet]

        public HttpResponseMessage SearchCakeByVendorId(int vendorId, int showCount = 0)
        {
            DataSet cakes = controller.SearchCakeByVendorId(vendorId, showCount);
            string json = JsonConvert.SerializeObject(cakes, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
    [HttpGet]

    public HttpResponseMessage GetInquirtList(int vendorId)
    {
      DataSet cakes = controller.GetInquirtList(vendorId);
      string json = JsonConvert.SerializeObject(cakes, Formatting.Indented);
      return Request.CreateResponse(HttpStatusCode.OK, json);
    }
    [HttpGet]
        public HttpResponseMessage GetAdminAllProducts()
        {
            try
            {
                DataSet products = controller.GetAdminAllProducts();
                string json = JsonConvert.SerializeObject(products, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, json);
            }
            catch (Exception ex)
            {
                string json = JsonConvert.SerializeObject(ex.Message, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, json);
            }
        }
        [HttpGet]
        public HttpResponseMessage GetAdminAllCakes()
        {
            try
            {
                DataSet products = controller.GetAdminAllCakes();
                string json = JsonConvert.SerializeObject(products, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, json);
            }
            catch (Exception ex)
            {
                string json = JsonConvert.SerializeObject(ex.Message, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.OK, json);
            }
        }
        [HttpGet]
        public HttpResponseMessage SearchProductsByVendorId(int vendorId)
        {
            DataSet products = controller.SearchProductsByVendorId(vendorId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage SearchAllProducts()
        {
            DataSet products = controller.SearchAllProducts();
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }


        [HttpGet]
        public HttpResponseMessage SearchAllCakes()
        {
            DataSet products = controller.SearchAllCakes();
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage SearchProductByVendorId(int vendorId, int showCount)
        {
            DataSet products = controller.SearchProductByVendorId(vendorId, 1, showCount);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]

        public HttpResponseMessage SearchFrozenFoodsByVendorId(int vendorId, int showCount)
        {
            DataSet products = controller.SearchProductByVendorId(vendorId, 4, showCount);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]

        public HttpResponseMessage SearchDessertsByVendorId(int vendorId, int showCount)
        {
            DataSet products = controller.SearchProductByVendorId(vendorId, 5, showCount);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage SearchProductByVendorId(int vendorId, int showCount, int subCategoryId)
        {
            DataSet products = controller.SearchProductByVendorId(vendorId, 1, showCount, subCategoryId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]

        public HttpResponseMessage SearchFrozenFoodsByVendorId(int vendorId, int showCount, int subCategoryId)
        {
            DataSet products = controller.SearchProductByVendorId(vendorId, 2, showCount, subCategoryId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]

        public HttpResponseMessage SearchDessertsByVendorId(int vendorId, int showCount, int subCategoryId)
        {
            DataSet products = controller.SearchProductByVendorId(vendorId, 3, showCount, subCategoryId);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }


        [HttpGet]
        public HttpResponseMessage ApprovedProductsByAdmin(int productId)
        {
            int result = controller.ApprovedProductsByAdmin(productId);
            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpGet]
        public HttpResponseMessage ApprovedCakesByAdmin(int cakeId)
        {
            int result = controller.ApprovedCakesByAdmin(cakeId);
            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }

        [HttpGet]
        public HttpResponseMessage AllProducts()
        {
            DataSet products = controller.AllProducts(3);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage GalleryProducts(int category,int page)
        {
            DataSet products = controller.GalleryProducts(category,page);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage TopSixProducts()
        {
            DataSet products = controller.TopSixProducts(3);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage TopRelatedProducts()
        {
            DataSet products = controller.TopRelatedProducts();
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]

        public HttpResponseMessage TopSixFrozenFoods()
        {
            DataSet products = controller.TopSixProducts(4);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]

        public HttpResponseMessage TopSixFrozenDesserts()
        {
            DataSet products = controller.TopSixProducts(5);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]

        public HttpResponseMessage TopSixCakes()
        {
            DataSet products = controller.TopSixCakes();
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]

        public HttpResponseMessage TopRelatedCakes()
        {
            DataSet products = controller.TopRelatedCakes();
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage AllCakes(int page)
        {
            DataSet products = controller.AllCakes(page);
            string json = JsonConvert.SerializeObject(products, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage GetTierData(int cakeId)
        {
            DataSet tiers = controller.GetTierData(cakeId);
            string json = JsonConvert.SerializeObject(tiers, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
    }
}