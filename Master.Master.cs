using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReportSystem
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ConnectData.UserName == "")
            {
                Response.Redirect("login.aspx");
            }

            if (ConnectData.UserName != "")
            {
                string name = ConnectData.UserName.ToString();
                string new_message = string.Concat("Hello, ", name.ToString(),"!");
                lblWelcome.Text = new_message.ToString();
               loginlink.Text = "Log off";
                var menu = Page.Master.FindControl("Menu1") as Menu;
                if (ConnectData.createRights != "Administrator")
                {
                  //  menu.Items.Remove(menu.FindItem("DELETE ENTRY"));
                }
            }
            else
            {
                lblWelcome.Text = "";
                loginlink.Text = "Log in";
            }
        }
    }
}