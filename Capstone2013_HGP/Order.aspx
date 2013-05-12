<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Capstone2013_HGP.Order1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(function () {
            var tabContainers = $('div.tabs > div');
            tabContainers.hide().filter(':first').show();

            $('div.tabs ul.tabNavigation a').click(function () {
                tabContainers.hide();
                tabContainers.filter(this.hash).show();
                $('div.tabs ul.tabNavigation a').removeClass('selected');
                $(this).addClass('selected');
                return false;
            }).filter(':first').click();
        });

        function OrderClick() {
            var link = document.getElementById("order");

            link.click();
        }

    </script>
    <style type="text/css">
        <!--
		DIV.container { margin: auto; width: 90%; margin-bottom: 10px;}
		TEXTAREA { width: 80%;}
		FIELDSET { border: 1px solid #a4d4e6; padding: 1em; margin: 0; }
		LEGEND { color: #ccc; font-size: 120%; }
		INPUT, TEXTAREA { font-family: Arial, verdana; font-size: 125%; padding: 7px; border: 1px solid #a4d4e6; }
		LABEL { display: block; margin-top: 10px; } 
		IMG { margin: 5px; }

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
            cursor:pointer;
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
            cursor:pointer;
        }
    -->
    
    </style>
    <div class="tabs">
  <!-- tabs -->
  <ul class="tabNavigation">
    <li><a id="event" href="#Event">Event Details</a></li>
    <li><a id="order"href="#Order">Order Details</a></li>
    <li><a id="confirm" href="#Confirm">Confirm Order</a></li>
  </ul>
  <!-- tab containers -->
  <div id="Event">
      <h4>Event Information</h4>
    <asp:DetailsView ID="dvInfo" runat="server" AutoGenerateRows="False" DataKeyNames="eventID" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="eventId" HeaderText="Event Number" ReadOnly="True" SortExpression="eventID" />
            <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
            <asp:BoundField DataField="EventName" HeaderText="Event Name" SortExpression="EventName" />
            <asp:BoundField DataField="VenueName" HeaderText="Venue Name" SortExpression="VenueName" />
            <asp:BoundField DataField="VenuePhone" HeaderText="Venue Phone" SortExpression="VenuePhone" />
            <asp:BoundField DataField="VenueAddress" HeaderText="Venue Address" ReadOnly="True" SortExpression="VenueAddress" />
            <asp:BoundField DataField="VenueCity" HeaderText="Venue City" SortExpression="VenueCity" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString="{0:d}" />
            <asp:TemplateField HeaderText="StartTime" SortExpression="Start Time">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#DateTime.Parse(Eval("StartTime").ToString()).ToString("hh:mm tt")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SeatingCap" HeaderText="SeatingCap" SortExpression="SeatingCap" />
        </Fields>
    </asp:DetailsView>
      <br />
      <a onclick="OrderClick();">Next -></a>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapstoneSQLConn %>" SelectCommand="SELECT * FROM [Event_View_Details] WHERE ([eventID] = @eventID)">
          <SelectParameters>
              <asp:QueryStringParameter DefaultValue="0" Name="eventID" QueryStringField="EventID" Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>
  </div>
  <div id="Order">
    <p>Sed do eiusmod tempor incididunt.</p>
  </div>
  <div id="Confirm">
    <p>Ut enim ad minim veniam</p>
  </div>
</div>
</asp:Content>
