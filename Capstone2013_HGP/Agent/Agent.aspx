<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agent.aspx.cs" Inherits="Capstone2013_HGP.Agent.Agent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <h1><%: Title %></h1>
    <br />
    <br />
                    <asp:Label ID="lblsearchby" runat="server">Search By:</asp:Label>
                    <asp:DropDownList ID="DropDownsb" runat="server" OnSelectedIndexChanged="DropDownsb_SelectedIndexChanged" Height="20px" Width="157px" AutoPostBack="True">
                        <asp:ListItem Value="Make A Selection">Make A Selection</asp:ListItem>
                        <asp:ListItem Value="Event Name">Event Name</asp:ListItem>
                        <asp:ListItem Value="Ticket Range">Ticket Range</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblevents" runat="server" Font-Bold="True" Text="Event Name:" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtEvents" runat="server" Height="15px" Visible="False" Width="143px"></asp:TextBox>
                    <asp:Label ID="lbltickets" runat="server" Font-Bold="True" Text="Price Range:" Visible="False"></asp:Label>
                    <asp:DropDownList ID="DropDownTickets" runat="server" OnSelectedIndexChanged="DropDownTickets_SelectedIndexChanged" AutoPostBack="True" Visible="False">
                        <asp:ListItem>Select a Price Range</asp:ListItem>
                        <asp:ListItem>$1.00-$10.00</asp:ListItem>
                        <asp:ListItem>$11.00-$20.00</asp:ListItem>
                        <asp:ListItem>$21.00-$30.00</asp:ListItem>
                        <asp:ListItem>$31.00-$40.00</asp:ListItem>
                        <asp:ListItem>$41.00-$50.00</asp:ListItem>
                        <asp:ListItem>$50.00 or Above</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnsearch" runat="server" BackColor="#33CCFF" Height="32px" Text="Search" Visible="False" Width="152px" OnClick="btnsearch_Click" /><br />
                    <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
    <asp:GridView ID="gvEvents" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanged="gvEvents_PageIndexChanged" OnRowCommand="gvEvents_RowCommand" DataKeyNames="eventID">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="Purchase" ShowSelectButton="True" />
            <asp:BoundField DataField="eventID" HeaderText="Event Number" SortExpression="eventID" ReadOnly="True" />
            <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
            <asp:BoundField DataField="EventName" HeaderText="Event Name" SortExpression="EventName" />
            <asp:BoundField DataField="VenueName" HeaderText="Venue Name" SortExpression="VenueName" />
            <asp:BoundField DataField="VenueAddress" HeaderText="Venue Address" ReadOnly="True" SortExpression="VenueAddress" />
            <asp:BoundField DataField="VenueCity" HeaderText="Venue City" SortExpression="VenueCity" />
            <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" SortExpression="ZipCode" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="SectionNumber" HeaderText="Section Number" SortExpression="SectionNumber" />
            <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
            <asp:BoundField DataField="TicketPrice" HeaderText="Ticket Price" SortExpression="TicketPrice" DataFormatString="{0:c}" />
            <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString="{0:d}" />
            <asp:TemplateField HeaderText="StartTime" SortExpression="Start Time">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapstoneSQLConn %>" SelectCommand="SELECT * FROM [Event_View]"></asp:SqlDataSource>
</asp:Content>


