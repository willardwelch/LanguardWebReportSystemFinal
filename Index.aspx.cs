using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
using System.Runtime.InteropServices;

namespace ReportSystem
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ConnectData.UserName == "")
            {
                Response.Redirect("login.aspx");
            }

            getLogonUserDetails();
        }

        public void getLogonUserDetails()
        {

            var dataset= ConnectData.checkLog.sp_selectUserLoginDetail(ConnectData.UserName).ToList();

            
            this.cmbTxttRight.DataTextField = "Rights";
            this.cmbTxttRight.DataValueField = "Rights";
            this.cmbTxttRight.DataSource = dataset;
            cmbTxttRight.DataBind();
            // cmbTxttRight.Visible = true;
            ConnectData.createRights = cmbTxttRight.SelectedValue;

            cmbtxtBrigade.DataTextField = "BrigadeLevel";
            cmbtxtBrigade.DataValueField = "BrigadeLevel";
            cmbtxtBrigade.DataSource = dataset;
            cmbtxtBrigade.DataBind();
            ConnectData.bdeLevelAccess = int.Parse(cmbtxtBrigade.SelectedValue);
           // cmbtxtBrigade.Visible = true;

           
            cmbtxtUnit.DataTextField = "UntLevel";
            cmbtxtUnit.DataValueField = "UntLevel";
            cmbtxtUnit.DataSource = dataset;
            cmbtxtUnit.DataBind();
            ConnectData.UnitLevelAccess = int.Parse(cmbtxtUnit.SelectedValue);
           // cmbtxtUnit.Visible = true;

            
            txtcmbCoy.DataTextField = "CoyLevel";
            txtcmbCoy.DataValueField = "CoyLevel";
            txtcmbCoy.DataSource = dataset;
            txtcmbCoy.DataBind();
            ConnectData.coylevelAccess = int.Parse(txtcmbCoy.SelectedValue);
            //txtcmbCoy.Visible = true;
               
        }

    }
        
  }