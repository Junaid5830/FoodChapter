using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Xml;
namespace FoodChapter.DataAccess
{
    public class Entities
    {
        #region USERS
        public static class USERS
        {
            public const string TABLE_NAME = "USERS";

            public const string USER_ID = "USER_ID";
            public const string USERNAME = "USERNAME";
            public const string PASSWORD = "PASSWORD";

            public static DataTable GetDataTable()
            {
                DataTable dt = new DataTable(TABLE_NAME);

                dt.Columns.Add(USER_ID, typeof(int));
                dt.Columns.Add(USERNAME, typeof(string));
                dt.Columns.Add(PASSWORD, typeof(string));
                return dt;
            }
        }
        #endregion





    }
}
