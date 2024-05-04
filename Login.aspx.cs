
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;


namespace ReportSystem
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConnectData.UserName = "";

            }
        }


        protected void Entity_Code()
        {

            try
            {
              
                var returnValue = ConnectData.checkLog.sp_selectUserLogin(txtUser.Text.ToString(), txtPassword.Text).FirstOrDefault();
                if (returnValue== null)
                {

                }
                else
                {
                                       
                    if (returnValue < 1)
                    {
                        ConnectData.message = "User entered is invalid";
                        ConnectData.title = "Password or user is invalid";
                        loginMessage.Text = "User or password is invalid";
                        // MessageBox.Show(ConnectData.message, ConnectData.title);
                        ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);

                    }

                    else
                    {
                        ConnectData.UserName = txtUser.Text;
                        loginMessage.Text = "Welcome " + ConnectData.UserName;
                           Response.Redirect("Index.aspx");
                    }//end else
                }

            }

            catch (IOException mes)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('" + mes.Message + "');", true);

            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                Entity_Code();
            }//end of try
            catch (IOException mes)
            {
                ConnectData.message = mes.Message;
                ConnectData.title = "Error Occurred";
                ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
            }
        }// Button1_Click
        
    }
    
}
