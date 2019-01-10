using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodChapter.Models
{
    public class SellerSearchModel
    {
        public bool all { get; set; }
        public string key { get; set; }
        public bool cake { get; set; }
        public bool food { get; set; }
        public bool frozen { get; set; }
        public bool dessert { get; set; }
        public bool delivery { get; set; }
        public int page { get; set; }
    }
}