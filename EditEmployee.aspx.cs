using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using static System.Net.Mime.MediaTypeNames;

namespace ReportSystem
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ConnectData.employeesearchlname!=null)
            {
                txtEmployee.Text = ConnectData.employeesearchlname;
                GetSearchInfo();

            }
        }

        private void GetSearchInfo()
        {
            //  SqlConnection connDb = new SqlConnection(ConnectData.connectionString);
            //  connDb.Open();
            if (txtEmployee.Text != "")
            {

                var dataset = ConnectData.checkLog.sp_SearchSecurityDetail(txtEmployee.Text).ToList();
               
                EditEmployeedetail.DataSource = dataset;
                EditEmployeedetail.DataBind();
                ConnectData.employeesearchlname = txtEmployee.Text;


            }
            else
            {
                ConnectData.message = "Please enter employee id to search by";
                ConnectData.title = "id Missing";
                ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
                txtEmployee.Focus();

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GetSearchInfo();
        }

        protected void EditEmployeedetail_RowEditing(object sender, GridViewEditEventArgs e)
        {
            EditEmployeedetail.EditIndex = e.NewEditIndex;
            EditEmployeedetail.DataBind();
            GetSearchInfo();
            GridViewRow row = EditEmployeedetail.Rows[e.NewEditIndex];
            TextBox idnum = (TextBox)(row.Cells[1].Controls[0]);

            TextBox fname1 = (TextBox)(row.Cells[2].Controls[0]);
            TextBox Lname1 = (TextBox)(row.Cells[3].Controls[0]);
            TextBox Mstatus = (TextBox)(row.Cells[4].Controls[0]);
            TextBox txtgender = (TextBox)(row.Cells[5].Controls[0]);


            TextBox dobtxt = (TextBox)(row.Cells[6].Controls[0]);
            TextBox DoEnlist = (TextBox)(row.Cells[7].Controls[0]);
            TextBox RodDate = (TextBox)(row.Cells[8].Controls[0]);
            TextBox address = (TextBox)(row.Cells[9].Controls[0]);
            TextBox parish = (TextBox)(row.Cells[10].Controls[0]);

            ConnectData.employeeIdNum = idnum.Text;
            ConnectData.employeefname= fname1.Text;
            ConnectData.employeelname = Lname1.Text;
            ConnectData.employeemstatus = Mstatus.Text;
            ConnectData.employeegender= txtgender.Text;
            ConnectData.employeedob = dobtxt.Text;
            ConnectData.employeeDoEnlist = DoEnlist.Text;
            ConnectData.employeeRodDate = RodDate.Text;
            ConnectData.employeeaddress = address.Text;
            ConnectData.employeeparish = parish.Text;

            GetSearchInfo();
            Response.Redirect("EditEmployeeInfo.aspx");
            EditEmployeedetail.EditIndex = -1;

            //EditEmployeedetail.Width = 800;
            //EditEmployeedetail.Columns[0].Visible = false;
        }

        protected void EditEmployeedetail_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = EditEmployeedetail.Rows[e.RowIndex];
            TextBox idnum = (TextBox)(row.Cells[1].Controls[0]);
           
            TextBox fname1 = (TextBox)(row.Cells[2].Controls[0]);
            TextBox Lname1 = (TextBox)(row.Cells[3].Controls[0]);
            TextBox Mstatus = (TextBox)(row.Cells[4].Controls[0]);
            TextBox txtgender = (TextBox)(row.Cells[5].Controls[0]);

            TextBox dobtxt = (TextBox)(row.Cells[6].Controls[0]);
            TextBox DoEnlist = (TextBox)(row.Cells[7].Controls[0]);
            TextBox RodDate = (TextBox)(row.Cells[8].Controls[0]);
            TextBox address = (TextBox)(row.Cells[9].Controls[0]);
            TextBox parish = (TextBox)(row.Cells[10].Controls[0]);

            
           try
            {
                var returnValue = ConnectData.checkLog.sp_UpdateSecurityDetail(int.Parse(idnum.Text), fname1.Text, Lname1.Text, txtgender.Text, Mstatus.Text, DateTime.Parse(dobtxt.Text), DateTime.Parse(DoEnlist.Text), DateTime.Parse(RodDate.Text), address.Text, parish.Text);
                if (returnValue <= 1)
                {
                    ConnectData.message = "Record Updated Successfully";
                    EditEmployeedetail.DataBind();
                    EditEmployeedetail.EditIndex = -1;

                    GetSearchInfo();
                    ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);

                    String[] headings = new string[] { "ID", "First Name", "last Name", "Marital Status", "Gender", "Date of Birth", "Enlistment Date", "Run Out Date", "Address", "Parish" };

                   
                }
            }
            catch (Exception ex)
            {
                ConnectData.message = ex.Message;
                ConnectData.title = "Error";
                this.ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
            }
        }

        protected void EditEmployeedetail_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void EditEmployeedetail_rowDataBound(object sender, GridViewRowEventArgs e)
        {
             String[] headings = new string[] {" ", "ID", "First Name", "Last Name", "Marital Status", "Gender", "Date of Birth","Enlistment Date","Run Out Date","Address","Parish"};
         
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

        protected void EditEmployeedetail_PreRender(object sender, EventArgs e)
        {
          
        }

        protected void EditEmployeedetail_RowCancellingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            EditEmployeedetail.EditIndex = -1;
            GetSearchInfo();
            EditEmployeedetail.DataBind();

            
        }
    }
}