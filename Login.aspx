<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ReportSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Script/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Script/dmsConvert.js" ></script>
   
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image ID="Image1" runat="server"  Height="361px" ImageUrl="~/Images/Langard background.jpeg" Width="100%" />
         <br />
        <br />
        <center>
        <table class="tableclass" cellspacing="0" border="0" cellpadding="1" id="ContentPlaceHolder1_MainContent_Login1" style="background-color:#0094FF;border-collapse:collapse;">
	    <tr>
	    	<td>
                 <table cellpadding="0" border="0" style="color:White;height:221px;width:532px;">
			        <tr><td></td>
				        <td align="left">Log In</td>
			        </tr>
                     <tr>
				        <td align="right"><label for="ContentPlaceHolder1_MainContent_Login1_UserName">User Name:</label></td>
                         <td>
                         <asp:TextBox ID="txtUser" runat="server" maxlength="30"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="User name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                	    </td>
                    </tr>
                     <tr>
			            <td align="right"><label for="ContentPlaceHolder1_MainContent_Login1_Password">Password:</label></td>
                        <td>
                              <asp:TextBox ID="txtPassword" Textmode="Password"  runat="server" MaxLength="30"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is missing" ForeColor="Red"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
				        <td align="center"  colspan="2">
                   
                          <asp:Label ID="loginMessage" runat="server"></asp:Label>
                        
                       </td>

                   </tr>
                   <tr>
                       <td></td>
                      <td align="left">
                          <asp:Button ID="Button1" runat="server" text="Login" class="buttonclass" OnClick="Button1_Click" style="height: 26px; margin-left: 27px" />
                        
                        
               
				        </td>
			      </tr>
		       </table>
	     </td>
	 </tr>
</table>
        </center>
    </form>
</body>
</html>
