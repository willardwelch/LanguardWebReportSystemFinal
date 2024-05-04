using ReportSystem.Database_File;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReportSystem
{
    public partial class EditEntryInfo : System.Web.UI.Page
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
                try
                {
                int rankid = (int)ConnectData.checkLog.sp_getRankName(ConnectData.entryRank).FirstOrDefault();
                int unit1value = (int)ConnectData.checkLog.sp_getUnitName(ConnectData.entryunit).FirstOrDefault();
                int comptxt = (int)ConnectData.checkLog.sp_getCoyName(ConnectData.entrycoy, ConnectData.entryunit).FirstOrDefault();
                int entry_nametxt = (int)ConnectData.checkLog.sp_getEntyID(ConnectData.entryname).FirstOrDefault();

                
                    int brigadeid = (int)(ConnectData.checkLog.sp_selectbrigadeID(unit1value, comptxt).FirstOrDefault());
                    cmbBrigade.SelectedValue = brigadeid.ToString();
               
                getandLoadUnit();
                getRank();// load rank
                GetEntryName(); //load entry name
                GetOrderName(); //load orders
                    cmbOrders.SelectedValue = ConnectData.entryorderid.ToString();




                empNo.Text = ConnectData.entryempId.ToString();
                cmbRank1.SelectedValue = rankid.ToString();                
                cmbUnit.SelectedValue = unit1value.ToString();
                cmbEntryType.SelectedValue = entry_nametxt.ToString();
                this.txtOrderNum.Text = ConnectData.entryorderno;

               
                CultureInfo culture = new CultureInfo("en-US");

                DateTime enteredDate = DateTime.Parse(ConnectData.entryorderdate);
                string newdate = Convert.ToString(enteredDate);
                string strDate = enteredDate.ToString("MM/dd/yyyy");


                //DateTime dt1 = DateTime.ParseExact(newdate, "mm/dd/yyyy",null);


                this.txtOrderDate.TextMode = TextBoxMode.SingleLine;
                txtOrderDate.Text = strDate;

                this.txtOccurrence.Text = ConnectData.entryoccurrence;

                enteredDate = DateTime.Parse(ConnectData.entrywef);
                newdate = Convert.ToString(enteredDate);
                strDate = enteredDate.ToString("MM/dd/yyyy");
                this.txtwef.TextMode = TextBoxMode.SingleLine;
                txtwef.Text = strDate;
               // this.txtwef.Text=ConnectData.entrywef.ToString();

                txtEndDate.Text = ConnectData.entryendate.ToString();

                
                enteredDate = DateTime.Parse(ConnectData.entryendate);
                newdate = Convert.ToString(enteredDate);
                strDate = enteredDate.ToString("MM/dd/yyyy");
                this.txtEndDate.TextMode = TextBoxMode.SingleLine;
                txtEndDate.Text = strDate;

                this.txtEnterby.Text=ConnectData.enteredby.ToString();
                LoadEmploeeInfo();


                getandLoadCoy();
                cmbCoy.SelectedValue = comptxt.ToString();

                }
                catch (Exception)
                {

                }
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

        public void getRank()
        {
            cmbRank1.DataSource = ConnectData.checkLog.sp_selectRank().ToList();
            cmbRank1.DataTextField = "RankName";
            cmbRank1.DataValueField = "ID";
            cmbRank1.DataBind();
        }


        public void GetOrderName()
        {
            cmbOrders.DataTextField = "OrdersName";
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
                if (ConnectData.entryunit != "")
                {
                    int unit1value = (int)ConnectData.checkLog.sp_getUnitName(ConnectData.entryunit).FirstOrDefault();
                    cmbUnit.SelectedValue = unit1value.ToString();
                }

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

        private void UpdatePt2Entry()
        {
            ConnectData.message = "Record Updated Successfully";
            ConnectData.title = "Save";
            try
            {

                TimeSpan datediffvalue = DateTime.Parse(txtEndDate.Text) - DateTime.Parse(txtwef.Text);
                int val1 = (int)datediffvalue.TotalMinutes;
                if (val1 < 0)
                {
                    ConnectData.message = "End date cannot be less the wef date";
                    ConnectData.title = "Save Failed";
                    txtEndDate.Focus();
                    ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);

                    return;
                }
                //  var returnValue = ConnectData.checkLog.sp_InsertPt2Orders(int.Parse(this.empNo.Text), int.Parse(this.cmbRank1.SelectedValue), int.Parse(this.cmbUnit.SelectedValue), int.Parse(this.cmbCoy.SelectedValue), int.Parse(this.cmbEntryType.SelectedValue), int.Parse(this.cmbOrders.SelectedValue), this.txtOrderNum.Text, DateTime.Parse(this.txtOrderDate.Text), this.txtOccurrence.Text, DateTime.Parse(this.txtwef.Text), DateTime.Parse(this.txtEndDate.Text), this.txtEnterby.Text);
                // var returnValue = ConnectData.checkLog.sp_EditPt2Orders(ConnectData.entryempId, int.Parse(this.cmbRank1.SelectedValue), int.Parse(this.cmbUnit.SelectedValue), int.Parse(this.cmbCoy.SelectedValue), int.Parse(this.cmbEntryType.SelectedValue), this.txtOrderNum.Text, DateTime.Parse(txtOrderDate.Text), txtOccurrence.Text, DateTime.Parse(txtwef.Text), DateTime.Parse(txtEndDate.Text), txtEnterby.Text);
                var returnValue = ConnectData.checkLog.sp_EditPt2OrdersLatest(ConnectData.entryempId, int.Parse(this.cmbRank1.SelectedValue), int.Parse(this.cmbUnit.SelectedValue), int.Parse(this.cmbCoy.SelectedValue), int.Parse(this.cmbEntryType.SelectedValue), this.txtOrderNum.Text, DateTime.Parse(txtOrderDate.Text), txtOccurrence.Text, DateTime.Parse(txtwef.Text), DateTime.Parse(txtEndDate.Text), txtEnterby.Text, ConnectData.entryorderid, ConnectData.entryorderno, DateTime.Parse(ConnectData.entryorderdate));
                if (returnValue <=1)
                {
                        ConnectData.message = "Record Updated Successfully";
                        ConnectData.title = "Updated";

                      //  editEntry.txtEmployee.Text = "";
                        EmptyComponent();
                        ClientScript.RegisterStartupScript(this.GetType(), ConnectData.title, "alert('" + ConnectData.message + "');", true);
                        Response.Redirect("Editentry.aspx");

                    }

                else
                {
                    
                        ConnectData.message = "Record already exist!";
                        ConnectData.title = "Save Failed";
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
           // this.empNo.Text = "";
            // this.cmbRank1.Text="";
            cmbRank1.ClearSelection();
            cmbUnit.ClearSelection();
            cmbCoy.ClearSelection();
            cmbEntryType.ClearSelection();
            cmbOrders.ClearSelection();
            this.txtOrderNum.Text = "";
            this.txtOrderDate.Text = "";
            this.txtOccurrence.Text = "";
            this.txtwef.Text = "";
            this.txtEndDate.Text = "";
            this.txtEnterby.Text = "";

            ConnectData.entryRank = "";
            ConnectData.entryunit = "";
            ConnectData.entrycoy = "";
            ConnectData.entryname = "";
            ConnectData.entryorderno = "";
            ConnectData.entryorderdate = "";
            ConnectData.entryoccurrence = "";
            ConnectData.entrywef = "";
            ConnectData.entryendate = "";
        }
        protected void cmbBrigade_SelectedIndexChanged(object sender, EventArgs e)
        {
            getandLoadUnit();
        }

        protected void cmbUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            getandLoadCoy();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            UpdatePt2Entry();
        }

        protected void empNo_TextChanged(object sender, EventArgs e)
        {
            LoadEmploeeInfo();
        }


        protected void LoadEmploeeInfo()
        {
            var dataset = ConnectData.checkLog.sp_SearchEmployeeInfoID(ConnectData.entryempId).ToList();
            EmpData.DataSource = dataset;
            EmpData.DataBind();
        }


        protected void EmpData_rowDataBound(object sender, GridViewRowEventArgs e)
        {
            String[] headings = new string[] { "ID ", "First Name", "Last Name", "Marital Status", "Gender", "Date of Birth" };

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

        protected void Save_Click(object sender, EventArgs e)
        {
            UpdatePt2Entry();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            //WindowsAccountType.
            Response.Redirect("editEntry.aspx");
            
        }
    }
}