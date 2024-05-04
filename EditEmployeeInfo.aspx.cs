using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Net.NetworkInformation;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.IO;
using System.Threading;

namespace ReportSystem
{
    public partial class EditEmployeeInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
            }
            else
            {
                this.txtFirstName.Text = ConnectData.employeefname;
                this.txtLastName.Text = ConnectData.employeelname;
                this.cmbParish.SelectedValue = ConnectData.employeeparish.ToString();
                this.gender.SelectedValue = ConnectData.employeegender;
                this.txtAddress.Text = ConnectData.employeeaddress;
                this.MStatus.SelectedValue = ConnectData.employeemstatus;

                DateTime enteredDate = DateTime.Parse(ConnectData.employeedob);
                string newdate = Convert.ToString(enteredDate);
                string strDate = enteredDate.ToString("MM/dd/yyyy");
                dob.Text = strDate;

                enteredDate = DateTime.Parse(ConnectData.employeeDoEnlist);
                newdate = Convert.ToString(enteredDate);
                strDate = enteredDate.ToString("MM/dd/yyyy");
                doe.Text = strDate;

                enteredDate = DateTime.Parse(ConnectData.employeeRodDate);
                newdate = Convert.ToString(enteredDate);
                strDate = enteredDate.ToString("MM/dd/yyyy");
                txtRod.Text = strDate;
            }
           
           

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveSecurityInfo();
        }

        private void EntityCoreCode()
        {
            try
            {
                var returnValue = ConnectData.checkLog.sp_UpdateSecurityDetail(int.Parse(ConnectData.employeeIdNum),this.txtFirstName.Text,this.txtLastName.Text, gender.Text,MStatus.Text,DateTime.Parse(dob.Text), DateTime.Parse(doe.Text), DateTime.Parse(this.txtRod.Text), txtAddress.Text, cmbParish.Text);
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

                        this.ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + "Record Updated successfully" + "');", true);
                       // Response.Write("Record Updated successfully");
                        Thread.Sleep(15000);
                        EmptyComponent();
                       // Response.Redirect("EditEmployee.aspx");

                    }
                }
            }//  end of try
            catch (IOException mes)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('" + mes.Message + "');", true);

            }
        }


        private void SaveSecurityInfo()
        {
            ConnectData.message = "Record Updated Successfully";
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