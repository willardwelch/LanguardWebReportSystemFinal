<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditEmployeeInfo.aspx.cs" Inherits="ReportSystem.EditEmployeeInfo" MasterPageFile="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <link rel="stylesheet" href="Script/main.css" type="text/css" />
               
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br /> <center>
              <table>
                  <tr>
                      <td>
                           <nav class="navbar navbar-expand-lg bg-red navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        
                                  <h4 class="heading" >Edit Employee</h4>
                            </nav>
                 
                  
                      </td>
                  </tr>
              </table>
           </center>

    <center>
    <table border="1" celspacing="2" cellpadding="2" bordercolor="blue">
          <tr>
            <td align="right">First Name:</td>
            <td><asp:TextBox ID="txtFirstName" Width="250px" runat="server" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is required" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">Last Name:</td>
            <td><asp:TextBox ID="txtLastName" Width="250px" runat="server" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is required" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>

       
         <tr>
             <td align="right">Date of Birth:</td>
             <td>
                 <asp:TextBox ID="dob" runat="server" Width="250px" MaxLength="18" TextMode="SingleLine"> </asp:TextBox><asp:Label ID="Label2" runat="server" Text="(mm/dd/yyyy)"></asp:Label>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="dob" ErrorMessage="Date of birth is missing" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>
              </td>
         </tr>

          <tr>
              <td align="right">Marital Status:</td>
              <td>
                  <asp:DropDownList ID="MStatus" runat="server" Width="250px">
                      <asp:ListItem></asp:ListItem>
                      <asp:ListItem>Married</asp:ListItem>
                      <asp:ListItem>Single</asp:ListItem>
                      <asp:ListItem>Divorce</asp:ListItem>
                      <asp:ListItem>Widow</asp:ListItem>
                  </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Marital Status is required" ControlToValidate="MStatus" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>
              </td>
         </tr>

          <tr>
              <td align="right">Gender:</td>
              <td>
                  <asp:DropDownList ID="gender" runat="server" Width="250px">
                      <asp:ListItem></asp:ListItem>
                      <asp:ListItem>Male</asp:ListItem>
                      <asp:ListItem>Female</asp:ListItem>
                  </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="gender" ErrorMessage="Gender is required" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>
              </td>
         </tr>

       

         <tr>
             <td align="right">Address:</td>
             <td>

                 <asp:TextBox ID="txtAddress" Width="250px" runat="server" MaxLength="500"  Height="48px" TextMode="MultiLine">

                 </asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" Font-Size="Small" ForeColor="#CC0000">

                 </asp:RequiredFieldValidator>
              </td>
         </tr>

         <tr>
             <td align="right">Parish:</td>
             <td>
                 <asp:DropDownList ID="cmbParish" runat="server" Width="250px">
                     <asp:ListItem></asp:ListItem>
                     <asp:ListItem>Kingston</asp:ListItem>
                     <asp:ListItem>St Andrew</asp:ListItem>
                     <asp:ListItem>Portland</asp:ListItem>
                     <asp:ListItem>St Thomas</asp:ListItem>
                     <asp:ListItem>St Catherine</asp:ListItem>
                     <asp:ListItem>St Ann</asp:ListItem>
                     <asp:ListItem>St Mary</asp:ListItem>
                     <asp:ListItem>Manchester</asp:ListItem>
                     <asp:ListItem>Clarendon</asp:ListItem>
                     <asp:ListItem>Hanvover</asp:ListItem>
                     <asp:ListItem>Westmoreland</asp:ListItem>
                     <asp:ListItem>St James</asp:ListItem>
                     <asp:ListItem>Trelawny</asp:ListItem>
                     <asp:ListItem>St Elizabeth</asp:ListItem>
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="cmbParish" ErrorMessage="Parish is required" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>
             </td>
        </tr>

         <tr>
             <td align="right">Date of Enlistment:</td>
             <td>
                 <asp:TextBox ID="doe" Width="250px" runat="server" MaxLength="15" TextMode="SingleLine"></asp:Textbox>
                 <asp:Label ID="Label3"  runat="server" Text="(mm/dd/yyyy)"></asp:Label>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="doe" ErrorMessage="Enlistmnet date is missing" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>
              </td>
         </tr>

        <tr>
    <td align="right">Run out Date:</td>
    <td>
        <asp:TextBox ID="txtRod" Width="250px" runat="server" MaxLength="15" TextMode="SingleLine"></asp:Textbox>
        <asp:Label ID="Label4" runat="server" Text="(mm/dd/yyyy)"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtRod" ErrorMessage="run out date is missing" Font-Size="Small" ForeColor="#CC0000"></asp:RequiredFieldValidator>
     </td>
</tr>

            <tr>
              <td align="right"></td> 
              <td align="left"><asp:Button Class="buttonclass" ID="Button1" runat="server" width="65px" Text="Update" OnClick="Button1_Click" />
                  <asp:Button ID="Button2" Class="buttonclass" runat="server" width="65px" Text="Cancel" /> </td>
          </tr>
    </table>
        </center>
</asp:Content>