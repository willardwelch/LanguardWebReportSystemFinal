<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewBrigade.aspx.cs" Inherits="ReportSystem.viewBrigade" MasterPageFile="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <link rel="stylesheet" href="Script/main.css" type="text/css" />
               
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <center>
           <table>
               <tr>
                   <td> <nav class="navbar navbar-expand-lg bg-red navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        
                         <h4 class="heading"> Brigades</h4>
                        </nav>
                 
                    
                   </td>
               </tr>
           </table>
     </center>
    
    <br />
    <center>
    <table border="0" width="300px">
        <tr>
            <td>
          <asp:GridView ID="Brigades" runat="server" Height="38px" Width="300px" AllowPaging="True" AllowSorting="True" BorderStyle="Solid" EnableSortingAndPagingCallbacks="True" OnLoad="Brigades_Load" BorderColor="#0000CC" BorderWidth="3px" AllowCustomPaging="True" DataKeyNames="ID" OnSelectedIndexChanged="Brigades_SelectedIndexChanged" OnSorted="Brigades_Load" PageSize="15" SelectedIndex="1" ForeColor="Black" AutoGenerateSelectButton="False">
              <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
              <HeaderStyle BackColor="#0099FF" ForeColor="white" />
              <RowStyle BackColor="White" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="1px" />
          
                  </asp:GridView>
                </td>
            </tr>
        </table>
</center>
</asp:Content>