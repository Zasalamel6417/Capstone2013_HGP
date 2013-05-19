<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Capstone2013_HGP.Order1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        function DisplayDiv() {
            var div = document.getElementById("CCInfo");

            div.style.display = 'block';
        }

        function HideDiv() {
            var div = document.getElementById("CCInfo");

            div.style.display = 'none';
        }
    </script>
    <style type="text/css">
        <!--
        DIV.container {
            margin: auto;
            width: 90%;
            margin-bottom: 10px;
        }

        TEXTAREA {
            width: 80%;
        }

        FIELDSET {
            border: 1px solid #a4d4e6;
            padding: 1em;
            margin: 0;
        }

        LEGEND {
            color: #ccc;
            font-size: 120%;
        }

        INPUT, TEXTAREA {
            font-family: Arial, verdana;
            font-size: 125%;
            padding: 7px;
            border: 1px solid #a4d4e6;
        }

        LABEL {
            display: block;
            margin-top: 10px;
        }

        IMG {
            margin: 5px;
        }

        UL.tabNavigation {
            list-style: none;
            margin: 0;
            padding: 0;
        }

            UL.tabNavigation LI {
                display: inline;
            }

                UL.tabNavigation LI A {
                    padding: 3px 5px;
                    background-color: #ccc;
                    color: #000;
                    text-decoration: none;
                }

                    UL.tabNavigation LI A.selected,
                    UL.tabNavigation LI A:hover {
                        background-color: #a4d4e6;
                        color: #000;
                        padding-top: 7px;
                        cursor: pointer;
                    }

                    UL.tabNavigation LI A:focus {
                        outline: 0;
                    }

        div.tabs > div {
            padding: 5px;
            margin-top: 3px;
            border: 2px solid #a4d4e6;
        }

            div.tabs > div h2 {
                margin-top: 0;
            }

        #first {
            background-color: #f00;
        }

        #second {
            background-color: #0f0;
        }

        #third {
            background-color: #00f;
        }

        .waste {
            min-height: 1000px;
        }

        a:hover {
            cursor: pointer;
        }
        -->
    </style>
    <div id="Order">
        <asp:SqlDataSource runat="server" ID="sqlDataSource" ConnectionString="<%$ ConnectionStrings:CapstoneSQLConn %>" SelectCommand="spGetOrderReady" SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="Quantity" QueryStringField="Qty" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="EventID" QueryStringField="EventID" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="sectionID" QueryStringField="sectionID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <hgroup class="title">
        <h1><%: Title %></h1>
        <h2>Review</h2>
    </hgroup>
    <h3>Your Ticket Reservation</h3>
        <asp:DetailsView Visible="False" ID="dvOrderInfo" runat="server" BackColor="#EFEEEF" BorderColor="#A4D4E6" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AutoGenerateRows="False" DataKeyNames="eventID" DataSourceID="sqlDataSource">
            
            <Fields>
                <asp:BoundField DataField="eventID" HeaderText="eventID" InsertVisible="False" ReadOnly="True" SortExpression="eventID" />
                <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
                <asp:BoundField DataField="EventName" HeaderText="EventName" SortExpression="EventName" />
                <asp:BoundField DataField="VenueName" HeaderText="VenueName" SortExpression="VenueName" />
                <asp:BoundField DataField="VenueAddress" HeaderText="VenueAddress" ReadOnly="True" SortExpression="VenueAddress" />
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
                <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                <asp:BoundField DataField="TicketPrice" HeaderText="TicketPrice" SortExpression="TicketPrice" DataFormatString="{0:c}" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True" SortExpression="Quantity" />
                <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" ReadOnly="True" SortExpression="TotalCost" DataFormatString="{0:c}" />
                <asp:TemplateField HeaderText="Tax">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblTax" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sub Total">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblSubTotal" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            
            <RowStyle BackColor="#efeeef" ForeColor="#000" />
        </asp:DetailsView>
        
        <section>
            <span>Email:</span><asp:TextBox runat="server" ID="txtEmail" />
        <table>
            <thead>
                <tr>
                    <th>Event</th>
                    <th>QTY</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><asp:TextBox runat="server" ID="txtDetailEvent" Enabled="false" /></td>
                    <td><asp:TextBox runat="server" ID="txtDetailQty" Enabled="false" /></td>
                    <td><asp:TextBox runat="server" ID="txtDetailPrice" Enabled="false" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <th>Tax:</th>
                    <td><asp:TextBox runat="server" ID="txtDetailTax" Enabled="false" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <th>Subtotal:</th>
                    <td><asp:TextBox runat="server" ID="txtDetailSubTotal" Enabled="false" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <th>Discount:</th>
                    <td><asp:DropDownList runat="server" ID="ddlDiscount" OnSelectedIndexChanged="ddlDiscount_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem>None</asp:ListItem>
                        <asp:ListItem Value="3">Senior -- 10% Discount(Requires Verification On Arrival)</asp:ListItem>
                        <asp:ListItem Value="2">Student -- 10% Discount(Requires Verification On Arrival)</asp:ListItem>
                        <asp:ListItem Value="1">Become a Member -- 15% Discount(Adds $5 to purchase)</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <th>Total:</th>
                    <td><asp:TextBox runat="server" ID="txtDetailTotal" Enabled="false" /></td>
                </tr>
            </tbody>
        </table>
            <div>
                <asp:CheckBox runat="server" ID="cbMail" /><asp:Label runat="server" ID="lblMail" Text="  Check here if you would like the the tickes mailed to you."></asp:Label>
            </div>
            <h3>Payment</h3>
            <hr />
        <div>
            <div>
                <asp:RadioButton runat="server" ID="radPaypal" GroupName="payoptions" TextAlign="Right" AutoPostBack="true" />
                <span>
                    <img alt='ExpressCheckout with PayPal' src='https://www.paypal.com/en_US/i/logo/PayPal_mark_37x23.gif' />
                </span>
            </div>
            <div>
                <asp:RadioButton runat="server" ID="radCredit" GroupName="payoptions" AutoPostBack="true" />
                <span>Credit / Debit Card</span>
            </div>
        </div>
            <asp:Label runat="server" ID="lblStatus" />
        <div id="CCInfo" style="display:none;" runat="server">
            <table>
                <tr>
                    <td><span>Card Number:</span></td>
                    <td><asp:TextBox runat="server" ID="txtCCNumber" Columns="35" ValidationGroup="Val" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCCNumber" ErrorMessage="*Enter Valid Card Number" ForeColor="#FF3300" ValidationExpression="(^(4|5)\d{3}-?\d{4}-?\d{4}-?\d{4}|(4|5)\d{15})|(^(6011)-?\d{4}-?\d{4}-?\d{4}|(6011)-?\d{12})|(^((3\d{3}))-\d{6}-\d{5}|^((3\d{14})))" ValidationGroup="Val"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><span>Security Code:</span></td>
                    <td><asp:TextBox runat="server" ID="txtSecCode" Columns="5" MaxLength="3" /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtSecCode" Display="Dynamic" ErrorMessage="*Numbers Only" ForeColor="Red" ValidationExpression="^[+]?\d*$" ValidationGroup="Val"></asp:RegularExpressionValidator>
                        <span style="margin-left:10px; margin-right:1px;">Expiration Date:</span><asp:TextBox runat="server" ID="txtExpDate" Columns="6" MaxLength="5" /><span>(MM/YY)<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtExpDate" ErrorMessage="*Date in Wrong Format" ForeColor="Red" ValidationExpression="^((0[1-9])|(1[0-2]))\/(\d{2})$" ValidationGroup="Val"></asp:RegularExpressionValidator>
                        </span></td>
                </tr>
                <tr>
                    <td><span>Name on Card:</span></td>
                    <td><asp:TextBox runat="server" ID="txtNameOnCard" Columns="35" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtNameOnCard" Display="Dynamic" ErrorMessage="*Name Cannot Contain Numbers" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="UserInfoVal"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Button runat="server" ID="btnPay" Text="Continue" OnClick="btnPay_Click" ValidationGroup="Val" />
    </section>
    </div>

</asp:Content>
