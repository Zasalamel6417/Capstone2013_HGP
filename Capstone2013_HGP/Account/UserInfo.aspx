<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="Capstone2013_HGP.Account.UserInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
   
    <script type="text/javascript">
        function DisplayDiv() {
            var div = document.getElementById("CCInfo");

            if (div.style.display == 'block') {
                div.style.display = 'none';
            }
            else {
                div.style.display = 'block';
            }
        }
    </script>
    <section>
    <asp:ValidationSummary runat="server" ValidationGroup="UserInfoVal" ID="usrInfoValGrp" ForeColor="Red" HeaderText="Required Fields:" />
        <asp:label runat="server" ID="lblCardValid" Visible="false" />
        <header>
            <h1>User Information:</h1>
        </header>
            <table>
                <tr>
                    <td><span>Email:</span></td>
                    <td><asp:TextBox runat="server" Enabled="false" ID="txtEmail" /></td>
                </tr>
                <tr>
                    <td><span>First Name:</span></td>
                    <td><asp:TextBox runat="server" ID="txtFirstName" ValidationGroup="UserInfoVal" />
                        <asp:RequiredFieldValidator ID="reqFNameVal" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="First Name is recquired" ForeColor="Red" ValidationGroup="UserInfoVal">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="First Name cannot contain numbers." ForeColor="Red" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="UserInfoVal">*</asp:RegularExpressionValidator>
                    </td>
                    <td><span>Last Name:</span></td>
                    <td><asp:TextBox runat="server" ID="txtLastName" ValidationGroup="UserInfoVal" />
                        <asp:RequiredFieldValidator ID="reqLNameVal" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Last Name is recquired" ForeColor="Red" ValidationGroup="UserInfoVal">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Last Name cannot contain numbers." ForeColor="Red" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="UserInfoVal">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><span>Age:</span></td>
                    <td><asp:TextBox runat="server" ID="txtAge" Columns="3" MaxLength="3" ValidationGroup="UserInfoVal" />
                        <asp:RequiredFieldValidator ID="reqAgeVal" runat="server" ControlToValidate="txtAge" Display="Dynamic" ErrorMessage="Please enter you age." ForeColor="Red" ValidationGroup="UserInfoVal">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtAge" Display="Dynamic" ErrorMessage="Age can take only numbers." ForeColor="Red" ValidationExpression="^[+]?\d*$" ValidationGroup="UserInfoVal">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><h5>Mailing Address</h5></td>
                </tr>
                <tr>
                    <td><span>Address:</span></td>
                    <td><asp:TextBox runat="server" ID="txtAddress1" ValidationGroup="UserInfoVal" />
                        <asp:RequiredFieldValidator ID="reqAddress1Val" runat="server" ControlToValidate="txtAddress1" ErrorMessage="Address is recquired" ForeColor="Red" ValidationGroup="UserInfoVal">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><span>Address 2:</span></td>
                    <td><asp:TextBox runat="server" ID="txtAddress2" /></td>
                </tr>
                <tr>
                    <td><span>City:</span></td>
                    <td><asp:TextBox runat="server" ID="txtCity" ValidationGroup="UserInfoVal" />
                        <asp:RequiredFieldValidator ID="reqLNameVal2" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="City is recquired" ForeColor="Red" ValidationGroup="UserInfoVal">*</asp:RequiredFieldValidator>
                    </td>
                    <td><span>State:</span></td>
                    <td><asp:TextBox runat="server" ID="txtState" Columns="2" MaxLength="2" ValidationGroup="UserInfoVal" />
                        <asp:RequiredFieldValidator ID="reqLNameVal3" runat="server" ControlToValidate="txtState" Display="Dynamic" ErrorMessage="Last Name is recquired" ForeColor="Red" ValidationGroup="UserInfoVal">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtState" Display="Dynamic" ErrorMessage="State is not recognized." ForeColor="Red" ValidationExpression="^((AL)|(AK)|(AS)|(AZ)|(AR)|(CA)|(CO)|(CT)|(DE)|(DC)|(FM)|(FL)|(GA)|(GU)|(HI)|(ID)|(IL)|(IN)|(IA)|(KS)|(KY)|(LA)|(ME)|(MH)|(MD)|(MA)|(MI)|(MN)|(MS)|(MO)|(MT)|(NE)|(NV)|(NH)|(NJ)|(NM)|(NY)|(NC)|(ND)|(MP)|(OH)|(OK)|(OR)|(PW)|(PA)|(PR)|(RI)|(SC)|(SD)|(TN)|(TX)|(UT)|(VT)|(VI)|(VA)|(WA)|(WV)|(WI)|(WY))$" ValidationGroup="UserInfoVal">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><span>Zip Code:</span></td>
                    <td><asp:TextBox runat="server" ID="txtZipcode" Columns="5" MaxLength="5" ValidationGroup="UserInfoVal" />
                        <asp:RequiredFieldValidator ID="reqLNameVal4" runat="server" ControlToValidate="txtState" Display="Dynamic" ErrorMessage="Zip Code is recquired" ForeColor="Red" ValidationGroup="UserInfoVal">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtZipcode" Display="Dynamic" ErrorMessage="Please enter valid Zip Code." ForeColor="Red" ValidationExpression="\d{5}(-\d{4})?" ValidationGroup="UserInfoVal">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <asp:CheckBox runat="server" ID="cbNewsletter" /> <span>Would you like to receive a newsletter?</span>
            <br />
            <asp:CheckBox runat="server" ID="cbMember" /> <span>Become a Member for only $5!?</span>
            <div id="CCInfo" style="display:none;">
            <table>
                <tr>
                    <td><span>Card Number:</span></td>
                    <td><asp:TextBox runat="server" ID="txtCCNumber" Columns="35" ValidationGroup="UserInfoVal" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCCNumber" ErrorMessage="*Enter Valid Card Number" ForeColor="#FF3300" ValidationExpression="(^(4|5)\d{3}-?\d{4}-?\d{4}-?\d{4}|(4|5)\d{15})|(^(6011)-?\d{4}-?\d{4}-?\d{4}|(6011)-?\d{12})|(^((3\d{3}))-\d{6}-\d{5}|^((3\d{14})))" ValidationGroup="UserInfoVal"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><span>Security Code:</span></td>
                    <td><asp:TextBox runat="server" ID="txtSecCode" Columns="5" MaxLength="3" /><span style="margin-left:10px; margin-right:1px;">Expiration Date:</span><asp:TextBox runat="server" ID="txtExpDate" Columns="6" MaxLength="5" /><span>(MM/YY)</span></td>
                </tr>
                <tr>
                    <td><span>Name on Card:</span></td>
                    <td><asp:TextBox runat="server" ID="txtNameOnCard" Columns="35" /></td>
                </tr>
            </table>
        </div>
        <br />
        <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" Text="Save" ValidationGroup="UserInfoVal" />
     </section>
</asp:Content>
