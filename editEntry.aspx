<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editEntry.aspx.cs" Inherits="ReportSystem.editEntry" MasterPageFile="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="Script/main.css" type="text/css" />
               
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br /><br />
 <center>
        <table>
            <tr>
                <td>  <nav class="navbar navbar-expand-lg bg-red navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        
                      <h4 class="heading">Edit Entry</h4>
            </nav>
                 

                </td>
            </tr>
        </table>
  </center>
    <br />
   

    <center>
     <table  width="300px" class="tableclass">
         <tr>
             <td align="right"><asp:Label ID="Label1" runat="server" Text="Employee Number: "></asp:Label>
             </td>

                 <td> <asp:TextBox ID="txtEmployee" runat="server" MaxLength="10" style="margin-top: 8px" Width="67px"></asp:TextBox>
                 </td>

              </tr>
         <tr>
                  <td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Emplyee Id Number is required" Font-Size="Small" ForeColor="#CC0000" ControlToValidate="txtEmployee"></asp:RequiredFieldValidator>
                  </td>
               </tr>
         <tr>
                  <td colspan=2 align="center">
                      <asp:Button ID="Button1" Class="buttonclass"  runat="server" Text="Search" OnClick="Button1_Click" /><br />
                  </td>
             
         </tr>
     </table>
</center>
    <br />

    <table border="0" width="100%">
        <tr>
            <td>
                <asp:GridView ID="Entry" Width="100%" runat="server" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="3px" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" ForeColor="#3333CC" AutoGenerateEditButton="True" OnRowCancelingEdit="Entry_RowCancelingEdit" OnRowEditing="Entry_RowEditing" OnRowUpdated="Entry_RowUpdated" OnRowUpdating="Entry_RowUpdating" AlternatingRowStyle-BorderWidth="2px" PageSize="15"  OnSelectedIndexChanged="Entry_SelectedIndexChanged" OnRowDataBound="Entry_rowDataBound" AutoGenerateColumns="True" EnableSortingAndPagingCallbacks="True">
               <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                 <HeaderStyle BackColor="#0099FF" ForeColor="white" />
                 <RowStyle BackColor="White" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="1px" />
                </asp:GridView>
                <asp:DropDownList id="getrankname" runat="server" Visible="false" />
            </td>
           
        </tr>
    </table>
   </asp:Content>