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
using System.Collections;

namespace FoodChapter.DataManagers
{
    public class OrderManager : DABase
    {
        private FoodChapterEntities db = new FoodChapterEntities();

        #region OrderDetails
        internal bool SaveOrderDetail(ORDER_DETAILS orderDetail)
        {
      const string SAVE_ORDER = "insert into ORDER_DETAILS values (@ORDER_ID,@VENDOR_ID,@ITEM_ID,@ITEM_TYPE,@QUANTITY,0,0,@rejectReason,@discount,0)";
      OpenDBConnection();
      SqlCommand cmd = new SqlCommand(SAVE_ORDER, connection);

      cmd.Parameters.AddWithValue("ORDER_ID", orderDetail.ORDER_ID);
      cmd.Parameters.AddWithValue("VENDOR_ID", orderDetail.VENDOR_ID);
      cmd.Parameters.AddWithValue("ITEM_ID", orderDetail.ITEM_ID);
      cmd.Parameters.AddWithValue("ITEM_TYPE", orderDetail.ITEM_TYPE);
      cmd.Parameters.AddWithValue("QUANTITY", orderDetail.QUANTITY);
      cmd.Parameters.AddWithValue("rejectReason", string.Empty);
      cmd.Parameters.AddWithValue("discount", orderDetail.DISCOUNT == null ? 0 : orderDetail.DISCOUNT);

      int result = cmd.ExecuteNonQuery();
      CloseDBConnection();

      if (result > 0)
        return true;
      else
        return false;
      //return ExecuteNonQuery(string.Format("insert into ORDER_DETAILS values ({0},{1},{2},{3},{4},{5},{6},'{7}',{8},0)",
      //              orderDetail.ORDER_ID, orderDetail.VENDOR_ID, orderDetail.ITEM_ID, orderDetail.ITEM_TYPE, orderDetail.QUANTITY,
      //              0, 0, string.Empty, orderDetail.DISCOUNT == null ? 0 : orderDetail.DISCOUNT)) > 0;
                //orderDetail.IS_DELIVERED = false;
                //orderDetail.IS_REJECTED = false;
                //orderDetail.REJECTED_REASON = string.Empty;
                //orderDetail.DISCOUNT = 0;
                //db.ORDER_DETAILS.Add(orderDetail); //requires using System.Data.Entity.Migrations;
                //db.SaveChanges();
                //return true;
            
        }

        internal bool DeleteOrderDetail(int OrderId)
        {
            //later need major revamp
            return false;
            string query = string.Format(@"DELETE FROM ORDER_DETAILS WHERE ORDER_ID = {0}", OrderId);

            int result = ExecuteNonQuery(query);
            if (result > 0)
                return true;
            else
                return false;
        }
        #endregion

        #region Order
        internal int SaveOrder(ORDER order)
        {
            try
            {
        const string SAVE_ORDER = "insert into orders values (@customerId,@STATUS_ID,@ADDRESS,@CONTACT_NO,@EMAIL,@GREETINGS,@totalAmount,@shipping,@discount,@Fbill,GETDATE(),@createdBy,1,@updatedOn,@updateBy,@RejectedReason,@CustomerName) select scope_identity() ";
        OpenDBConnection();
        SqlCommand cmd = new SqlCommand(SAVE_ORDER, connection);

        cmd.Parameters.AddWithValue("customerId", order.CUSTOMER_ID);
        cmd.Parameters.AddWithValue("STATUS_ID", order.STATUS_ID);
        cmd.Parameters.AddWithValue("ADDRESS", order.ADDRESS);
        cmd.Parameters.AddWithValue("CONTACT_NO", order.CONTACT_NO);
        cmd.Parameters.AddWithValue("EMAIL", order.EMAIL);
        cmd.Parameters.AddWithValue("GREETINGS", order.GREETINGS);
        cmd.Parameters.AddWithValue("totalAmount", order.TOTAL_AMOUNT);
        cmd.Parameters.AddWithValue("shipping", order.SHIPPING_CHARGES);
        cmd.Parameters.AddWithValue("discount", order.TOTAL_DISCOUNT);
        cmd.Parameters.AddWithValue("Fbill", order.FINAL_BILL);
        cmd.Parameters.AddWithValue("createdBy", order.CUSTOMER_ID);
        cmd.Parameters.AddWithValue("updatedOn", DBNull.Value);
        cmd.Parameters.AddWithValue("updateBy", DBNull.Value);
        cmd.Parameters.AddWithValue("RejectedReason", DBNull.Value);
        cmd.Parameters.AddWithValue("CustomerName", order.CUSTOMER_NAME);
        int orderId = int.Parse(cmd.ExecuteScalar().ToString());
        CloseDBConnection();
        //int orderId =  int.Parse(ExecuteScalar(string.Format("insert into orders values ({0},{1},'{2}','{3}','{4}','{5}',{6},{7},{8},{9},GETDATE(),{1},1,GETDATE(),{1},'','{10}') select scope_identity()",
        //            order.CUSTOMER_ID, order.STATUS_ID, order.ADDRESS, order.CONTACT_NO, order.EMAIL, order.ADDRESS,
        //            order.TOTAL_AMOUNT, order.SHIPPING_CHARGES, order.TOTAL_DISCOUNT, order.FINAL_BILL, order.CUSTOMER_NAME)).ToString());


                if(orderId > 0)
                {
                    ArrayList list = SessionManager.GetCakeImageSession();
                    if(list != null)
                    {
                        foreach (var data in list)
                        {
                            ExecuteNonQuery(string.Format("update cake_images set ORDER_ID = {0} where cake_image_id = {1}", orderId, data));
                        }
                    }
                }
                return orderId;
                //db.ORDERS.Add(order); //requires using System.Data.Entity.Migrations;
                //db.SaveChanges();

                ////foreach (var data in order.ORDER_DETAILS)
                ////{
                ////    data.IS_DELIVERED = false;
                ////    data.IS_REJECTED = false;
                ////    data.REJECTED_REASON = string.Empty;
                ////    data.DISCOUNT = 0;
                ////    db.ORDER_DETAILS.Add(data);
                ////}
                ////db.SaveChanges();
                //return order.ORDER_ID;


            }
            catch (Exception e)
            {
                return 0;
            }
        }

        internal bool DeleteOrder(int OrderId)
        {
            string query = string.Format(@"DELETE FROM ORDERS WHERE ORDER_ID = {0}", OrderId);

            int result = ExecuteNonQuery(query);
            if (result > 0)
                return true;
            else
                return false;
        }
        #endregion

        #region REPORTING

        internal DataSet GetSalesReport(DateTime fromDate, DateTime toDate, int vendroId, int productId, int productType)
        {
            string query = @"SELECT OD.ORDER_ID, P.NAME, OD.QUANTITY, OD.UNIT_AMOUNT,
                            OD.QUANTITY * OD.UNIT_AMOUNT AS OVERALL_AMOUNT
                            FROM ORDERS CO, ORDER_DETAILS OD, PRODUCTS P, VENDORS V
                            WHERE CO.ORDER_ID = OD.ORDER_ID AND P.PRODUCT_ID = OD.PRODUCT_ID AND P.VENDOR_ID = V.VENDOR_ID
                            AND CO.CREATED_ON >= '{0}' AND CO.CREATED_ON <= '{1}' AND
                            (-1 IN ({2}) OR V.VENDOR_ID IN ({2})) AND (-1 IN ({3}) OR P.PRODUCT_ID IN ({3}))
                            AND (-1 IN ({2}) OR P.PRODUCT_TYPE IN ({2}))
                            ORDER BY CO.CREATED_ON DESC";
            query = string.Format(query, fromDate, toDate, vendroId, productId, productType);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "PRODUCT";
            return users;
        }
    internal int CancelOrder(int orderId, int OrderDetailId)
    {
      string query = @"UPDATE ORDER_DETAILS SET IS_CANCELLED = 0 Where ORDER_DETAIL_ID={0}";

      DataSet ds = ExecuteDataSet(string.Format("SELECT * FROM ORDERS WHERE ORDER_ID ={0} AND GETDATE() < DATEADD(MI,10,CREATED_ON )", orderId));
      if (ds.Tables[0].Rows.Count > 0)
      {
        query = string.Format(query, OrderDetailId);
        return ExecuteNonQuery(query);

      }
      return 0;
      
    }
    internal DataSet GetOrderReport(int vendorId)
        {
            string query = @"select REPLACE(STR(CO.ORDER_ID,7),' ','0') as ORDER_ID, CO.CREATED_ON, GC.NAME, GC.MOBILE, GC.ADDRESS 
                             CO.IS_DELIVERED, CO.IS_REJECTED 
                            from ORDERS CO, GUEST_CUSTOMER GC
                            WHERE CO.CUSTOMER_ID = GC.ID AND ( -1 IN ({0}) OR CO.VENDOR_ID IN ({0})) ORDER BY CO.CREATED_ON DESC";
            query = string.Format(query, vendorId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }
        internal DataSet GetPreviousOrderReport(int vendorId)
        {
            //            string query = @"select GC.NAME, REPLACE(STR(CO.ORDER_ID,7),' ','0') as ORDER_ID, CO.CREATED_ON, GC.NAME, GC.MOBILE,
            //                            GC.ADDRESS, CO.IS_DELIVERED, CO.IS_REJECTED, (SELECT sum(QUANTITY * UNIT_AMOUNT) FROM ORDER_DETAILS
            //       WHERE ORDER_ID =CO.ORDER_ID) as PRICE, CASE WHEN (IS_REJECTED is null or IS_REJECTED = 0 ) THEN 'NO'
            //       ELSE 'YES' END AS REJECT_STATUS, CASE WHEN (IS_DELIVERED is null or IS_DELIVERED = 0 ) THEN 'NO'
            //       ELSE 'YES' END AS DELIVERED_STATUS 
            //                            from CUSTOMER_ORDER CO, GUEST_CUSTOMER GC
            //                            WHERE CO.CUSTOMER_ID = GC.ID AND (IS_DELIVERED is null or IS_DELIVERED = 0 )
            //                            AND (IS_REJECTED is null or IS_REJECTED = 0 )
            //       and ( -1 IN ({0}) OR CO.VENDOR_ID IN ({0}))
            //                            ORDER BY CO.CREATED_ON DESC";
            //            string query = @"  select distinct concat('FC',od.VENDOR_ID,'-', REPLACE(STR(CO.ORDER_ID,7),' ','0')) as ORDER_ID, od.ORDER_ID as oid,
            //                               (select BUSINESS_ENTITY_NAME from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as BUSINESS_ENTITY_NAME, 
            //                                (select PERSONAL_PHONE from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as PERSONAL_PHONE,
            //                                                         GC.NAME, CO.CREATED_ON, GC.NAME, GC.MOBILE,
            //                                                        GC.ADDRESS, od.IS_DELIVERED, od.IS_REJECTED, (SELECT sum(QUANTITY * UNIT_AMOUNT) FROM ORDER_DETAILS
            //                                   WHERE ORDER_ID = CO.ORDER_ID and VENDOR_ID = co.VENDOR_ID ) as PRICE, CASE WHEN (od.IS_REJECTED is null or od.IS_REJECTED = 0 ) THEN 'NO'
            //                                   ELSE 'YES' END AS REJECT_STATUS, CASE WHEN (od.IS_DELIVERED is null or od.IS_DELIVERED = 0 ) THEN 'NO'
            //                                   ELSE 'YES' END AS DELIVERED_STATUS  from CUSTOMER_ORDER co, ORDER_DETAILS od, GUEST_CUSTOMER GC
            //                            where CO.CUSTOMER_ID = GC.ID and co.ORDER_ID = od.ORDER_ID 
            //                            AND (od.IS_DELIVERED is null or od.IS_DELIVERED = 0 )
            //                            and ( -1 IN ({0}) OR od.VENDOR_ID IN ({0}))
            //	                               order by od.ORDER_ID desc";
            string query = @"SELECT count(o.order_id)  as TOTAL_ITEMS, (select name from USERS where user_id = O.customer_id) as FOODIES, O.CONTACT_NO,O.ADDRESS,O.GREETINGS,O.CREATED_ON
                        ,O.ORDER_ID
                        FROM ORDERS O 
                        inner join ORDER_DETAILS OD on O.ORDER_ID = OD.ORDER_ID
                        WHERE OD.VENDOR_ID = {0} and OD.IS_DELIVERED = 0 and OD.IS_REJECTED  <> 1
                        group by CUSTOMER_ID,CONTACT_NO,ADDRESS,GREETINGS,CREATED_ON,o.ORDER_ID
                        ORDER BY O.CREATED_ON DESC";
            query = string.Format(query, vendorId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }
        internal DataSet AdminPendingOrder()
        {

            string query = @"SELECT count(o.order_id)  as TOTAL_ITEMS, (select name from USERS where user_id = O.customer_id) as FOODIES, O.CONTACT_NO,O.ADDRESS,O.GREETINGS,O.CREATED_ON
                        ,O.ORDER_ID
                        FROM ORDERS O 
                        inner join ORDER_DETAILS OD on O.ORDER_ID = OD.ORDER_ID
                        and OD.IS_DELIVERED = 0 and OD.IS_REJECTED  <> 1
                        group by CUSTOMER_ID,CONTACT_NO,ADDRESS,GREETINGS,CREATED_ON,o.ORDER_ID
                        ORDER BY O.CREATED_ON DESC";
            query = string.Format(query);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }
        internal DataSet GetRejectedOrderReport(int vendorId)
        {
            //            string query = @"select GC.NAME, REPLACE(STR(CO.ORDER_ID,7),' ','0') as ORDER_ID, CO.CREATED_ON, GC.NAME, GC.MOBILE,
            //                            GC.ADDRESS, CO.IS_DELIVERED, CO.IS_REJECTED, (SELECT sum(QUANTITY * UNIT_AMOUNT) FROM ORDER_DETAILS
            //       WHERE ORDER_ID =CO.ORDER_ID) as PRICE, CASE WHEN (IS_REJECTED is null or IS_REJECTED = 0 ) THEN 'NO'
            //       ELSE 'YES' END AS REJECT_STATUS, CASE WHEN (IS_DELIVERED is null or IS_DELIVERED = 0 ) THEN 'NO'
            //       ELSE 'YES' END AS DELIVERED_STATUS 
            //                            from CUSTOMER_ORDER CO, GUEST_CUSTOMER GC
            //                            WHERE CO.CUSTOMER_ID = GC.ID AND (IS_DELIVERED is null or IS_DELIVERED = 0 )
            //                            AND (IS_REJECTED is null or IS_REJECTED = 0 )
            //       and ( -1 IN ({0}) OR CO.VENDOR_ID IN ({0}))
            //                            ORDER BY CO.CREATED_ON DESC";
            //            string query = @"  select distinct concat('FC',od.VENDOR_ID,'-', REPLACE(STR(CO.ORDER_ID,7),' ','0')) as ORDER_ID, od.ORDER_ID as oid,
            //                               (select BUSINESS_ENTITY_NAME from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as BUSINESS_ENTITY_NAME, 
            //                                (select PERSONAL_PHONE from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as PERSONAL_PHONE,
            //                                                         GC.NAME, CO.CREATED_ON, GC.NAME, GC.MOBILE,
            //                                                        GC.ADDRESS, od.IS_DELIVERED, od.IS_REJECTED, (SELECT sum(QUANTITY * UNIT_AMOUNT) FROM ORDER_DETAILS
            //                                   WHERE ORDER_ID = CO.ORDER_ID and VENDOR_ID = co.VENDOR_ID ) as PRICE, CASE WHEN (od.IS_REJECTED is null or od.IS_REJECTED = 0 ) THEN 'NO'
            //                                   ELSE 'YES' END AS REJECT_STATUS, CASE WHEN (od.IS_DELIVERED is null or od.IS_DELIVERED = 0 ) THEN 'NO'
            //                                   ELSE 'YES' END AS DELIVERED_STATUS  from CUSTOMER_ORDER co, ORDER_DETAILS od, GUEST_CUSTOMER GC
            //                            where CO.CUSTOMER_ID = GC.ID and co.ORDER_ID = od.ORDER_ID 
            //                            AND (od.IS_DELIVERED is null or od.IS_DELIVERED = 0 )
            //                            and ( -1 IN ({0}) OR od.VENDOR_ID IN ({0}))
            //	                               order by od.ORDER_ID desc";
            string query = @"SELECT count(o.order_id)  as TOTAL_ITEMS, (select name from USERS where user_id = O.customer_id) as FOODIES, O.CONTACT_NO,O.ADDRESS,O.GREETINGS,O.CREATED_ON
                        ,O.ORDER_ID
                        FROM ORDERS O 
                        inner join ORDER_DETAILS OD on O.ORDER_ID = OD.ORDER_ID
                        WHERE OD.VENDOR_ID = {0} and OD.IS_DELIVERED = 0 and OD.IS_REJECTED  <> 0
                        group by CUSTOMER_ID,CONTACT_NO,ADDRESS,GREETINGS,CREATED_ON,o.ORDER_ID
                        ORDER BY O.CREATED_ON DESC";
            query = string.Format(query, vendorId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }
        internal DataSet GetAdminRejectedOrderReport()
        {

            string query = @"SELECT count(o.order_id)  as TOTAL_ITEMS, (select name from USERS where user_id = O.customer_id) as FOODIES, O.CONTACT_NO,O.ADDRESS,O.GREETINGS,O.CREATED_ON
                        ,O.ORDER_ID
                        FROM ORDERS O 
                        inner join ORDER_DETAILS OD on O.ORDER_ID = OD.ORDER_ID
                        and OD.IS_DELIVERED = 0 and OD.IS_REJECTED  <> 0
                        group by CUSTOMER_ID,CONTACT_NO,ADDRESS,GREETINGS,CREATED_ON,o.ORDER_ID
                        ORDER BY O.CREATED_ON DESC";
            query = string.Format(query);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }
        internal DataSet GetCompletedOrderReport(int vendorId)
        {
            //            string query = @"select GC.NAME, REPLACE(STR(CO.ORDER_ID,7),' ','0') as ORDER_ID, CO.CREATED_ON, GC.NAME, GC.MOBILE,
            //                            GC.ADDRESS, CO.IS_DELIVERED, CO.IS_REJECTED, (SELECT sum(QUANTITY * UNIT_AMOUNT) FROM ORDER_DETAILS
            //       WHERE ORDER_ID =CO.ORDER_ID) as PRICE, CASE WHEN (IS_REJECTED is null or IS_REJECTED = 0 ) THEN 'NO'
            //       ELSE 'YES' END AS REJECT_STATUS, CASE WHEN (IS_DELIVERED is null or IS_DELIVERED = 0 ) THEN 'NO'
            //       ELSE 'YES' END AS DELIVERED_STATUS 
            //                            from CUSTOMER_ORDER CO, GUEST_CUSTOMER GC
            //                            WHERE CO.CUSTOMER_ID = GC.ID AND (IS_DELIVERED =1 )
            //                            
            //       and ( -1 IN ({0}) OR CO.VENDOR_ID IN ({0}))
            //                            ORDER BY CO.CREATED_ON DESC";
            //            string query = @"select distinct concat('FC',od.VENDOR_ID,'-', REPLACE(STR(CO.ORDER_ID,7),' ','0')) as ORDER_ID, od.ORDER_ID as oid,
            //                               (select BUSINESS_ENTITY_NAME from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as BUSINESS_ENTITY_NAME, 
            //                                (select PERSONAL_PHONE from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as PERSONAL_PHONE,
            //                                                         GC.NAME, CO.CREATED_ON, GC.NAME, GC.MOBILE,
            //                                                        GC.ADDRESS, od.IS_DELIVERED, od.IS_REJECTED, (SELECT sum(QUANTITY * UNIT_AMOUNT) FROM ORDER_DETAILS
            //                                   WHERE ORDER_ID = CO.ORDER_ID and VENDOR_ID = co.VENDOR_ID ) as PRICE, CASE WHEN (od.IS_REJECTED is null or od.IS_REJECTED = 0 ) THEN 'NO'
            //                                   ELSE 'YES' END AS REJECT_STATUS, CASE WHEN (od.IS_DELIVERED is null or od.IS_DELIVERED = 0 ) THEN 'NO'
            //                                   ELSE 'YES' END AS DELIVERED_STATUS  from CUSTOMER_ORDER co, ORDER_DETAILS od, GUEST_CUSTOMER GC
            //                            where CO.CUSTOMER_ID = GC.ID and co.ORDER_ID = od.ORDER_ID and (select COUNT(*) from ORDER_DETAILS od where ( -1 IN ({0}) OR od.VENDOR_ID IN ({0}))) > 0
            //                            AND (od.IS_DELIVERED = 1 )
            //	                               order by od.ORDER_ID desc";
            string query = @"SELECT count(o.order_id)  as TOTAL_ITEMS, (select name from USERS where user_id = O.customer_id) as FOODIES, O.CONTACT_NO,O.ADDRESS,O.GREETINGS,O.CREATED_ON
                      ,O.ORDER_ID
                      FROM ORDERS O 
                      inner join ORDER_DETAILS OD on O.ORDER_ID = OD.ORDER_ID
                      WHERE OD.VENDOR_ID = {0} and OD.IS_DELIVERED = 1 and OD.IS_REJECTED  <> 1
                      group by CUSTOMER_ID,CONTACT_NO,ADDRESS,GREETINGS,CREATED_ON,o.ORDER_ID
                      ORDER BY O.CREATED_ON DESC";
            query = string.Format(query, vendorId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }
        internal DataSet GetAdminCompletedOrderReport()
        {

            string query = @"SELECT count(o.order_id)  as TOTAL_ITEMS, (select name from USERS where user_id = O.customer_id) as FOODIES, O.CONTACT_NO,O.ADDRESS,O.GREETINGS,O.CREATED_ON
                      ,O.ORDER_ID
                      FROM ORDERS O 
                      inner join ORDER_DETAILS OD on O.ORDER_ID = OD.ORDER_ID
                      and OD.IS_DELIVERED = 1 and OD.IS_REJECTED  <> 1
                      group by CUSTOMER_ID,CONTACT_NO,ADDRESS,GREETINGS,CREATED_ON,o.ORDER_ID
                      ORDER BY O.CREATED_ON DESC";
            query = string.Format(query);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }

        internal DataSet GetOrderDataForEmail(int orderId)
        {
            string query = @"select  (select BUSINESS_ENTITY_NAME from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as BUSINESS_ENTITY_NAME, 
                             (select PERSONAL_PHONE from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as PERSONAL_PHONE, 
                            PRODUCT_ID, CASE WHEN PRODUCT_TYPE > 0 THEN (SELECT NAME FROM PRODUCTS WHERE PRODUCT_ID = OD.PRODUCT_ID) 
                            ELSE (SELECT NAME FROM CAKES WHERE CAKE_ID = OD.PRODUCT_ID) END AS PRODUCT_NAME, 
                            QUANTITY, UNIT_AMOUNT, CASE WHEN CAKE_FLAVOR_ID IS NOT NULL THEN 
                            (SELECT DESCRIPTION FROM FLAVOR WHERE FLAVOR_ID =  (SELECT FLAVOR_ID FROM CAKE_FLAVORS
                             WHERE CAKE_FLAVOR_ID = OD.CAKE_FLAVOR_ID)) ELSE 'N/A' END AS FLAVOUR, ISNULL(TIERS_COUNT,'') AS TIERS_COUNT,
                            ISNULL(SIZE,'') AS SIZE, convert(varchar(10), ISNULL(GREETINGS,'N/A')) AS GREETINGS, IS_CUSTOMIZE,[IS_REJECTED]
                            ,[REJECTION_REASON],[IS_DELIVERED] from ORDER_DETAILS OD
							where ORDER_ID = {0}";
            query = string.Format(query, orderId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }
        internal DataSet GetOrderDataForVendorEmail(int orderId)
        {
            string query = @"select distinct concat('FC',od.VENDOR_ID,'-', REPLACE(STR(CO.ORDER_ID,7),' ','0')) as ORDER_ID, od.ORDER_ID as oid,
                               (select BUSINESS_ENTITY_NAME from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as BUSINESS_ENTITY_NAME, 
                                (select EMAIL from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as EMAIL,
                                                          CO.CREATED_ON, GC.NAME, GC.MOBILE,
                                                        GC.ADDRESS, od.IS_DELIVERED, od.IS_REJECTED, (SELECT sum(QUANTITY * UNIT_AMOUNT) FROM ORDER_DETAILS
                                   WHERE ORDER_ID = CO.ORDER_ID and VENDOR_ID = co.VENDOR_ID ) as PRICE, CASE WHEN (od.IS_REJECTED is null or od.IS_REJECTED = 0 ) THEN 'NO'
                                   ELSE 'YES' END AS REJECT_STATUS, CASE WHEN (od.IS_DELIVERED is null or od.IS_DELIVERED = 0 ) THEN 'NO'
                                   ELSE 'YES' END AS DELIVERED_STATUS  from ORDERS co, ORDER_DETAILS od, GUEST_CUSTOMER GC
								   where CO.CUSTOMER_ID = GC.ID and co.ORDER_ID = od.ORDER_ID and od.ORDER_ID = {0}";
            query = string.Format(query, orderId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }
        internal DataSet GetCustomerData(int orderId)
        {
            string query = @"select REPLACE(STR(CO.ORDER_ID,7),' ','0') as ORDER_ID, CO.CREATED_ON, GC.NAME, GC.MOBILE, GC.ADDRESS,
                            CO.IS_DELIVERED, CO.IS_REJECTED, CO.REJECTED_REASON
                            from ORDERS CO, GUEST_CUSTOMER GC
                            WHERE CO.CUSTOMER_ID = GC.ID AND ( -1 IN ({0}) OR CO.ORDER_ID IN ({0})) ORDER BY CO.CREATED_ON DESC";
            query = string.Format(query, orderId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }

        internal bool UpdateOrderInfo(ORDER_DETAILS order)
        {
            try
            {
                //later need full revamp
                string query = @"UPDATE ORDER_DETAILS SET IS_DELIVERED = {0}, IS_REJECTED = {1},
                                REJECTION_REASON = '{2}'
                                WHERE ORDER_ID = {3} AND VENDOR_ID = {4}";
                query = string.Format(query, order.IS_DELIVERED, order.IS_REJECTED, order.REJECTED_REASON, order.ORDER_ID, order.VENDOR_ID);
                ExecuteNonQuery(query);
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }


        internal DataSet GetOrderDetails(int orderId, int vendorId)
        {
            string query = @"select  (select BUSINESS_ENTITY_NAME from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as BUSINESS_ENTITY_NAME, 
                             (select PERSONAL_PHONE from VENDORS v where v.VENDOR_ID = od.VENDOR_ID) as PERSONAL_PHONE, 
                            PRODUCT_ID, CASE WHEN PRODUCT_TYPE > 0 THEN (SELECT NAME FROM PRODUCTS WHERE PRODUCT_ID = OD.PRODUCT_ID) 
                            ELSE (SELECT NAME FROM CAKES WHERE CAKE_ID = OD.PRODUCT_ID) END AS PRODUCT_NAME, 
                            QUANTITY, UNIT_AMOUNT, CASE WHEN CAKE_FLAVOR_ID IS NOT NULL THEN 
                            (SELECT DESCRIPTION FROM FLAVOR WHERE FLAVOR_ID =  (SELECT FLAVOR_ID FROM CAKE_FLAVORS
                             WHERE CAKE_FLAVOR_ID = OD.CAKE_FLAVOR_ID)) ELSE 'N/A' END AS FLAVOUR, ISNULL(TIERS_COUNT,'') AS TIERS_COUNT,
                            ISNULL(SIZE,'') AS SIZE, convert(varchar(10), ISNULL(GREETINGS,'N/A')) AS GREETINGS, IS_CUSTOMIZE,[IS_REJECTED]
                            ,[REJECTION_REASON],[IS_DELIVERED] from ORDER_DETAILS OD
                            where ( -1 in ({0}) OR OD.ORDER_ID IN ({0}) ) and
                            ( -1 in ({0}) or od.VENDOR_ID in ({1}) )";

            query = string.Format(query, orderId, vendorId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }
        internal int DeliveredOrder(int orderId)
        {
            try
            {
                return ExecuteNonQuery(string.Format("UPDATE ORDER_DETAILS SET IS_DELIVERED = 1 ,IS_REJECTED = 0,REJECTED_REASON = '' WHERE ORDER_DETAIL_ID = {0}", orderId));

            }
            catch (Exception e)
            {
                return 0;
            }
        }
        internal int RejectedOrder(int orderId)
        {
            try
            {
                return ExecuteNonQuery(string.Format("UPDATE ORDER_DETAILS SET IS_DELIVERED = 0,IS_REJECTED = 1,REJECTED_REASON = 'REJECTED' WHERE ORDER_DETAIL_ID = {0}", orderId));

            }
            catch (Exception e)
            {
                return 0;
            }
        }
        internal DataSet GetOrderDetail(int orderId)
        {
            string query = string.Format(@"SELECT (select name from USERS where user_id = O.customer_id) as FOODIES, O.CONTACT_NO,O.ADDRESS,O.GREETINGS,O.CREATED_ON,O.EMAIL
                            ,O.ORDER_ID
                            FROM ORDERS O 
							where ORDER_ID ={0}", orderId);
            DataSet order = ExecuteDataSet(query);
            order.Tables[0].TableName = "ORDERS";
            return order;
        }


        internal DataSet GetVendorOrderDetails(int orderId, int vendorId)
        {
            string query = @"select *, case when ITEM_TYPE = 1 then 
      (select NAME from CAKES where CAKE_ID = ITEM_ID) else (select NAME from PRODUCTS where PRODUCT_ID = ITEM_ID) END  AS ITEM_NAME
      , case when ITEM_TYPE = 1 then 
      (select PRICE from CAKES where CAKE_ID = ITEM_ID) else (select PRICE from PRODUCTS where PRODUCT_ID = ITEM_ID) END  AS PRICE,
      case when IS_DELIVERED = 0 then 'Pending' else 'Delivered' end as STATUS
         from ORDER_DETAILS 
      where ORDER_ID = {0} and VENDOR_ID = {1}";

            query = string.Format(query, orderId, vendorId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }
    internal DataSet CustomizeCakeImage(int orderId, int cakeId)
    {
      string query = @"Select IMAGE_PATH  from CAKE_IMAGES where ORDER_ID = {0} and CAKE_ID ={1}";

      query = string.Format(query, orderId, cakeId);
      DataSet users = ExecuteDataSet(query);
      users.Tables[0].TableName = "CAKE_IMAGES";
      return users;
    }
    internal DataSet GetAdminOrderDetails(int orderId)
        {
            string query = @"select *, case when ITEM_TYPE = 1 then 
      (select NAME from CAKES where CAKE_ID = ITEM_ID) else (select NAME from PRODUCTS where PRODUCT_ID = ITEM_ID) END  AS ITEM_NAME
      , case when ITEM_TYPE = 1 then 
      (select PRICE from CAKES where CAKE_ID = ITEM_ID) else (select PRICE from PRODUCTS where PRODUCT_ID = ITEM_ID) END  AS PRICE,
      case when IS_DELIVERED = 0 then 'Pending' else 'Delivered' end as STATUS
         from ORDER_DETAILS 
      where ORDER_ID = {0}";

            query = string.Format(query, orderId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;
        }
        internal DataSet getCustomerOrderDetails(int orderId)
        {

            string query = @"select od.*,v.business_entity_name, case when ITEM_TYPE = 1 then 
      (select NAME from CAKES where CAKE_ID = ITEM_ID) else (select NAME from PRODUCTS where PRODUCT_ID = ITEM_ID) END  AS ITEM_NAME
      , case when ITEM_TYPE = 1 then 
      (select PRICE from CAKES where CAKE_ID = ITEM_ID) else (select PRICE from PRODUCTS where PRODUCT_ID = ITEM_ID) END  AS PRICE,
	  CASE WHEN ITEM_TYPE = 1 THEN 
	  	  (select CAKE_PHOTO from CAKES where CAKE_ID = ITEM_ID) else (select PRODUCT_PHOTO from PRODUCTS where PRODUCT_ID = ITEM_ID) END  AS ITEM_PHOTO,

      case when IS_DELIVERED = 0 then 'Pending' else 'Delivered' end as STATUS,

(select created_on from orders where order_id = {0}) as CREATED_ON
         from ORDER_DETAILS od
		 inner join vendors v on od.vendor_id = v.vendor_id
      where ORDER_ID = {0}
	  order by od.vendor_id desc";

            query = string.Format(query, orderId);
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "ORDER_DETAILS";
            return users;

        }
        #endregion

    }
}