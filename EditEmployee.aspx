<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="ReportSystem.EditEmployee" MasterPageFile="Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <link rel="stylesheet" href="Script/main.css" type="text/css" />
      <link rel="stylesheet" href="Script/style.css" type="text/css" />
    
               
      </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
     <center>
           <table>
               <tr>
                   <td> <nav class="navbar navbar-expand-lg bg-red navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        
                              <h4 class="heading">Search Employee</h4>
                    </nav>
                 
                     
                   </td>
               </tr>
           </table>
     </center>
    <br />
    <center>
        <table  width="40%" class="tableclass">
            <tr>
                <td align="right">
                   
                              Surname
                       
                    
                   
                </td>

                    <td align="left"> <asp:TextBox ID="txtEmployee" runat="server" MaxLength="10" style="margin-top: 8px" Width="101px"></asp:TextBox>
                    </td>

                 </tr>
            <tr>
                     <td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmployee" ErrorMessage="Surname is missing" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                     </td>
                     <td align="left">
                         <asp:Button ID="Button1" Class="buttonclass" runat="server" Text="Search" OnClick="Button1_Click" /></td>
            </tr>
        </table>
   </center>
    <br />

    <table border="0" width="100%">
        <tr>
            <td>
                  <asp:GridView ID="EditEmployeedetail" runat="server" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="3px" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" ForeColor="#3333CC" AutoGenerateEditButton="True" EnableSortingAndPagingCallbacks="True" OnRowUpdating="EditEmployeedetail_RowUpdating" OnRowUpdated="EditEmployeedetail_RowUpdated" OnRowEditing="EditEmployeedetail_RowEditing" Width="100%" OnRowDataBound="EditEmployeedetail_rowDataBound" OnPreRender="EditEmployeedetail_PreRender" CssClass="wide" OnRowCancelingEdit="EditEmployeedetail_RowCancellingEdit">
                   <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                     <HeaderStyle BackColor="#0099FF" ForeColor="white" />
                     <RowStyle BackColor="White" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="1px" />
                    </asp:GridView>
                </td>
        </tr>
    </table>
</asp:Content>