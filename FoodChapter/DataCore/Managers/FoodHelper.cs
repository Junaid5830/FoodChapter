﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FoodChapter.DataCore.Managers
{
    public static class FoodHelper
    {
        public static int PRODUCT_ID = 1;

        public static DataSet ToDataSet<T>(this IList<T> list, string tableName)
        {
            Type elementType = typeof(T);
            DataSet ds = new DataSet();
            DataTable t = new DataTable();
            t.TableName = tableName;
            ds.Tables.Add(t);

            //add a column to table for each public property on T   
            foreach (var propInfo in elementType.GetProperties())
            {
                t.Columns.Add(propInfo.Name, propInfo.PropertyType);
            }

            //go through each property on T and add each value to the table   
            foreach (T item in list)
            {
                DataRow row = t.NewRow(); foreach (var propInfo in elementType.GetProperties())
                {
                    row[propInfo.Name] = propInfo.GetValue(item, null);
                }
                t.Rows.Add(row);
            }
            return ds;
        }
    }
}