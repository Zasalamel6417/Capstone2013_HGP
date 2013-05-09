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
    

namespace Capstone2013_HGP
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

                ;
                lbltickets.Visible = false;
                DropDownTickets.Visible = false;



            }
            if (DropDownsb.SelectedValue == "Ticket Range")
            {
                lbltickets.Visible = true;
                DropDownTickets.Visible = true;
                btnsearch.Visible = true;

                
                lblevents.Visible = false;
                txtevents.Visible = false;

            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            
            string EventName;
            EventName = txtevents.Text.ToString();
            string connectionstring2 = WebConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;
            string selectsql2 = "select e.name as 'Event', c.name as 'Artist', e.startDate as 'Date', e.startTime as 'Time', v.name as 'Venue', a.price as 'Ticket Price', a.ticketsAvail as 'Available Tickets' from [Event] as e, [Venue] as v, [AvailableTickets] as a, [Artist] as c where e.venueID = v.venueID and e.eventID = a.eventID and e.artistID = c.artistID and e.name LIKE '%" + EventName + "%'";
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

        protected void GridSearch_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        }
    
}