//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FoodChapter.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PRODUCT_TAGS
    {
        public int TAG_ID { get; set; }
        public Nullable<int> PRODUCT_ID { get; set; }
        public string TAG_NAME { get; set; }
        public Nullable<System.DateTime> CREATED_ON { get; set; }
        public Nullable<int> CREATED_BY { get; set; }
        public Nullable<System.DateTime> UPDATED_ON { get; set; }
        public Nullable<int> UPDATED_BY { get; set; }
    
        public virtual PRODUCT PRODUCT { get; set; }
    }
}
