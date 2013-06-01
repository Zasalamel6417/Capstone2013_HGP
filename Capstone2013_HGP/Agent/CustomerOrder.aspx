<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerOrder.aspx.cs" Inherits="Capstone2013_HGP.Agent.CustomerOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function DisplayDiv() {
            var div = document.getElementById("exist");
            var div2 = document.getElementById("newCust");
            div.style.display = 'block';
            div2.style.display = 'block';
        }

        function HideDiv() {
            var div = document.getElementById("exist");
            var div2 = document.getElementById("newCust");
            div.style.display = 'none';
            div2.style.display = 'none';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Title %></h1>
    <br />
    <br />
    <div id="Event">
        <h4>Event Information</h4>
        <asp:DetailsView ID="dvInfo" runat="server" AutoGenerateRows="False" DataKeyNames="eventID" DataSourceID="SqlDataSource1" BackColor="#EFEEEF" BorderColor="#A4D4E6" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
            <Fields>
                <asp:BoundField DataField="eventID" HeaderText="eventID" ReadOnly="True" SortExpression="eventID" />
                <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
                <asp:BoundField DataField="EventName" HeaderText="EventName" SortExpression="EventName" />
                <asp:BoundField DataField="VenueName" HeaderText="VenueName" SortExpression="VenueName" />
                <asp:BoundField DataField="VenueAddress" HeaderText="VenueAddress" SortExpression="VenueAddress" ReadOnly="True" />
                <asp:BoundField DataField="VenueCity" HeaderText="VenueCity" SortExpression="VenueCity" />
                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="VenuePhone" HeaderText="VenuePhone" SortExpression="VenuePhone" />
                <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:d}" />
                <asp:TemplateField HeaderText="StartTime" SortExpression="StartTime">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#DateTime.Parse(Eval("StartTime").ToString()).ToString("hh:mm tt")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SectionNumber" HeaderText="Section Number" SortExpression="SectionNumber" />
                <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                <asp:BoundField DataField="TicketPrice" HeaderText="TicketPrice" SortExpression="TicketPrice" DataFormatString="{0:c}" />
                <asp:BoundField DataField="TicketsAvailable" HeaderText="TicketsAvailable" SortExpression="TicketsAvailable" />
            </Fields>
            <RowStyle BackColor="#efeeef" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:Label ForeColor="Red" runat="server" ID="lblStatus" />
        <br />
        <br />
        Exisiting Customer?
                <asp:RadioButton ID="radExist" runat="server" AutoPostBack="True" />
        <div id="exist" style="display: none;" runat="server">
            <asp:Panel ID="pnlExist" runat="server">
                <br />
                Select the Customer:
            <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="ddlExisting" DataTextField="Column1" DataValueField="Column1">
            </asp:DropDownList>
                <asp:SqlDataSource ID="ddlExisting" runat="server" ConnectionString="<%$ ConnectionStrings:CapstoneSQLConn %>" SelectCommand="spGrabCustomer" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </asp:Panel>
        </div>

        <br />
        <br />
        New Customer?
                <asp:RadioButton ID="radNew" runat="server" AutoPostBack="True"/>
        <div id="newCust" style="display: none;" runat="server">
            <asp:Panel ID="pnlNew" runat="server">
                <asp:Label ID="Label2" runat="server" Text="First Name: "></asp:Label>
                <asp:TextBox ID="txtFName" runat="server" Height="16px"></asp:TextBox>
                &nbsp;<asp:Label ID="Label3" runat="server" Text="Last Name:"></asp:Label>
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Address:"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" Width="382px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Address 2nd Line:"></asp:Label>
                <asp:TextBox ID="txtAdd2" runat="server" Width="89px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="City:"></asp:Label>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                &nbsp;
            <asp:Label ID="Label7" runat="server" Text="State:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtState" runat="server" Width="39px"></asp:TextBox>
                &nbsp;
            <asp:Label ID="Label8" runat="server" Text="ZIP"></asp:Label>
                &nbsp;<asp:TextBox ID="txtZip" runat="server" Width="85px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="Email:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtEmail" runat="server" Width="284px"></asp:TextBox>
            </asp:Panel>
        </div>
        <br />
        <span style="margin-right: 10px;">Quantity to Order:</span><asp:TextBox ID="txtQty" runat="server" Columns="5" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQty" Display="Dynamic" ErrorMessage="Quantity of tickets is required." ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtQty" Display="Dynamic" ErrorMessage="Enter a number only." ForeColor="Red" ValidationExpression="^[+]?\d*$"></asp:RegularExpressionValidator>
        <br />
        <asp:Button ID="btnOrder" runat="server" Text="Order" OnClick="btnOrder_Click" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapstoneSQLConn %>" SelectCommand="SELECT * FROM [Event_View_Details] WHERE ([eventID] = @eventID) AND ([SectionNumber] = @sectionID)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="eventID" QueryStringField="EventID" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="sectionID" QueryStringField="sectionID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
