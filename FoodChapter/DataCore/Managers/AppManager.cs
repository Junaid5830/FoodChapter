using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FoodChapter.DataAccess;
using System.Data;
namespace FoodChapter.DataCore.Managers
{
    public class AppManager:DABase
    {
        #region Vendor


        #endregion
        #region User


        #endregion
        #region Product

        internal DataSet topProducts()
        {
            string query = @"select P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                from PRODUCTS p
                inner join vendors v on p.vendor_id = v.vendor_id
                where  p.PRODUCT_ID in (select TOP 4 item_id from order_Details where item_type= 2 group by item_id,QUANTITY ORDER BY count(item_id) * QUANTITY DESC)";
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "PRODUCTS";
            return users;
        }
        internal DataSet topCakes()
        {
            string query = @"select P.*, CONCAT(V.FIRST_NAME, ' ', V.MIDDLE_NAME, ' ', V.LAST_NAME) AS VENDOR_NAME
                from Cakes p
                inner join vendors v on p.vendor_id = v.vendor_id
                where  p.cake_id in (select TOP 4 item_id from order_Details where item_type= 1 group by item_id,QUANTITY ORDER BY count(item_id) * QUANTITY DESC)";
            DataSet users = ExecuteDataSet(query);
            users.Tables[0].TableName = "CAKES";
            return users;
        }

        #endregion
        #region Order


        #endregion
    }
}