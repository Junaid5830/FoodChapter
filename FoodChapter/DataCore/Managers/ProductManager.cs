using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
//using WebCrawler;
using FoodChapter.DataAccess;
using System.Data;
using System.Data.SqlClient;
//using Utilities;
using System.Configuration;
//using OpenTokSDK;
using Newtonsoft;
//using MySql.Data.MySqlClient;
using FoodChapter.Models;
using System.Data.Entity.Migrations;

namespace FoodChapter.DataCore.Managers
{
  public class ProductManager : DABase
  {
    private FoodChapterEntities db = new FoodChapterEntities();

    #region Product

    internal DataSet SearchProductByName(string productSearch, int productType)
    {
      SqlDataAdapter da = new SqlDataAdapter();
      SqlCommand cmd = new SqlCommand(@"select P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from PRODUCTS p inner join VENDORS V on P.VENDOR_ID = V.VENDOR_ID
                            where V.VENDOR_ID = P.VENDOR_ID AND P.NAME like @PName AND 
                            ( -1 in (@type)  OR (SELECT CATEGORY_ID FROM PRODUCT_SUB_CATAGORY
							WHERE ID = p.PRODUCT_TYPE)  in {1} )", connection);
      cmd.Parameters.AddWithValue("PName", productSearch);
      cmd.Parameters.AddWithValue("type", productType);
      da.SelectCommand = cmd;
      DataSet ds = new DataSet();
      OpenDBConnection();
      da.Fill(ds);
      CloseDBConnection();

      //DataSet ds = ExecuteDataSet(string.Format("select * from VENDORS where  BUSINESS_ENTITY_NAME = '{0}' and PRIMARY_WORKSPACE_PHONE = '{1}'", businessEntity, phone));
      if (ds != null && ds.Tables[0].Rows.Count > 0)
        return ds;
      else
        return ds;
      //string query = @"select P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
      //                      from PRODUCTS p inner join VENDORS V on P.VENDOR_ID = V.VENDOR_ID
      //                      where V.VENDOR_ID = P.VENDOR_ID AND P.NAME like '%{0}%' AND 
      //                      ( -1 in ({1})  OR (SELECT CATEGORY_ID FROM PRODUCT_SUB_CATAGORY
      //	WHERE ID = p.PRODUCT_TYPE)  in {1} )";
      //      query = string.Format(query, productSearch, productType);
      //      DataSet users = ExecuteDataSet(query);
      //      users.Tables[0].TableName = "PRODUCT";
      //      return users;
    }

    internal DataSet GetCakeDetail(int orderId, int cakeId)
    {
      string query = @"select (SELECT DESCRIPTION FROM FLAVOR WHERE FLAVOR_ID = (SELECT FLAVOR_ID FROM CAKE_FLAVORS
                                WHERE CAKE_FLAVOR_ID = ccd.CAKE_FALVOUR_ID)) AS FLAVOUR,
                             TIER_ORDER, TIER_WEIGHT, FLAVOUR_PRICE
                              from cake_customize_detail ccd where CAKE_ID = {0} and ORDER_ID = {1}";
      query = string.Format(query, cakeId, orderId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CAKE_DETAIL";
      return users;
    }

        internal DataSet SearchProductByVendorId(int vendorId)
        {
            string query = @"select P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from PRODUCTS p inner join VENDORS V on P.VENDOR_ID = V.VENDOR_ID
                            where P.VENDOR_ID = {0} and P.IS_ACTIVE = 1";
            query = string.Format(query, vendorId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "PRODUCTS";
            return users;
        }
    internal DataSet SearchAllProducts()
    {
      string query = @"select P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from PRODUCTS p inner join VENDORS V on P.VENDOR_ID = V.VENDOR_ID
                            ";
      query = string.Format(query);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCTS";
      return users;
    }
    internal DataSet GetAdminAllProducts()
    {
      string query = "SELECT p.*, (case when IS_APPROVED = 1 then 'Approved' else 'Pending' END) STATUS from PRODUCTS p";
      DataSet vendors = ExecuteDataSet(query);
      vendors.Tables[0].TableName = "PRODUCTS";
      return vendors;
    }
    internal DataSet GetAdminAllCakes()
    {
      string query = "SELECT c.*, (case when IS_APPROVED = 1 then 'Approved' else 'Pending' END) STATUS from CAKES c";
      DataSet vendors = ExecuteDataSet(query);
      vendors.Tables[0].TableName = "CAKES";
      return vendors;
    }
    internal DataSet SearchAllCakes()
    {
      string query = @"select C.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from CAKES c inner join VENDORS V on C.VENDOR_ID = V.VENDOR_ID";
      query = string.Format(query);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CAKES";
      return users;
    }
    internal DataSet SearchProductByVendorId(int vendorId, int catagoryId, int showCount)
    {
      string query = @"select top(12) P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from PRODUCTS p , VENDORS V
                            where V.VENDOR_ID = P.VENDOR_ID AND P.VENDOR_ID = {0}
                            and (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) = {1}
                            and PRODUCT_ID not IN (Select top({2}) PRODUCT_ID from PRODUCTS 
	                        where (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) = {1} order by CREATED_ON desc)
	                        order by CREATED_ON desc";
      query = string.Format(query, vendorId, catagoryId, showCount);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCTS";
      return users;
    }
    internal DataSet SearchProductByVendorId(int vendorId, int catagoryId, int showCount, int subCategoryId)
    {
      string query = @"select top(12) P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from PRODUCTS p , VENDORS V
                            where V.VENDOR_ID = P.VENDOR_ID AND P.VENDOR_ID = {0}
                            and p.PRODUCT_SUB_CATEGORY_ID = {3}
                            and (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) = {1}
                           
                            and PRODUCT_ID not IN (Select top({2}) PRODUCT_ID from PRODUCTS 
	                        where (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) = {1} order by CREATED_ON desc)
	                        
                            order by CREATED_ON desc";
      query = string.Format(query, vendorId, catagoryId, showCount, subCategoryId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCTS";
      return users;
    }
    internal DataSet TopSixProducts(int catagoryId)
    {
      string query = @"select top(8) P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from PRODUCTS p , VENDORS V
                            where V.VENDOR_ID = P.VENDOR_ID and p.IS_ACTIVE=1
                            and (Select CATEGORY_ID from SUB_CATEGORIES where SUB_CATEGORY_ID = 
							P.PRODUCT_SUB_CATEGORY_ID) = {0}";
      query = string.Format(query, catagoryId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCTS";
      return users;
    }
    internal DataSet TopRelatedProducts()
    {
      string query = @"Select Top(2)* from products order by Name Desc";
      query = string.Format(query);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCTS";
      return users;
    }

    internal DataSet SearchProductsByCriterias(int active, int delivery, int catagory, int vendorId)
    {
      string query = @"select (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) 
                            as Catagory, P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from PRODUCTS p , VENDORS V
                            where V.VENDOR_ID = P.VENDOR_ID and (-1 in ({0}) or P.IS_ACTIVE in ({0}))
                            and (-1 in ({1}) or P.DELIVERY in ({1}))
                            and (-1 in ({3}) or P.VENDOR_ID in ({3}))
                            and (-1 in ({2}) or (Select CATEGORY_ID from SUB_CATEGORIES 
                            where CATEGORY_ID = SUB_CATEGORY_ID) in ({2}))";
      query = string.Format(query, active, delivery, catagory, vendorId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCTS";
      return users;
    }

    internal DataSet SearchCakesByCriterias(int active, int delivery, int vendorId)
    {
      string query = @"Select C.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME 
                            from CAKES C, VENDORS V  
                            where V.VENDOR_ID = C.VENDOR_ID 
                            and (-1 in ({2}) or C.VENDOR_ID in ({2}))
                            AND (-1 in ({0}) or IS_ACTIVE in ({0}))
                            and (-1 in ({1}) or DELIVERY in ({0}))";
      query = string.Format(query, active, delivery, vendorId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCTS";
      return users;
    }

    internal DataSet SearchProductByProductId(int productId)
    {
      string query = @"select P.*, sb.CATEGORY_ID, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME, V.PERSONAL_PHONE,C.DESCRIPTION as Category  from PRODUCTS P
                            inner join SUB_CATEGORIES sb on P.PRODUCT_SUB_CATEGORY_ID = sb.SUB_CATEGORY_ID
							inner join  VENDORS V on P.VENDOR_ID = V.VENDOR_ID  
inner join CATEGORY C on C.CATEGORY_ID  = sb.CATEGORY_ID   
                            where P.PRODUCT_ID = {0}";

      query = string.Format(query, productId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCT";
      return users;
    }

    internal DataSet SearchProductByProductType(int ProductType)
    {
      string query = @"select P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from PRODUCTS p , VENDORS V
                            where V.VENDOR_ID = P.VENDOR_ID AND P.PRODUCT_TYPE = {0}";
      query = string.Format(query, ProductType);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCT";
      return users;
    }

    internal DataSet GetLatestProducts(int topProducts = 0)
    {
      string query = @"select TOP(50) P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from PRODUCTS p , VENDORS V
                            where V.VENDOR_ID = P.VENDOR_ID AND P.PRODUCT_ID NOT IN (SELECT TOP ({0}) PRODUCT_ID from PRODUCTS order by CREATED_ON desc )
                            order by p.CREATED_ON desc";
      query = string.Format(query, topProducts);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCTS";
      return users;
    }

    internal DataSet GetProductSubCatagories(int catgoryId, int vendorId)
    {
      string query = @"SELECT * FROM SUB_CATEGORIES WHERE CATEGORY_ID = {0} and VENDOR_ID = {1}";
      query = string.Format(query, catgoryId, vendorId);
      DataSet subCategories = ExecuteDataSet(query);
      subCategories.Tables[0].TableName = "SUBCATEGORIES";
      return subCategories;
    }

    internal bool SaveProductSubCatagory(SUB_CATEGORIES subCatagory)
    {
      try
      {




        const string INSERT_USERS = "insert into SUB_CATEGORIES values (@id,@name,@createdBy,@updatedOn,0,GETDATE(),@vendorID)";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(INSERT_USERS, connection);


        cmd.Parameters.AddWithValue("id", subCatagory.CATEGORY_ID);
        cmd.Parameters.AddWithValue("name", subCatagory.NAME);
        cmd.Parameters.AddWithValue("createdBy", SessionManager.GetVendorSession());
        cmd.Parameters.AddWithValue("updatedOn", DBNull.Value);
        cmd.Parameters.AddWithValue("vendorID", SessionManager.GetVendorSession());
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;

        //return ExecuteNonQuery(string.Format("insert into SUB_CATEGORIES values ({0},'{1}',{2},GETDATE(),0,GETDATE(),{2})", subCatagory.CATEGORY_ID, subCatagory.NAME, SessionManager.GetVendorSession())) > 0;
        //        //db.SUB_CATEGORIES.Add(subCatagory); 
        //        //db.SaveChanges();
        //        //return true;
      }
      catch (Exception e)
      {
        return false;
      }

    }

    internal bool SaveFlavour(FLAVOR flavor)
    {
      try
      {
        //flavor.CREATED_ON = DateTime.Now;
        //flavor.CREATED_BY = int.Parse(SessionManager.GetVendorSession());
        const string Insert_flavour = "insert into  FLAVOR values (@description,getdate(),@createdBy,@updateOn,@updateBy)";
        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(Insert_flavour, connection);

        cmd.Parameters.AddWithValue("description", flavor.DESCRIPTION);
        cmd.Parameters.AddWithValue("createdBy", SessionManager.GetVendorSession());
        cmd.Parameters.AddWithValue("updateOn", DBNull.Value);
        cmd.Parameters.AddWithValue("updateBy", DBNull.Value);
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;

        //return ExecuteNonQuery(string.Format("insert into  FLAVOR values ('{0}',getdate(),{1},GETDATE(),{1})",flavor.DESCRIPTION,flavor.CREATED_BY,flavor.CREATED_BY)) > 0;

        //db.FLAVORs.Add(flavor); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }

    }

    internal bool SaveEvent(EVENT events)
    {
      try
      {
        //events.CREATED_ON = DateTime.Now;
        //events.CREATED_BY = int.Parse(SessionManager.GetVendorSession());
        const string Insert_events = "insert into  EVENTS values (@description,getdate(),@createdBy,@updateOn,@updateBy)";
        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(Insert_events, connection);

        cmd.Parameters.AddWithValue("description", events.DESCRIPTION);
        cmd.Parameters.AddWithValue("createdBy", SessionManager.GetVendorSession());
        cmd.Parameters.AddWithValue("updateOn", DBNull.Value);
        cmd.Parameters.AddWithValue("updateBy", DBNull.Value);
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;
        //return ExecuteNonQuery(string.Format("insert into  EVENTS values ('{0}',getdate(),{1},GETDATE(),{1})", events.DESCRIPTION, events.CREATED_BY)) > 0;

        //db.EVENTS.Add(events); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }

    }

    internal int SaveProduct(PRODUCT product)
    {
      try
      {

        const string Insert_Product = "insert into PRODUCTS values (@vendorId,@PRODUCT_SUB_CATEGORY_ID,@NAME,@description,@TIME_REQUIRED,@PRICE,@SERVES,@DELIVERY,@isActive,getdate(),@photo,0,0,@aprovedOn) select scope_identity()";
        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(Insert_Product, connection);
        cmd.Parameters.AddWithValue("vendorId", product.VENDOR_ID);
        cmd.Parameters.AddWithValue("PRODUCT_SUB_CATEGORY_ID", product.PRODUCT_SUB_CATEGORY_ID);
        cmd.Parameters.AddWithValue("NAME", product.NAME);
        cmd.Parameters.AddWithValue("description", product.DESCRIPTION);
        cmd.Parameters.AddWithValue("TIME_REQUIRED", product.TIME_REQUIRED);
        cmd.Parameters.AddWithValue("PRICE", product.PRICE);
        cmd.Parameters.AddWithValue("SERVES", product.SERVES == string.Empty ? "0" : product.SERVES);
        cmd.Parameters.AddWithValue("DELIVERY", product.DELIVERY == true ? 1 : 0);
        cmd.Parameters.AddWithValue("isActive", 1);
        cmd.Parameters.AddWithValue("photo", "");
        cmd.Parameters.AddWithValue("aprovedOn", DBNull.Value);
        int result = int.Parse(cmd.ExecuteScalar().ToString());
        CloseDBConnection();
        if (result > 0)
          return result;
        else
          return 0;
        //product.CREATED_ON = DateTime.Now;
        //        product.PRODUCT_PHOTO = "";
        //        return int.Parse(ExecuteScalar(string.Format("insert into PRODUCTS values ({0},{1},'{2}','{3}',{4},{5},{6},{7},{8},'{9}','{10}',0,0,getdate()) select scope_identity()",
        //            product.VENDOR_ID, product.PRODUCT_SUB_CATEGORY_ID,product.NAME,product.DESCRIPTION,product.TIME_REQUIRED,product.PRICE,
        //            product.SERVES == string.Empty ? "0":product.SERVES,product.DELIVERY == true ? 1:0,1,product.CREATED_ON,product.PRODUCT_PHOTO)).ToString());
        //db.PRODUCTS.Add(product); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return product.PRODUCT_ID;
      }
      catch (Exception e)
      {
        return 0;
      }
    }
    internal int UpdateProduct(PRODUCT product)
    {
      try
      {
        const string UpdateProduct = @"UPDATE [dbo].[PRODUCTS]
   SET 
      [PRODUCT_SUB_CATEGORY_ID] = @PRODUCT_SUB_CATEGORY_ID
      ,[NAME] = @NAME
      ,[DESCRIPTION] = @DESCRIPTION
      ,[TIME_REQUIRED] = @TIME_REQUIRED
      ,[PRICE] = @PRICE
      ,[SERVES] = @SERVES
      ,[DELIVERY] = @DELIVERY
      ,[IS_ACTIVE] = @IS_ACTIVE
 WHERE PRODUCT_ID = @PRODUCT_ID";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(UpdateProduct, connection);

        cmd.Parameters.AddWithValue("PRODUCT_SUB_CATEGORY_ID", product.PRODUCT_SUB_CATEGORY_ID);
        cmd.Parameters.AddWithValue("NAME", product.NAME);
        cmd.Parameters.AddWithValue("DESCRIPTION", product.DESCRIPTION);
        cmd.Parameters.AddWithValue("TIME_REQUIRED", product.TIME_REQUIRED);
        cmd.Parameters.AddWithValue("PRICE", product.PRICE);
        cmd.Parameters.AddWithValue("SERVES", product.SERVES);
        cmd.Parameters.AddWithValue("DELIVERY", product.DELIVERY == true ? 1 : 0);
        cmd.Parameters.AddWithValue("IS_ACTIVE", product.IS_ACTIVE);
        cmd.Parameters.AddWithValue("PRODUCT_ID", product.PRODUCT_ID);
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
        {
            ExecuteNonQuery(string.Format("Delete from PRODUCT_TAGS where PRODUCT_ID = {0}", product.PRODUCT_ID));
            return product.PRODUCT_ID;
        }
        else
            return 0;
        //       ExecuteNonQuery(string.Format(@"UPDATE [dbo].[PRODUCTS]
        //  SET 
        //     [PRODUCT_SUB_CATEGORY_ID] = {0}
        //     ,[NAME] = '{1}'
        //     ,[DESCRIPTION] = '{2}'
        //     ,[TIME_REQUIRED] = {3}
        //     ,[PRICE] = {4}
        //     ,[SERVES] = '{5}'
        //     ,[DELIVERY] = {6}
        //     ,[IS_ACTIVE] = {7}

        //WHERE PRODUCT_ID = {8}",product.PRODUCT_SUB_CATEGORY_ID, product.NAME,product.DESCRIPTION,product.TIME_REQUIRED,product.PRICE,
        //                       product.SERVES,product.DELIVERY == true ?1:0,product.IS_ACTIVE  , product.PRODUCT_ID        


        //                       ));
        //db.PRODUCTS.AddOrUpdate(product); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        
      }
      catch (Exception e)
      {
        return 0;
      }
    }

    internal bool DeleteProduct(int productId)
    {
      try
      {
        ExecuteNonQuery(string.Format("delete from PRODUCT_TAGS  where PRODUCT_ID = {0}", productId));
        //return ExecuteNonQuery(string.Format("delete from PRODUCTS  where PRODUCT_ID = {0}", productId)) > 0;
        return ExecuteNonQuery(string.Format("update  PRODUCTS set IS_ACTIVE = 0  where PRODUCT_ID = {0}", productId)) > 0;


        //var itemToRemove = db.PRODUCTS.SingleOrDefault(x => x.PRODUCT_ID == productId); //returns a single item.

        //if (itemToRemove != null)
        //{
        //    db.PRODUCTS.Remove(itemToRemove);
        //    db.SaveChanges();
        //}
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }
    }
    internal void UpdateProductImage(string pid, string path)
    {
      const string UpdateProductImage = "UPDATE Products SET PRODUCT_PHOTO = @path WHERE product_ID = @productID";
      OpenDBConnection();
      SqlCommand cmd = new SqlCommand(UpdateProductImage, connection);

      cmd.Parameters.AddWithValue("productID", pid);
      cmd.Parameters.AddWithValue("path", path);

      int result = cmd.ExecuteNonQuery();
      CloseDBConnection();

      //ExecuteNonQuery(string.Format("UPDATE Products SET PRODUCT_PHOTO = '{1}' WHERE product_ID = {0}", productID, path));
    }
    internal void UpdateCustomizedImage(string productID, string path)
    {

      ExecuteNonQuery(string.Format("delete from cake_images where cake_id = {0}", productID));

      const string UpdateCustomizedImage = "insert into cake_images values (@productID,@path,0) select SCOPE_IDENTITY()";

      OpenDBConnection();
      SqlCommand cmd = new SqlCommand(UpdateCustomizedImage, connection);


      cmd.Parameters.AddWithValue("productID", productID);
      cmd.Parameters.AddWithValue("path", path);
      int result = int.Parse(cmd.ExecuteScalar().ToString());
      CloseDBConnection();

      //int result = int.Parse(ExecuteScalar(string.Format("insert into cake_images values ({0},'{1}',0) select SCOPE_IDENTITY()", productID, path)).ToString());
      if (result > 0)
      {
        SessionManager.SetCakeImageSession(result);
      }
      //ExecuteNonQuery(string.Format("insert into cake_images values ({0},'{1}') select SCOPE_IDENTITY()", productID, path));
    }
    #endregion

    #region cakes
    internal bool SaveCakeTier(CAKE_TIERS cakeTier)
    {
      try
      {
        return ExecuteNonQuery(string.Format("insert into CAKE_TIERS  values ({0},{1},{2},{3},GETDATE(),{4},GETDATE(),{4},1)", cakeTier.CAKE_ID, cakeTier.TIER_ORDER, cakeTier.MIN_WEIGHT, cakeTier.MAX_WEIGHT, SessionManager.GetVendorSession())) > 0;

        //db.CAKE_TIERS.Add(cakeTier); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }
    }
    internal void UpdateCakeImage(string cakeid, string path)
    {
      const string UpdateCakeImage = "UPDATE Cakes SET CAKE_PHOTO = @path WHERE Cake_ID = @cakeid";
      OpenDBConnection();
      SqlCommand cmd = new SqlCommand(UpdateCakeImage, connection);

      cmd.Parameters.AddWithValue("cakeid", cakeid);
      cmd.Parameters.AddWithValue("path", path);

      int result = cmd.ExecuteNonQuery();
      CloseDBConnection();
      //ExecuteNonQuery(string.Format("UPDATE Cakes SET CAKE_PHOTO = '{1}' WHERE Cake_ID = {0}", cakeid, path));
    }
    internal bool SaveCakeTag(CAKE_TAGS cakeTag)
    {
      try
      {
        cakeTag.CREATED_BY = int.Parse(SessionManager.GetVendorSession());
        const string SaveCakeTag = "insert into cake_TAGS values (@id,@name,GETDATE(),@createdBy,GETDATE(),@updatedBy,1)";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(SaveCakeTag, connection);


        cmd.Parameters.AddWithValue("id", cakeTag.CAKE_ID);
        cmd.Parameters.AddWithValue("name", cakeTag.TAG_NAME);
        cmd.Parameters.AddWithValue("createdBy", SessionManager.GetVendorSession());
        cmd.Parameters.AddWithValue("updatedBy", SessionManager.GetVendorSession());
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;
        //return ExecuteNonQuery(string.Format("insert into cake_TAGS values ({0},'{1}',GETDATE(),{2},GETDATE(),{2},1)", cakeTag.CAKE_ID, cakeTag.TAG_NAME, SessionManager.GetVendorSession())) > 0;
        //db.CAKE_TAGS.Add(cakeTag); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }
    }
    internal int SaveCake(CAKE cake)
    {
      try
      {
        const string SaveCake = @"insert into cakes values (@VENDOR_ID,@NAME,@MIN_WEIGHT,@MAX_WEIGHT,@MIN_TIERS,@MAX_TIERS,@DESCRIPTION,@ESTIMATED_TIME,@PRICE,@DELIVERY,@IS_CUSTOMIZABLE,@TYPE_ID,@ADDITIONAL_PRICE,@photo,GETDATE(),@createdBy,GETDATE(),@updatedBy,1,0,0,getdate()) select SCOPE_IDENTITY()";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(SaveCake, connection);


        cmd.Parameters.AddWithValue("VENDOR_ID", cake.VENDOR_ID);
        cmd.Parameters.AddWithValue("NAME", cake.NAME);
        cmd.Parameters.AddWithValue("MIN_WEIGHT", cake.MIN_WEIGHT);
        cmd.Parameters.AddWithValue("MAX_WEIGHT", cake.MAX_WEIGHT);
        cmd.Parameters.AddWithValue("MIN_TIERS", DBNull.Value);
        cmd.Parameters.AddWithValue("MAX_TIERS", DBNull.Value);
        cmd.Parameters.AddWithValue("DESCRIPTION", cake.DESCRIPTION);
        cmd.Parameters.AddWithValue("ESTIMATED_TIME", cake.ESTIMATED_TIME);
        cmd.Parameters.AddWithValue("PRICE", cake.PRICE);
        cmd.Parameters.AddWithValue("DELIVERY", cake.DELIVERY == true ? 1 : 0);
        cmd.Parameters.AddWithValue("IS_CUSTOMIZABLE", 1);
        cmd.Parameters.AddWithValue("TYPE_ID", cake.TYPE_ID);
        cmd.Parameters.AddWithValue("ADDITIONAL_PRICE", cake.ADDITIONAL_PRICE);
        cmd.Parameters.AddWithValue("photo", "");
        cmd.Parameters.AddWithValue("createdBy", SessionManager.GetVendorSession());
        cmd.Parameters.AddWithValue("updatedBy", SessionManager.GetVendorSession());
        int result = int.Parse(cmd.ExecuteScalar().ToString());
        CloseDBConnection();
        if (result > 0)
          return result;
        else
          return 0;

        //cake.CREATED_BY = int.Parse(SessionManager.GetVendorSession());
        //        string qry = @"insert into cakes values ({0},'{1}',{2},{3},{4},{5},'{6}',{7},{8},{9},{10},{14},{11},'{12}',GETDATE(),{13},GETDATE(),{13},1,0,0,getdate()) select SCOPE_IDENTITY()";
        //        return int.Parse(ExecuteScalar(string.Format(qry,
        //            cake.VENDOR_ID, cake.NAME, cake.MIN_WEIGHT, cake.MAX_WEIGHT, cake.MIN_TIERS, cake.MAX_TIERS, cake.DESCRIPTION, cake.ESTIMATED_TIME,
        //           cake.PRICE, cake.DELIVERY == true ? 1 : 0, cake.IS_CUSTOMIZABLE == 0 ? 1 : 0, cake.ADDITIONAL_PRICE, "", cake.CREATED_BY,cake.TYPE_ID
        //            )

        //            ).ToString());

        //db.CAKES.Add(cake); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return cake.CAKE_ID;
      }
      catch (Exception e)
      {
        return 0;
      }
    }
    internal int IsUniqueCake(string cakeName, int vendorId)
    {
      int result = 1;
      CAKE cakes = db.CAKES.Where(u => u.NAME == cakeName && u.VENDOR_ID == vendorId).SingleOrDefault();
      if (cakes != null)
        result = 0;

      return result;
    }
    internal int IsUniqueCake(string cakeName, int vendorId, int cakeId)
    {
      int result = 1;
      CAKE cakes = db.CAKES.Where(u => u.NAME == cakeName && u.VENDOR_ID == vendorId && u.CAKE_ID != cakeId).SingleOrDefault();
      if (cakes != null)
        result = 0;

      return result;
    }
    internal int IsUniqueProduct(string productName, int vendorId)
    {
      int result = 1;
      PRODUCT product = db.PRODUCTS.Where(u => u.NAME == productName && u.VENDOR_ID == vendorId).SingleOrDefault();
      if (product != null)
        result = 0;

      return result;
    }
    internal int IsUniqueProduct(string productName, int vendorId, int ProductId)
    {
      int result = 1;
      PRODUCT product = db.PRODUCTS.Where(u => u.NAME == productName && u.VENDOR_ID == vendorId && u.PRODUCT_ID != ProductId).SingleOrDefault();
      if (product != null)
        result = 0;

      return result;
    }
    internal bool SaveCakeCustomizeDetail(CAKE_CUSTOMIZE_DETAIL cakeDetail)
    {
      try
      {
        const string SaveCakeCustomizeDetail = @"insert into CAKE_CUSTOMIZE_DETAIL values (@CAKE_ID,@ORDER_ID,@CAKE_FLAVOUR_ID,@TIER_ORDER,@TIER_WEIGHT,@FLAVOUR_PRICE)";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(SaveCakeCustomizeDetail, connection);


        cmd.Parameters.AddWithValue("CAKE_ID", cakeDetail.CAKE_ID);
        cmd.Parameters.AddWithValue("ORDER_ID", cakeDetail.ORDER_ID);
        cmd.Parameters.AddWithValue("CAKE_FLAVOUR_ID", cakeDetail.CAKE_FLAVOUR_ID);
        cmd.Parameters.AddWithValue("TIER_ORDER", cakeDetail.TIER_ORDER);
        cmd.Parameters.AddWithValue("TIER_WEIGHT", cakeDetail.TIER_WEIGHT);
        cmd.Parameters.AddWithValue("FLAVOUR_PRICE", cakeDetail.FLAVOUR_PRICE);

        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;
        //return ExecuteNonQuery(string.Format(@"insert into CAKE_CUSTOMIZE_DETAIL values ({0},{1},{2},{3},{4},{5})",
        //            cakeDetail.CAKE_ID,cakeDetail.ORDER_ID,cakeDetail.CAKE_FLAVOUR_ID,cakeDetail.TIER_ORDER,cakeDetail.TIER_WEIGHT,cakeDetail.FLAVOUR_PRICE

        //            ))>0;
        //db.CAKE_CUSTOMIZE_DETAIL.Add(cakeDetail); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }
    }
    internal DataSet SearchCakeByCakeId(int cakeId)
    {
      string query = @"select P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME,V.PERSONAL_PHONE  from CAKES P
							inner join  VENDORS V on P.VENDOR_ID = V.VENDOR_ID   
                            where P.CAKE_ID = {0}";

      query = string.Format(query, cakeId);
      DataSet cakes = ExecuteDataSet(query);
      cakes.Tables[0].TableName = "CAKE";
      return cakes;
    }
    internal DataSet GetCakeTagsByCakeId(int cakeId)
    {
      string query = @"select * from CAKE_TAGS
                            WHERE ( -1 in ({0})  or  CAKE_ID in ({0}))";
      query = string.Format(query, cakeId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CAKE_TAGS";
      return users;
    }
    internal DataSet GetCakeEventsByCakeId(int cakeId)
    {
      string query = @"select * from CAKE_EVENTS c
                                inner join events e on e.event_id = c.EVENT_ID

                            WHERE CAKE_ID = '{0}'";
      query = string.Format(query, cakeId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CAKE_EVENTS";
      return users;
    }
    internal DataSet GetCakeFlavorsByCakeId(int cakeId)
    {
      string query = @"select * from CAKE_FLAVORS c
                            inner join FLAVOR e on e.FLAVOR_ID = c.FLAVOR_ID
                            WHERE CAKE_ID = '{0}'";
      query = string.Format(query, cakeId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CAKE_FLAVORS";
      return users;
    }
    internal DataSet GetAllEvents(string vendorId)
    {
      string query = string.Format("Select * from Events where CREATED_BY = {0}", vendorId);
      DataSet vendors = ExecuteDataSet(query);
      vendors.Tables[0].TableName = "EVENTS";
      return vendors;
    }
    internal DataSet GetAllProducts(int showCount)
    {
      string query = @"Select top(12) * from PRODUCTS
                            where (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) = 1
	                        and PRODUCT_ID not IN (Select top({0}) PRODUCT_ID from PRODUCTS 
	                        where (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) = 1 order by CREATED_ON desc)
	                        order by CREATED_ON desc"
                      ;
      query = string.Format(query, showCount);
      DataSet vendors = ExecuteDataSet(query);
      vendors.Tables[0].TableName = "PRODUCTS";
      return vendors;
    }

        internal DataSet GetProductsByPage(int showCount)
        {
            string query = @"SELECT * ,(Select CATeGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID)
as CATEGORY_ID from PRODUCTS order by PRODUCT_ID asc offset 8 * {0}  ROWS FETCH NEXT 8 ROWS ONLY ";
            query = string.Format(query, showCount);
            DataSet vendors = ExecuteDataSet(query);
            vendors.Tables[0].TableName = "PRODUCTS";
            return vendors;
        }
        internal DataSet GetCakesByPage(int showCount)
        {
            if (showCount > 0)
                showCount--;

            string query = @"select * from CAKES where IS_ACTIVE=1 order by cake_id offset 10 * {0} ROWS FETCH NEXT 10 ROWS ONLY ";
            query = string.Format(query, showCount);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "CAKES";
            return users;
        }

        internal DataSet GetAllDesserts(int showCount)
    {
      string query = @"Select top(12) * from PRODUCTS
                            where (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) = 3
	                        and PRODUCT_ID not IN (Select top({0}) PRODUCT_ID from PRODUCTS 
	                        where (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) = 3 order by CREATED_ON desc)
	                        order by CREATED_ON desc";
      query = string.Format(query, showCount);
      DataSet vendors = ExecuteDataSet(query);
      vendors.Tables[0].TableName = "PRODUCTS";
      return vendors;
    }
    internal DataSet GetAllFrozenFoods(int showCount)
    {
      string query = @"Select top(12) * from PRODUCTS
                            where (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) = 2
	                        and PRODUCT_ID not IN (Select top({0}) PRODUCT_ID from PRODUCTS 
	                        where (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) = 2 order by CREATED_ON desc)
	                        order by CREATED_ON desc";
      query = string.Format(query, showCount);
      DataSet vendors = ExecuteDataSet(query);
      vendors.Tables[0].TableName = "PRODUCTS";
      return vendors;
    }
    internal DataSet GetAllCakes(int showCount)
    {
      string query = @"Select top(12) * from CAKES
                            where CAKE_ID not in (select top({0}) CAKE_ID from CAKES order by CREATED_ON desc)
                            order by CREATED_ON desc";
      query = string.Format(query, showCount);
      DataSet vendors = ExecuteDataSet(query);
      vendors.Tables[0].TableName = "CAKES";
      return vendors;
    }
    internal DataSet SearchCakesByCakeTag(string cakeTag)
    {
      SqlDataAdapter da = new SqlDataAdapter();
      SqlCommand cmd = new SqlCommand(@"select * from CAKES where CAKE_ID IN ( SELECT DISTINCT CAKE_ID FROM CAKE_TAGS WHERE TAG_NAME LIKE @cakeTag or name like @cakeTag)", connection);
      cmd.Parameters.AddWithValue("cakeTag", cakeTag);
      da.SelectCommand = cmd;
      DataSet ds = new DataSet();
      OpenDBConnection();
      da.Fill(ds);
      CloseDBConnection();
      if (ds != null && ds.Tables[0].Rows.Count > 0)
        return ds;
      else
        return ds;
      //string query = @"select * from CAKES 
      //                      where CAKE_ID IN ( SELECT DISTINCT CAKE_ID FROM CAKE_TAGS WHERE TAG_NAME LIKE '%{0}%' or name like '%{0}%')";
      //      query = string.Format(query, cakeTag);
      //      DataSet vendors = ExecuteDataSet(query);
      //      vendors.Tables[0].TableName = "CAKES";
      //      return vendors;
    }
    internal DataSet SearchVendorCakesByCakeTag(string cakeTag, int vendorId)
    {

      SqlDataAdapter da = new SqlDataAdapter();
      SqlCommand cmd = new SqlCommand(@"select * from CAKES where CAKE_ID IN ( SELECT DISTINCT CAKE_ID FROM CAKE_TAGS WHERE TAG_NAME LIKE @cakeTag or name like @cakeTag) and vendor_id = @vendorId", connection);
      cmd.Parameters.AddWithValue("cakeTag", cakeTag);
      cmd.Parameters.AddWithValue("vendorId", vendorId);
      da.SelectCommand = cmd;
      DataSet ds = new DataSet();
      OpenDBConnection();
      da.Fill(ds);
      CloseDBConnection();
      if (ds != null && ds.Tables[0].Rows.Count > 0)
        return ds;
      else
        return ds;

      //string query = @"select * from CAKES 
      //                      where CAKE_ID IN ( SELECT DISTINCT CAKE_ID FROM CAKE_TAGS WHERE TAG_NAME LIKE '%{0}%' or name like '%{0}%') and vendor_id = {1}";
      //      query = string.Format(query, cakeTag,vendorId);
      //      DataSet vendors = ExecuteDataSet(query);
      //      vendors.Tables[0].TableName = "CAKES";
      //      return vendors;
    }
    internal DataSet GetAllTypes()
    {
      string query = "Select * from CAKE_Types";
      DataSet vendors = ExecuteDataSet(query);
      vendors.Tables[0].TableName = "TYPES";
      return vendors;
    }
    internal DataSet GetAllFlavors(string vendorId)
    {
      string query = string.Format("Select * from flavor where CREATED_BY = {0}", vendorId);
      DataSet vendors = ExecuteDataSet(query);
      vendors.Tables[0].TableName = "FLAVORS";
      return vendors;
    }
    internal int ApprovedProductsByAdmin(int productId)
    {
      try
      {
        return ExecuteNonQuery(string.Format("Update PRODUCTS SET IS_APPROVED= 1,APPROVED_ON = '{1}', APPROVED_BY = {2} where PRODUCT_ID = {0}", productId, DateTime.Now.ToString(), SessionManager.GetAdminSession()));


      }
      catch (Exception e)
      {
        return 0;
      }
    }
    internal int ApprovedCakesByAdmin(int cakeId)
    {
      try
      {
        return ExecuteNonQuery(string.Format("Update CAKES SET IS_APPROVED= 1,APPROVED_ON = '{1}', APPROVED_BY = {2} where CAKE_ID = {0}", cakeId, DateTime.Now.ToString(), SessionManager.GetAdminSession()));


      }
      catch (Exception e)
      {
        return 0;
      }
    }
    internal DataSet GetAllCakeFlavors(int cakeId)
    {
      string query = @"select CF.PRICE, CF.CAKE_FLAVOR_ID, F.DESCRIPTION from CAKE_FLAVORS CF, FLAVOR F
                            Where CF.FLAVOR_ID = F.FLAVOR_ID AND CAKE_ID = '{0}'";
      query = string.Format(query, cakeId);
      DataSet vendors = ExecuteDataSet(query);
      vendors.Tables[0].TableName = "CAKE_FLAVORS";
      return vendors;
    }
    internal int UpdateCake(CAKE cake)
    {
      try
      {
        //db.CAKES.AddOrUpdate(cake);
        //db.SaveChanges();
        cake.UPDATED_BY = int.Parse(SessionManager.GetVendorSession());
        const string UpdateCake = @"UPDATE [dbo].[CAKES]
   SET 
      [NAME] = @NAME
      ,[MIN_WEIGHT] = @MIN_WEIGHT
      ,[MAX_WEIGHT] = @MAX_WEIGHT
      
      ,[DESCRIPTION] = @DESCRIPTION
      ,[ESTIMATED_TIME] = @ESTIMATED_TIME
      ,[PRICE] = @PRICE
      ,[DELIVERY] = @DELIVERY

      ,[ADDITIONAL_PRICE] = @ADDITIONAL_PRICE
      ,[UPDATED_ON] = GETDATE()
      ,[UPDATED_BY] = @UPDATED_BY
      ,[IS_ACTIVE] = @IS_ACTIVE
 WHERE CAKE_ID = @CAKE_ID";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(UpdateCake, connection);

        cmd.Parameters.AddWithValue("NAME", cake.NAME);
        cmd.Parameters.AddWithValue("MIN_WEIGHT", cake.MIN_WEIGHT);
        cmd.Parameters.AddWithValue("MAX_WEIGHT", cake.MAX_WEIGHT);

        cmd.Parameters.AddWithValue("DESCRIPTION", cake.DESCRIPTION);
        cmd.Parameters.AddWithValue("ESTIMATED_TIME", cake.ESTIMATED_TIME);
        cmd.Parameters.AddWithValue("PRICE", cake.PRICE);
        cmd.Parameters.AddWithValue("DELIVERY", cake.DELIVERY == true ? 1 : 0);
        cmd.Parameters.AddWithValue("ADDITIONAL_PRICE", cake.ADDITIONAL_PRICE);
        cmd.Parameters.AddWithValue("UPDATED_BY", SessionManager.GetVendorSession());
        cmd.Parameters.AddWithValue("IS_ACTIVE", cake.IS_ACTIVE == true ? 1 : 0);
        cmd.Parameters.AddWithValue("CAKE_ID", cake.CAKE_ID);
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();

        //       ExecuteNonQuery(string.Format(@"UPDATE [dbo].[CAKES]
        //  SET 
        //     [NAME] = '{0}'
        //     ,[MIN_WEIGHT] = {1}
        //     ,[MAX_WEIGHT] = {2}
        //     ,[MIN_TIERS] = {3}
        //     ,[MAX_TIERS] = {4}
        //     ,[DESCRIPTION] = '{5}'
        //     ,[ESTIMATED_TIME] = {6}
        //     ,[PRICE] = {7}
        //     ,[DELIVERY] = {8}
        //     ,[IS_CUSTOMIZABLE] = {9}

        //     ,[ADDITIONAL_PRICE] = {10}
        //     ,[UPDATED_ON] = GETDATE()
        //     ,[UPDATED_BY] = {11}
        //     ,[IS_ACTIVE] = {12}
        //WHERE CAKE_ID = {13}", cake.NAME,cake.MIN_WEIGHT,cake.MAX_WEIGHT,cake.MIN_TIERS,cake.MAX_TIERS,cake.DESCRIPTION,cake.ESTIMATED_TIME,cake.PRICE,
        //                     cake.DELIVERY == true ? 1 : 0, cake.IS_CUSTOMIZABLE, cake.ADDITIONAL_PRICE, SessionManager.GetVendorSession(), cake.IS_ACTIVE == true ? 1 : 0, cake.CAKE_ID    
        //                     ));


        ExecuteNonQuery(string.Format("Delete from cake_tags where cake_id = {0}", cake.CAKE_ID));
        ExecuteNonQuery(string.Format("Delete from cake_events where cake_id = {0}", cake.CAKE_ID));
        ExecuteNonQuery(string.Format("Delete from cake_flavors where cake_id = {0}", cake.CAKE_ID));
        ExecuteNonQuery(string.Format("Delete from cake_tiers where cake_id = {0}", cake.CAKE_ID));
        return cake.CAKE_ID;
      }
      catch (Exception e)
      {
        return 0;
      }
    }
    internal bool DeleteCake(int cakeId)
    {
      try
      {
        ExecuteNonQuery(string.Format("Delete from cake_tags where cake_id = {0}", cakeId));
        ExecuteNonQuery(string.Format("Delete from cake_events where cake_id = {0}", cakeId));
        ExecuteNonQuery(string.Format("Delete from cake_flavors where cake_id = {0}", cakeId));
        ExecuteNonQuery(string.Format("Delete from cake_tiers where cake_id = {0}", cakeId));

        //ExecuteNonQuery(string.Format("update cake_tags set IS_ACTIVE =0,UPDATED_BY = {0} , UPDATED_ON = GETDATE() where CAKE_ID = {0}", cakeId, SessionManager.GetVendorSession()));
        //ExecuteNonQuery(string.Format("update cake_events set IS_ACTIVE =0,UPDATED_BY = {0} , UPDATED_ON = GETDATE() where CAKE_ID = {0}", cakeId, SessionManager.GetVendorSession()));
        //ExecuteNonQuery(string.Format("update cake_flavors set IS_ACTIVE =0,UPDATED_BY = {0} , UPDATED_ON = GETDATE() where CAKE_ID = {0}", cakeId, SessionManager.GetVendorSession()));
        //ExecuteNonQuery(string.Format("update cake_tiers set IS_ACTIVE =0,UPDATED_BY = {0} , UPDATED_ON = GETDATE() where CAKE_ID = {0}", cakeId, SessionManager.GetVendorSession()));


        return ExecuteNonQuery(string.Format("update cakes set IS_ACTIVE =0,UPDATED_BY = VENDOR_ID , UPDATED_ON = GETDATE() where CAKE_ID = {0}", cakeId)) > 0;
      }
      catch (Exception e)
      {
        return false;
      }
    }
    public DataSet GetTierData(int cakeId)
    {
      string query = @"select * from CAKE_TIERS where CAKE_ID = '{0}'";
      query = string.Format(query, cakeId);
      DataSet tiers = ExecuteDataSet(query);
      tiers.Tables[0].TableName = "CAKE_TIERS";
      return tiers;
    }
    #endregion

    #region ProductTags

    internal bool SaveProductTag(PRODUCT_TAGS productTag)
    {
      try
      {

        const string SaveProductTag = "insert into PRODUCT_TAGS values (@id,@tagName,GETDATE(),@createdBy,GETDATE(),@updatedBy)";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(SaveProductTag, connection);
        cmd.Parameters.AddWithValue("id", productTag.PRODUCT_ID);
        cmd.Parameters.AddWithValue("tagName", productTag.TAG_NAME);
        cmd.Parameters.AddWithValue("createdBy", SessionManager.GetVendorSession());
        cmd.Parameters.AddWithValue("updatedBy", SessionManager.GetVendorSession());
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;
        //return ExecuteNonQuery(string.Format("insert into PRODUCT_TAGS values ({0},'{1}',GETDATE(),{2},GETDATE(),{2})", productTag.PRODUCT_ID, productTag.TAG_NAME, SessionManager.GetVendorSession())) > 0;
        //db.PRODUCT_TAGS.Add(productTag); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }
      //string query = string.Format(@"Insert into PRODUCT_TAGS VALUES ('{0}', '{1}')",
      //productTag.PRODUCT_ID, productTag.TAG_NAME);

      //int result = ExecuteNonQuery(query);
      //if (result > 0)
      //    return true;
      //else
      //    return false;

    }
    internal DataSet GetProductTagsByProductId(int productId)
    {
      string query = @"select * from PRODUCT_TAGS TAGS
                            WHERE ( -1 in ({0}) or PRODUCT_ID in ({0}))";
      query = string.Format(query, productId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCT_TAGS";
      return users;
    }
    internal DataSet SearchProductByProductTag(string productTag)
    {

      SqlDataAdapter da = new SqlDataAdapter();
      SqlCommand cmd = new SqlCommand(@"Select *, (Select CATeGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) as CATEGORY_ID from PRODUCTS p
                            where p.PRODUCT_ID IN(SELECT DISTINCT PRODUCT_ID FROM PRODUCT_TAGS

              WHERE TAG_NAME LIKE @name or name like @name or p.name like @name) ", connection);
      cmd.Parameters.AddWithValue("name", productTag);
      da.SelectCommand = cmd;
      DataSet ds = new DataSet();
      OpenDBConnection();
      da.Fill(ds);
      CloseDBConnection();

      //DataSet ds = ExecuteDataSet(string.Format("select * from VENDORS where  BUSINESS_ENTITY_NAME = '{0}' and PRIMARY_WORKSPACE_PHONE = '{1}'", businessEntity, phone));
      if (ds != null && ds.Tables[0].Rows.Count > 0)
        return ds;
      else
        return ds;
      //string query = @"Select *, (Select CATeGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) as CATEGORY_ID from PRODUCTS p
      //                      where p.PRODUCT_ID IN (SELECT DISTINCT PRODUCT_ID FROM PRODUCT_TAGS
      //	WHERE TAG_NAME LIKE '%{0}%' or name like '%{0}%' or p.name like '%{0}%') ";
      //      query = string.Format(query, productTag);
      //      DataSet users = ExecuteDataSet(query);
      //      users.Tables[0].TableName = "PRODUCTS";
      //      return users;
    }
    internal DataSet SearchVendorProductByProductTag(string productTag, int vendorId)
    {
      SqlDataAdapter da = new SqlDataAdapter();
      SqlCommand cmd = new SqlCommand(@"Select *, (Select CATeGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) as CATEGORY_ID from PRODUCTS p
                            where p.PRODUCT_ID IN (SELECT DISTINCT PRODUCT_ID FROM PRODUCT_TAGS
							WHERE TAG_NAME LIKE @name or p.name like @name) and p.vendor_id = @id", connection);
      cmd.Parameters.AddWithValue("name", productTag);
      cmd.Parameters.AddWithValue("id", vendorId);
      da.SelectCommand = cmd;
      DataSet ds = new DataSet();
      OpenDBConnection();
      da.Fill(ds);
      CloseDBConnection();

      //DataSet ds = ExecuteDataSet(string.Format("select * from VENDORS where  BUSINESS_ENTITY_NAME = '{0}' and PRIMARY_WORKSPACE_PHONE = '{1}'", businessEntity, phone));
      if (ds != null && ds.Tables[0].Rows.Count > 0)
        return ds;
      else
        return ds;
      //string query = @"Select *, (Select CATeGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) as CATEGORY_ID from PRODUCTS p
      //                      where p.PRODUCT_ID IN (SELECT DISTINCT PRODUCT_ID FROM PRODUCT_TAGS
      //	WHERE TAG_NAME LIKE '%{0}%' or p.name like '%{0}%') and p.vendor_id = {1}  ";
      //      query = string.Format(query, productTag,vendorId);
      //      DataSet users = ExecuteDataSet(query);
      //      users.Tables[0].TableName = "PRODUCTS";
      //      return users;
    }
    internal DataSet SearchProductByVendorName(string name)
    {
      SqlDataAdapter da = new SqlDataAdapter();
      SqlCommand cmd = new SqlCommand(@"Select *, (Select CATeGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) as CATEGORY_ID from PRODUCTS p
                                    where p.vendor_ID IN (SELECT DISTINCT vendor_ID FROM vendors
							        WHERE business_entity_NAME = @name) ", connection);
      cmd.Parameters.AddWithValue("name", name);
      da.SelectCommand = cmd;
      DataSet ds = new DataSet();
      OpenDBConnection();
      da.Fill(ds);
      CloseDBConnection();
      if (ds != null && ds.Tables[0].Rows.Count > 0)
        return ds;
      else
        return ds;
      //string query = @"Select *, (Select CATeGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) as CATEGORY_ID from PRODUCTS p
      //                      where p.vendor_ID IN (SELECT DISTINCT vendor_ID FROM vendors
      //	WHERE business_entity_NAME = '{0}') ";
      //      query = string.Format(query, name);
      //      DataSet users = ExecuteDataSet(query);
      //      users.Tables[0].TableName = "PRODUCTS";
      //      return users;
    }
    internal DataSet SearchCakeByVendorName(string name)
    {

      SqlDataAdapter da = new SqlDataAdapter();
      SqlCommand cmd = new SqlCommand(@"select c.* from CAKES c where c.vendor_ID IN (SELECT DISTINCT vendor_ID FROM vendors
							        WHERE business_entity_NAME = @name) ", connection);
      cmd.Parameters.AddWithValue("name", name);
      da.SelectCommand = cmd;
      DataSet ds = new DataSet();
      OpenDBConnection();
      da.Fill(ds);
      CloseDBConnection();
      if (ds != null && ds.Tables[0].Rows.Count > 0)
        return ds;
      else
        return ds;
      //string query = @"select c.* from CAKES c where c.vendor_ID IN (SELECT DISTINCT vendor_ID FROM vendors
      //	WHERE business_entity_NAME = '{0}') ";
      //      query = string.Format(query, name);
      //      DataSet users = ExecuteDataSet(query);
      //      users.Tables[0].TableName = "CAKES";
      //      return users;
    }
    internal bool DeleteProductTag(int tagId)
    {

      string query = @"DELETE FROM PRODUCT_TAGS
                            WHERE PRODUCT_ID = {0}";
      query = string.Format(query, tagId);
      int result = ExecuteNonQuery(query);
      if (result > 0)
        return true;
      else
        return false;
    }

    #endregion

    #region others
    internal bool SaveCakeEvents(CAKE_EVENTS events)
    {
      try
      {
        events.CREATED_BY = int.Parse(SessionManager.GetVendorSession());
        const string SaveCakeEvents = "insert into CAKE_EVENTS values (@cakeid,@eventid,GETDATE(),@createdBy,GETDATE(),@updatedBy,1)";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(SaveCakeEvents, connection);


        cmd.Parameters.AddWithValue("cakeid", events.CAKE_ID);
        cmd.Parameters.AddWithValue("eventid", events.EVENT_ID);
        cmd.Parameters.AddWithValue("createdBy", SessionManager.GetVendorSession());
        cmd.Parameters.AddWithValue("updatedBy", SessionManager.GetVendorSession());
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;
        //return ExecuteNonQuery(string.Format("insert into CAKE_EVENTS values ({0},{1},GETDATE(),{2},GETDATE(),{2},1)", events.CAKE_ID, events.EVENT_ID, SessionManager.GetVendorSession())) > 0;

        //db.CAKE_EVENTS.Add(events); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }

    }
    internal bool SaveCakeFlavour(CAKE_FLAVORS flavour)
    {
      try
      {
        flavour.CREATED_BY = int.Parse(SessionManager.GetVendorSession());
        const string SaveCakeFlavour = "insert into CAKE_FLAVORS values (@cakeid,@flvrid,@price,GETDATE(),@createdBy,GETDATE(),@updatedBy,1)";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(SaveCakeFlavour, connection);


        cmd.Parameters.AddWithValue("cakeid", flavour.CAKE_ID);
        cmd.Parameters.AddWithValue("flvrid", flavour.FLAVOR_ID);
        cmd.Parameters.AddWithValue("price", flavour.PRICE);
        cmd.Parameters.AddWithValue("createdBy", SessionManager.GetVendorSession());
        cmd.Parameters.AddWithValue("updatedBy", SessionManager.GetVendorSession());
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;
        //return ExecuteNonQuery(string.Format("insert into CAKE_FLAVORS values ({0},{1},{2},GETDATE(),{3},GETDATE(),{3},1)", flavour.CAKE_ID, flavour.FLAVOR_ID, flavour.PRICE, SessionManager.GetVendorSession())) > 0;

        //db.CAKE_FLAVORS.Add(flavour); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }


    }
    internal DataSet SearchCakeByVendorId(int vendorId, int showCount)
    {
      //            string query = @"Select top(12) * from CAKES
      //                            where CAKE_ID not in (select top({1}) CAKE_ID from CAKES order by CREATED_ON desc) and VENDOR_ID = {0}
      //                            order by CREATED_ON desc";

      string query2 = "select top(12) * from cakes where IS_ACTIVE=1 and vendor_id = {0}";

      //query = string.Format(query, vendorId, showCount);
      query2 = string.Format(query2, vendorId);
      DataSet users = ExecuteDataSet(query2);
      users.Tables[0].TableName = "CAKES";
      return users;
    }
    internal DataSet GetInquirtList(int vendorId)
    {

      string query = "Select concat ( V.FIRST_NAME,V.LAST_NAME) as VENDOR_NAME, IT.Description as INQUIRY_TYPE, I.INQUIRY_TIME, I.USER_ID From INQUIRY I inner join VENDORS V on I.OBJECT_ID= V.VENDOR_ID inner join INQUIRY_TYPE IT on I.INQUIRY_TYPE_ID = IT.INQUIRY_TYPE_ID where OBJECT_ID={0}";

      //query = string.Format(query, vendorId, showCount);
      query = string.Format(query, vendorId);
      DataSet inquiry = ExecuteDataSet(query);
      inquiry.Tables[0].TableName = "INQUIRY";
      return inquiry;
    }
    internal DataSet TopSixCakes()
    {
      string query = @"select Top(8) * from CAKES where IS_ACTIVE=1";
      //query = string.Format(query, vendorId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CAKES";
      return users;
    }
    internal DataSet TopRelatedCakes()
    {
      string query = @"Select top (2) * from Cakes order by Name desc";
      query = string.Format(query);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CAKES";
      return users;
    }
    internal DataSet GetCakeTierDetail(int cakeId)
    {
      string query = @"SELECT TIER_ORDER, MIN_WEIGHT, MAX_WEIGHT FROM CAKE_TIERS
                            WHERE CAKE_ID = {0} 
                            ORDER BY TIER_ORDER";
      query = string.Format(query, cakeId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CAKE_TIERS";
      return users;
    }
    internal DataSet AllCakes(int page)
    {
      if (page > 0)
        page--;

      string query = @"select * from CAKES where IS_ACTIVE=1 order by cake_id offset 10 * {0} ROWS FETCH NEXT 10 ROWS ONLY ";
      query = string.Format(query, page);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CAKES";
      return users;
    }
    internal DataSet AllProducts(int catagoryId)
    {
      string query = @"select P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from PRODUCTS p , VENDORS V
                            where V.VENDOR_ID = P.VENDOR_ID
                            and (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) = {0}";
      query = string.Format(query, catagoryId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCTS";
      return users;
    }
    internal DataSet GalleryProducts(int category, int page)
    {
      if (page > 0)
        page--;

      string query = @"select P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                            from PRODUCTS p , VENDORS V
                            where V.VENDOR_ID = P.VENDOR_ID and P.IS_ACTIVE=1
                            and (Select CATEGORY_ID from SUB_CATEGORIES where SUB_CATEGORY_ID = 
							PRODUCT_SUB_CATEGORY_ID) = {0}
							order by PRODUCT_ID asc
                            offset 8 * {1} ROWS FETCH NEXT 8 ROWS ONLY";
      query = string.Format(query, category, page);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "PRODUCTS";
      return users;
    }
    internal int updateCakePrice(int cakeId, int? minPrice)
    {
      return ExecuteNonQuery(string.Format("update cakes set Price = {1} where cake_id = {0}", cakeId, minPrice));
    }

    #endregion
  }
}