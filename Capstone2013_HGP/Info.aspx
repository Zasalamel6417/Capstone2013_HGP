<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="Capstone2013_HGP.Info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lble" runat="server" Text="Event Name:" Font-Bold="True" Font-Italic="True"></asp:Label>
    <asp:TextBox ID="Tevent" runat="server" Width="140px"></asp:TextBox>
    <asp:Label ID="lblart" runat="server" Text="Artist:" Font-Bold="True" Font-Italic="True"></asp:Label>
    <asp:TextBox ID="Tartist" runat="server"></asp:TextBox>
    <asp:Label ID="lbld" runat="server" Text="Event Date:" Font-Bold="True" Font-Italic="True"></asp:Label>
    <asp:TextBox ID="Tdate" runat="server"></asp:TextBox><br />
    <asp:Label ID="lblt" runat="server" Text="Event Time:" Font-Bold="True" Font-Italic="True"></asp:Label>
    <asp:TextBox ID="Ttime" runat="server"></asp:TextBox>
    <asp:Label ID="lblv" runat="server" Text="Event Venue:" Font-Bold="True" Font-Italic="True"></asp:Label>
    <asp:TextBox ID="Tvenue" runat="server"></asp:TextBox>
    <asp:Label ID="lbls" runat="server" Text="Section:" Font-Bold="True" Font-Italic="True"></asp:Label>
    <asp:TextBox ID="Tsection" runat="server"></asp:TextBox><br />
    <asp:Label ID="lblp" runat="server" Text="Price Per Ticket:" Font-Bold="True" Font-Italic="True"></asp:Label>
    <asp:TextBox ID="Tprice" runat="server"></asp:TextBox><br />
    <asp:Label ID="uname" runat="server" Text="User ID:" Font-Bold="True" Font-Italic="True"></asp:Label>
    <asp:TextBox ID="Tuname" runat="server"></asp:TextBox><br />
  
    
   
</asp:Content>

