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
using System.Runtime.CompilerServices;
using ReportSystem.Database_File;

namespace ReportSystem
{
    public partial class editEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ConnectData.entryempId.ToString()!="")
            {
                if (ConnectData.entryempId > 0)
                {
                    txtEmployee.Text = ConnectData.entryempId.ToString();
                    GetSearchInfo();
                }
            }
        }


        private void GetSearchInfo()
        {
            try
            {
                var dataset = ConnectData.checkLog.sp_selectP20EntrybyID(int.Parse(txtEmployee.Text));
                Entry.DataSource = dataset;
                Entry.DataBind();

            }//end of try
            catch (Exception)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GetSearchInfo();
        }

        protected void Entry_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Entry.EditIndex = e.NewEditIndex;
            Entry.DataBind();
            GetSearchInfo();

            GridViewRow row = Entry.Rows[e.NewEditIndex];
            TextBox rankidtxt = (TextBox)(row.Cells[1].Controls[0]);

            TextBox fname1 = (TextBox)(row.Cells[2].Controls[0]);
            TextBox Lname1 = (TextBox)(row.Cells[3].Controls[0]);
            TextBox unit1 = (TextBox)(row.Cells[4].Controls[0]);
            TextBox comp = (TextBox)(row.Cells[5].Controls[0]);
            TextBox entrynametxt = (TextBox)(row.Cells[6].Controls[0]);
            //TextBox orderidtxt = (TextBox)(row.Cells[7].Controls[0]);
            TextBox ordernotxt = (TextBox)(row.Cells[7].Controls[0]);
            TextBox dateordertxt = (TextBox)(row.Cells[9].Controls[0]);
            TextBox occurrencetxt = (TextBox)(row.Cells[8].Controls[0]);
            TextBox weftxt = (TextBox)(row.Cells[10].Controls[0]);
            TextBox enddatetxt = (TextBox)(row.Cells[11].Controls[0]);
            TextBox enteredbytxt = (TextBox)(row.Cells[12].Controls[0]);

            ConnectData.entryempId = int.Parse(this.txtEmployee.Text);
            ConnectData.entryRank= rankidtxt.Text;
            ConnectData.entryunit= unit1.Text;
            ConnectData.entrycoy = comp.Text;
            ConnectData.entryname = entrynametxt.Text;
            ConnectData.entryorderno = ordernotxt.Text;

            string[] splitdate=  dateordertxt.Text.Split(' ');
            ConnectData.entryorderdate = splitdate[0];
            ConnectData.entryoccurrence= occurrencetxt.Text;

            string[] splitwefdate = weftxt.Text.Split(' ');
            ConnectData.entrywef = splitwefdate[0];

            string[] splitenddate = enddatetxt.Text.Split(' ');
            ConnectData.entryendate= splitenddate[0];
            ConnectData.enteredby= enteredbytxt.Text;

            int rankid = (int)ConnectData.checkLog.sp_getRankName(ConnectData.entryRank).FirstOrDefault();
            int unit1value = (int)ConnectData.checkLog.sp_getUnitName(ConnectData.entryunit).FirstOrDefault();
            int comptxt = (int)ConnectData.checkLog.sp_getCoyName(ConnectData.entrycoy, ConnectData.entryunit).FirstOrDefault();
            int entry_nametxt = (int)ConnectData.checkLog.sp_getEntyID(ConnectData.entryname).FirstOrDefault();

            ConnectData.entryorderid = (int)ConnectData.checkLog.sp_EditPt2OrdersType(int.Parse(this.txtEmployee.Text), rankid, unit1value, comptxt, entry_nametxt, ordernotxt.Text, DateTime.Parse(dateordertxt.Text), occurrencetxt.Text, DateTime.Parse(weftxt.Text), DateTime.Parse(enddatetxt.Text), enteredbytxt.Text).FirstOrDefault();

           // (int.Parse(this.txtEmployee.Text), rankid, unit1value, comptxt, entry_nametxt, ordernotxt.Text, DateTime.Parse(dateordertxt.Text), occurrencetxt.Text, DateTime.Parse(weftxt.Text), DateTime.Parse(enddatetxt.Text), enteredbytxt.Text);

            Entry.EditIndex = -1;
           Response.Redirect("EditEntryInfo.aspx");

            //getrankname.Visible = true;


        }

        protected void Entry_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            Entry.EditIndex = -1;
            GetSearchInfo();
            Entry.DataBind();
           
        }

        protected void Entry_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
          /*  GridViewRow row = Entry.Rows[e.RowIndex];
            TextBox rankidtxt = (TextBox)(row.Cells[1].Controls[0]);
            
            TextBox fname1 = (TextBox)(row.Cells[2].Controls[0]);
            TextBox Lname1 = (TextBox)(row.Cells[3].Controls[0]);
            TextBox unit1 = (TextBox)(row.Cells[4].Controls[0]);
            TextBox comp = (TextBox)(row.Cells[5].Controls[0]);
            TextBox entrynametxt = (TextBox)(row.Cells[6].Controls[0]);
            //TextBox orderidtxt = (TextBox)(row.Cells[7].Controls[0]);
            TextBox ordernotxt = (TextBox)(row.Cells[7].Controls[0]);
            TextBox dateordertxt = (TextBox)(row.Cells[9].Controls[0]);
            TextBox occurrencetxt = (TextBox)(row.Cells[8].Controls[0]);
            TextBox weftxt = (TextBox)(row.Cells[10].Controls[0]);
            TextBox enddatetxt = (TextBox)(row.Cells[11].Controls[0]);
            TextBox enteredbytxt = (TextBox)(row.Cells[12].Controls[0]);

           

            try
            {
                int rankid = (int)ConnectData.checkLog.sp_getRankName(rankidtxt.Text).FirstOrDefault();
                int unit1value = (int)ConnectData.checkLog.sp_getUnitName(unit1.Text).FirstOrDefault();
                int comptxt = (int)ConnectData.checkLog.sp_getCoyName(comp.Text, unit1.Text).FirstOrDefault();
                int entry_nametxt = (int)ConnectData.checkLog.sp_getEntyID(entrynametxt.Text).FirstOrDefault();
               
                var returnValue = ConnectData.checkLog.sp_EditPt2Orders(int.Parse(this.txtEmployee.Text), rankid, unit1value, comptxt, entry_nametxt,  ordernotxt.Text, DateTime.Parse(dateordertxt.Text), occurrencetxt.Text, DateTime.Parse(weftxt.Text), DateTime.Parse(enddatetxt.Text), enteredbytxt.Text);
                if (returnValue > 0)
                {
                    ConnectData.message = "Record already exist!";
                    ConnectData.title = "Save Failed";
                    ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);

                }

                else
                {
                    ConnectData.message = "Record Updated Successfully";
                    Entry.DataBind(); 
                    Entry.EditIndex = -1;

                    GetSearchInfo();
                    // Entry.UpdateMethod
                    //Entry.UpdateRow(e.RowIndex, true);
                    ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
                    //  EmptyComponent();
                    
                }


            }
            catch (Exception ex)
            {
                ConnectData.message = ex.Message;
                ConnectData.title = "Error";
                this.ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
            }
           
           */

        }

        protected void Entry_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void Entry_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Entry_rowDataBound(object sender, GridViewRowEventArgs e)
        {
            String[] headings = new string[] { " ","Rank", "First Name", "Last Name", "Unit", "Company","Entry Type", "Order Number", "Occurence", "Date of Order", "Effective Date", "End Date","Entered By" };

            if (e.Row.RowType == DataControlRowType.Header)
            {
                for (int i = 0; i < e.Row.Controls.Count ; i++)
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

       
       

       
        protected void Entry_PreRender(object sender, EventArgs e)
        {
            Entry.Columns[1].Visible = false;
        }

        protected void EmpData_rowDataBound(object sender, GridViewRowEventArgs e)
        {
            String[] headings = new string[] { "ID ", "First Name", "Last Name", "Marital Status", "Gender", "Date of Birth" };

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