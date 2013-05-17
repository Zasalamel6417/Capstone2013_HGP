<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Capstone2013_HGP.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section style="left: 2px; width: 1200px; top: 200px; text-align: justify">
        <fieldset>
            <legend>Search By:</legend>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblsearchby" runat="server">Search By:</asp:Label>
                    <asp:DropDownList ID="DropDownsb" runat="server" OnSelectedIndexChanged="DropDownsb_SelectedIndexChanged" Height="20px" Width="157px" AutoPostBack="True">
                        <asp:ListItem Value="Make A Selection">Make A Selection</asp:ListItem>
                        <asp:ListItem Value="Event Name">Event Name</asp:ListItem>
                        <asp:ListItem Value="Ticket Range">Ticket Range</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblevents" runat="server" Font-Bold="True" Text="Event Name:" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtevents" runat="server" Height="15px" Visible="False" Width="143px"></asp:TextBox>
                    <asp:Label ID="lbltickets" runat="server" Font-Bold="True" Text="Price Range:" Visible="False"></asp:Label>
                    <asp:DropDownList ID="DropDownTickets" runat="server" OnSelectedIndexChanged="DropDownTickets_SelectedIndexChanged" AutoPostBack="True" Visible="False">
                        <asp:ListItem>$1.00-$10.00</asp:ListItem>
                        <asp:ListItem>$11.00-$20.00</asp:ListItem>
                        <asp:ListItem>$21.00-$30.00</asp:ListItem>
                        <asp:ListItem>$31.00-$40.00</asp:ListItem>
                        <asp:ListItem>$41.00-$50.00</asp:ListItem>
                        <asp:ListItem>$50.00 or Above</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnsearch" runat="server" BackColor="#33CCFF" Height="32px" Text="Search" Visible="False" Width="152px" OnClick="btnsearch_Click" /><br />
                    <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>


                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="DropDownsb" />
                    <asp:AsyncPostBackTrigger ControlID="DropDownTickets" />
                </Triggers>
            </asp:UpdatePanel>
        </fieldset>
    </section>
    <section style="left: 150px; width: 1500px; top: 260px; text-align: justify">
        <asp:UpdatePanel ID="UPPGrid" runat="server">
            <ContentTemplate>
                <p></p>
                <asp:GridView ID="GridSearch" runat="server" OnSelectedIndexChanged="GridSearch_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" Width="750px" AllowPaging="True" OnPageIndexChanging="GridSearch_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField HeaderText="Buy" SelectText="Purchase" ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <br />
                <br />
                <asp:GridView ID="GridVenue" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" AutoGenerateColumns="False" DataSourceID="VenueReservation">
                    <Columns>
                        <asp:CommandField HeaderText="Reserve Seats" SelectText="Reserve" ShowSelectButton="True" />
                        <asp:BoundField DataField="name" HeaderText="Artist" SortExpression="name" />
                        <asp:BoundField DataField="Expr1" HeaderText="Event" SortExpression="Expr1" />
                        <asp:BoundField DataField="Expr2" HeaderText="Venue" SortExpression="Expr2" />
                        <asp:BoundField DataField="Expr3" HeaderText="Section" SortExpression="Expr3" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="VenueReservation" runat="server" ConnectionString="<%$ ConnectionStrings:CapstoneSQLConn %>" SelectCommand="SELECT Artist.name, Event.name AS Expr1, Venue.name AS Expr2, Section.name AS Expr3 FROM Event INNER JOIN Venue ON Event.venueID = Venue.venueID INNER JOIN Artist ON Event.artistID = Artist.artistID INNER JOIN Section ON Venue.venueID = Section.venueID"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>

    </section>

</asp:Content>
