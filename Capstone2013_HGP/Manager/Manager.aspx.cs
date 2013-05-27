using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone2013_HGP.Manager
{
    public partial class Manager : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvEvents_PageIndexChanged(object sender, EventArgs e)
        {
            gvEvents.SelectedIndex = -1;
        }

        protected void gvEvents_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            MembershipUser mu = Membership.GetUser();

            if (mu != null)
            {
                if (e.CommandName == "Select")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvEvents.Rows[index];
                    Response.Redirect("~/OrderInformation.aspx?EventID=" + row.Cells[1].Text.ToString() + "&sectionID="+ row.Cells[9].Text.ToString());
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void DropDownsb_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownsb.SelectedValue == "Make A Selection")
            {

                lblerror.Text = "*Please Make a Valid Selection to Proceed.";
                lblevents.Visible = false;
                txtEvents.Visible = false;
                btnsearch.Visible = false;

                lbltickets.Visible = false;
                DropDownTickets.Visible = false;




            }
            if (DropDownsb.SelectedValue == "Event Name")
            {
                lblevents.Visible = true;
                txtEvents.Visible = true;
                btnsearch.Visible = true;
                txtEvents.Focus();

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
                txtEvents.Visible = false;

            }
        }


        protected void DropDownTickets_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connectionstring2 = ConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;

            gvEvents.DataSource = null;
            gvEvents.DataSourceID = "";

            if (DropDownTickets.SelectedValue == "$1.00-$10.00")
            {
                string selectsql2 = "SELECT * FROM [dbo].Event_View WHERE TicketPrice between 1 and 10 Order By TicketPrice ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                gvEvents.DataSource = ds2;
                gvEvents.DataBind();

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
                string selectsql2 = "SELECT * FROM [dbo].Event_View WHERE TicketPrice between 11 and 20 Order By TicketPrice ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                gvEvents.DataSource = ds2;
                gvEvents.DataBind();

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
                string selectsql2 = "SELECT * FROM [dbo].Event_View WHERE TicketPrice between 21 and 30 Order By TicketPrice ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                var ds2 = new DataSet();
                adapter.Fill(ds2);
                gvEvents.DataSource = ds2;
                gvEvents.DataBind();

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
                string selectsql2 = "SELECT * FROM [dbo].Event_View WHERE TicketPrice between 31 and 40 Order By TicketPrice ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                gvEvents.DataSource = ds2;
                gvEvents.DataBind();

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
                string selectsql2 = "SELECT * FROM [dbo].Event_View WHERE TicketPrice between 41 and 50 Order By TicketPrice ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                gvEvents.DataSource = ds2;
                gvEvents.DataBind();

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
                string selectsql2 = "SELECT * FROM [dbo].Event_View WHERE TicketPrice >= 50 Order By TicketPrice ASC";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                gvEvents.DataSource = ds2;
                gvEvents.DataBind();

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

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string connectionstring2 = ConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;

            gvEvents.DataSource = null;
            gvEvents.DataSourceID = "";

            string EventName;
            lblerror.Text = String.Empty;
            EventName = txtEvents.Text.ToString();
            if (EventName == "")
            {
                lblerror.Text = "*Please Make sure You've typed a Keyword in the Provided Field";

            }
            else
            {
                lblerror.Text = "";
                string selectsql2 = "SELECT * FROM [dbo].Event_View WHERE (EventName LIKE '%' + @EventName + '%')";
                SqlConnection connect2 = new SqlConnection(connectionstring2);
                SqlCommand cmd = new SqlCommand(selectsql2, connect2);
                SqlParameter pm = new SqlParameter("@EventName", txtEvents.Text);
                cmd.Parameters.Add(pm);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adapter.Fill(ds2);
                gvEvents.DataSource = ds2;
                gvEvents.DataBind();

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

        protected void gvReservation_PageIndexChanged(object sender, EventArgs e)
        {
            gvReservation.SelectedIndex = -1;
        }

        protected void gvReservation_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            MembershipUser mu = Membership.GetUser();

            if (mu != null)
            {
                if (e.CommandName == "Select")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvReservation.Rows[index];
                    Response.Redirect("~/Manager/Reserve.aspx?EventID=" + row.Cells[1].Text.ToString() + "&sectionID=" + row.Cells[9].Text.ToString());
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }
}