using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
//using PushSharp.Apple;
//using PushSharp.Google;
//using PushSharp.Windows;
using System;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Security;
using System.Net.Sockets;
using System.Security.Authentication;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Configuration;
using System.Web.Http;
using FoodChapter;
using FoodChapter.DataCore;
using FoodChapter.Models;
using FoodChapter.DataCore.Managers;
using FoodChapter.DataManagers;

namespace FoodChapter.DataCore
{
    public class BusinessCoreController
    {
        #region USER
        internal int AuthenticateFaceBookUser(USER user)
        {
            return new UsersManager().AuthenticateFaceBookUser(user);
        }

        internal int AuthenticateGoogleUser(USER user)
        {
            return new UsersManager().AuthenticateGoogleUser(user);
        }

        public void SetCaptchUserSession(string captch)
        {
            SessionManager.SetCaptchUserSession(captch);
        }
        public int AuthenticateUser(string email, string password)
        {
            return new UsersManager().AuthenticateUser(email, password);
        }
        public int AuthenticateAdmin(string email, string password)
        {
            return new UsersManager().AuthenticateAdmin(email, password);
        }
        public DataSet GetDashBoardData(int vendorId = -1)
        {
            return new UsersManager().GetDashBoardData(vendorId);
        }
        public int saveQueries(EMAIL_DATA emailData)
        {
            return new UsersManager().saveQueries(emailData);
        }

        public DataSet GetAdminDashBoardData(int adminId)
        {
            return new UsersManager().GetAdminDashBoardData(adminId);
        }
        public DataSet GetAllUsers()
        {
            return new UsersManager().GetAllUsers();
        }
        public DataSet GetAllCategories()
        {
            return new UsersManager().GetAllCategories();
        }
        public DataSet GetAllAdmins()
        {
            return new UsersManager().GetAllAdmins();
        }
        public bool updateUser(USER user)
        {
            return new UsersManager().updateUser(user);
        }
        public bool EditCategory(CATEGORY cat)
        {
            return new UsersManager().EditCategory(cat);
        }
        public DataSet GetUserById(int userId)
        {
            return new UsersManager().GetUserById(userId);

        }
        public DataSet GetCategoryById(int catId)
        {
            return new UsersManager().GetCategoryById(catId);

        }
        internal DataSet GetUserReportData(DateTime fromDate, DateTime toDate)
        {
            return new UsersManager().GetUserReportData(fromDate, toDate);
        }
        public bool saveUser(USER user)
        {
            return new UsersManager().saveUser(user);
        }
        public int saveUserAtOrder(USER user)
        {
            return new UsersManager().saveUserAtOrder(user);
        }
        public bool SaveAdminUser(ADMIN admin)
        {
            return new UsersManager().SaveAdminUser(admin);
        }
        //public void UpdateUserImage(string vendorId, string path)
        //{
        //    new UsersManager().UpdateUserImage(vendorId, path);
        //}
        public void checkFBGoogleUser(USER u)
        {
            new UsersManager().checkFBGoogleUser(u);
        }
        #endregion

        #region VENDOR
        public DataSet GetFeaturedSellers()
        {
            return new VendorsManager().GetFeaturedSellers();
        }

        public bool SaveVendorReview(VENDOR_REVIEW review)
        {
            return new VendorsManager().SaveVendorReview(review);
        }
        public bool SaveInquiry(INQUIRY inquiry)
        {
          return new VendorsManager().SaveInquiry(inquiry);
        }

        public void SetCaptchVendorSession(string captch)
        {
            SessionManager.SetCaptchVendorSession(captch);
        }
        public int AuthenticateVendor(string email, string password)
        {
            return new VendorsManager().AuthenticateVendor(email, password);
        }
        internal int IsUniqueVendor(string businessEntity, string phone)
        {
            return new VendorsManager().IsUniqueVendor(businessEntity, phone);
        }
        internal int IsUniqueVendor(string businessEntity, string phone, int vendorId)
        {
            return new VendorsManager().IsUniqueVendor(businessEntity, phone, vendorId);
        }
        public DataSet GetAllVendors()
        {
            return new VendorsManager().GetAllVendors();
        }

        public DataSet GetVendorRating(int vendorId)
        {
            return new VendorsManager().GetVendorRating(vendorId);
        }

        public DataSet GetVendorsReview(int vendorId)
        {
            return new VendorsManager().GetVendorsReview(vendorId);
        }

        public DataSet GetVendors()
        {
            return new VendorsManager().GetVendors();
        }
        public DataSet GetAdminAllProducts()
        {
            return new ProductManager().GetAdminAllProducts();
        }
        public DataSet GetAdminAllCakes()
        {
            return new ProductManager().GetAdminAllCakes();
        }
        internal DataSet GetFeaturedVendorsforGalleryFilter()
        {
            return new VendorsManager().GetFeaturedVendorsforGalleryFilter();
        }

        public DataSet GetAllTypes()
        {
            return new ProductManager().GetAllTypes();
        }

        public DataSet SearchProductsByCriterias(int active, int delivery, int catagory, int vendorId)
        {
            return new ProductManager().SearchProductsByCriterias(active, delivery, catagory, vendorId);
        }
        public DataSet SearchCakesByCriterias(int active, int delivery, int vendorId)
        {
            return new ProductManager().SearchCakesByCriterias(active, delivery, vendorId);
        }
        public DataSet GetCakeDetail(int orderId, int cakeId)
        {
            return new ProductManager().GetCakeDetail(orderId, cakeId);
        }

        public DataSet GetAllEvents(string VendorId)
        {
            return new ProductManager().GetAllEvents(VendorId);
        }
        public DataSet GetAllFlavors(string VendorId)
        {
            return new ProductManager().GetAllFlavors(VendorId);
        }

        public DataSet GetAllProducts(int showCount)
        {
            return new ProductManager().GetAllProducts(showCount);
        }

        public DataSet GetProductsByPage(int showCount)
        {
            return new ProductManager().GetProductsByPage(showCount);
        }
        public DataSet GetCakesByPage(int showCount)
        {
            return new ProductManager().GetCakesByPage(showCount);
        }
        public DataSet GetAllDesserts(int showCount)
        {
            return new ProductManager().GetAllDesserts(showCount);
        }
        public DataSet GetAllFrozenFoods(int showCount)
        {
            return new ProductManager().GetAllFrozenFoods(showCount);
        }
        public DataSet GetAllCakes(int showCount)
        {
            return new ProductManager().GetAllCakes(showCount);
        }
        public int updateCakePrice(int cakeId, int? minPrice)
        {
            return new ProductManager().updateCakePrice(cakeId, minPrice);
        }
        public DataSet GetVendorById(string id)
        {
            return new VendorsManager().GetVendorById(id);
        }
        public DataSet GetVendorProfileByUniqueId(string uniqueId)
        {
            return new VendorsManager().GetVendorProfileByUniqueId(uniqueId);
        }
        public DataSet GetVendorProfileByEntityName(string entity)
        {
            return new VendorsManager().GetVendorProfileByEntityName(entity);
        }
        public DataSet CheckUserOrder(int userId)
        {
            return new VendorsManager().CheckUserOrder(userId);
        }

        public int saveVendor(VENDOR vendor)
        {
            return new VendorsManager().saveVendor(vendor);
        }
        public bool updateVendor(VENDOR vendor)
        {
            return new VendorsManager().updateVendor(vendor);

        }
        internal bool DeleteVendor(int vendorId)
        {
            return new VendorsManager().DeleteVendor(vendorId);
        }
        public int ApprovedByAdmin(int vendorId)
        {
            return new VendorsManager().ApprovedByAdmin(vendorId);
        }
        public int ApprovedProductsByAdmin(int productId)
        {
            return new ProductManager().ApprovedProductsByAdmin(productId);
        }
        public int ApprovedCakesByAdmin(int cakeId)
        {
            return new ProductManager().ApprovedCakesByAdmin(cakeId);
        }

        public bool DeleteUser(int userId)
        {
            return new UsersManager().DeleteUser(userId);
        }
        public bool DeleteCategory(int userId)
        {
            return new UsersManager().DeleteCategory(userId);
        }
        public bool DeleteAdminUser(int userId)
        {
            return new UsersManager().DeleteAdminUser(userId);
        }
        public DataSet SearchVendor(string vendorSearch)
        {
            return new VendorsManager().SearchVendor(vendorSearch);
        }
        public void UpdateVendorImage(string vendorId, string path)
        {
            new VendorsManager().UpdateVendorImage(vendorId, path);
        }
    public void UpdatePersonalImage(string vendorId, string path)
    {
      new VendorsManager().UpdatePersonalImage(vendorId, path);
    }
    public void UpdateCNICImage(string vendorId, string path)
        {
            new VendorsManager().UpdateCNICImage(vendorId, path);
        }
        public void UpdateProductImage(string pid, string path)
        {
            new ProductManager().UpdateProductImage(pid, path);
        }
        public void UpdateCakeImage(string cakeid, string path)
        {
            new ProductManager().UpdateCakeImage(cakeid, path);
        }
        public void UpdateCustomizedImage(string productID, string path)
        {
            new ProductManager().UpdateCustomizedImage(productID, path);
        }
        public DataSet getVendorOrderAndProduct(SellerSearchModel whereClause)
        {
            return new VendorsManager().getVendorOrderAndProduct(whereClause);
        }
        public int MarkFeatured( int vendorId)
        {
            return new VendorsManager().MarkFeatured(vendorId);
        }
        internal DataSet GetVendorProductsByPrice(int vendorId, int code)
        {
            return new VendorsManager().GetVendorProductsByPrice(vendorId, code);
        }
        internal DataSet GetProductsByVendor(int vendorId)
        {
            return new VendorsManager().GetProductsByVendor(vendorId);
        }
        internal DataSet GetVendorCakesByPrice(int vendorId, int code)
        {
            return new VendorsManager().GetVendorCakesByPrice(vendorId, code);
        }
        #endregion


        #region PRODUCT
        internal int IsUniqueCake(string cakeName, int vendorId)
        {
            return new ProductManager().IsUniqueCake(cakeName, vendorId);

        }

        internal int IsUniqueCake(string cakeName, int vendorId, int cakeId)
        {
            return new ProductManager().IsUniqueCake(cakeName, vendorId, cakeId);

        }
        internal int IsUniqueCat(string cakeName, int vendorId)
        {
            return new UsersManager().IsUniqueCat(cakeName, vendorId);

        }

        internal int IsUniqueCat(string cakeName, int vendorId, int cakeId)
        {
            return new UsersManager().IsUniqueCat(cakeName, vendorId, cakeId);

        }

        internal int IsUniqueProduct(string productName, int vendorId)
        {
            return new ProductManager().IsUniqueProduct(productName, vendorId);

        }

        internal int IsUniqueProduct(string productName, int vendorId, int productId)
        {
            return new ProductManager().IsUniqueProduct(productName, vendorId, productId);

        }

        public DataSet SearchProductByName(string productSearch, int productType)
        {
            return new ProductManager().SearchProductByName(productSearch, productType);
        }

        public DataSet SearchProductByVendorId(int vendorId, int catagoryId, int showCount)
        {
            return new ProductManager().SearchProductByVendorId(vendorId, catagoryId, showCount);
        }
        public DataSet SearchProductByVendorId(int vendorId, int catagoryId, int showCount, int subCategoryId)
        {
            return new ProductManager().SearchProductByVendorId(vendorId, catagoryId, showCount, subCategoryId);
        }

        public DataSet TopSixProducts(int catagoryId)
        {
            return new ProductManager().TopSixProducts(catagoryId);
        }
        public DataSet TopRelatedProducts()
        {
            return new ProductManager().TopRelatedProducts();
        }
        public DataSet AllProducts(int catagoryId)
        {
            return new ProductManager().AllProducts(catagoryId);
        }
        public DataSet GalleryProducts(int category,int page)
        {
            return new ProductManager().GalleryProducts(category,page);
        }

        public DataSet TopSixCakes()
        {
            return new ProductManager().TopSixCakes();

        }
        public DataSet TopRelatedCakes()
        {
            return new ProductManager().TopRelatedCakes();

        }
        public DataSet AllCakes(int page)
        {
            return new ProductManager().AllCakes(page);

        }

        public DataSet GetTopSixVendors()
        {
            return new VendorsManager().GetTopSixVendors();

        }
        public DataSet SearchProductsByVendorId(int vendorId)
        {
            return new ProductManager().SearchProductByVendorId(vendorId);
        }
        public DataSet SearchAllProducts()
        {
            return new ProductManager().SearchAllProducts();
        }
        public DataSet SearchAllCakes()
        {
            return new ProductManager().SearchAllCakes();
        }
        public DataSet SearchProductByVendorId(int vendorId)
        {
            return new ProductManager().SearchProductByVendorId(vendorId);
        }

        public DataSet SearchProductByProductId(int productId)
        {
            return new ProductManager().SearchProductByProductId(productId);
        }

        public DataSet SearchProductByProductType(int ProductType)
        {
            return new ProductManager().SearchProductByProductType(ProductType);
        }

        public DataSet GetLatestProducts(int topProducts)
        {
            return new ProductManager().GetLatestProducts(topProducts);
        }

        public bool SaveProductSubCatagory(SUB_CATEGORIES subCatagory)
        {
            return new ProductManager().SaveProductSubCatagory(subCatagory);
        }

        public int SaveProduct(PRODUCT product)
        {
            return new ProductManager().SaveProduct(product);
        }

        public int UpdateProduct(PRODUCT product)
        {
            return new ProductManager().UpdateProduct(product);
        }

        public DataSet GetProductSubCatagories(int catgoryId, int vendorId)
        {
            return new ProductManager().GetProductSubCatagories(catgoryId, vendorId);
        }
        internal bool DeleteProduct(int productId)
        {
            return new ProductManager().DeleteProduct(productId);
        }
        public DataSet SearchProductByVendorName(string name)
        {
            return new ProductManager().SearchProductByVendorName(name);
        }
        public DataSet SearchCakeByVendorName(string name)
        {
            return new ProductManager().SearchCakeByVendorName(name);
        }
        #endregion


        #region PRODUCT_TAGS
        public bool SaveProductTag(PRODUCT_TAGS productTag)
        {
            return new ProductManager().SaveProductTag(productTag);
        }

        public bool SaveCakeFlavour(CAKE_FLAVORS flavour)
        {
            return new ProductManager().SaveCakeFlavour(flavour);
        }

        public bool SaveCakeEvents(CAKE_EVENTS events)
        {
            return new ProductManager().SaveCakeEvents(events);
        }
        public DataSet GetProductTagsByProductId(int productId)
        {
            return new ProductManager().GetProductTagsByProductId(productId);
        }

        public DataSet SearchProductByProductTag(string productTag)
        {
            return new ProductManager().SearchProductByProductTag(productTag);
        }
        public DataSet SearchVendorProductByProductTag(string productTag, int vendorId)
        {
            return new ProductManager().SearchVendorProductByProductTag(productTag, vendorId);
        }
        public DataSet SearchCakesByCakeTag(string cakeTag)
        {
            return new ProductManager().SearchCakesByCakeTag(cakeTag);
        }
        public DataSet SearchVendorCakesByCakeTag(string cakeTag, int vendorId)
        {
            return new ProductManager().SearchVendorCakesByCakeTag(cakeTag, vendorId);
        }
        public bool DeleteProductTag(int tagId)
        {
            return new ProductManager().DeleteProductTag(tagId);
        }
        #endregion

        #region OrderDetail
        public bool SaveOrderDetail(ORDER_DETAILS orderDetail)
        {
            return new OrderManager().SaveOrderDetail(orderDetail);
        }
        public bool DeleteOrderDetail(int OrderId)
        {
            return new OrderManager().DeleteOrderDetail(OrderId);
        }
        #endregion

        #region Order
        internal int SaveOrder(ORDER order)
        {
            return new OrderManager().SaveOrder(order);
        }
        public bool DeleteOrder(int OrderId)
        {
            return new OrderManager().DeleteOrder(OrderId);
        }

        public DataSet GetSalesReport(DateTime fromDate, DateTime toDate, int vendroId, int productId, int productType)
        {
            return new OrderManager().GetSalesReport(fromDate, toDate, vendroId, productId, productType);
        }

        public DataSet GetOrderReport(int vendorId)
        {
            return new OrderManager().GetOrderReport(vendorId);
        }
        public DataSet GetPreviousOrderReport(int vendorId)
        {
            return new OrderManager().GetPreviousOrderReport(vendorId);
        }
        public DataSet AdminPendingOrder()
        {
            return new OrderManager().AdminPendingOrder();
        }
        public DataSet GetRejectedOrderReport(int vendorId)
        {
            return new OrderManager().GetRejectedOrderReport(vendorId);
        }
        public DataSet GetAdminRejectedOrderReport()
        {
            return new OrderManager().GetAdminRejectedOrderReport();
        }
        public DataSet GetCompletedOrderReport(int vendorId)
        {
            return new OrderManager().GetCompletedOrderReport(vendorId);
        }
        public DataSet GetAdminCompletedOrderReport()
        {
            return new OrderManager().GetAdminCompletedOrderReport();
        }
        public DataSet GetCustomerData(int orderId)
        {
            return new OrderManager().GetCustomerData(orderId);
        }

        public DataSet GetOrderDetails(int orderId, int vendorId)
        {
            return new OrderManager().GetOrderDetails(orderId, vendorId);
        }
        public bool UpdateOrderInfo(ORDER_DETAILS order)
        {
            return new OrderManager().UpdateOrderInfo(order);
        }
        public DataSet GetOrderDetail(int orderId)
        {
            return new OrderManager().GetOrderDetail(orderId);
        }
        public DataSet getCustomerOrderDetails(int orderId)
        {
            return new OrderManager().getCustomerOrderDetails(orderId);
        }
        public DataSet GetVendorOrderDetails(int orderId, int vendorId)
        {
            return new OrderManager().GetVendorOrderDetails(orderId, vendorId);
        }
    public DataSet CustomizeCakeImage(int orderId, int cakeId)
    {
      return new OrderManager().CustomizeCakeImage(orderId, cakeId);
    }
    public DataSet GetAdminOrderDetails(int orderId)
        {
            return new OrderManager().GetAdminOrderDetails(orderId);
        }
        public int CancelOrder(int orderId, int OrderDetailId)
        {
            return new OrderManager().CancelOrder(orderId, OrderDetailId);
        }
        public int DeliveredOrder(int orderId)
        {
            return new OrderManager().DeliveredOrder(orderId);
        }


        public int RejectedOrder(int orderId)
        {
            return new OrderManager().RejectedOrder(orderId);
        }
        #endregion

        #region Cake

        public int SaveCake(CAKE cake)
        {
            return new ProductManager().SaveCake(cake);
        }
        public bool SaveCakeTag(CAKE_TAGS cakeTag)
        {
            return new ProductManager().SaveCakeTag(cakeTag);
        }
        public DataSet SearchCakeByCakeId(int cakeId)
        {
            return new ProductManager().SearchCakeByCakeId(cakeId);
        }
        public bool SaveCakeCustomizeDetail(CAKE_CUSTOMIZE_DETAIL cakeDetail)
        {
            return new ProductManager().SaveCakeCustomizeDetail(cakeDetail);
        }
        public DataSet GetCakeTagsByCakeId(int cakeId)
        {
            return new ProductManager().GetCakeTagsByCakeId(cakeId);
        }
        public DataSet GetCakeEventsByCakeId(int cakeId)
        {
            return new ProductManager().GetCakeEventsByCakeId(cakeId);
        }
        public DataSet GetCakeFlavorsByCakeId(int cakeId)
        {
            return new ProductManager().GetCakeFlavorsByCakeId(cakeId);
        }
        public int UpdateCake(CAKE cake)
        {
            return new ProductManager().UpdateCake(cake);
        }
        internal bool DeleteCake(int cakeId)
        {
            return new ProductManager().DeleteCake(cakeId);
        }

        public DataSet GetAllCakeFlavors(int cakeId)
        {
            return new ProductManager().GetAllCakeFlavors(cakeId);

        }

        public DataSet SearchCakeByVendorId(int vendorId, int showCount)
        {
            return new ProductManager().SearchCakeByVendorId(vendorId, showCount);
        }

        public DataSet GetInquirtList(int vendorId)
        {
          return new ProductManager().GetInquirtList(vendorId);
        }
    public DataSet GetAdminInquirtList()
    {
      return new UsersManager().GetAdminInquirtList();
    }
    #endregion

    public bool SaveCakeTier(CAKE_TIERS cakeTier)
        {
            return new ProductManager().SaveCakeTier(cakeTier);
        }
        public bool saveCategories(CATEGORY cat)
        {
            return new UsersManager().saveCategories(cat);
        }

        public bool SaveFlavour(FLAVOR flavor)
        {
            return new ProductManager().SaveFlavour(flavor);

        }


        public DataSet GetCakeTierDetail(int cakeId)
        {
            return new ProductManager().GetCakeTierDetail(cakeId);
        }

        internal bool SaveEvent(EVENT events)
        {
            return new ProductManager().SaveEvent(events);
        }

        public bool uniqueEmail(int userType, string email, int id)
        {
            return new UsersManager().uniqueEmail(userType, email, id);
        }
        internal int uniqueEmailforCustomerAtPlaceOrder(string email)
        {
            return new UsersManager().uniqueEmailforCustomerAtPlaceOrder(email);
        }

        public DataSet GetTierData(int cakeId)
        {
            return new ProductManager().GetTierData(cakeId);
        }
        public string fetchUsername(int userid)
        {
            return new UsersManager().fetchUsername(userid);
        }
    }
}