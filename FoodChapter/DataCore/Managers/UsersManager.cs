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
  public class UsersManager : DABase
  {
    private FoodChapterEntities db = new FoodChapterEntities();

    #region User

    internal string fetchUsername(int userid)
    {
      USER user = db.USERS.Where(u => u.USER_ID == userid).SingleOrDefault();
      if (user != null)
        return user.NAME;
      return "";
    }

    internal int AuthenticateFaceBookUser(USER user)
    {
      USER fbUser = db.USERS.Where(u => (u.EMAIL == user.EMAIL || u.PHONE == user.PHONE) && u.USER_TYPE == 3).SingleOrDefault();
      if (fbUser == null)
      {
        user.USER_TYPE = 3;
        db.USERS.Add(user);
        db.SaveChanges();
        return user.USER_ID;
      }
      else
        return fbUser.USER_ID;
    }

    internal int AuthenticateGoogleUser(USER user)
    {
      USER fbUser = db.USERS.Where(u => u.EMAIL == user.EMAIL && u.USER_TYPE == 2).SingleOrDefault();
      if (fbUser == null)
      {
        user.USER_TYPE = 2;
        db.USERS.Add(user);
        db.SaveChanges();
        return user.USER_ID;
      }
      else
        return fbUser.USER_ID;
    }

    internal int AuthenticateUser(string email, string password)
    {
      USER user = db.USERS.Where(u => u.EMAIL == email && u.PASSWORD == password).SingleOrDefault();
      if (user != null)
        return user.USER_ID;
      return 0;

    }
    internal int AuthenticateAdmin(string email, string password)
    {
      ADMIN user = db.ADMINS.Where(u => u.EMAIL == email && u.PASSWORD == password).SingleOrDefault();
      if (user != null)
        return user.ADMIN_ID;
      return 0;
      //DataSet ds =  ExecuteDataSet(string.Format("select * from admins where email = '{0}' and password = '{1}'", email, password));
      //if (ds.Tables[0].Rows.Count > 0)
      //    return int.Parse(ds.Tables[0].Rows[0][0].ToString());
      //else
      //    return 0;
    }

    internal DataSet GetAllUsers()
    {
      //return FoodHelper.ToDataSet(db.USERS.ToList(), "USERS");
      string query = "Select * from users where IS_ACTIVE=1";
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "USERS";
      return users;
    }
    internal DataSet GetAllCategories()
    {
      //return FoodHelper.ToDataSet(db.USERS.ToList(), "USERS");
      string query = "Select * from category where IS_ACTIVE=1";
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CATEGORY";
      return users;
    }
    internal DataSet GetAllAdmins()
    {
      //return FoodHelper.ToDataSet(db.USERS.ToList(), "USERS");
      string query = @"Select * from ADMINS where IS_ACTIVE=1";
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "ADMINS";
      return users;
    }
    internal DataSet GetUserById(int userId)
    {
      //return FoodHelper.ToDataSet(db.USERS.Where(u=>u.USER_ID == userId).ToList(), "USERS");

      string query = "Select * from users where USER_ID = {0}";
      query = string.Format(query, userId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "USERS";
      return users;
    }
    internal DataSet GetCategoryById(int userId)
    {
      //return FoodHelper.ToDataSet(db.USERS.Where(u=>u.USER_ID == userId).ToList(), "USERS");

      string query = "Select * from category where CATEGORY_ID = {0}";
      query = string.Format(query, userId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CATEGORY";
      return users;
    }
    internal DataSet GetUserReportData(DateTime fromDate, DateTime toDate)
    {
      //return FoodHelper.ToDataSet(db.USERS.Where(u => u.CREATED_ON >= fromDate && u.CREATED_ON <= toDate).ToList(), "USERS");

      string query = string.Format("SELECT * FROM USERS WHERE CREATED_ON >= '{0}' AND CREATED_ON <= '{1}'", fromDate, toDate);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "USERS";
      return users;
    }

    internal DataSet GetDashBoardData(int vendorId)
    {
      string query = @"select ((select count(*) from PRODUCTS
                            where ( -1 in ({0}) or VENDOR_ID in  ({0}))) + (select count(*) from CAKES
                            where ( -1 in ({0}) or VENDOR_ID in  ({0})
                                ))) as PRODUCTS,

                            (select count(*) from ORDER_DETAILS
                            where ( -1 in ({0}) or VENDOR_ID in  ({0}) and 
							( IS_DELIVERED is null or IS_DELIVERED  = 0 ) )) AS PENDING_ORDERS,

                            (select count(*) from ORDER_DETAILS
                            where ( -1 in ({0}) or VENDOR_ID in  ({0}))) AS ORDERS,


                            (select count(distinct CUSTOMER_ID ) from ORDERS O
							inner join ORDER_DETAILS OD ON O.ORDER_ID = OD.ORDER_ID
                            where ( -1 in ({0}) or OD.VENDOR_ID in  ({0}))) AS CUSTOMERS";

      query = string.Format(query, vendorId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "DASHBOARD";
      return users;
    }
    internal DataSet GetAdminDashBoardData(int adminId)
    {
      string query = @"select ((SELECT COUNT(*) FROM PRODUCTS p 
                          INNER JOIN SUB_CATEGORIES SC ON p.PRODUCT_SUB_CATEGORY_ID = sc.SUB_CATEGORY_ID
                          inner JOIN CATEGORY C ON SC.CATEGORY_ID = c.CATEGORY_ID
                          where C.CATEGORY_ID = 3 and P.IS_ACTIVE =1 )) as FOODS,

                          ((SELECT COUNT(*) FROM PRODUCTS p 
                          INNER JOIN SUB_CATEGORIES SC ON p.PRODUCT_SUB_CATEGORY_ID = sc.SUB_CATEGORY_ID
                          inner JOIN CATEGORY C ON SC.CATEGORY_ID = c.CATEGORY_ID
                          where C.CATEGORY_ID = 4 and P.IS_ACTIVE =1 )) as FROZEN_FOODS,

                          ((SELECT COUNT(*) FROM PRODUCTS p 
                          INNER JOIN SUB_CATEGORIES SC ON p.PRODUCT_SUB_CATEGORY_ID = sc.SUB_CATEGORY_ID
                          inner JOIN CATEGORY C ON SC.CATEGORY_ID = c.CATEGORY_ID
                          where C.CATEGORY_ID = 5 and P.IS_ACTIVE =1 )) as DESSERTS,


                          (select count(*) from CAKES) as CAKES,

                          (select count(*) from ORDER_DETAILS where (( (IS_DELIVERED is null or IS_DELIVERED  = 0) ) AND IS_REJECTED = 0)) AS PENDING_ORDERS,

                          (select count(*) from ORDER_DETAILS where (( IS_REJECTED =0 AND IS_DELIVERED  = 1 ) )) AS COMPLETED_ORDERS,

                          (select count(*) from ORDER_DETAILS where (( IS_REJECTED =1 AND IS_DELIVERED  = 0 ) )) AS COMPLETED_ORDERS,

                          (select COUNT(*) FROM USERS WHERE IS_ACTIVE = 1) AS CUSTOMERS,

                          (select COUNT(*) FROM VENDORS WHERE IS_ACTIVE = 1) AS VENDORS";

      query = string.Format(query, adminId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "DASHBOARD";
      return users;
    }

    internal bool saveCategories(CATEGORY cat)
    {
     
        const string Insert_category = "insert into CATEGORY values (@description,1,@createdBy,getdate(),@c1,@c2)";
        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(Insert_category, connection);
        
        cmd.Parameters.AddWithValue("description", cat.DESCRIPTION);
        cmd.Parameters.AddWithValue("createdBy", SessionManager.GetAdminSession());
      cmd.Parameters.AddWithValue("c1", DBNull.Value);
      cmd.Parameters.AddWithValue("c2", DBNull.Value);
      int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;
        //string query = "insert into CATEGORY values ('{0}',1,{1},getdate(),{1},getdate())";
        //return ExecuteNonQuery(string.Format(query, cat.DESCRIPTION, SessionManager.GetAdminSession()));
        //db.CATEGORies.Add(cat);
        //db.SaveChanges();
        //return cat.CATEGORY_ID;
    }

    internal bool saveUser(USER user)
    {

      const string INSERT_USERS = "insert into users values (1,@name,@email,@password,@phone,GETDATE(),0,GETDATE(),0,1)";

      OpenDBConnection();
      SqlCommand cmd = new SqlCommand(INSERT_USERS, connection);


      cmd.Parameters.AddWithValue("name", user.NAME);
      cmd.Parameters.AddWithValue("email", user.EMAIL);
      cmd.Parameters.AddWithValue("password", user.PASSWORD);
      cmd.Parameters.AddWithValue("phone", user.PHONE);
      int result = cmd.ExecuteNonQuery();
      CloseDBConnection();
      if (result > 0)
        return true;
      else
        return false;
      //db.USERS.Add(user);
      //db.SaveChanges();		DateTime.Now.ToString()	The name 'DateTime' does not exist in the current context	

      //return true;
      //return ExecuteNonQuery(string.Format("insert into users values (1,'{0}','{1}','{2}','{3}',GETDATE(),0,GETDATE(),0,1)", user.NAME, user.EMAIL, user.PASSWORD, user.PHONE)) > 0;

    }

    internal DataSet GetAdminInquirtList()
    {

      string query = "Select I.INQUIRY_ID, I.OBJECT_ID, I.INQUIRY_TIME, CONCAT( V.BUSINESS_ENTITY_NAME,P.NAME) as OBJECT_NAME, IT.Description as INQUIRY_TYPE From INQUIRY I left join INQUIRY_TYPE IT on IT.INQUIRY_TYPE_ID  =  I.INQUIRY_TYPE_ID  left join VENDORS V on V.VENDOR_ID=I.OBJECT_ID  left join PRODUCTS P on  P.PRODUCT_ID=I.OBJECT_ID";

      //query = string.Format(query, vendorId, showCount);
      query = string.Format(query);
      DataSet inquiry = ExecuteDataSet(query);
      inquiry.Tables[0].TableName = "INQUIRY";
      return inquiry;
    }

    internal int saveUserAtOrder(USER user)
    {
      const string INSERT_USERS = "insert into users values (1,@name,@email,@password,@phone,GETDATE(),0,GETDATE(),0,1)";

      OpenDBConnection();
      SqlCommand cmd = new SqlCommand(INSERT_USERS, connection);


      cmd.Parameters.AddWithValue("name", user.NAME);
      cmd.Parameters.AddWithValue("email", user.EMAIL);
      cmd.Parameters.AddWithValue("password", user.PASSWORD);
      cmd.Parameters.AddWithValue("phone", user.PHONE);
      int result = cmd.ExecuteNonQuery();
      CloseDBConnection();
      if (result > 0)
        return 0;
      else
        return result;
      //db.USERS.Add(user);
      //db.SaveChanges();
      //return true;
      //return int.Parse(ExecuteScalar(string.Format("insert into users values (1,'{0}','{1}','{2}','{3}',GETDATE(),0,GETDATE(),0,1) select scope_identity()", user.NAME, user.EMAIL, user.PASSWORD, user.PHONE)).ToString());

    }
    internal bool SaveAdminUser(ADMIN admin)
    {
      try
      {
        const string Insert_category = "insert into ADMINS values (@email,@password,GETDATE(),@createdBy,@ad1,@ad2,1)";
        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(Insert_category, connection);

        cmd.Parameters.AddWithValue("email", admin.EMAIL);
        cmd.Parameters.AddWithValue("password", admin.PASSWORD);
        cmd.Parameters.AddWithValue("createdBy",SessionManager.GetAdminSession());
        cmd.Parameters.AddWithValue("ad1", DBNull.Value);
        cmd.Parameters.AddWithValue("ad2", DBNull.Value);
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;
        //return ExecuteNonQuery(string.Format("insert into ADMINS values ('{0}','{1}',GETDATE(),{2},GETDATE(),{2},1)", admin.EMAIL, admin.PASSWORD, SessionManager.GetAdminSession())) > 0;

        //db.ADMINS.Add(admin);
        //db.SaveChanges();
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }

    }
    internal bool updateUser(USER user)
    {
      try
      {
        const string update_user = @"UPDATE[dbo].[USERS]
          SET [NAME] = @name
             ,[EMAIL] = @email
             ,[PASSWORD] = @password
             ,[PHONE] = @phone
             ,[UPDATED_ON] = GETDATE()
             ,[UPDATED_BY] = @updateBy
             ,[IS_ACTIVE] = @isActive
        WHERE USER_ID = @userId";
        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(update_user, connection);

        cmd.Parameters.AddWithValue("name", user.NAME);
        cmd.Parameters.AddWithValue("email", user.EMAIL);
        cmd.Parameters.AddWithValue("password", user.PASSWORD);
        cmd.Parameters.AddWithValue("phone", user.PHONE);
        cmd.Parameters.AddWithValue("updateBy", SessionManager.GetAdminSession());
        cmd.Parameters.AddWithValue("isActive", user.IS_ACTIVE == true ? 1:0);
        cmd.Parameters.AddWithValue("userId", user.USER_ID);
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;
        //       return ExecuteNonQuery(string.Format(@"UPDATE [dbo].[USERS]
        //  SET [NAME] = '{0}'
        //     ,[EMAIL] = '{1}'
        //     ,[PASSWORD] = '{2}'
        //     ,[PHONE] = '{3}'
        //     ,[UPDATED_ON] = GETDATE()
        //     ,[UPDATED_BY] = '{4}'
        //     ,[IS_ACTIVE] = {5}
        //WHERE USER_ID = {6}", user.NAME, user.EMAIL, user.PASSWORD, user.PHONE, SessionManager.GetAdminSession(), user.IS_ACTIVE == true ? 1 : 0, user.USER_ID)) > 0;

        //db.USERS.AddOrUpdate(user); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }

    }
    internal bool DeleteUser(int userId)
    {
      try
      {
        ExecuteNonQuery(string.Format("Update USERS SET IS_ACTIVE= 0 where USER_ID = {0}", userId));
        return true;
      }
      catch (Exception e)
      {
        return false;
      }
    }
    internal bool EditCategory(CATEGORY cat)
    {
      try
      {
        const string update_Category = @"UPDATE [dbo].[CATEGORY]
   SET [DESCRIPTION] = @decs
      ,[IS_ACTIVE] = @isActive
      ,[UPDATED_BY] = @updatedBy
      ,[UPDATED_ON] = GETDATE()
 WHERE CATEGORY_ID = @catId";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(update_Category, connection);

        cmd.Parameters.AddWithValue("decs", cat.DESCRIPTION);
        cmd.Parameters.AddWithValue("isActive", 1);
        cmd.Parameters.AddWithValue("updatedBy", SessionManager.GetAdminSession());
       
        cmd.Parameters.AddWithValue("catId", cat.CATEGORY_ID);
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;

        //       return ExecuteNonQuery(string.Fo rmat(@"UPDATE [dbo].[CATEGORY]
        //  SET [DESCRIPTION] = '{0}'
        //     ,[IS_ACTIVE] = '{1}'
        //     ,[UPDATED_BY] = '{2}'
        //     ,[UPDATED_ON] = GETDATE()
        //WHERE CATEGORY_ID = {3}", cat.DESCRIPTION, 1, SessionManager.GetAdminSession(), cat.CATEGORY_ID)) > 0;



        //db.CATEGORies.AddOrUpdate(cat); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();
        //return true;
      }
      catch (Exception e)
      {
        return false;
      }

    }
    internal bool DeleteCategory(int userId)
    {
      try
      {
        ExecuteNonQuery(string.Format("Update CATEGORY SET IS_ACTIVE= 0 where CATEGORY_ID = {0}", userId));
        return true;
      }
      catch (Exception e)
      {
        return false;
      }
    }
    internal bool DeleteAdminUser(int userId)
    {
      try
      {
        ExecuteNonQuery(string.Format("Update ADMINS SET IS_ACTIVE= 0 where ADMIN_ID = {0}", userId));
        return true;
      }
      catch (Exception e)
      {
        return false;
      }
    }
    //internal void UpdateUserImage(string userId, string path)
    //{
    //    ExecuteNonQuery(string.Format("UPDATE USERS SET PROFILE_IMAGE = '{1}' WHERE USER_ID = {0}", userId, path));
    //}
    internal bool uniqueEmail(int userType, string email, int id)
    {
      int count = 0;
      if (userType == 1)
        count = db.USERS.Count(x => x.EMAIL == email && x.USER_ID != id);
      else
        count = db.VENDORS.Count(x => x.EMAIL == email && x.VENDOR_ID != id);

      if (count <= 0)
        return true;
      else
        return false;
    }
    internal int uniqueEmailforCustomerAtPlaceOrder(string email)
    {
      USER u = db.USERS.Where(x => x.EMAIL == email).FirstOrDefault();
      if (u != null)
        return u.USER_ID;
      else
        return 0;
    }
    internal void checkFBGoogleUser(USER u)
    {
      int count = 0;
      count = db.USERS.Count(x => x.EMAIL == u.EMAIL);
      if (count > 0)
      {
        var user = db.USERS.SingleOrDefault(x => x.EMAIL == u.EMAIL);
        SessionManager.SetUserSession(user.USER_ID);
        SessionManager.SetUsernameSession(user.NAME);
      }
      else
      {
        db.USERS.Add(u);
        db.SaveChanges();
        SessionManager.SetUserSession(u.USER_ID);
        SessionManager.SetUsernameSession(u.NAME);
      }
    }
    #endregion
    internal int IsUniqueCat(string cakeName, int vendorId)
    {
      int result = 1;
      CATEGORY cakes = db.CATEGORies.Where(u => u.DESCRIPTION == cakeName && u.CATEGORY_ID == vendorId).SingleOrDefault();
      if (cakes != null)
        result = 0;

      return result;
    }

    internal int IsUniqueCat(string cakeName, int vendorId, int cakeId)
    {
      int result = 1;
      CATEGORY cakes = db.CATEGORies.Where(u => u.DESCRIPTION == cakeName && u.CATEGORY_ID == vendorId && u.CATEGORY_ID != cakeId).SingleOrDefault();
      if (cakes != null)
        result = 0;

      return result;
    }
    internal int saveQueries(EMAIL_DATA emailData)
    {
      return ExecuteNonQuery(string.Format(@"Insert into EMAIL_DATA values ('{0}','{1}','{2}',getdate())", emailData.NAME, emailData.EMAIL, emailData.MESSAGE));
    }
  }
}