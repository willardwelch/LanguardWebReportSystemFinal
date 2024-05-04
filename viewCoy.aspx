<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewCoy.aspx.cs" Inherits="ReportSystem.viewCoy" MasterPageFile="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <link rel="stylesheet" href="Script/main.css" type="text/css" />
               
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br /><br />
         <center>
                <table>
                    <tr>
                        <td> <nav class="navbar navbar-expand-lg bg-red navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        
                                <h4 class="heading"> Companies</h4>
                        </nav>
                 
                        
                        </td>
                    </tr>
                </table>
  </center> 
    <br />
    <center>
         <table border="0" width="500px">
             <tr>
                    
                         <td align="right">Brigade
                             &nbsp;</td>
                         <td>
                             <asp:DropDownList ID="cmbBrigade" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbBrigade_SelectedIndexChanged"></asp:DropDownList></td>
                      
                 </tr>

             <tr>
       
                    <td align="right">Unit
                        &nbsp;</td>
                    <td>
                        <asp:DropDownList ID="cmbUnit" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbUnit_SelectedIndexChanged"></asp:DropDownList></td>
         
    </tr>

                
         </table>
    <br />

 <table border="0" width="500px">
     <tr>
        
         <td>
             <asp:GridView ID="Comp" runat="server" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#0000CC" BorderStyle="Solid" Width="500px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="15" ForeColor="Black" OnRowDataBound="comp_rowDataBound">
             <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
 <HeaderStyle BackColor="#0099FF" ForeColor="white" />
 <RowStyle BackColor="White" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="1px" />

                        
                                 
             </asp:GridView>
             <br />
         </td>
     </tr>
 </table>
    </center>
</asp:Content>