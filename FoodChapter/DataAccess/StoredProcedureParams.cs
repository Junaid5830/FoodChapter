using System;
using System.Data;
using System.Configuration;
//using eLearning.Common.Utils;
using System.Data.Common;
using System.Data.SqlClient;


namespace FoodChapter.DataAccess
{
    
    public class StoredProcedureParams 
    {

        public string paramName;
        public DbType paramType;
        private string paramValue;
        
        public StoredProcedureParams(string paramName, DbType paramType)
        {
            this.paramName = paramName;
            this.paramType = paramType;
        }
      
        public string ParamName 
        {
            get
            {
               return paramName   ;
            }
            set
            {
               paramName= value;
            }
        
        }
        public string ParamValue
        {
            get
            {
                return paramValue;
            }
            set
            {
                paramValue = value;
            }

        }
        public DbType ParamType
        {
            get
            {
                return paramType;
            }
            set
            {
                paramType = value;
            }

        }
    }
}
