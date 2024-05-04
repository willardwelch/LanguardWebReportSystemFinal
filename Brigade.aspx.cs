using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReportSystem
{
    public partial class Brigade : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

            Response.Write("Welcome "+ConnectData.UserName);
           // GridView1.Columns[1].Visible = false;

        }
        protected void Page_Load(object sender)
        {
            try
            {

                 if (ConnectData.createRights == "Administrator")
                {
                    Brigades.DataSource = ConnectData.checkLog.sp_selectBrigade();
                    Brigades.DataBind();

                }
                else
                {
                    Brigades.DataSource = ConnectData.checkLog.sp_selectBrigadebyBde(ConnectData.bdeLevelAccess);
                    Brigades.DataBind();
                }
            }//end of try
            catch (IOException mes)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('" + mes.Message + "');", true);

            }

        }// end of Page_Load



        public void Show()
        {
           
            //this.GridView1.Visible=true;
        }
    }
}