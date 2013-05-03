 <%@ Page Title="Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Capstone2013_HGP.Order" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1><%: Title %></h1>
        <h2> Review</h2>
    </hgroup>
    
    <section>
        <header>
            <h3>Your Ticket Reservation</h3>
        </header>
        <table>
            <thead>
                <th>Event</th>
                <th>QTY</th>
                <th>Price</th>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <th>Discount:</th>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <th>Tax:</th>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <th>Subtotal:</th>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <th>Total:</th>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div>
            <input type="radio" name="paytype" required="required" value="paypal"/>
            <img alt="ExpressCheckout with PayPal" src="https://www.paypal.com/en_US/i/logo/PayPal_mark_37x23.gif" /><br/>
            <input type="radio" name="paytype" required="required" value="creditcard"/>Credit / Debit Card
        </div>
        <button type="submit" name="sendOrder">Continue</button>
    </section>
</asp:Content>
