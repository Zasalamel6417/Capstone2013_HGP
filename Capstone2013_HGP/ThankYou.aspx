<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="Capstone2013_HGP.ThankYou" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Thank you!</h1> 
    <p> Thank you for your order, <%=User.Identity.Name%>, I hope you enjoy the event for which you've purchased tickets for.
        Remember to check out the many up coming events for others you would like to attend! Take a second to review your order
        and remember we've sent the same information in an email that we have on file for your account!
    </p>
    <br />
    <asp:DetailsView ID="dvOrderInfo" runat="server" BackColor="#EFEEEF" BorderColor="#A4D4E6" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AutoGenerateRows="False" DataKeyNames="orderID" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="orderID" HeaderText="Order Number:" InsertVisible="False" ReadOnly="True" SortExpression="orderID" />
            <asp:BoundField DataField="orderDateTime" HeaderText="Order Date" SortExpression="orderDateTime" />
            <asp:BoundField DataField="EventName" HeaderText="Event Name:" SortExpression="EventName" />
            <asp:BoundField DataField="ArtistName" HeaderText="Artist:" SortExpression="ArtistName" />
            <asp:BoundField DataField="Customer" HeaderText="Customer:" ReadOnly="True" SortExpression="Customer" />
            <asp:BoundField DataField="discount" HeaderText="Discount:" NullDisplayText="None" SortExpression="discount" />
            <asp:BoundField DataField="DiscountPercent" DataFormatString="{0:p}" HeaderText="Percent Off:" NullDisplayText="0%" SortExpression="DiscountPercent" />
            <asp:BoundField DataField="quantity" HeaderText="Quantity:" SortExpression="quantity" />
            <asp:BoundField DataField="orderTotal" DataFormatString="{0:c}" HeaderText="Total:" SortExpression="orderTotal" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapstoneSQLConn %>" SelectCommand="SELECT Orders.orderID, Orders.orderDateTime, Event.name AS EventName, Artist.name AS ArtistName, Customer.firstName + ' ' + Customer.lastName AS Customer, Discounts.discount, Discounts.value AS DiscountPercent, OrderDetail.quantity, Orders.orderTotal FROM Orders INNER JOIN OrderDetail ON Orders.orderID = OrderDetail.orderID INNER JOIN Event ON OrderDetail.eventID = Event.eventID INNER JOIN Customer ON Orders.custID = Customer.custID INNER JOIN Artist ON Event.artistID = Artist.artistID INNER JOIN Discounts ON Orders.discountID = Discounts.discountID WHERE (Orders.orderDateTime = (SELECT MAX(orderDateTime) AS Expr1 FROM Orders AS Orders_1)) AND (Customer.custID = @custID)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="custID" QueryStringField="custID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button runat="server" ID="btnFinish" Text="Finish" OnClick="btnFinish_Click"/>
</asp:Content>
