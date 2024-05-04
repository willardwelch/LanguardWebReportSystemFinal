<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Brigade.aspx.cs" Inherits="ReportSystem.Brigade" MasterPageFile="Master.Master" %>

     <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <link rel="stylesheet" href="Script/main.css" type="text/css" />
               
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
          <br />
          <br /> 
       <center>
            <table>
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="BRIGADES" Font-Bold="True"></asp:Label>

                    </td>
                </tr>
            </table>
         </center>
    <br />

    <table border="1">
        <tr>
            <td>
                <asp:GridView ID="Brigades" runat="server"  AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#0000CC" BorderStyle="Solid" Width="500px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="15" ForeColor="Black" OnRowDataBound="comp_rowDataBound">
             <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
             <HeaderStyle BackColor="#0099FF" ForeColor="white" />
             <RowStyle BackColor="White" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="1px" />

                </asp:GridView>
            </td>
        </tr>
    </table>
 </asp:Content>