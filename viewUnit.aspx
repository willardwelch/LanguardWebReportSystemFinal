<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewUnit.aspx.cs" Inherits="ReportSystem.viewUnit" MasterPageFile="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <link rel="stylesheet" href="Script/main.css" type="text/css" />
               
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br /><br />
 <center>
        <table>
            <tr>
                <td> <nav class="navbar navbar-expand-lg bg-red navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        
                     <h4 class="heading"> Unit</h4>
                    </nav>
               
                </td>
            </tr>
        </table>
  </center>
    <center>
            <table border="0" width="30%">
                <tr>
                    <td align="right">
                       
                     <h5 class="display-8 m-0 text-primary">Brigade:</h5>
                           
                    </td>
                    <td align="left"> <asp:DropDownList ID="cmbBrigade" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbBrigade_SelectedIndexChanged" OnTextChanged="cmbBrigade_TextChanged"></asp:DropDownList></td>
                </tr>
            </table>
       
        <br />
    <table border="0" cellspacing="2" celppading="2">
        <tr>
            <td>
                <asp:GridView ID="Units" runat="server" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="3px" Width="350px" ForeColor="Black" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" PageSize="15">
                    <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                     <HeaderStyle BackColor="#0099FF" ForeColor="White" />
                     <RowStyle BackColor="White" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="1px" />
                 </asp:GridView>
                <br />
            </td>
        </tr>
    </table></center>
</asp:Content>