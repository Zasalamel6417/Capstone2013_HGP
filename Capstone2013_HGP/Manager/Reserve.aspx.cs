using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone2013_HGP.Manager
{
    public partial class Reserve : System.Web.UI.Page
    {
        //Variable for number of tickets available
        int numAvail;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Take the number of tickets in the DetailsView and set it to numAvail.
                numAvail = Convert.ToInt32(dvReservationInfo.Rows[14].Cells[1].Text);

                //If numAvail is lessthan or equal to 0, don't let the user make the order.
                if (numAvail <= 0)
                {
                    txtQty.Visible = false;
                    btnReserve.Enabled = false;
                    btnReserve.Visible = false;
                    lblStatus.Text = "There are no more tickets Available for this event.";
                }
            }
        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {

            //Get logged in user
            MembershipUser mu = Membership.GetUser();

            //If user exists, then get the event ID and quantity and send the customer to the OrderPage.
            if (mu != null)
            {

                string eventID = dvReservationInfo.Rows[0].Cells[1].Text;
                int quantity = Convert.ToInt32(txtQty.Text);
                numAvail = Convert.ToInt32(dvReservationInfo.Rows[14].Cells[1].Text);

                if (quantity > numAvail)
                {
                    lblStatus.Text = "Not enough tickets available.";
                }
                else
                {
                    Response.Redirect("~/Order.aspx?EventId=" + eventID + "&Qty=" + quantity.ToString() + "&sectionID=" + dvReservationInfo.Rows[11].Cells[1].Text);
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }
}