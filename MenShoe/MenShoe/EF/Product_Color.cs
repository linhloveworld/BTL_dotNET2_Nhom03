//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MenShoe.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product_Color
    {
        public long ProductColorID { get; set; }
        public Nullable<long> ColorID { get; set; }
        public Nullable<long> ProductID { get; set; }
    
        public virtual Color Color { get; set; }
    }
}
