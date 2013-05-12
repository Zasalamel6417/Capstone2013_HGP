<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="Capstone2013_HGP.Event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="gvEvents" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanged="gvEvents_PageIndexChanged" OnRowCommand="gvEvents_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="Purchase" ShowSelectButton="True" />
            <asp:BoundField DataField="EventId" HeaderText="Event Number" SortExpression="EventNumber" />
            <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
            <asp:BoundField DataField="EventName" HeaderText="Event Name" SortExpression="EventName" />
            <asp:BoundField DataField="VenueName" HeaderText="Venue Name" SortExpression="VenueName" />
            <asp:BoundField DataField="VenueAddress" HeaderText="Venue Address" ReadOnly="True" SortExpression="VenueAddress" />
            <asp:BoundField DataField="VenueCity" HeaderText="Venue City" SortExpression="VenueCity" />
            <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" SortExpression="ZipCode" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString="{0:d}" />
            <asp:TemplateField HeaderText="Start Time" SortExpression="StartTime">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#DateTime.Parse(Eval("StartTime").ToString()).ToString("hh:mm tt")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#a4d4e6" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#a4d4e6" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#a4d4e6" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:Label ID="lblTest" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapstoneSQLConn %>" SelectCommand="SELECT * FROM [Event_View]"></asp:SqlDataSource>
</asp:Content>
