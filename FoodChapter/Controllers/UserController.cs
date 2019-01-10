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

namespace FoodChapter.Controllers
{
    //    [EnableCors("AllowAllHeaders")]
    public class UserController : ApiController
    {
        private static BusinessCoreController controller = new BusinessCoreController();
        public static string apiKey = "AIzaSyC67qOLCwRi1_6Z8g1zKA6OQkJekYIBDz8";
        // GET api/<controller>
        [HttpGet]

        public HttpResponseMessage GetAllUsers()
        {
            DataSet users = controller.GetAllUsers();
            string json = JsonConvert.SerializeObject(users, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

    [HttpGet]

    public HttpResponseMessage GetAdminInquirtList()
    {
      DataSet cakes = controller.GetAdminInquirtList();
      string json = JsonConvert.SerializeObject(cakes, Formatting.Indented);
      return Request.CreateResponse(HttpStatusCode.OK, json);
    }
    [HttpGet]

        public HttpResponseMessage GetAllCategories()
        {
            DataSet users = controller.GetAllCategories();
            string json = JsonConvert.SerializeObject(users, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]
        public HttpResponseMessage SetCaptchUserSession(string captcha)
        {
            SessionManager.SetCaptchUserSession(captcha);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpGet]
        public HttpResponseMessage GetCaptchUserSession()
        {
            string captcha = SessionManager.GetCaptchUserSession();
            return Request.CreateResponse(HttpStatusCode.OK, captcha);
        }
        [HttpGet]
        public HttpResponseMessage DeleteUser(int userId)
        {

            bool result = controller.DeleteUser(userId);
            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpGet]
        public HttpResponseMessage DeleteCategory(int userId)
        {

            bool result = controller.DeleteCategory(userId);
            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpGet]

        public HttpResponseMessage GetUserById(int userId)
        {
            DataSet users = controller.GetUserById(userId);
            string json = JsonConvert.SerializeObject(users, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]

        public HttpResponseMessage GetCategoryById(int catId)
        {
            DataSet users = controller.GetCategoryById(catId);
            string json = JsonConvert.SerializeObject(users, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]

        public HttpResponseMessage GetDashBoardData(int vendorId)
        {
            DataSet users = controller.GetDashBoardData(vendorId);
            string json = JsonConvert.SerializeObject(users, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [HttpGet]

        public HttpResponseMessage GetAdminDashBoardData(int adminId)
        {
            DataSet users = controller.GetAdminDashBoardData(adminId);
            string json = JsonConvert.SerializeObject(users, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpPost]
        public HttpResponseMessage updateUser([FromBody] USER user)
        {
            if (controller.uniqueEmail(1, user.EMAIL, user.USER_ID))
            {
                user.UPDATED_ON = DateTime.Now;

                bool result = controller.updateUser(user);
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
        [HttpPost]
        public HttpResponseMessage EditCategory([FromBody] CATEGORY cat)
        {

            cat.UPDATED_ON = DateTime.Now;
            cat.UPDATED_BY = 0;
            bool result = controller.EditCategory(cat);
            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);



        }

        [HttpPost]

        // POST api/<controller>
        public HttpResponseMessage authenticateUser([FromBody]USER user)
        {
            string username = user.EMAIL.Trim();
            string password = user.PASSWORD.Trim();

            int result = controller.AuthenticateUser(username, password);
            if (result > 0)
            {
                SessionManager.SetUserSession(result);
                SessionManager.SetUsernameSession(controller.fetchUsername(result));
                return Request.CreateResponse(HttpStatusCode.OK, result);

            }
            else
                return Request.CreateResponse(HttpStatusCode.Unauthorized, result);
        }

        [HttpPost]

        public HttpResponseMessage AuthenticateFaceBookUser([FromBody]USER user)
        {

            int result = controller.AuthenticateFaceBookUser(user);
            if (result > 0)
            {
                SessionManager.SetUserSession(result);
                SessionManager.SetUsernameSession(controller.fetchUsername(result));
                return Request.CreateResponse(HttpStatusCode.OK, result);

            }
            else
                return Request.CreateResponse(HttpStatusCode.Unauthorized, result);
        }

        [HttpGet]

        public HttpResponseMessage AuthenticateGoogleUser([FromBody]USER user)
        {

            int result = controller.AuthenticateGoogleUser(user);
            if (result > 0)
            {
                SessionManager.SetUserSession(result);
                SessionManager.SetUsernameSession(controller.fetchUsername(result));
                return Request.CreateResponse(HttpStatusCode.OK, result);

            }
            else
                return Request.CreateResponse(HttpStatusCode.Unauthorized, result);
        }

        [HttpPost]

        // POST api/<controller>
        public HttpResponseMessage authenticateAdmin([FromBody]ADMIN user)
        {
            try
            {
                string username = user.EMAIL.Trim();
                string password = user.PASSWORD.Trim();

                int result = controller.AuthenticateAdmin(username, password);
                if (result > 0)
                {
                    SessionManager.SetAdminSession(result);
                    return Request.CreateResponse(HttpStatusCode.OK, result);

                }
                else
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, result);
            }
            catch (Exception ex)
            {
                string json = JsonConvert.SerializeObject(ex.Message, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }
        [System.Web.Http.AcceptVerbs("POST")]
        [ActionName("saveUser")]
        [System.Web.Http.HttpPost]
        [System.Web.Http.HttpOptions]
        public HttpResponseMessage saveUser([FromBody] USER user)
        {
            if (controller.uniqueEmail(1, user.EMAIL, 0))
            {
                user.IS_ACTIVE = true;
                user.CREATED_ON = DateTime.Now;
                user.CREATED_BY = 0;
                bool result = controller.saveUser(user);
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

        public HttpResponseMessage GetAllAdmins()
        {
            DataSet users = controller.GetAllAdmins();
            string json = JsonConvert.SerializeObject(users, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }
        [System.Web.Http.AcceptVerbs("POST")]
        [ActionName("SaveAdminUser")]
        [System.Web.Http.HttpPost]
        [System.Web.Http.HttpOptions]
        public HttpResponseMessage SaveAdminUser([FromBody] ADMIN admin)
        {
            if (controller.uniqueEmail(1, admin.EMAIL, 0))
            {
                admin.IS_ACTIVE = true;
                admin.CREATED_ON = DateTime.Now;
                admin.CREATED_BY = 0;
                bool result = controller.SaveAdminUser(admin);
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
        public HttpResponseMessage DeleteAdminUser(int userId)
        {

            bool result = controller.DeleteAdminUser(userId);
            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpPost]
        public HttpResponseMessage GetUserReportData(DateTime fromDate, DateTime toDate)
        {
            DataSet users = controller.GetUserReportData(fromDate, toDate);
            string json = JsonConvert.SerializeObject(users, Formatting.Indented);
            return Request.CreateResponse(HttpStatusCode.OK, json);
        }

        [HttpPost]
        public HttpResponseMessage IsUniqueCat([FromBody] CATEGORY cat)
        {
            int result = 0;
            if (cat.CATEGORY_ID == 0)
                result = controller.IsUniqueCat(cat.DESCRIPTION, (int)cat.CATEGORY_ID);
            else
                result = controller.IsUniqueCat(cat.DESCRIPTION, (int)cat.CATEGORY_ID, cat.CATEGORY_ID);

            if (result > 0)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpPost]
        public HttpResponseMessage saveCategories([FromBody] CATEGORY cat)
        {
            cat.IS_ACTIVE = true;
            cat.CREATED_ON = DateTime.Now;
            cat.CATEGORY_ID = 0;
            bool result = controller.saveCategories(cat);
            if (result)
                return Request.CreateResponse(HttpStatusCode.OK, result);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError, result);
        }
        [HttpGet]
        public HttpResponseMessage checkFBGoogleUser([FromBody] USER u)
        {
            controller.checkFBGoogleUser(u);
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }
        [HttpPost]
        public HttpResponseMessage SendEmailToUser(EMAIL_DATA emailData)
        {
            try
            {
                int result = controller.saveQueries(emailData);
                EmailHelper helper = new EmailHelper();
                helper.sendEmail("Customer Query", emailData.MESSAGE, "info@foodchapter.pk");
                if(result > 0)
                    return Request.CreateResponse(HttpStatusCode.OK, true);
                else
                    return Request.CreateResponse(HttpStatusCode.OK, false);
            }
            catch(Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message + ex.InnerException.Message);
            }
            //Thread t1 = new Thread(delegate()
            //{
            //    EmailHelper.SendUserEmail(detail[0], detail[1], detail[2], detail[3]);
            //});
            //t1.Start();
            ////EmailHelper.SendUserEmail(detail[0], detail[1], detail[2], detail[3]);
            //return Request.CreateResponse(HttpStatusCode.OK, true);
        }
    }
}