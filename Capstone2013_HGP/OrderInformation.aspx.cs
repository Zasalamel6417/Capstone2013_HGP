﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Capstone2013_HGP
{
    public partial class OrderInformation : System.Web.UI.Page
    {
        //Variable for number of tickets available
        int numAvail;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Take the number of tickets in the DetailsView and set it to numAvail.
                numAvail = Convert.ToInt32(dvInfo.Rows[14].Cells[1].Text);

                //If numAvail is lessthan or equal to 0, don't let the user make the order.
                if (numAvail <= 0)
                {
                    txtQty.Visible = false;
                    btnOrder.Enabled = false;
                    btnOrder.Visible = false;
                    lblStatus.Text = "There are no more tickets Available for this event.";
                }
            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {

            //Get logged in user
            MembershipUser mu = Membership.GetUser();

            //If user exists, then get the event ID and quantity and send the customer to the OrderPage.
            if (mu != null)
            {

                string eventID = dvInfo.Rows[0].Cells[1].Text;
                int quantity = Convert.ToInt32(txtQty.Text);
                numAvail = Convert.ToInt32(dvInfo.Rows[14].Cells[1].Text);

                if (quantity > numAvail)
                {
                    lblStatus.Text = "Not enough tickets available.";
                }
                else
                {
                    Response.Redirect("~/Order.aspx?EventId=" + eventID + "&Qty=" + quantity.ToString() + "&sectionID="+ dvInfo.Rows[11].Cells[1].Text);
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }
}