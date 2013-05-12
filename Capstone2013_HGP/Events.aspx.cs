using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration.Assemblies;
using System.Web.Configuration;
using System.Security.Authentication;


namespace Capstone2013_HGP
{
    public partial class Events : System.Web.UI.Page
    {
        string event1;
        string artist;
        DateTime date;
        DateTime time;
        string venue;
        double price;
        string section;

        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionstring2 = WebConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;
            string selectsql2 = "select e.name as 'Event', c.name as 'Artist', e.startDate as 'Date', e.startTime as 'Time', v.name as 'Venue', a.price as 'Ticket Price', s.name as 'Seat Section' from [Event] as e, [Venue] as v, [Section] as s, [AvailableTickets] as a, [Artist] as c where e.venueID = v.venueID and e.eventID = a.eventID and a.sectionID = s.sectionID and e.artistID = c.artistID";
            SqlConnection connect2 = new SqlConnection(connectionstring2);
            SqlCommand cmd = new SqlCommand(selectsql2, connect2);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds2 = new DataSet();
            adapter.Fill(ds2);
            GridSearch.DataSource = ds2;
            GridSearch.DataBind();
        }

        protected void DropDownsb_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownsb.SelectedValue == "Make A Selection")
            {

                lblerror.Text = "*Please Make a Valid Selection to Proceed.";
                lblevents.Visible = false;
                txtevents.Visible = false;
                btnsearch.Visible = false;

                lbltickets.Visible = false;
                DropDownTickets.Visible = false;




            }
            if (DropDownsb.SelectedValue == "Event Name")
            {
                lblevents.Visible = true;
                txtevents.Visible = true;
                btnsearch.Visible = true;
                txtevents.Focus();

                lblerror.Text = "";
                lbltickets.Visible = false;
                DropDownTickets.Visible = false;



            }
            if (DropDownsb.SelectedValue == "Ticket Range")
            {
                lbltickets.Visible = true;
                DropDownTickets.Visible = true;
                btnsearch.Visible = false;

                lblerror.Text = "";
                lblevents.Visible = false;
                txtevents.Visible = false;

            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {

            string EventName;
            lblerror.Text = String.Empty;
            EventName = txtevents.Text.ToString();
            if (EventName == "")
            {
                lblerror.Text = "*Please Make sure You've typed a Keyword in the Provided Field";

            }
            else
            {
                lblerror.Text = "";
                string connectionstring2 = WebConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;
                string selectsql2 = "select e.name as 'Event', c.name as 'Artist', e.startDate as 'Date', e.startTime as 'Time', v.name as 'Venue', a.price as 'Ticket Price', s.name as 'Seat Section' from [Event] as e, [Venue] as v, [Section] as s, [AvailableTickets] as a, [Artist] as c where e.venueID = v.venueID and e.eventID = a.eventID and a.sectionID = s.sectionID and e.artistID = c.artistID and e.name LIKE '%" + EventName + "%'";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                GridSearch.DataSource = ds2;
                GridSearch.DataBind();

                if (ds2.Tables[0].Rows.Count == 0)
                {

                    lblerror.Text = "*Your Search Returned Zero Result!!, Please Try Searching Again!!!";

                }
                else
                {
                    lblerror.Text = "";
                }
            }





        }






        protected void DropDownTickets_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownTickets.SelectedValue == "$1.00-$10.00")
            {
                string connectionstring2 = WebConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;
                string selectsql2 = "select e.name as 'Event', c.name as 'Artist', e.startDate as 'Date', e.startTime as 'Time', v.name as 'Venue', a.price as 'Ticket Price', s.name as 'Seat Section' from [Event] as e, [Venue] as v, [Section] as s, [AvailableTickets] as a, [Artist] as c where e.venueID = v.venueID and e.eventID = a.eventID and a.sectionID = s.sectionID and e.artistID = c.artistID and a.price between 1 and 10 order by a.price ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                GridSearch.DataSource = ds2;
                GridSearch.DataBind();

                if (ds2.Tables[0].Rows.Count == 0)
                {

                    lblerror.Text = "*Your Search Returned Zero Result!!, Please Try Searching Again!!!";

                }
                else
                {
                    lblerror.Text = "";
                }

            }
            if (DropDownTickets.SelectedValue == "$11.00-$20.00")
            {
                string connectionstring2 = WebConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;
                string selectsql2 = "select e.name as 'Event', c.name as 'Artist', e.startDate as 'Date', e.startTime as 'Time', v.name as 'Venue', a.price as 'Ticket Price', s.name as 'Seat Section' from [Event] as e, [Venue] as v, [Section] as s, [AvailableTickets] as a, [Artist] as c where e.venueID = v.venueID and e.eventID = a.eventID and a.sectionID = s.sectionID and e.artistID = c.artistID and a.price between 11 and 20 order by a.price ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                GridSearch.DataSource = ds2;
                GridSearch.DataBind();

                if (ds2.Tables[0].Rows.Count == 0)
                {

                    lblerror.Text = "*Your Search Returned Zero Result!!, Please Try Searching Again!!!";

                }
                else
                {
                    lblerror.Text = "";
                }

            }
            if (DropDownTickets.SelectedValue == "$21.00-$30.00")
            {
                string connectionstring2 = WebConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;
                string selectsql2 = "select e.name as 'Event', c.name as 'Artist', e.startDate as 'Date', e.startTime as 'Time', v.name as 'Venue', a.price as 'Ticket Price', s.name as 'Seat Section' from [Event] as e, [Venue] as v, [Section] as s, [AvailableTickets] as a, [Artist] as c where e.venueID = v.venueID and e.eventID = a.eventID and a.sectionID = s.sectionID and e.artistID = c.artistID and a.price between 21 and 30 order by a.price ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                GridSearch.DataSource = ds2;
                GridSearch.DataBind();

                if (ds2.Tables[0].Rows.Count == 0)
                {

                    lblerror.Text = "*Your Search Returned Zero Result!!, Please Try Searching Again!!!";

                }
                else
                {
                    lblerror.Text = "";
                }

            }
            if (DropDownTickets.SelectedValue == "$31.00-$40.00")
            {
                string connectionstring2 = WebConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;
                string selectsql2 = "select e.name as 'Event', c.name as 'Artist', e.startDate as 'Date', e.startTime as 'Time', v.name as 'Venue', a.price as 'Ticket Price', s.name as 'Seat Section' from [Event] as e, [Venue] as v, [Section] as s, [AvailableTickets] as a, [Artist] as c where e.venueID = v.venueID and e.eventID = a.eventID and a.sectionID = s.sectionID and e.artistID = c.artistID and a.price between 31 and 40 order by a.price ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                GridSearch.DataSource = ds2;
                GridSearch.DataBind();

                if (ds2.Tables[0].Rows.Count == 0)
                {

                    lblerror.Text = "*Your Search Returned Zero Result!!, Please Try Searching Again!!!";

                }
                else
                {
                    lblerror.Text = "";
                }

            }
            if (DropDownTickets.SelectedValue == "$41.00-$50.00")
            {
                string connectionstring2 = WebConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;
                string selectsql2 = "select e.name as 'Event', c.name as 'Artist', e.startDate as 'Date', e.startTime as 'Time', v.name as 'Venue', a.price as 'Ticket Price', s.name as 'Seat Section' from [Event] as e, [Venue] as v, [Section] as s, [AvailableTickets] as a, [Artist] as c where e.venueID = v.venueID and e.eventID = a.eventID and a.sectionID = s.sectionID and e.artistID = c.artistID and a.price between 41 and 50 order by a.price ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                GridSearch.DataSource = ds2;
                GridSearch.DataBind();

                if (ds2.Tables[0].Rows.Count == 0)
                {

                    lblerror.Text = "*Your Search Returned Zero Result!!, Please Try Searching Again!!!";

                }
                else
                {
                    lblerror.Text = "";
                }

            }
            if (DropDownTickets.SelectedValue == "$50.00 or Above")
            {
                string connectionstring2 = WebConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;
                string selectsql2 = "select e.name as 'Event', c.name as 'Artist', e.startDate as 'Date', e.startTime as 'Time', v.name as 'Venue', a.price as 'Ticket Price', s.name as 'Seat Section' from [Event] as e, [Venue] as v, [Section] as s, [AvailableTickets] as a, [Artist] as c where e.venueID = v.venueID and e.eventID = a.eventID and a.sectionID = s.sectionID and e.artistID = c.artistID and a.price > 50 order by a.price ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                GridSearch.DataSource = ds2;
                GridSearch.DataBind();

                if (ds2.Tables[0].Rows.Count == 0)
                {

                    lblerror.Text = "*Your Search Returned Zero Result!!, Please Try Searching Again!!!";

                }
                else
                {
                    lblerror.Text = "";
                }

            }
        }

        protected void GridSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTransfer dt = new DataTransfer();

            dt.TheEvent = GridSearch.SelectedRow.Cells[1].Text;
            dt.TheArtist = GridSearch.SelectedRow.Cells[2].Text;
            dt.TheDate = Convert.ToDateTime(GridSearch.SelectedRow.Cells[3].Text);
            dt.TheTime = Convert.ToDateTime(GridSearch.SelectedRow.Cells[4].Text);
            dt.TheVenue = GridSearch.SelectedRow.Cells[5].Text;
            dt.ThePrice = Convert.ToDouble(GridSearch.SelectedRow.Cells[6].Text);
            dt.Thesection = GridSearch.SelectedRow.Cells[7].Text;

            Session["Event"] = "Event";
            Session.Add("Event", dt.TheEvent);
            Session["Artist"] = "Artist";
            Session.Add("Artist", dt.TheArtist);
            Session["Date"] = "Date";
            Session.Add("Date", dt.TheDate);
            Session["Time"] = "Time";
            Session.Add("Time", dt.TheTime);
            Session["Venue"] = "Venue";
            Session.Add("Venue", dt.TheVenue);
            Session["Price"] = "Price";
            Session.Add("Price", dt.ThePrice);
            Session["Section"] = "Section";
            Session.Add("Section", dt.Thesection);

            if (User.Identity.IsAuthenticated)
            {
                string uname = User.Identity.Name.ToString();
                //string username = Request.QueryString["username"];
                Session["Uname"] = "Uname";
                Session.Add("Uname", uname);
                Response.Redirect("Info.aspx", true);

            }
            else
            {
                Response.Redirect("~/Account/Login", true);
            }
            //Response.Redirect("Info.aspx?uid=" + dt.TheEvent + "");
            //Response.Redirect("Info.aspx?uid=" + dt.TheArtist + "");
            //Response.Redirect("Info.aspx?uid=" + dt.TheDate + "");
            //Response.Redirect("Info.aspx?uid=" + dt.TheTime + "");
            //Response.Redirect("Info.aspx?uid=" + dt.TheVenue + "");
            //Response.Redirect("Info.aspx?uid=" + dt.ThePrice + "");
            //Response.Redirect("Info.aspx?uid=" + dt.Thesection + "");
        }

        protected void GridSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridSearch.PageIndex = e.NewPageIndex;
            GridSearch.DataBind();
        }

    }

}