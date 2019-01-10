using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FoodChapter.DataAccess;
using FoodChapter.Models;
namespace FoodChapter.DataCore.Managers
{
    public class MultipleUploadHelper: DABase
    {
        private FoodChapterEntities db = new FoodChapterEntities();

        public const string QRY_SAVE_CAKES = @"insert into CAKES 
                                            (VENDOR_ID,NAME,MIN_WEIGHT,MAX_WEIGHT,MIN_TIERS,MAX_TIERS,DESCRIPTION,ESTIMATED_TIME,
                                            PRICE,DELIVERY,IS_ACTIVE,IS_CUSTOMIZABLE,CREATED_ON,TYPE_ID,PRICE_PER_TIER,CAKE_PHOTO)
                                            values 
                                            ({0},'{1}',1,1,1,1,'',1,1,0,1,0,GETDATE(),1,1,'{2}')";

        public const string QRY_SAVE_PRODUCT = @"insert into PRODUCTS 
                                                (VENDOR_ID,PRODUCT_SUB_CATEGORY_ID,NAME,DESCRIPTION,TIME_REQUIRED,PRICE,SERVES,
                                                DELIVERY,IS_ACTIVE,CREATED_ON,PRODUCT_PHOTO)
                                                values ({0},1,'{1}','',1,1,1,0,1,GETDATE(),'{2}')";

        public int saveCake(string vendorId,string name,string path)
        {
            int result = ExecuteNonQuery(string.Format(QRY_SAVE_CAKES, vendorId, name, path));
            return result;
        }
        public int saveProduct(string vendorId, string name, string path)
        {
            int result = ExecuteNonQuery(string.Format(QRY_SAVE_PRODUCT, vendorId, name, path));
            return result;
        }
                                            
    }
}