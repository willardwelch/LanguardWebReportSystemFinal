using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.Security;

namespace ReportSystem
{
    public partial class deleteEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void GetSearchInfo()
        {
            try
            {
                var dataset = ConnectData.checkLog.sp_selectP20EntrybyID(int.Parse(txtEmployee.Text));
                DelEntry.DataSource = dataset;
                DelEntry.DataBind();

            }//end of try
            catch (Exception  ex)
            {
                ConnectData.message =ex.Message;
                ConnectData.title = "ERROR";
                ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GetSearchInfo();
        }

        protected void DelEntry_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            GridViewRow row = this.DelEntry.Rows[e.RowIndex];
            String rankidtxt = DelEntry.Rows[e.RowIndex].Cells[1].Text;
            String fname1 = DelEntry.Rows[e.RowIndex].Cells[2].Text;
            String Lname1 = DelEntry.Rows[e.RowIndex].Cells[3].Text;
            String unit1 = DelEntry.Rows[e.RowIndex].Cells[4].Text;
            String comp = DelEntry.Rows[e.RowIndex].Cells[5].Text;
            String entrynametxt = DelEntry.Rows[e.RowIndex].Cells[6].Text;
            //TextBox orderidtxt = (TextBox)(row.Cells[7].Controls[0]);
            String ordernotxt = DelEntry.Rows[e.RowIndex].Cells[7].Text;
            String dateordertxt = DelEntry.Rows[e.RowIndex].Cells[9].Text;
            String occurrencetxt = DelEntry.Rows[e.RowIndex].Cells[8].Text;
            String weftxt = DelEntry.Rows[e.RowIndex].Cells[10].Text;
            String enddatetxt = DelEntry.Rows[e.RowIndex].Cells[11].Text;
            String enteredbytxt = DelEntry.Rows[e.RowIndex].Cells[12].Text;



            try
            {
                int rankid = (int)ConnectData.checkLog.sp_getRankName(rankidtxt).FirstOrDefault();
                int unit1value = (int)ConnectData.checkLog.sp_getUnitName(unit1).FirstOrDefault();
                int comptxt = (int)ConnectData.checkLog.sp_getCoyName(comp, unit1).FirstOrDefault();
                int entry_nametxt = (int)ConnectData.checkLog.sp_getEntyID(entrynametxt).FirstOrDefault();

               var returnValue = ConnectData.checkLog.sp_DeletePt2Orders(int.Parse(this.txtEmployee.Text), rankid, unit1value, comptxt, entry_nametxt, ordernotxt, DateTime.Parse(dateordertxt), occurrencetxt, DateTime.Parse(weftxt), DateTime.Parse(enddatetxt), enteredbytxt);
                ConnectData.message = "Record successfully Deleted!";
                ConnectData.title = "Deleted";
                ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
                DelEntry.DataBind();
                DelEntry.EditIndex = -1;
                GetSearchInfo();
                //EmptyComponent();

            }
            catch (Exception ex)
            {
                ConnectData.message = ex.Message;
                ConnectData.title = "Error";
                this.ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
            }

        }// end of DelEntry_RowDeleting

        protected void DelEntry_rowDataBound(object sender, GridViewRowEventArgs e)
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