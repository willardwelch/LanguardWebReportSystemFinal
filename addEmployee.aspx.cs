using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace ReportSystem
{
    public partial class addEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveSecurityInfo();
        }

        private void EntityCoreCode()
        {
            try
            {
                 var returnValue = ConnectData.checkLog.sp_InsertSecurityDetail(txtFirstName.Text, txtLastName.Text, gender.Text, MStatus.Text, DateTime.Parse(dob.Text), DateTime.Parse(doe.Text), DateTime.Parse(this.txtRod.Text), txtAddress.Text.ToString(), cmbParish.Text.ToString()) ;
                if (returnValue.ToString() == null)
                {

                }
                else
                {

                    if (Convert.ToInt32(returnValue) > 0)
                    {
                        ConnectData.message = "Record already exist!";
                        ConnectData.title = "Save Failed";
                        ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
                    }

                    else
                    { 

                        this.ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + "Record saved successfully" + "');", true);
                        EmptyComponent();

                    }
                }
            }//  end of try
            catch(IOException mes)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('" + mes.Message + "');", true);

            }
        }

       
        private void SaveSecurityInfo()
        {
            ConnectData.message = "Record Saved Successfully";
            ConnectData.title = "Save";
        try
            {
               EntityCoreCode();
              
            }
            catch (Exception ex)
            {
                ConnectData.message = ex.Message;
                ConnectData.title = "Save Failed";
                 this.ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);

            }

        }

        private void EmptyComponent()
        {
            this.txtFirstName.Text = "";
            this.txtLastName.Text = "";
            this.txtRod.Text = "";
            this.txtAddress.Text = "";
            this.cmbParish.SelectedValue = "";
            this.MStatus.SelectedValue = "";
            this.gender.SelectedValue = "";
            this.dob.Text = "";
            this.doe.Text = "";

        }
    }
}