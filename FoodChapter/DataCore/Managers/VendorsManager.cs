using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

namespace FoodChapter.DataManagers
{
    public class VendorsManager:DABase
    {
        private FoodChapterEntities db = new FoodChapterEntities();
        internal int AuthenticateVendor(string email, string password)
        {
            VENDOR vendor = db.VENDORS.Where(u => u.EMAIL == email && u.PASSWORD == password).SingleOrDefault();
            if (vendor != null)
            {
                //SessionManager.SetUserSession(vendor.VENDOR_ID);
                //HttpContext.Current.Session["VENDOR_ID"] = vendor.VENDOR_ID;
                return vendor.VENDOR_ID;
            }
                
            return 0;
        }

        internal int IsUniqueVendor(string businessEntity, string phone)
        {
            int result = 1;
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("select * from VENDORS where  BUSINESS_ENTITY_NAME = @entity or PRIMARY_WORKSPACE_PHONE = @phone", connection);
            cmd.Parameters.AddWithValue("entity", businessEntity);
            cmd.Parameters.AddWithValue("phone", phone);
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            OpenDBConnection();
            da.Fill(ds);
            CloseDBConnection();
            
            //DataSet ds = ExecuteDataSet(string.Format("select * from VENDORS where  BUSINESS_ENTITY_NAME = '{0}' and PRIMARY_WORKSPACE_PHONE = '{1}'", businessEntity, phone));
            if (ds!=null && ds.Tables[0].Rows.Count > 0)
                return 0;

            return result;
        }

        internal int IsUniqueVendor(string businessEntity, string phone, int vendorId)
        {
            int result = vendorId;
            //VENDOR vendor = db.VENDORS.Where(u => u.BUSINESS_ENTITY_NAME == businessEntity && u.VENDOR_ID != vendorId).SingleOrDefault();
            //if (vendor == null)
            //{
            //    vendor = db.VENDORS.Where(u => u.PERSONAL_PHONE == phone && u.VENDOR_ID != vendorId).SingleOrDefault();
            //    if (vendor != null)
            //        result = 0;
            //}
            //else
            //    result = 0;
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("select * from VENDORS where VENDOR_ID <> @vendorId and  BUSINESS_ENTITY_NAME = @entity or PRIMARY_WORKSPACE_PHONE = @phone", connection);
            cmd.Parameters.AddWithValue("entity", businessEntity);
            cmd.Parameters.AddWithValue("phone", phone);
            cmd.Parameters.AddWithValue("vendorId", vendorId);
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            OpenDBConnection();
            da.Fill(ds);
            CloseDBConnection();

            if (ds != null && ds.Tables[0].Rows.Count > 0)
                return 0;

            return result;

            //DataSet ds = ExecuteDataSet(string.Format("select * from VENDORS where VENDOR_ID <> {0} and BUSINESS_ENTITY_NAME = '{1}' and PRIMARY_WORKSPACE_PHONE = '{2}'", vendorId, businessEntity, phone));
            //if (ds.Tables[0].Rows.Count > 0)
              //  return 0;

            //return result;
        }

        internal DataSet GetVendorRating(int vendorId)
        {
            string qry = @"select top(1) (select sum(RATING) from VENDOR_REVIEW where VENDOR_ID = {0}) /
                            (select count(*) from VENDOR_REVIEW where VENDOR_ID = {0}) as RATING from [VENDOR_REVIEW]";
            DataSet ds = ExecuteDataSet(string.Format(qry, vendorId));
            ds.Tables[0].TableName = "VENDOR_REVIEW";
            return ds;
        }

        internal DataSet GetVendorsReview(int vendorId)
        {
            //string qry = @" select (select case when NAME is null or len(NAME) = 0
            //                then Concat('Foodie',CUSTOMER_ID) end  from USERS
            //                where USER_ID = vr.[CUSTOMER_ID]) as NAME, vr.[CUSTOMER_ID], [RATING], [REVIEW] from VENDOR_REVIEW vr
            //                  where VENDOR_ID = {0} order by CREATED_ON DESC";
      string qry = @"select VENDOR_REVIEW.CUSTOMER_ID,VENDOR_REVIEW.RATING,VENDOR_REVIEW.REVIEW,USERS.NAME
							  from VENDOR_REVIEW
							  left join USERS on USERS.USER_ID = VENDOR_REVIEW.CUSTOMER_ID
							  where VENDOR_ID = {0}
							  order by VENDOR_REVIEW.CREATED_ON desc";
      DataSet ds = ExecuteDataSet(string.Format(qry, vendorId));
            ds.Tables[0].TableName = "VENDOR_REVIEW";
            return ds;
        }

        internal DataSet CheckUserOrder(int userId)
        {
            string qry = @"select count(*) as ORDER_COUNT from ORDERS
                            where CUSTOMER_ID = {0}";
            DataSet ds = ExecuteDataSet(string.Format(qry, userId));
            ds.Tables[0].TableName = "VENDOR_REVIEW";
            return ds;
        }


        internal bool SaveVendorReview(VENDOR_REVIEW review)
        {

            try
            {

        const string INSERT_REVIEW = "insert into vendor_review values (@vendorId,@customerId,@ratting,@review,@createdDate)";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(INSERT_REVIEW, connection);


        cmd.Parameters.AddWithValue("vendorId", review.VENDOR_ID);
        cmd.Parameters.AddWithValue("customerId", review.CUSTOMER_ID);
        cmd.Parameters.AddWithValue("ratting", review.RATING);
        cmd.Parameters.AddWithValue("review", review.REVIEW);
        cmd.Parameters.AddWithValue("createdDate", review.CREATED_ON);
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;
        //return ExecuteNonQuery(string.Format("insert into vendor_review values ({0},{1},{2},'{3}','{4}')", review.VENDOR_ID,
        //    review.CUSTOMER_ID, review.RATING, review.REVIEW, review.CREATED_ON

        //    )) > 0;
      }
            catch(Exception exc)
            {
                return false;
            }
        }

    internal bool SaveInquiry(INQUIRY inquiry)
    {

      try
      {

        const string Insert_Inquiry = "insert into INQUIRY values (@userId,@objectId,@time,@typeId) ";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(Insert_Inquiry, connection);

        cmd.Parameters.AddWithValue("userId", inquiry.USER_ID);
        cmd.Parameters.AddWithValue("objectId", inquiry.OBJECT_ID);
        cmd.Parameters.AddWithValue("time", inquiry.INQUIRY_TIME);
        cmd.Parameters.AddWithValue("typeId", inquiry.INQUIRY_TYPE_ID);
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
        if (result > 0)
          return true;
        else
          return false;
      }
      catch (Exception ex)
      {
        return false;
      }
    }
    internal string getVendorImage(int vendorId)
        {
            VENDOR vendor = db.VENDORS.Where(u => u.VENDOR_ID == vendorId).SingleOrDefault();
     
            if (vendor != null)
                return vendor.PROFILE_IMAGE;
            else
                return "";
        }
    internal string getVendorPersonalImage(int vendorId)
    {
      VENDOR vendor = db.VENDORS.Where(u => u.VENDOR_ID == vendorId).SingleOrDefault();
      if (vendor != null)
        return vendor.PERSONAL_IMAGE;
      else
        return "";
    }
    internal DataSet getVendorOrderAndProduct(SellerSearchModel whereClause)
        {
            if (whereClause.page > 0)
                whereClause.page--;

            SqlDataAdapter da = new SqlDataAdapter();

            SqlCommand cmd = new SqlCommand("SP_GET_VENDORS", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@key", whereClause.key));
            cmd.Parameters.Add(new SqlParameter("@all", whereClause.all));
            cmd.Parameters.Add(new SqlParameter("@cake", whereClause.cake));
            cmd.Parameters.Add(new SqlParameter("@food", whereClause.food));
            cmd.Parameters.Add(new SqlParameter("@dessert", whereClause.dessert));
            cmd.Parameters.Add(new SqlParameter("@frozen", whereClause.frozen));
            cmd.Parameters.Add(new SqlParameter("@delivery", whereClause.delivery));
            cmd.Parameters.Add(new SqlParameter("@page", whereClause.page));
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            OpenDBConnection();

            da.Fill(ds);
            CloseDBConnection();
            ds.Tables[0].TableName = "VENDORS";
            return ds;
            
//            if(whereClause.key.Equals("0") && whereClause.cake && whereClause.food && whereClause.frozen && whereClause.dessert && whereClause.delivery)
//            {
//                string qry = @"select (SELECT COUNT(*) FROM ORDERS c Where VENDOR_ID = v.VENDOR_ID ) AS VENDOR_ORDERS, 
//                                (SELECT COUNT(*) FROM   PRODUCTS Where VENDOR_ID = v.VENDOR_ID) AS VENDOR_ITEMS,
//                                v.* 
//                                from vendors v  {0}
//                                ";
//                DataSet ds = ExecuteDataSet(qry);
//                ds.Tables[0].TableName = "VENDORS";
//                return ds;
//            }
            


            
        }
        internal DataSet GetAllVendors()
        {
            string query = "Select * from Vendors Where IS_ACTIVE=1";
            DataSet vendors = ExecuteDataSet(query);
            vendors.Tables[0].TableName = "VENDORS";
            return vendors;
        }
        internal DataSet GetTopSixVendors()
        {
            string query = "Select Top(6) * from Vendors";
            DataSet vendors = ExecuteDataSet(query);
            vendors.Tables[0].TableName = "VENDORS";
            return vendors;
        }
        internal DataSet GetVendorProfileByUniqueId(string uniqueId)
        {
            string query = string.Format("select * from vendors where unique_id = '{0}' ", uniqueId);
            DataSet vendor = ExecuteDataSet(query);
            vendor.Tables[0].TableName = "VENDOR";
            return vendor;
        }
        internal DataSet GetVendorProfileByEntityName(string entity)
        {
            string query = string.Format("select * from vendors where Business_entity_name = '{0}' ", entity);
            DataSet vendor = ExecuteDataSet(query);
            vendor.Tables[0].TableName = "VENDOR";
            return vendor;
        }
        internal DataSet GetVendorById(string id)
        {
            try
            {

                SqlDataAdapter da = new SqlDataAdapter();

                SqlCommand cmd = new SqlCommand("SP_GET_VENDOR_DETAILS", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@vendorId", id));
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                OpenDBConnection();

                da.Fill(ds);
                CloseDBConnection();
                ds.Tables[0].TableName = "VENDOR";
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            //string query = string.Format("select * from vendors where vendor_id = '{0}' ",id);
            //DataSet vendor = ExecuteDataSet(query);
            //vendor.Tables[0].TableName = "VENDOR";
            //return vendor;
        }
        internal int saveVendor(VENDOR vendor)
        {
            vendor.FEATURED = false;
            Guid guid = Guid.NewGuid();
            vendor.UNIQUE_ID = guid.ToString();
            vendor.IS_APPROVED = false;
            //vendor.PROFILE_IMAGE = "";
            //vendor.CNIC_IMAGE = "";

      const string SaveVendor = "Insert into vendors values (@fName,@mName,@lName,@bEntity,@email,@pass,@persPhone,@PRIMARY_WORKSPACE_PHONE,@SECONDARY_WORKSPACE_PHONE,@PERSONAL_ADDRESS,@BUSINESS_ADDRESS,@CNIC,0,@DESCRIPTION,@PROFILE_IMAGE,1,@UNIQUE_ID,getdate(),@CREATED_BY,@UPDATED_ON,@UPDATED_BY,1,0,@APPROVED_BY,@APPROVED_ON,@CNIC_IMAGE,@PERSONAL_IMAGE) SELECT SCOPE_IDENTITY()";

      OpenDBConnection();
      SqlCommand cmd = new SqlCommand(SaveVendor, connection);


      cmd.Parameters.AddWithValue("fName", vendor.FIRST_NAME);
      cmd.Parameters.AddWithValue("mName", DBNull.Value);
      cmd.Parameters.AddWithValue("lName", vendor.LAST_NAME);
      cmd.Parameters.AddWithValue("bEntity", vendor.BUSINESS_ENTITY_NAME);
      cmd.Parameters.AddWithValue("email", vendor.EMAIL);
      cmd.Parameters.AddWithValue("pass", vendor.PASSWORD);
      cmd.Parameters.AddWithValue("persPhone", vendor.PERSONAL_PHONE);
      cmd.Parameters.AddWithValue("PRIMARY_WORKSPACE_PHONE", "");
      cmd.Parameters.AddWithValue("SECONDARY_WORKSPACE_PHONE","");
      cmd.Parameters.AddWithValue("PERSONAL_ADDRESS", vendor.PERSONAL_ADDRESS);
      cmd.Parameters.AddWithValue("BUSINESS_ADDRESS", "");
      cmd.Parameters.AddWithValue("CNIC", vendor.CNIC);
      //cmd.Parameters.AddWithValue("fName", vendor.FIRST_NAME);
      cmd.Parameters.AddWithValue("DESCRIPTION", vendor.DESCRIPTION);
      cmd.Parameters.AddWithValue("PROFILE_IMAGE", "../UploadedFiles/FoodSellers/Avatar.png");
      //cmd.Parameters.AddWithValue("fName", vendor.FIRST_NAME);
      cmd.Parameters.AddWithValue("UNIQUE_ID", vendor.UNIQUE_ID = guid.ToString());
      cmd.Parameters.AddWithValue("CREATED_BY", SessionManager.GetVendorSession());
      cmd.Parameters.AddWithValue("UPDATED_ON", DBNull.Value);
      cmd.Parameters.AddWithValue("UPDATED_BY", DBNull.Value);
      //cmd.Parameters.AddWithValue("fName", vendor.FIRST_NAME);
      //cmd.Parameters.AddWithValue("fName", vendor.FIRST_NAME);
      cmd.Parameters.AddWithValue("APPROVED_BY", DBNull.Value);
      cmd.Parameters.AddWithValue("APPROVED_ON", DBNull.Value);
      cmd.Parameters.AddWithValue("CNIC_IMAGE", DBNull.Value);
      cmd.Parameters.AddWithValue("PERSONAL_IMAGE", "");
      int result = int.Parse(cmd.ExecuteScalar().ToString());
      CloseDBConnection();
      //string qry = @"Insert into vendors values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}',{12},'{13}','{14}',{15},'{16}','{17}',{18},'{19}',{20},{21},{22},{23},'{24}','{25}') SELECT SCOPE_IDENTITY()";
      //      int result = int.Parse(ExecuteScalar(string.Format(qry,
      //          vendor.FIRST_NAME, vendor.MIDDLE_NAME, vendor.LAST_NAME, vendor.BUSINESS_ENTITY_NAME, vendor.EMAIL, vendor.PASSWORD,
      //          vendor.PERSONAL_PHONE, vendor.PRIMARY_WORKSPACE_PHONE, vendor.SECONDARY_WORKSPACE_PHONE, vendor.PERSONAL_ADDRESS,
      //          vendor.BUSINESS_ADDRESS, vendor.CNIC, 0, vendor.DESCRIPTION, vendor.PROFILE_IMAGE,1,
      //          vendor.UNIQUE_ID, vendor.CREATED_ON, vendor.CREATED_BY, vendor.CREATED_ON, vendor.CREATED_BY, 1,
      //          0, vendor.CREATED_BY, vendor.CREATED_ON,vendor.CNIC_IMAGE)).ToString());

            foreach (var data in vendor.VENDOR_CATEGORIES)
            {
                data.UPDATED_ON = DateTime.Now;
                ExecuteNonQuery(string.Format("insert into VENDOR_CATEGORIES values ({0},{1},'{2}',{3})",data.CATEGORY_ID,result,vendor.UPDATED_ON,result));
            }
            return result;        
                    //db.VENDORS.Add(vendor); 
                //db.SaveChanges();
                //foreach (var data in vendor.VENDOR_CATEGORIES)
                //{
                //    //data.VENDOR_ID = vendor.VENDOR_ID;
                //    data.UPDATED_BY = vendor.VENDOR_ID;
                //    data.UPDATED_ON = DateTime.Now;
                //    db.VENDOR_CATEGORIES.Add(data);
                //}
                //db.SaveChanges();
                //return vendor.VENDOR_ID;
            
        }
        internal int MarkFeatured(int vendorId)
        {
            string query = "update vendors set FEATURED = 1 where VENDOR_ID = {0}";
            return ExecuteNonQuery(string.Format(query,vendorId));
        }
        internal DataSet GetVendors()
        {
            string query = "SELECT v.*, (case when FEATURED = 1 then 'Yes' else 'No' END) IS_FEATURED, (case when IS_APPROVED = 1 then 'Approved' else 'Pending' END) STATUS from VENDORS v";
            DataSet vendors = ExecuteDataSet(query);
            vendors.Tables[0].TableName = "VENDORS";
            return vendors;
        }
        internal bool updateVendor(VENDOR vendor)
        {
            try
            {
        Guid guid = Guid.NewGuid();
        vendor.UNIQUE_ID = guid.ToString();
        
        VENDOR v = db.VENDORS.Where(x => x.VENDOR_ID == vendor.VENDOR_ID).FirstOrDefault();
        const string update_Vendor = @"UPDATE [dbo].[VENDORS]
   SET [FIRST_NAME] = @fName
      ,[MIDDLE_NAME] = @mName
      ,[LAST_NAME] = @Lname
      ,[BUSINESS_ENTITY_NAME] = @BUSINESS_ENTITY_NAME
      ,[EMAIL] = @EMAIL
      ,[PASSWORD] = @PASSWORD
      ,[PERSONAL_PHONE] = @PERSONAL_PHONE
      ,[PRIMARY_WORKSPACE_PHONE] = @PRIMARY_WORKSPACE_PHONE
      ,[SECONDARY_WORKSPACE_PHONE] = @SECONDARY_WORKSPACE_PHONE
      ,[PERSONAL_ADDRESS] = @PERSONAL_ADDRESS
      ,[BUSINESS_ADDRESS] = @BUSINESS_ADDRESS
      ,[CNIC] = @CNIC
      ,[FEATURED] = @FEATURED
      ,[DESCRIPTION] = @DESCRIPTION
      ,[DELIVERY] = @DELIVERY
      ,[UNIQUE_ID] = @UNIQUE_ID
      
      ,[UPDATED_ON] = @UPDATED_ON
      ,[UPDATED_BY] = @UPDATED_BY
      ,[IS_ACTIVE] = @isActive
      ,[IS_APPROVED] = @IS_APPROVED
      ,[APPROVED_BY] =@APPROVED_BY
      ,[APPROVED_ON] = @APPROVED_ON
       WHERE VENDOR_ID = @VENDOR_ID";

        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(update_Vendor, connection);

        cmd.Parameters.AddWithValue("fName", vendor.FIRST_NAME);
        cmd.Parameters.AddWithValue("mName", vendor.MIDDLE_NAME);
        cmd.Parameters.AddWithValue("Lname", vendor.LAST_NAME);
        cmd.Parameters.AddWithValue("BUSINESS_ENTITY_NAME", vendor.BUSINESS_ENTITY_NAME);
        cmd.Parameters.AddWithValue("EMAIL", vendor.EMAIL);
        cmd.Parameters.AddWithValue("PASSWORD", vendor.PASSWORD);
        cmd.Parameters.AddWithValue("PERSONAL_PHONE", vendor.PERSONAL_PHONE);
        cmd.Parameters.AddWithValue("PRIMARY_WORKSPACE_PHONE", vendor.PRIMARY_WORKSPACE_PHONE);
        cmd.Parameters.AddWithValue("SECONDARY_WORKSPACE_PHONE", vendor.SECONDARY_WORKSPACE_PHONE);
        cmd.Parameters.AddWithValue("PERSONAL_ADDRESS", vendor.PERSONAL_ADDRESS);
        cmd.Parameters.AddWithValue("BUSINESS_ADDRESS", vendor.BUSINESS_ADDRESS);
        cmd.Parameters.AddWithValue("CNIC", vendor.CNIC);
        cmd.Parameters.AddWithValue("FEATURED", 0);
        cmd.Parameters.AddWithValue("DESCRIPTION", vendor.DESCRIPTION);
        cmd.Parameters.AddWithValue("DELIVERY", vendor.DELIVERY == true ? 1 : 0);
        cmd.Parameters.AddWithValue("UNIQUE_ID", vendor.UNIQUE_ID);
        
        cmd.Parameters.AddWithValue("UPDATED_ON", vendor.UPDATED_ON);
        cmd.Parameters.AddWithValue("UPDATED_BY", SessionManager.GetVendorSession());
        cmd.Parameters.AddWithValue("isActive", 1);
        cmd.Parameters.AddWithValue("IS_APPROVED", 0);
        cmd.Parameters.AddWithValue("APPROVED_BY", 0);
        cmd.Parameters.AddWithValue("APPROVED_ON", DBNull.Value);
        cmd.Parameters.AddWithValue("VENDOR_ID", vendor.VENDOR_ID);
        int result = cmd.ExecuteNonQuery();
        CloseDBConnection();
     
        
       


 //       string query = @"UPDATE [dbo].[VENDORS]
 //  SET [FIRST_NAME] = '{0}'
 //     ,[MIDDLE_NAME] = '{1}'
 //     ,[LAST_NAME] = '{2}'
 //     ,[BUSINESS_ENTITY_NAME] = '{3}'
 //     ,[EMAIL] = '{4}'
 //     ,[PASSWORD] = '{5}'
 //     ,[PERSONAL_PHONE] = '{6}'
 //     ,[PRIMARY_WORKSPACE_PHONE] = '{7}'
 //     ,[SECONDARY_WORKSPACE_PHONE] = '{8}'
 //     ,[PERSONAL_ADDRESS] = '{9}'
 //     ,[BUSINESS_ADDRESS] = '{10}'
 //     ,[CNIC] = '{11}'
 //     ,[FEATURED] = {12}
 //     ,[DESCRIPTION] = '{13}'
 //     ,[PROFILE_IMAGE] = '{14}'
 //     ,[DELIVERY] = {15}
 //     ,[UNIQUE_ID] = '{16}'
 //     ,[CREATED_ON] = '{17}'
 //     ,[CREATED_BY] = {18}
 //     ,[UPDATED_ON] = '{19}'
 //     ,[UPDATED_BY] = {20}
 //     ,[IS_ACTIVE] = {21}
 //     ,[IS_APPROVED] = {22}
 //     ,[APPROVED_BY] = {23}
 //     ,[APPROVED_ON] = '{24}'
 //WHERE VENDOR_ID = {25}";
 //       Guid guid = Guid.NewGuid();
 //       vendor.UNIQUE_ID = guid.ToString();

 //       VENDOR v = db.VENDORS.Where(x => x.VENDOR_ID == vendor.VENDOR_ID).FirstOrDefault();

 //       int result = ExecuteNonQuery(string.Format(query,
 //       vendor.FIRST_NAME, vendor.MIDDLE_NAME, vendor.LAST_NAME, vendor.BUSINESS_ENTITY_NAME, vendor.EMAIL, vendor.PASSWORD,
 //       vendor.PERSONAL_PHONE, vendor.PRIMARY_WORKSPACE_PHONE, vendor.SECONDARY_WORKSPACE_PHONE, vendor.PERSONAL_ADDRESS,
 //       vendor.BUSINESS_ADDRESS, vendor.CNIC, 0, vendor.DESCRIPTION, vendor.PROFILE_IMAGE, vendor.DELIVERY == true ? 1 : 0,
 //       vendor.UNIQUE_ID, v.CREATED_ON, 0, v.CREATED_ON, 0, 1,
 //       0, 0, vendor.APPROVED_ON, vendor.VENDOR_ID));

        ExecuteNonQuery(string.Format("delete from vendor_categories where vendor_id = {0}", vendor.VENDOR_ID));

                foreach (var data in vendor.VENDOR_CATEGORIES)
                {
                    data.UPDATED_ON = DateTime.Now;
                    ExecuteNonQuery(string.Format("insert into VENDOR_CATEGORIES values ({0},{1},'{2}',{3})", data.CATEGORY_ID, vendor.VENDOR_ID, vendor.UPDATED_ON, vendor.VENDOR_ID));
                }

        //db.VENDORS.AddOrUpdate(v => v.VENDOR_ID, vendor); //requires using System.Data.Entity.Migrations;
        //db.SaveChanges();

        //ExecuteNonQuery(string.Format("delete from vendor_categories where vendor_id = {0}",vendor.VENDOR_ID));
        //foreach(var data in vendor.VENDOR_CATEGORIES)
        //{
        //    db.VENDOR_CATEGORIES.Add(data);
        //}
        //db.SaveChanges();
        if (result > 0)
          return true;
        else
          return false;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        
      internal DataSet SearchVendor(string vendorSearch)
    {
      SqlDataAdapter da = new SqlDataAdapter();
      SqlCommand cmd = new SqlCommand("select * from VENDORS where FIRST_NAME like @fname OR MIDDLE_NAME like @mName OR LAST_NAME like @LName", connection);
      cmd.Parameters.AddWithValue("fname", vendorSearch);
      cmd.Parameters.AddWithValue("mName", vendorSearch);
      cmd.Parameters.AddWithValue("LName", vendorSearch);
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
    }
    //string query = @"select * from VENDORS
    //                        where FIRST_NAME like '%{0}%' OR MIDDLE_NAME like '%{0}%' OR LAST_NAME like '%{0}%'";
    //        query = string.Format(query, vendorSearch);
    //        DataSet users = ExecuteDataSet(query);
    //        users.Tables[0].TableName = "VENDORS";
    //        return users;
        
        internal int ApprovedByAdmin(int vendorId)
        {
            try
            {
               return  ExecuteNonQuery(string.Format("Update VENDORS SET IS_APPROVED= 1,APPROVED_ON = '{1}', APPROVED_BY = {2} where VENDOR_ID = {0}", vendorId,DateTime.Now.ToString(),SessionManager.GetAdminSession()));

                
            }
            catch (Exception e)
            {
                return 0;
            }
        }
        internal bool DeleteVendor(int vendorId)
        {
            try
            {
        ExecuteNonQuery(string.Format("Update VENDORS SET IS_ACTIVE= 0 where VENDOR_ID = {0}", vendorId));

        return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        internal void UpdateVendorImage(string vendorId, string path)
        {
      const string updateVendorImage = "UPDATE VENDORS SET PROFILE_IMAGE = @pImage WHERE VENDOR_ID = @vendorId";
      OpenDBConnection();
      SqlCommand cmd = new SqlCommand(updateVendorImage, connection);

      cmd.Parameters.AddWithValue("pImage", path);
      cmd.Parameters.AddWithValue("vendorId", vendorId);
      int result = cmd.ExecuteNonQuery();
      CloseDBConnection();
      //ExecuteNonQuery(string.Format("UPDATE VENDORS SET PROFILE_IMAGE = '{1}' WHERE VENDOR_ID = {0}",vendorId,path));
        }
    internal void UpdatePersonalImage(string vendorId, string path)
    {
      const string UpdatePersonalImage = "UPDATE VENDORS SET PERSONAL_IMAGE = @pImage WHERE VENDOR_ID = @vendorId";
      OpenDBConnection();
      SqlCommand cmd = new SqlCommand(UpdatePersonalImage, connection);

      cmd.Parameters.AddWithValue("pImage", path);
      cmd.Parameters.AddWithValue("vendorId", vendorId);
      int result = cmd.ExecuteNonQuery();
      CloseDBConnection();
      //ExecuteNonQuery(string.Format("UPDATE VENDORS SET PROFILE_IMAGE = '{1}' WHERE VENDOR_ID = {0}",vendorId,path));
    }
    internal void UpdateCNICImage(string vendorId, string path)
    {
      const string updateVendorCnicImage = "UPDATE VENDORS SET CNIC_IMAGE = @pImage WHERE VENDOR_ID = @vendorId";
      OpenDBConnection();
      SqlCommand cmd = new SqlCommand(updateVendorCnicImage, connection);

      cmd.Parameters.AddWithValue("pImage", path);
      cmd.Parameters.AddWithValue("vendorId", vendorId);
      int result = cmd.ExecuteNonQuery();
      CloseDBConnection();
      //ExecuteNonQuery(string.Format("UPDATE VENDORS SET CNIC_IMAGE = '{1}' WHERE VENDOR_ID = {0}", vendorId, path));
    }
    internal DataSet GetFeaturedSellers()
        {
            string query = "select top  5* from VENDORS where FEATURED =1";
            DataSet vendors = ExecuteDataSet(query);
            vendors.Tables[0].TableName = "VENDORS";
            return vendors;
        }
        internal DataSet GetFeaturedVendorsforGalleryFilter()
        {
            DataSet vendors = ExecuteDataSet("select VENDOR_ID,ISNULL(BUSINESS_ENTITY_NAME,'') as BUSINESS_ENTITY_NAME from VENDORS where FEATURED = 1 and IS_ACTIVE = 1 and IS_APPROVED =1");
            vendors.Tables[0].TableName = "VENDORS";
            return vendors;
        }
        internal DataSet GetVendorProductsByPrice(int vendorId, int code)
        {
            string query = @"Select p.*, (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) as CATEGORY_ID from PRODUCTS p
                            inner join vendors v on P.vendor_id = v.vendor_id
                            where 1=1 and p.vendor_id = {0} and p.is_active =1 {1} ";
            string where = "";
            if (code == 1)
                where = "";
            else if (code == 2)
                where = " and p.PRICE <=500";
            else if (code == 3)
                where = " and p.price >=500 and p.price <=1500";
            else
                where = " and p.price >= 1500";

            query = string.Format(query, vendorId, where);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "PRODUCTS";
            return users;
        }

        internal DataSet GetProductsByVendor(int vendorId)
        {
            string query = @"Select p.*, (Select CATEGORY_ID from SUB_CATEGORIES where CATEGORY_ID = SUB_CATEGORY_ID) as CATEGORY_ID from PRODUCTS p
                            inner join vendors v on P.vendor_id = v.vendor_id
                            where 1=1 and p.vendor_id = {0} and p.is_active =1 ";

            query = string.Format(query, vendorId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "PRODUCTS";
            return users;
        }
        internal DataSet GetVendorCakesByPrice(int vendorId,int code)
        {
            string query = @"select c.* from CAKES c
                inner join vendors v on c.vendor_id = v.vendor_id
                where 1=1 and c.vendor_id = {0} and c.is_active =1 {1}";
            
            string where = "";
            if (code == 1)
                where = "";
            else if (code == 2)
                where = " and C.PRICE <=500";
            else if (code == 3)
                where = " and c.price >=500 and c.price <=1500";
            else
                where = " and c.price >=1500";

            query = string.Format(query, vendorId,where);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "CAKES";
            return users;
        }
    }
} 