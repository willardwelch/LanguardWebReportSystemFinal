using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReportSystem
{
    public partial class checkEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GetSearchInfo();
        }

        private void GetSearchInfo()
        {
            try
            {
                var dataset = ConnectData.checkLog.sp_selectP20EntrybyID(int.Parse(txtEmployee.Text)).ToList();
                P2Checkinfo.DataSource = dataset;
                P2Checkinfo.DataBind();
            }//end of try
            catch(Exception )
            {

            }
       }

        protected void P2Checkinfo_rowDataBound(object sender, GridViewRowEventArgs e)
        {
            String[] headings = new string[] { " ", "Rank", "First Name", "Last Name", "Unit", "Company", "Entry Type", "Order Number", "Occurence", "Date of Order", "Effective Date", "End Date", "Entered By" };

            if (e.Row.RowType == DataControlRowType.Header)
            {
                for (int i = 0; i < e.Row.Controls.Count; i++)
                {
                    //  e.Row.Controls[i]
                    var headerCell = e.Row.Controls[i] as DataControlFieldHeaderCell;
                    if (headerCell != null)
                    {
                        e.Row.Cells[i].Text = headings[i];
                    }
                }
            }
        }
    }
}