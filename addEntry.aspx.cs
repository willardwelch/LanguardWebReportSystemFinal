using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReportSystem
{
    public partial class addEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
            }
            else
            {
                 cmbBrigade.DataValueField = "ID";
                 if (ConnectData.createRights == "Administrator")
                {
                    cmbBrigade.DataTextField = "Brigade";

                    cmbBrigade.DataSource = ConnectData.checkLog.sp_selectBrigade().ToList();
                }
                else
                {
                    cmbBrigade.DataTextField = "Brigade";
                    cmbBrigade.DataSource = ConnectData.checkLog.sp_selectBrigadebyBde(ConnectData.bdeLevelAccess).ToList();
                }


                cmbBrigade.DataBind();
                getandLoadUnit();
                getRank();// load rank
                GetEntryName(); //load entry name
                GetOrderName(); //load orders
               getandLoadCoy();


            }
            //

        }

        public void GetEntryName()
        {
              cmbEntryType.DataTextField = "Entry";
            cmbEntryType.DataValueField = "ID";
            cmbEntryType.DataSource = ConnectData.checkLog.sp_selectEntryName().ToList();
            cmbEntryType.DataBind();

        }

        public void  getRank()
        {
            cmbRank1.DataSource = ConnectData.checkLog.sp_selectRank().ToList();
            cmbRank1.DataTextField = "RankName";
            cmbRank1.DataValueField = "ID";
            cmbRank1.DataBind();
        }


        public void GetOrderName()
        {   cmbOrders.DataTextField = "OrdersName";
            cmbOrders.DataValueField = "ID";
            cmbOrders.DataSource = ConnectData.checkLog.sp_selectOrdersType().ToList();
            cmbOrders.DataBind();

        }

        public void getandLoadUnit()
        {
            try
            {
              

                int Bdeid;
                 if (ConnectData.createRights != "Administrator")
                    Bdeid = ConnectData.bdeLevelAccess;
                else
                    Bdeid = int.Parse(cmbBrigade.SelectedValue);

                 cmbUnit.DataValueField = "ID";
                if (ConnectData.UnitLevelAccess > 0)
                {
                    cmbUnit.DataTextField = "Unit";
                    this.cmbUnit.DataSource = ConnectData.checkLog.sp_selectUnitbyID(Bdeid, ConnectData.UnitLevelAccess).ToList();

                }
                else
                {
                    cmbUnit.DataTextField = "Unit";

                    this.cmbUnit.DataSource = ConnectData.checkLog.sp_selectUnit(Bdeid).ToList();
                }
                
                cmbUnit.DataBind();

                getandLoadCoy();
            }
            catch (Exception)
            {
            }
        }

        public void getandLoadCoy()
        {
            try
            {
                this.cmbCoy.DataTextField = "Coyname";
                this.cmbCoy.DataValueField = "ID";
                this.cmbCoy.DataSource = ConnectData.checkLog.sp_selectCoy(int.Parse(cmbBrigade.SelectedValue), int.Parse(this.cmbUnit.SelectedValue)).ToList();
                this.DataBind();
            }
            catch (Exception)
            {
            }
        }

        private void InsertP2Entry()
        {
            ConnectData.message = "Record Saved Successfully";
            ConnectData.title = "Save";
            try
            {

                TimeSpan datediffvalue = DateTime.Parse(txtEndDate.Text)- DateTime.Parse(txtwef.Text);
                int val1 = (int) datediffvalue.TotalMinutes;
                if (val1 < 0)
                {
                    ConnectData.message = "End date cannot be less the wef date";
                    ConnectData.title = "Save Failed";
                    txtEndDate.Focus();
                    ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);

                    return;
                }
                 var returnValue = ConnectData.checkLog.sp_InsertPt2Orders(int.Parse(this.empNo.Text), int.Parse(this.cmbRank1.SelectedValue), int.Parse(this.cmbUnit.SelectedValue), int.Parse(this.cmbCoy.SelectedValue), int.Parse(this.cmbEntryType.SelectedValue), int.Parse(this.cmbOrders.SelectedValue), this.txtOrderNum.Text, DateTime.Parse(this.txtOrderDate.Text), this.txtOccurrence.Text, DateTime.Parse(this.txtwef.Text), DateTime.Parse(this.txtEndDate.Text), this.txtEnterby.Text);
                if (returnValue > 0)
                {
                    ConnectData.message = "Record already exist!";
                    ConnectData.title = "Save Failed";
                    ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);

                }

                else
                {
                    ConnectData.message = "Record Saved Successfully";
                    ConnectData.title = "Save";
                    EmptyComponent();
                        ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);

                }


            }
            catch (Exception ex)
            {
                ConnectData.message = ex.Message;
                ConnectData.title = "Error";
                this.ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
            }
        }

        public void EmptyComponent()
        {
            this.empNo.Text="";
           // this.cmbRank1.Text="";
            cmbRank1.ClearSelection();
            cmbUnit.ClearSelection();
            cmbCoy.ClearSelection();
            cmbEntryType.ClearSelection();
            cmbOrders.ClearSelection();
            this.txtOrderNum.Text="";
            this.txtOrderDate.Text="";
            this.txtOccurrence.Text="";
            this.txtwef.Text="";
            this.txtEndDate.Text="";
            this.txtEnterby.Text="";
        }
        protected void cmbBrigade_SelectedIndexChanged(object sender, EventArgs e)
        {
            getandLoadUnit();
        }

        protected void cmbUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            getandLoadCoy();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            InsertP2Entry();
        }

        protected void empNo_TextChanged(object sender, EventArgs e)
        {
            LoadEmploeeInfo();
        }


        protected void LoadEmploeeInfo()
        {
            var dataset = ConnectData.checkLog.sp_SearchEmployeeInfoID(int.Parse(this.empNo.Text)).ToList();
            EmpData.DataSource = dataset;
            EmpData.DataBind();
        }


        protected void EmpData_rowDataBound(object sender, GridViewRowEventArgs e)
        {
            String[] headings = new string[] { "ID ", "First Name", "Last Name", "Marital Status","Gender", "Date of Birth" };

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
    }

}
