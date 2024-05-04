using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Diagnostics.Eventing.Reader;

namespace ReportSystem
{
    public partial class viewUnit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
            }
            else
            {
                /*  this.cmbBrigade.DataSource = ConnectData.LoadBrigadeRights();
                  cmbBrigade.DataTextField = "Brigade";
                  cmbBrigade.DataValueField = "ID";
                  cmbBrigade.DataBind();*/

                cmbBrigade.DataValueField = "ID";

                if (ConnectData.createRights == "Administrator")
                {
                    cmbBrigade.DataSource = ConnectData.checkLog.sp_selectBrigade().ToList();

                    cmbBrigade.DataTextField = "Brigade";

                    cmbBrigade.DataBind();
                }
                else
                {
                    cmbBrigade.DataSource = ConnectData.checkLog.sp_selectBrigadebyBde(ConnectData.bdeLevelAccess).ToList();
                    cmbBrigade.DataTextField = "Brigade";

                    cmbBrigade.DataBind();
                }


                
            }

                    getandLoadUnit();
        }

        public void getandLoadUnit()
        {
            /* try
             {
                 this.Units.DataSource = ConnectData.LoadUnitRights(int.Parse(cmbBrigade.SelectedValue));
                 this.Units.DataBind();
             }
             catch (Exception)
             {
             }*/
            int Bdeid;
              if (ConnectData.createRights != "Administrator")
                Bdeid = ConnectData.bdeLevelAccess;
            else
                Bdeid = int.Parse(cmbBrigade.SelectedValue);

            if (ConnectData.UnitLevelAccess > 0)
            {
                this.Units.DataSource = ConnectData.checkLog.sp_selectUnitbyID(Bdeid, ConnectData.UnitLevelAccess).ToList();
                Units.DataBind();
                //Units.HeaderRow.Cells[0].Visible = false;

               // this.Units.Columns[0].Visible = false;

            }
            else
            {
                 this.Units.DataSource = ConnectData.checkLog.sp_selectUnit(Bdeid).ToList();
                Units.DataBind();
                
            }
            
        }

        protected void cmbBrigade_SelectedIndexChanged(object sender, EventArgs e)
        {
            getandLoadUnit();
        }

        protected void cmbBrigade_TextChanged(object sender, EventArgs e)
        {
            getandLoadUnit();
        }
    }
}