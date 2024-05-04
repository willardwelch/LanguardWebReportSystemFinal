<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportSystem.Index" MasterPageFile="Master.Master" EnableSessionState="False" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <link rel="stylesheet" href="script/main.css" type="text/css" />
     
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="Lib/animate/animate.min.css" rel="stylesheet">
               
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:DropDownList ID="cmbTxttRight" runat="server" Visible="False">
    </asp:DropDownList>
    
    <asp:DropDownList ID="cmbtxtBrigade" runat="server" Visible="False">
    </asp:DropDownList>
    <asp:DropDownList ID="cmbtxtUnit" runat="server" Visible="False">
    </asp:DropDownList>
    <asp:DropDownList ID="txtcmbCoy" runat="server" Visible="False">
    </asp:DropDownList>
     <!-- Carousel Start -->
    <br /><br />
    <div class="container-fluid p-0 mb-5">
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
               
                  <div class="carousel-inner">
                        <div class="carousel-item active">
                              <h1 class="display-1 text-white mb-md-4 animated zoomIn">Welcome to Languard Security Services Ltd</h1>
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                        <div class="p-3" style="max-width: 900px;">
                                            <h4 class="text-white text-uppercase animated bounceInDown">Best Security Services</h4>
                                         </div>
                                </div>
                                <img backgroundcolor="blue" src="Images/carousel-1.jpg" alt="Image" height="500px" width="100%">
                            
                         </div>
                    </div>
            </div>
      </div>
</asp:Content>