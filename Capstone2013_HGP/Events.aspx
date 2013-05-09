<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Capstone2013_HGP.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section style="position: absolute; right: 2px; width: 780px; top: 200px; text-align: justify">
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
                    <asp:DropDownList ID="DropDownTickets" runat="server" Visible="False">
                        <asp:ListItem>$1.00-$10.00</asp:ListItem>
                        <asp:ListItem>$11.00-$20.00</asp:ListItem>
                        <asp:ListItem>$21.00-$30.00</asp:ListItem>
                        <asp:ListItem>$31.00-$40.00</asp:ListItem>
                        <asp:ListItem>$41.00-$50.00</asp:ListItem>
                        <asp:ListItem>$50.00 or Above</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnsearch" runat="server" BackColor="#33CCFF" Height="31px" Text="Search" Visible="False" Width="125px" OnClick="btnsearch_Click" /><br />
                    <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="DropDownsb" />
                </Triggers>
            </asp:UpdatePanel>
        </fieldset>
    </section>
    <section style="position: absolute; left: 50px; width: 850px; top: 260px; text-align: justify">
        <asp:UpdatePanel ID="UPPGrid" runat="server">
            <ContentTemplate>

                <asp:GridView ID="GridSearch" runat="server" OnSelectedIndexChanged="GridSearch_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ButtonField ButtonType="Button" CommandName="Edit" HeaderText="Buy" ShowHeader="True" Text="Purchase" />
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

                </section>
            </ContentTemplate>
        </asp:UpdatePanel>

    </section>
</asp:Content>
