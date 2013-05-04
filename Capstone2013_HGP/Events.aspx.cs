using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone2013_HGP
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Make A Selection")
            {
                

                lblevents.Visible = false;
                txtevents.Visible = false;
                btnsearch.Visible = false;

                lbltickets.Visible = false;
                DropDownTickets.Visible = false;




            }
            if (DropDownList1.SelectedValue == "Event Name")
            {
                lblevents.Visible = true;
                txtevents.Visible = true;
                btnsearch.Visible = true;
                txtevents.Focus();

                ;
                lbltickets.Visible = false;
                DropDownTickets.Visible = false;



            }
            if (DropDownList1.SelectedValue == "Ticket Range")
            {
                lbltickets.Visible = true;
                DropDownTickets.Visible = true;
                btnsearch.Visible = true;

                
                lblevents.Visible = false;
                txtevents.Visible = false;

            }
        }

       

    }
}