<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Capstone2013_HGP.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
        <h2> Home Grown Productions</h2>
    </hgroup>

    <article>
        <p>        
            Use this area to provide additional information.
        </p>

        <p>        
            Use this area to provide additional information.
        </p>

        <p>        
            Use this area to provide additional information.
        </p>
    </article>

    <aside>
        <h3>How it Works</h3>
        
        <ol class="round">
            <li class="one">
                <h5>Find a Show</h5>
                Search our listings for hot shows, concerts, and events.
            </li>
            <li class="two">
                <h5>Choose Your Seats</h5>
                Found the best seats in the house? Reserve them right here before they fill up!
            </li>
            <li class="three">
                <h5>Go</h5>
                You can have your tickets mailed to you, or pick them up at the box office. Either way, you get in the door.
            </li>
        </ol>
    </aside>
</asp:Content>