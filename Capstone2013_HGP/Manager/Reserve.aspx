<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="Capstone2013_HGP.Manager.Reserve" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DetailsView ID="dvReservationInfo" runat="server" AutoGenerateRows="False" DataSourceID="dv_Reserve" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="eventID" HeaderText="eventID" SortExpression="eventID" />
            <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
            <asp:BoundField DataField="EventName" HeaderText="EventName" SortExpression="EventName" />
            <asp:BoundField DataField="VenueName" HeaderText="VenueName" SortExpression="VenueName" />
            <asp:BoundField DataField="SectionNumber" HeaderText="SectionNumber" SortExpression="SectionNumber" />
            <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
            <asp:BoundField DataField="TicketPrice" HeaderText="TicketPrice" SortExpression="TicketPrice" />
            <asp:BoundField DataField="TicketsAvailable" HeaderText="TicketsAvailable" ReadOnly="True" SortExpression="TicketsAvailable" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="dv_Reserve" runat="server" ConnectionString="<%$ ConnectionStrings:CapstoneSQLConn %>" SelectCommand="SELECT * FROM [Reserve_Details] WHERE ([eventID] = @eventID) AND ([SectionNumber] = @sectionID)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="eventID" QueryStringField="EventID" Type="Int32" />
            <asp:QueryStringParameter Name="sectionID" QueryStringField="SectionID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ForeColor="Red" runat="server" ID="lblStatus" />
    <br />
    <span style="margin-right: 10px;">Quantity to Reserve:</span><asp:TextBox ID="txtQty" runat="server" Columns="5" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQty" Display="Dynamic" ErrorMessage="Quantity of tickets is required." ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtQty" Display="Dynamic" ErrorMessage="Enter a number only." ForeColor="Red" ValidationExpression="^[+]?\d*$"></asp:RegularExpressionValidator>
    <br />
    <asp:Button ID="btnReserve" runat="server" Text="Reserve" OnClick="btnReserve_Click" />
</asp:Content>
