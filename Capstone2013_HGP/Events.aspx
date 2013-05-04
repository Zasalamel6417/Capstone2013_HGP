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
    <article>
        <section style="position: relative; right: -65px; top: -7px; width: 877px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Search By:"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="20px" Width="157px" AutoPostBack="True">
                        <asp:ListItem Value="Make A Selection">Make A Selection</asp:ListItem>
                        <asp:ListItem Value="Event Name">Event Name</asp:ListItem>
                        <asp:ListItem Value="Ticket Range">Ticket Range</asp:ListItem>
                    </asp:DropDownList>

                    &nbsp;
                    <asp:Label ID="lblevents" runat="server" Font-Bold="True" Text="Event Name:" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtevents" runat="server" Height="15px" Visible="False" Width="143px"></asp:TextBox>
&nbsp;<asp:Label ID="lbltickets" runat="server" Font-Bold="True" Text="Price Range:" Visible="False"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownTickets" runat="server" Visible="False">
                        <asp:ListItem>$1.00-$10.00</asp:ListItem>
                        <asp:ListItem>$11.00-$20.00</asp:ListItem>
                        <asp:ListItem>$21.00-$30.00</asp:ListItem>
                        <asp:ListItem>$31.00-$40.00</asp:ListItem>
                        <asp:ListItem>$41.00-$50.00</asp:ListItem>
                        <asp:ListItem>$50.00 or Above</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnsearch" runat="server" BackColor="#33CCFF" Height="31px" Text="Search" Visible="False" Width="125px" />
                    <br />

                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="DropDownList1" />
                </Triggers>
            </asp:UpdatePanel>
        </section>
      
 </article>

</asp:Content>
