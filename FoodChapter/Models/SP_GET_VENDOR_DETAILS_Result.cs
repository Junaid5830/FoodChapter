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
    
    public partial class SP_GET_VENDOR_DETAILS_Result
    {
        public int VENDOR_ID { get; set; }
        public string FIRST_NAME { get; set; }
        public string MIDDLE_NAME { get; set; }
        public string LAST_NAME { get; set; }
        public string BUSINESS_ENTITY_NAME { get; set; }
        public string EMAIL { get; set; }
        public string PASSWORD { get; set; }
        public string PERSONAL_PHONE { get; set; }
        public string PRIMARY_WORKSPACE_PHONE { get; set; }
        public string SECONDARY_WORKSPACE_PHONE { get; set; }
        public string PERSONAL_ADDRESS { get; set; }
        public string BUSINESS_ADDRESS { get; set; }
        public string CNIC { get; set; }
        public Nullable<bool> FEATURED { get; set; }
        public string DESCRIPTION { get; set; }
        public string PROFILE_IMAGE { get; set; }
        public Nullable<bool> DELIVERY { get; set; }
        public string UNIQUE_ID { get; set; }
        public Nullable<System.DateTime> CREATED_ON { get; set; }
        public Nullable<int> CREATED_BY { get; set; }
        public Nullable<System.DateTime> UPDATED_ON { get; set; }
        public Nullable<int> UPDATED_BY { get; set; }
        public Nullable<bool> IS_ACTIVE { get; set; }
        public Nullable<bool> IS_APPROVED { get; set; }
        public Nullable<int> APPROVED_BY { get; set; }
        public Nullable<System.DateTime> APPROVED_ON { get; set; }
        public string CNIC_IMAGE { get; set; }
        public string PERSONAL_IMAGE { get; set; }
        public Nullable<bool> CAKES_SPECIALITY { get; set; }
        public Nullable<bool> FOODS_SPECIALITY { get; set; }
        public Nullable<bool> FROZEN_FOODS_SPECIALITY { get; set; }
        public Nullable<bool> DESSERTS_SPECIALITY { get; set; }
    }
}
