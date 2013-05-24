<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Capstone2013_HGP.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
        <h2>Home Grown Productions</h2>
    </hgroup>

    <article>
        <p>        
            Home Grown Productions is a company based around the needs and desires of the customer. HGP brings the artists you want to the cities you want.
            Their focus is to make our customers as happy as possible, representing the artists with respect, and keeping the venues safe and secure. HGP was founded because we were tired of seeing
            people constantly having to plan long road trips to see the artist they love to support. 
        </p>

        <p>        
            Please refer to the contact page if you have any questions regarding Home Grown Productions or any event that is listed.
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