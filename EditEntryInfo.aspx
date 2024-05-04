<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditEntryInfo.aspx.cs" Inherits="ReportSystem.EditEntryInfo"  MasterPageFile="Master.Master" %>
s
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <link rel="stylesheet" href="Script/main.css" type="text/css" />
               
      <style type="text/css">
          .auto-style1 {
              width: 399px;
          }
      </style>
               
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br /><br>

<center>  
              <table>
                  <tr>
                      <td>
                             <nav class="navbar navbar-expand-lg bg-red navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        
                                     <h4 class="heading">Edit Entry</h4>
                            </nav>
                 
                      </td>
                  </tr>
              </table>
        

    <table border="0">
        <tr>
            <td>

                <asp:GridView ID="EmpData" runat="server" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="3px" Width="550px" ForeColor="white" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" PageSize="15" OnRowDataBound="EmpData_rowDataBound">
                    <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                     <HeaderStyle BackColor="#0099FF" ForeColor="white" />
                     <RowStyle BackColor="White" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="1px" />
                 </asp:GridView>

            </td>
        </tr>
    </table>
    <br />
    <table width="550px" class="tableclass">
        <tr>
            <td align="right"> Employee No

            </td>
            <td class="auto-style1">
                <asp:TextBox ID="empNo" runat="server" Width="60px" AutoPostBack="True" OnTextChanged="empNo_TextChanged" ReadOnly="True"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Font-Bold="False" Font-Size="Small" ForeColor="Red" ControlToValidate="empNo"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
    <td align="right"> Rank

        </td>
        <td class="auto-style1">
            <asp:DropDownList ID="cmbRank1" runat="server" Width="250px"></asp:DropDownList>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="cmbRank1" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>

        </td>
    </tr>
        <tr>
            <td align="right"> Brigade

            </td>
            <td class="auto-style1">
                <asp:DropDownList ID="cmbBrigade" Width="250px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbBrigade_SelectedIndexChanged"></asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cmbBrigade" ErrorMessage="*" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>

            </td>
        </tr>
         <tr>
             <td align="right"> Unit

             </td>
             <td class="auto-style1">
                 <asp:DropDownList ID="cmbUnit" Width="250px" runat="server" OnSelectedIndexChanged="cmbUnit_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cmbUnit" ErrorMessage="*" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>

             </td>
        </tr>
         <tr>
             <td align="right"> Sub Unit

             </td>
             <td class="auto-style1">
                 <asp:DropDownList ID="cmbCoy" runat="server" Width="250px"></asp:DropDownList>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="cmbUnit" ErrorMessage="*" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>

             </td>
        </tr>

         <tr>
             <td align="right"> Type of Entry

             </td>
             <td class="auto-style1">
                 <asp:DropDownList ID="cmbEntryType" runat="server" Width="250px"></asp:DropDownList>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="cmbEntryType" ErrorMessage="*" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>

             </td>
         </tr>

          <tr>
              <td align="right"> Type of Orders

              </td>
              <td class="auto-style1">
                  <asp:DropDownList ID="cmbOrders" runat="server" Width="250px"></asp:DropDownList>

                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="cmbOrders" ErrorMessage="*" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>

              </td>
         </tr>

         <tr>
             <td align="right"> Orders Number

             </td>
             <td class="auto-style1">
                 <asp:TextBox ID="txtOrderNum" runat="server" Width="250px" MaxLength="10"></asp:TextBox>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" Font-Size="Small" ForeColor="Red" ControlToValidate="txtOrderNum"></asp:RequiredFieldValidator>

             </td>
        </tr>

         <tr>
             <td align="right"> Date of Orders

             </td>
             <td class="auto-style1">
                 <asp:TextBox ID="txtOrderDate" runat="server" Width="250px" MaxLength="10" TextMode="Date"></asp:TextBox>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtOrderDate" ErrorMessage="*" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>(mm/dd/yyyy)

                 

             </td>
        </tr>

        
         <tr>
             <td align="right"> Occurence

             </td>
             <td class="auto-style1">
                 <asp:TextBox ID="txtOccurrence" runat="server" Width="246px" MaxLength="6000"  Height="56px" TextMode="MultiLine" />
             </td>
        </tr>

         <tr>
             <td align="right"> WEF

             </td>
             <td class="auto-style1">
                 <asp:TextBox ID="txtwef" runat="server" Width="250px" MaxLength="10" TextMode="Date"></asp:TextBox>(mm/dd/yyyy)

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtwef" ErrorMessage="*" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>

             </td>
        </tr>
        <tr>
            <td align="right"> End Date

            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtEndDate" runat="server" Width="250px" MaxLength="10" TextMode="Date"></asp:TextBox>(mm/dd/yyyy)

                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtEndDate" ErrorMessage="*" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>

            </td>
        </tr>
         <tr>
             <td align="right"> Entered  By

             </td>
             <td class="auto-style1">
                 <asp:TextBox ID="txtEnterby" runat="server" Width="250px" MaxLength="20"></asp:TextBox>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtEnterby" ErrorMessage="*" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>

             </td>
         </tr>
        <tr>
            <td align="right">

            </td>
            <td align="left" class="auto-style1">
                <asp:Button ID="Save" Class="buttonclass" runat="server" Text="Update" OnClick="Save_Click" />
                &nbsp;
                 <asp:Button ID="Button1" Class="buttonclass" runat="server" Text="Back" OnClientClick="JavaScript:window.history.back(1); return false;"/></td>
        </tr>

  </table>

    </center>
</asp:Content>