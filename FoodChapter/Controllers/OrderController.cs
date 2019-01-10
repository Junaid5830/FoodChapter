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
using FoodChapter.DataCore.Managers;
using System.Threading;

namespace FoodChapter.Controllers
{
    public class OrderController : ApiController
    {
        private static BusinessCoreController controller = new BusinessCoreController();
        public static string apiKey = "AIzaSyC67qOLCwRi1_6Z8g1zKA6OQkJekYIBDz8";
        // GET api/<controller>

        [HttpPost]
        public HttpResponseMessage SaveOrderDetail([FromBody] List<ORDER_DETAILS> orderDetail)
        {
            try
            {
                int count = 0;
                //Thread t1 = new Thread(delegate()
                //{
                foreach (ORDER_DETAILS detail in orderDetail)
                {
                    bool result = controller.SaveOrderDetail(detail);
                    if (result)
                        count++;
                }
                //});
                //t1.Start();
                if (count == orderDetail.Count)
                    return Request.CreateResponse(HttpStatusCode.OK, true);
                else
                    return Request.CreateResponse(HttpStatusCode.InternalServerError, false);
            }
            catch(Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message + ex.InnerException.ToString());
            }
        }

        [HttpPost]
        public HttpResponseMessage SaveOrder([FromBody] ORDER order)
        {

            if (order.CUSTOMER_ID == 0)
            {
                // means unregistered user, register it
                order.CUSTOMER_ID = controller.uniqueEmailforCustomerAtPlaceOrder(order.EMAIL);
                if (order.CUSTOMER_ID <= 0)
                {
                    //register user
                    USER user = new USER();
                    user.EMAIL = order.EMAIL;
                    user.NAME = order.CUSTOMER_NAME;
                    user.PASSWORD = order.CONTACT_NO;
                    user.PHONE = order.CONTACT_NO;
                    user.USER_TYPE = 1;
                    user.CREATED_ON = DateTime.Now;

                    order.CUSTOMER_ID = controller.saveUserAtOrder(user);
                    if (order.CUSTOMER_ID <= 0)
                        return Request.CreateResponse(HttpStatusCode.InternalServerError, -1);

                }
            }

            order.CREATED_ON = DateTime.Now;
            order.CREATED_BY = order.CUSTOMER_ID;//for web orders
            order.STATUS_ID = 1;
            order.IS_ACTIVE = true;
            int result = controller.SaveOrder(order);

            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }

        [HttpPost]
        public HttpResponseMessage DeleteOrder(int orderId)
        {
            bool result = controller.DeleteOrderDetail(orderId);
            result = controller.DeleteOrder(orderId);
            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }

        [HttpPost]
        public HttpResponseMessage GetSalesReport(DateTime fromDate, DateTime toDate, int vendroId, int productId, int productType)
        {
            DataSet tags = controller.GetSalesReport(fromDate, toDate, vendroId, productId, productType);
            string json = JsonConvert.SerializeObject(tags, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage GetOrderReport(int vendorId)
        {
            DataSet orders = controller.GetOrderReport(vendorId);
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }



        [HttpGet]
        public HttpResponseMessage SendEmailToUser(string email, string OrderId, string Payment, DateTime orderDate)
        {
            string text = "Your Order ( order id : " + OrderId + " ) is placed successfully . Vendors will contact you shortly !!";
            EmailHelper helper = new EmailHelper();
            helper.sendEmail("Order Food Chapter", text, email);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }

        [HttpGet]
        public HttpResponseMessage SendEmailToUser(string emailData)
        {
            string[] detail = emailData.Split('|');
            string text = "Your Order ( order id : " + detail[1] + " ) is placed successfully . Vendors will contact you shortly !!";
            EmailHelper helper = new EmailHelper();
            helper.sendEmail("Order Food Chapter", text, detail[0]);
            return Request.CreateResponse(HttpStatusCode.OK, true);
            //Thread t1 = new Thread(delegate()
            //{
            //    EmailHelper.SendUserEmail(detail[0], detail[1], detail[2], detail[3]);
            //});
            //t1.Start();
            ////EmailHelper.SendUserEmail(detail[0], detail[1], detail[2], detail[3]);
            //return Request.CreateResponse(HttpStatusCode.OK, true);
        }

        [HttpGet]
        public HttpResponseMessage GetPreviousOrderReport(int vendorId)
        {
            DataSet orders = controller.GetPreviousOrderReport(vendorId);
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage AdminPendingOrder()
        {
            DataSet orders = controller.AdminPendingOrder();
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage GetRejectedOrderReport(int vendorId)
        {
            DataSet orders = controller.GetRejectedOrderReport(vendorId);
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage GetAdminRejectedOrderReport()
        {
            DataSet orders = controller.GetAdminRejectedOrderReport();
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage GetCompletedOrderReport(int vendorId)
        {
            DataSet orders = controller.GetCompletedOrderReport(vendorId);
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage GetAdminCompletedOrderReport()
        {
            DataSet orders = controller.GetAdminCompletedOrderReport();
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage GetCustomerData(int orderId)
        {
            DataSet orders = controller.GetCustomerData(orderId);
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage GetOrderDetails(int orderId, int vendorId)
        {
            DataSet orders = controller.GetOrderDetails(orderId, vendorId);
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpGet]
        public HttpResponseMessage SetOrderSession(int orderId)
        {
            SessionManager.SetOrderSession(orderId);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }

        [HttpGet]
        public HttpResponseMessage SetOrderIndexSession(int orderIndex)
        {
            SessionManager.SetOrderIndexSession(orderIndex);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }

        [HttpGet]
        public HttpResponseMessage SetCartSession()
        {
            SessionManager.SetCartSession(1);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }

        [HttpGet]
        public HttpResponseMessage SetProductSession(int productId)
        {
            SessionManager.SetProductSession(productId);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpGet]
        public HttpResponseMessage SetCakeSession(int cakeId)
        {
            SessionManager.SetCakeSession(cakeId);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpGet]
        public HttpResponseMessage SetOrderPaymentSession(int payment)
        {
            SessionManager.SetOrderPaymentSession(payment);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }

        [HttpGet]
        public HttpResponseMessage SetOrderPaymentDate(string orderDate)
        {
            SessionManager.SetOrderPaymentDate(orderDate);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }

        [HttpPost]
        public HttpResponseMessage UpdateOrderInfo([FromBody] ORDER_DETAILS order)
        {

            bool result = controller.UpdateOrderInfo(order);

            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpGet]
        public HttpResponseMessage DeliveredOrder(int orderId)
        {
            int result = controller.DeliveredOrder(orderId);
            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpGet]
        public HttpResponseMessage RejectedOrder(int orderId)
        {
            int result = controller.RejectedOrder(orderId);
            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }

        [HttpGet]
        public HttpResponseMessage GetOrderDetail(int orderId)
        {
            DataSet order = controller.GetOrderDetail(orderId);
            //SessionManager.SetOrderSession(1);
            string json = JsonConvert.SerializeObject(order, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);

            //return Request.CreateResponse(HttpStatusCode.OK, vendors, Configuration.Formatters.JsonFormatter);
        }
        [HttpGet]
        public HttpResponseMessage GetVendorOrderDetails(int orderId, int vendorId)
        {
            DataSet orders = controller.GetVendorOrderDetails(orderId, vendorId);
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

    [HttpGet]
    public HttpResponseMessage CustomizeCakeImage(int orderId, int cakeId)
    {
      DataSet orders = controller.CustomizeCakeImage(orderId, cakeId);
      string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
      return Request.CreateResponse(HttpStatusCode.OK, json);
    }

    [HttpGet]
        public HttpResponseMessage GetAdminOrderDetails(int orderId)
        {
            DataSet orders = controller.GetAdminOrderDetails(orderId);
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
    [HttpGet]
    public HttpResponseMessage CancelOrder(int orderId,int OrderDetailId)
    {
      int orders = controller.CancelOrder(orderId, OrderDetailId);
      string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
      return Request.CreateResponse(HttpStatusCode.OK, json);
    }
    [HttpGet]
        public HttpResponseMessage getCustomerOrderDetails(int orderId)
        {
            DataSet orders = controller.getCustomerOrderDetails(orderId);
            string json = JsonConvert.SerializeObject(orders, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
    }

}