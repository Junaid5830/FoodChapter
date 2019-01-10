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
    public class AppCoreController
    {
        #region Vendor


        #endregion
        #region User


        #endregion
        #region Product
        internal DataSet topProducts()
        {
            return new AppManager().topProducts();
        }
        internal DataSet topCakes()
        {
            return new AppManager().topCakes();
        }

        #endregion
        #region Order


        #endregion
    }
}