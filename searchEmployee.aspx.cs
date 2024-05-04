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
    public partial class searchEmployee : System.Web.UI.Page
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
          //  SqlConnection connDb = new SqlConnection(ConnectData.connectionString);
          //  connDb.Open();
            if (txtEmployee.Text != "")
            {

                  var dataset = ConnectData.checkLog.sp_SearchSecurityDetail(txtEmployee.Text).ToList();
                EmployeeInfo.DataSource = dataset;
                EmployeeInfo.DataBind();


            }
            else
            {
                ConnectData.message = "Please enter employee id to search by";
                ConnectData.title = "id Missing";
                ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
                txtEmployee.Focus();

            }

        }


        protected void EmployeeInfo_rowDataBound(object sender, GridViewRowEventArgs e)
        {
            String[] headings = new string[] {"ID", "First Name", "Last Name", "Marital Status", "Gender", "Date of Birth", "Enlistment Date", "Run Out Date", "Address", "Parish" };

            if (e.Row.RowType == DataControlRowType.Header)
            {
                for (int i = 0; i < e.Row.Controls.Count - 1; i++)
                {
                    //  e.Row.Controls[i]
                    var headerCell = e.Row.Controls[i] as DataControlFieldHeaderCell;
                   
                        e.Row.Cells[i].Text = headings[i];
                    
                }
            }
        }
    }
}