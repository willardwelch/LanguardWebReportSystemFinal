//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ReportSystem.Database_File
{
    using System;
    using System.Collections.Generic;
    
    public partial class SoldierInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SoldierInfo()
        {
            this.P2OEntry = new HashSet<P2OEntry>();
        }
    
        public int Id { get; set; }
        public string FName { get; set; }
        public string LName { get; set; }
        public string MaritalStatus { get; set; }
        public System.DateTime DOB { get; set; }
        public System.DateTime DOE { get; set; }
        public System.DateTime ROD { get; set; }
        public string Address { get; set; }
        public string Parish { get; set; }
        public Nullable<System.DateTime> TerminationDate { get; set; }
        public string Gender { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<P2OEntry> P2OEntry { get; set; }
    }
}
