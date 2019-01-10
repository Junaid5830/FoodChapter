using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Xml;
using Context = System.Web.HttpContext;
using System.Collections;

namespace FoodChapter
{
    public class SessionManager
    {
        #region Customize Cake Image session handling
        public static void SetCakeImageSession(int id)
        {
            ArrayList obj = GetCakeImageSession();
            if (obj == null)
                obj = new ArrayList();
            obj.Add(id);
            HttpContext.Current.Session["CAKE_IMAGE"] = obj;
        }
        public static ArrayList GetCakeImageSession()
        {
            return (ArrayList)Context.Current.Session["CAKE_IMAGE"];
            
        }
        public static void RemoveCakeImageSession()
        {
            HttpContext.Current.Session.Remove("CAKE_IMAGE");

        }
        public static bool isCakeImageSessionSet()
        {
            if (Context.Current.Session["CAKE_IMAGE"] != null)
            {
                ArrayList al = GetCakeImageSession();
                if (al.Count > 0)
                    return true;
                else
                    return false;
            }
            else
                return false;
        }
        #endregion


        #region Admin session handling
        public static void SetAdminSession(int id)
        {
            HttpContext.Current.Session["ADMIN_ID"] = id;
        }
        public static string GetAdminSession()
        {
            if (isAdminSessionSet())
                return Convert.ToString(Context.Current.Session["ADMIN_ID"]);
            else
                return Convert.ToString(0);
        }
        public static void RemoveAdminSession()
        {
            Context.Current.Session.Remove("ADMIN_ID");
        }
        public static bool isAdminSessionSet()
        {
            if (Context.Current.Session["ADMIN_ID"] != null)
                return true;
            else
                return false;
        }
        #endregion

        #region User session handling
        public static void SetUserSession(int id)
        {
            HttpContext.Current.Session["USER_ID"] = id;
        }
        public static string GetUserSession()
        {
            if (isUserSessionSet())
                return Convert.ToString(Context.Current.Session["USER_ID"]);
            else
                return Convert.ToString(0);
        }
        public static void RemoveUserSession()
        {
            Context.Current.Session.Remove("USER_ID");
        }
        public static bool isUserSessionSet()
        {
            if (Context.Current.Session["USER_ID"] != null)
                return true;
            else
                return false;
        }
        #endregion

        #region Username session handling
        public static void SetUsernameSession(string name)
        {
            HttpContext.Current.Session["USERNAME"] = name;
        }
        public static string GetUsernameSession()
        {
            if (isUsernameSessionSet())
                return Convert.ToString(Context.Current.Session["USERNAME"]);
            else
                return Convert.ToString(0);
        }
        public static void RemoveUsernameSession()
        {
            Context.Current.Session.Remove("USERNAME");
        }
        public static bool isUsernameSessionSet()
        {
            if (Context.Current.Session["USERNAME"] != null)
                return true;
            else
                return false;
        }
        #endregion


        #region Vendor session handling
        public static void SetVendorSession(int id)
        {
            HttpContext.Current.Session["VENDOR_ID"] = id;
        }
        public static string GetVendorSession()
        {
            if (isVendorSessionSet())
                return Convert.ToString(Context.Current.Session["VENDOR_ID"]);
            else
                return Convert.ToString(0);
        }
        public static void RemoveVendorSession()
        {
            HttpContext.Current.Session.Remove("VENDOR_ID");
            
        }
        public static bool isVendorSessionSet()
        {
            if (Context.Current.Session["VENDOR_ID"] != null)
                return true;
            else
                return false;
        }
        #endregion

        #region VendorImage session handling
        public static void SetVendorImageSession(string id)
        {
            HttpContext.Current.Session["VENDOR_IMAGE"] = id;
        }
        public static string GetVendorImageSession()
        {
            if (isVendorImageSessionSet())
                return Convert.ToString(Context.Current.Session["VENDOR_IMAGE"]);
            else
                return Convert.ToString(0);
        }
        public static void RemoveVendorImageSession()
        {
            Context.Current.Session.Remove("VENDOR_IMAGE");
        }
        public static bool isVendorImageSessionSet()
        {
            if (Context.Current.Session["VENDOR_IMAGE"] != null)
                return true;
            else
                return false;
        }
        #endregion

        #region Order session handling
        public static void SetOrderSession(int id)
        {
            HttpContext.Current.Session["ORDER_ID"] = id;
        }
        public static string GeOrderSession()
        {
            if (isOrderSessionSet())
                return Convert.ToString(Context.Current.Session["ORDER_ID"]);
            else
                return Convert.ToString(0);
        }
        public static void RemoveGeOrderSession()
        {
            Context.Current.Session.Remove("ORDER_ID");
        }
        public static void SetOrderPaymentSession(int id)
        {
            HttpContext.Current.Session["ORDER_PAYMENT"] = id;
        }
        public static string GetOrderPaymentSession()
        {
            return Convert.ToString(Context.Current.Session["ORDER_PAYMENT"]);
        }
        public static void RemoveGeOrderPayment()
        {
            Context.Current.Session.Remove("ORDER_PAYMENT");
        }
        public static void SetOrderPaymentDate(string orderDate)
        {
            HttpContext.Current.Session["ORDER_DATE"] = orderDate;
        }
        public static string GetOrderPaymentDate()
        {
            return Context.Current.Session["ORDER_DATE"].ToString();
        }
        public static void RemoveOrderDate()
        {
            Context.Current.Session.Remove("ORDER_DATE");
        }
        public static bool isOrderSessionSet()
        {
            if (Context.Current.Session["ORDER_ID"] != null)
                return true;
            else
                return false;
        }

        public static void SetOrderIndexSession(int id)
        {
            HttpContext.Current.Session["ORDER_INDEX"] = id;
        }
        public static string GetOrderIndexSession()
        {
            return Convert.ToString(Context.Current.Session["ORDER_INDEX"]);
        }
        public static void RemoveOrderIndexSession()
        {
            Context.Current.Session.Remove("ORDER_INDEX");
        }
        public static bool isOrderIndexSessionSet()
        {
            if (Context.Current.Session["ORDER_INDEX"] != null)
                return true;
            else
                return false;
        }
        #endregion

        #region Product session handling
        public static void SetProductSession(int id)
        {
            HttpContext.Current.Session["PRODUCT_ID"] = id;
        }
        public static string GetProductSession()
        {
            if (isProductSessionSet())
                return Convert.ToString(Context.Current.Session["PRODUCT_ID"]);
            else
                return Convert.ToString(0);
        }
        public static void RemoveProductSession()
        {
            Context.Current.Session.Remove("PRODUCT_ID");
        }
        public static bool isProductSessionSet()
        {
            if (Context.Current.Session["PRODUCT_ID"] != null)
                return true;
            else
                return false;
        }
        #endregion

        #region Cake session handling
        public static void SetCakeSession(int id)
        {
            HttpContext.Current.Session["CAKE_ID"] = id;
        }
        public static string GetCakeSession()
        {
            if (isCakeSessionSet())
                return Convert.ToString(Context.Current.Session["CAKE_ID"]);
            else
                return Convert.ToString(0); 
        }
        public static void RemoveCakeSession()
        {
            Context.Current.Session.Remove("CAKE_ID");
        }
        public static bool isCakeSessionSet()
        {
            if (Context.Current.Session["CAKE_ID"] != null)
                return true;
            else
                return false;
        }
        #endregion

        #region Cart session handling
        public static void SetCartSession(int id)
        {
            HttpContext.Current.Session["CART_STATUS"] = id;
        }
        public static string GetCartSession()
        {
            if (isCartSessionSet())
                return Convert.ToString(Context.Current.Session["CART_STATUS"]);
            else
                return "0";
        }
        public static void RemoveCartSession()
        {
            Context.Current.Session.Remove("CART_STATUS");
        }
        public static bool isCartSessionSet()
        {
            if (Context.Current.Session["CART_STATUS"] != null)
                return true;
            else
                return false;
        }
        #endregion

        #region Captch Session

        public static void SetCaptchVendorSession(string captch)
        {
            HttpContext.Current.Session["VENDOR_CAPTCHA"] = captch;
        }
        public static string GetCaptchVendorSession()
        {
            return Convert.ToString(Context.Current.Session["VENDOR_CAPTCHA"]);
        }
        public static void SetCaptchUserSession(string captch)
        {
            HttpContext.Current.Session["USER_CAPTCHA"] = captch;
        }
        public static string GetCaptchUserSession()
        {
            return Convert.ToString(Context.Current.Session["USER_CAPTCHA"]);
        }
        #endregion

        #region Category session handling
        public static void SetCategorySession(int id)
        {
            HttpContext.Current.Session["CATEGORY"] = id;
        }
        public static string GetCategorySession()
        {
            if (isCategorySessionSet())
                return Convert.ToString(Context.Current.Session["CATEGORY"]);
            else
                return Convert.ToString(0);
        }
        public static void RemoveCategorySession()
        {
            HttpContext.Current.Session.Remove("CATEGORY");

        }
        public static bool isCategorySessionSet()
        {
            if (Context.Current.Session["CATEGORY"] != null)
                return true;
            else
                return false;
        }
        #endregion

        #region ShowVP session handling
        public static void SetShowVPSession(int id)
        {
            HttpContext.Current.Session["SHOW_VP"] = id;
        }
        public static string GetShowVPSession()
        {
            if (isShowVPSessionSet())
                return Convert.ToString(Context.Current.Session["SHOW_VP"]);
            else
                return Convert.ToString(0);
        }
        public static void RemoveShowVPSession()
        {
            HttpContext.Current.Session.Remove("SHOW_VP");

        }
        public static bool isShowVPSessionSet()
        {
            if (Context.Current.Session["SHOW_VP"] != null)
                return true;
            else
                return false;
        }
        #endregion

        #region ViewVendor session handling
        public static void SetViewVendorSession(int id)
        {
            HttpContext.Current.Session["VIEW_VENDOR_ID"] = id;
        }
        public static string GetViewVendorSession()
        {
            if (isViewVendorSessionSet())
                return Convert.ToString(Context.Current.Session["VIEW_VENDOR_ID"]);
            else
                return Convert.ToString(0);
        }
        public static void RemoveViewVendorSession()
        {
            HttpContext.Current.Session.Remove("VIEW_VENDOR_ID");

        }
        public static bool isViewVendorSessionSet()
        {
            if (Context.Current.Session["VIEW_VENDOR_ID"] != null)
                return true;
            else
                return false;
        }
        #endregion

        #region View Product session handling
        public static void SetViewProductSession(int id)
        {
            HttpContext.Current.Session["VIEW_PRODUCT_ID"] = id;
        }
        public static void SetViewCakeSession(int id)
        {
            HttpContext.Current.Session["VIEW_CAKE_ID"] = id;
        }
        public static string GetViewProductSession()
        {
            if (isViewProductSessionSet())
                return Convert.ToString(Context.Current.Session["VIEW_PRODUCT_ID"]);
            else
                return Convert.ToString(0);
        }
        public static void RemoveViewProductSession()
        {
            Context.Current.Session.Remove("VIEW_PRODUCT_ID");
        }
        public static bool isViewProductSessionSet()
        {
            if (Context.Current.Session["VIEW_PRODUCT_ID"] != null)
                return true;
            else
                return false;
        }
        #endregion

        //#region View  Cake session handling
        //public static void SetViewCakeSession(int id)
        //{
        //    HttpContext.Current.Session["VIEW_CAKE_ID"] = id;
        //}
        //public static string GetViewCakeSession()
        //{
        //    if (isViewCakeSessionSet())
        //        return Convert.ToString(Context.Current.Session["VIEW_CAKE_ID"]);
        //    else
        //        return Convert.ToString(0);
        //}
        //public static void RemoveViewCakeSession()
        //{
        //    Context.Current.Session.Remove("VIEW_CAKE_ID");
        //}
        //public static bool isViewCakeSessionSet()
        //{
        //    if (Context.Current.Session["VIEW_CAKE_ID"] != null)
        //        return true;
        //    else
        //        return false;
        //}
        //#endregion

    }
}