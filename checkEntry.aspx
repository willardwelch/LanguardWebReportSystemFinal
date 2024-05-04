<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkEntry.aspx.cs" Inherits="ReportSystem.checkEntry" MasterPageFile="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <link rel="stylesheet" href="Script/main.css" type="text/css" />
               
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <br /><br />
 <center>
        <table>
            <tr>
                <td> <nav class="navbar navbar-expand-lg bg-red navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        
         <h4 class="heading">Check Order Entries</h4>
</nav>
                 
                 
                </td>
            </tr>
        </table>
  </center>
    <br />

    <center>
     <table  width="350" class="tableclass" >
         <tr>
             <td align="right"><asp:Label ID="Label1" runat="server" Text="Employee Number: "></asp:Label>
             </td>

                 <td> <asp:TextBox ID="txtEmployee" runat="server" MaxLength="10" style="margin-top: 8px" Width="107px"></asp:TextBox>
                 </td>

              </tr>
         <tr>
                  <td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Emplyee Id Number is required" Font-Size="Small" ForeColor="#CC0000" ControlToValidate="txtEmployee"></asp:RequiredFieldValidator>
                  </td>
            </tr>
         <tr>
                  <td  colspan=2 align="center">
                      <asp:Button ID="Button1" runat="server" Class="buttonclass" Text="Search" OnClick="Button1_Click" /></td>
         </tr>
     </table>
</center>


     <table border="0">
     <tr>
         <td>
             <asp:GridView ID="P2Checkinfo" runat="server" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="3px" Width="100%" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" ForeColor="#3333CC" OnRowDataBound="P2Checkinfo_rowDataBound">
               <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                 <HeaderStyle BackColor="#0099FF" ForeColor="white" />
                 <RowStyle BackColor="White" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="1px" /> </asp:GridView>
             </td>
     </tr>
 </table>
</asp:Content>