<%@ Page Title="Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpressCheckoutSuccess.aspx.cs" Inherits="Capstone2013_HGP.ExpressCheckoutSuccess" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1><%: Title %></h1>
        <h2>Confirm</h2>
    </hgroup>
    
    <section>
        <header>
            <h3>Complete Your Order</h3>
        </header>
        <p>
            <asp:Label runat="server" Text="" ID="lblMessage"></asp:Label>
        </p>
        <asp:Button ID="finishTransactionButton" runat="server"
            Text="Finish transaction!" onclick="finishTransactionButton_Click" />
    </section>
</asp:Content>
