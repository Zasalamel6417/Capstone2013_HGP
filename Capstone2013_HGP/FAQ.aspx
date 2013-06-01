<%@ Page Title="FAQ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="Capstone2013_HGP.FAQ" %>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {

            //$("#headerone1").hover(function () {

            //    $("#faqContents").slideToggle("slow");

            //});

            $("#headerone1").click(function () {

                $("#faqContents").slideToggle("slow");

            });

        });

        $(document).ready(function () {

            //$("#headertwo2").hover(function () {

            //    $("#faqContents1").slideToggle("slow");

            //});

            $("#headertwo2").click(function () {

                $("#faqContents1").slideToggle("slow");

            });

        });

        $(document).ready(function () {

            $("#headerthree3").click(function () {

                $("#email").slideToggle("slow");

                $("#hidden").text("");

            });

        });

        $(document).ready(function () {

            $("#headerfour4").click(function () {

                $("#faqContents6").slideToggle("slow");



            });

        });

    </script>

    <style type="text/css">
        #faqContents
        {
            display: none;
            border: 1px solid limegreen;
            width: 700px;
            height: 300px;
            margin-top: 10px;
            padding: 1px;
            font-family: Times New Roman’, Times, serif;
            font-size: 16px;
            background-color: lightblue;
        }



        #faqContents1
        {
            display: none;
            border: 1px solid limegreen;
            width: 700px;
            height: 120px;
            margin-top: 10px;
            padding: 1px;
            font-family: Times New Roman’, Times, serif;
            font-size: 16px;
            background-color: lightpink;
        }



        #headone
        {
            border: 1px solid;
            width: 850px;
            height: 100px;
            text-align: center;
            color: blue;
            text-shadow: 1px 1px 1px black;
            border-top: 1px solid rgba(0,0,0, 0.4);
            background: rgba(0,0,0, 0.25);
            box-shadow: inset 0 1px rgba(255, 255, 255, 0.3),inset 0 10px rgba(255, 255, 255, 0.2), inset 0 10px 20px rgba(255, 255, 255, 0.25), inset 0 -15px 30px rgba(0, 0, 0, 0.3);
        }

        #headerone1, #headertwo2, #headerthree3, #headerfour4 {
            cursor: pointer;
        }

        #email
        {
            display: none;
            border: 1px solid black;
            background-color: lightblue;
            width: 500px;
            height: 230px;
        }

        #faqContents6
        {
            display: none;
            border: 1px solid limegreen;
            width: 700px;
            height: 100px;
            margin-top: 10px;
            padding: 1px;
            font-family: Times New Roman’, Times, serif;
            font-size: 16px;
            background-color: lightcyan;
        }
    </style>
    
    <hgroup class="title">
        <h1>HGP</h1>
        <h2>Frequently Asked Questions</h2>
    </hgroup>

    <div id="headerone1">

        <h3><i>How Do I purchase A Ticket?</i></h3>

    </div>

    <div id="faqContents">

        <ol>

            <li>First Step is Visit the Home-grown production Website.</li>

            <li>Login to your account if you are an existing user.</li>

            <li>The Home page will give you a glimpse of upcoming events. .</li>

            <li>Click on one of the slides corresponding to the event you would like to attend on the Home page.</li>

            <li>If The event you want does not appear on the homepage, click or Navigate to the Events Page.</li>

            <li>All events are listed on the events page.</li>

            <li>If the event you are looking for is not listed on the first page of the events page, click on page 2 at the bottom</li>

            <li>Navigate through all the pages available on the events page to locate the event you are looking for.</li>

            <li>Once you see the event you are looking for, Click on the purchase button on the left hand side.</li>

            <li>Once the "Purchase" button is clicked you'll be forewarded to the order confirmation page.</li>

            <li>Review your order and click next check out.</li>

            <li>Once the checkout is done, you will receive a confirmation email on the email you provided us.</li>

            <li>You're done!!!!!.</li>

        </ol>

    </div>

    <div id="headertwo2">

        <h3><i>How Do I Cancel a purchased ticket?</i></h3>

    </div>

    <div id="faqContents1">

        <ol>

            <li>To Cancel a purchased Ticket you can either

                <ul>

                    <li>Call Our Ticket Agent Hotline @ 615-500-HGPS

                    </li>

                    <li>Visit our Ticket Agent Location to speak to a Live Person/Agent

                    </li>

                    <li>Our Address is 4500 Homegrowns Way Nashville TN, 37207

                    </li>

                </ul>

            </li>

        </ol>

    </div>

    <div id="headerfour4">

        <h3><i>How Do I register To the Site?</i></h3>

    </div>

    <div id="faqContents6">

        <ol>

            <li>Click the following link to Register to the site.

            <ul>

                <li><a id="registerLink" runat="server" href="~/Account/Register">Register</a></li>

            </ul>

            </li>

        </ol>

    </div>

    <div id="headerthree3">

        <h3><i>Other Questions And Comments:</i></h3>

    </div>

    <div id="email">

        <asp:Label ID="lblfrom" runat="server" Text="From:"></asp:Label>

        <asp:TextBox ID="txtfrom" runat="server" Style="height: 15px"></asp:TextBox>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Please Provide a Valid Email Address" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtfrom" ForeColor="#FF3300"></asp:RegularExpressionValidator>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please Provide an Email" ControlToValidate="txtfrom" Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>

        <br />

        <asp:Label ID="lblsub" runat="server" Text="Subject:"></asp:Label>

        <asp:TextBox ID="txtsub" runat="server" Style="height: 15px"></asp:TextBox><br />

        <asp:Label ID="lblbody" runat="server" Text="Type Question or Comments below..."></asp:Label><br />

        <asp:TextBox ID="txtarea" runat="server" TextMode="MultiLine" Style="width: 280px;"></asp:TextBox><br />

        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Message Body Can not be Empty" ControlToValidate="txtarea" Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>

        <br />

        <asp:Button ID="btnsend" runat="server" Text="Send" OnClick="btnsend_Click" />









    </div>

    <div id="hidden">

        <asp:Label ID="lblmsge" runat="server" Font-Size="Large" ForeColor="#006600"></asp:Label>

    </div>

</asp:Content>
