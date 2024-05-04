using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReportSystem
{
    public partial class viewCoy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
            }
            else
            {
                /* this.cmbBrigade.DataSource = ConnectData.LoadBrigadeRights();
                 cmbBrigade.DataTextField = "Brigade";
                 cmbBrigade.DataValueField = "ID";
                 cmbBrigade.DataBind();*/

                 if (ConnectData.createRights == "Administrator")
                {
                    cmbBrigade.DataTextField = "Brigade";
                    cmbBrigade.DataValueField = "ID";

                    cmbBrigade.DataSource = ConnectData.checkLog.sp_selectBrigade().ToList();
                }
                else
                {
                      cmbBrigade.DataSource = ConnectData.checkLog.sp_selectBrigadebyBde(ConnectData.bdeLevelAccess).ToList();
                    cmbBrigade.DataValueField = "ID";
                    cmbBrigade.DataTextField = "Brigade";

                }


                cmbBrigade.DataBind();
                   getandLoadUnit();
                    getCoy();

             }

         }

         public void getandLoadUnit()
         {
             /*  try
               {
                   this.cmbUnit.DataSource = ConnectData.LoadUnitRights(int.Parse(cmbBrigade.SelectedValue));
                   cmbUnit.DataTextField = "Unit";
                   cmbUnit.DataValueField = "ID";
                   cmbUnit.DataBind();
                   getCoy();
                 //  this.Units.DataSource = ConnectData.LoadUnitRights(int.Parse(cmbBrigade.SelectedValue));
                 //  this.Units.DataBind();
               }
               catch (Exception)
               {
               }*/
            int Bdeid;
           // var checkLog = new Database_File.Lg2ReportingSystemEntities();
            if (ConnectData.createRights != "Administrator")
                Bdeid = ConnectData.bdeLevelAccess;
            else
                Bdeid = int.Parse(cmbBrigade.SelectedValue);

            if (ConnectData.UnitLevelAccess > 0)
            {
                cmbUnit.DataTextField = "Unit";
                cmbUnit.DataValueField = "ID";

                this.cmbUnit.DataSource = ConnectData.checkLog.sp_selectUnitbyID(Bdeid, ConnectData.UnitLevelAccess).ToList();
               
            }
            else
            {
                cmbUnit.DataTextField = "Unit";
                cmbUnit.DataValueField = "ID";

                this.cmbUnit.DataSource = ConnectData.checkLog.sp_selectUnit(Bdeid).ToList();
            }
                 cmbUnit.DataBind();
        }

        public void getCoy()
        {
           try
            {
                //  this.Comp.DataSource = ConnectData.LoadCoy(int.Parse(this.cmbUnit.SelectedValue),int.Parse(cmbBrigade.SelectedValue),"");
                //  this.Comp.DataBind();
                 Comp.DataSource = ConnectData.checkLog.sp_selectCoy(int.Parse(cmbBrigade.SelectedValue), int.Parse(this.cmbUnit.SelectedValue)).ToList();
                Comp.DataBind();


            }
            catch (Exception)
            {
            }
             
           
        }

        protected void cmbBrigade_SelectedIndexChanged(object sender, EventArgs e)
        {
            getandLoadUnit();
        }

        protected void Units_SelectedIndexChanged(object sender, EventArgs e)
        {
            // var values = Units.Rows[]
            //    GridViewRow row = Units.Rows[e];


            // Units.SelectedRow.c
          

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
          //  GridViewRow row = this.Units.SelectedRow;
           // var id = Units.SelectedRow.Cells[0].Text;

          //  ClientScript.RegisterStartupScript(this.GetType(), "Getting ID", "alert('" + row.Cells[1].Text + "');", true);

        }

        protected void Units_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
           
           // ClientScript.RegisterStartupScript(this.GetType(), "Getting ID", "alert('" + id + "');", true);

        }

        protected void cmbUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCoy();
        }


        protected void comp_rowDataBound(object sender, GridViewRowEventArgs e)
        {
            String[] headings = new string[] { "ID", "Company"};

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
                // this.EditEmployeedetail.Columns[0].Visible = false;
            }
        }
    }
}