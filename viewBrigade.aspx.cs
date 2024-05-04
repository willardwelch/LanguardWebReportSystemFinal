using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReportSystem
{
    public partial class viewBrigade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Brigades.DataSource = ConnectData.LoadBrigade(this);
            Brigades.DataBind();*/
            try
            {

                 if (ConnectData.createRights == "Administrator")
                {
                    Brigades.DataSource = ConnectData.checkLog.sp_selectBrigade().ToList();
                    Brigades.DataBind();

                }
                else
                {
                    Brigades.DataSource = ConnectData.checkLog.sp_selectBrigadebyBde(ConnectData.bdeLevelAccess).ToList();
                    Brigades.DataBind();
                
                }
                int a = Brigades.Columns.Count;
            }//end of try
            catch (IOException mes)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('" + mes.Message + "');", true);


            }
        }
            protected void Brigades_Load(object sender, EventArgs e)
        {
            try
            {
                this.Brigades.Columns[0].Visible = false;
            }
            catch (Exception ) { 

                }
        }

        protected void Brigades_SelectedIndexChanged(object sender, EventArgs e)
        {
            var a = sender.ToString();
           // Brigades.r

        }
    }
}