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
using System.Windows.Forms;

namespace Capstone2013_HGP.Agent
{
    public partial class CustomerOrder : System.Web.UI.Page
    {
        //Variable for number of tickets available
        private int numAvail;

        protected void Page_Load(object sender, EventArgs e)
        {
            //pnlExist.Visible = false;
            // pnlNew.Visible = false;

            if (!IsPostBack)
            {
                //Take the number of tickets in the DetailsView and set it to numAvail.
                // numAvail = Convert.ToInt32(dvInfo.Rows[14].Cells[1].Text);

                //If numAvail is lessthan or equal to 0, don't let the user make the order.
                /* if (numAvail <= 0)
                {
                    txtQty.Visible = false;
                    btnOrder.Enabled = false;
                    btnOrder.Visible = false;
                    lblStatus.Text = "There are no more tickets Available for this event.";
                }*/
            }

            if (IsPostBack)
            {
                if (radExist.Checked)
                {
                    exist.Attributes["style"] = "display: block;";
                }
                else
                {
                    exist.Attributes["style"] = "display: none;";
                }

                if (radNew.Checked)
                {
                    newCust.Attributes["style"] = "display: block;";
                }
                else
                {
                    newCust.Attributes["style"] = "display: none;";
                }


            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ToString()))
                {
                    using (SqlCommand cmd = new SqlCommand("spInsertCustomer", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = txtEmail.Text;
                        cmd.Parameters.Add("@firstName", SqlDbType.VarChar).Value = txtFName.Text;
                        cmd.Parameters.Add("@lastName", SqlDbType.VarChar).Value = txtLName.Text;
                        cmd.Parameters.Add("@age", SqlDbType.Int).Value = Convert.ToInt32(txtAge.Text);
                        // cmd.Parameters.Add("@newsletter", SqlDbType.Bit).Value = chkMbr.Checked;
                        // cmd.Parameters.Add("@isMember", SqlDbType.Bit).Value = chkNewsletter.Checked;
                        cmd.Parameters.Add("@address1", SqlDbType.VarChar).Value = txtAddress.Text;
                        cmd.Parameters.Add("@address2", SqlDbType.VarChar).Value = txtAdd2.Text;
                        cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = txtCity.Text;
                        cmd.Parameters.Add("@stateCode", SqlDbType.VarChar).Value = txtState.Text;
                        cmd.Parameters.Add("@zipCode", SqlDbType.Char).Value = txtZip.Text;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        MessageBox.Show("The customer was inserted");
                    }
                }
            


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
                    Response.Redirect("~/Order.aspx?EventId=" + eventID + "&Qty=" + quantity.ToString() + "&sectionID=" +
                                      dvInfo.Rows[11].Cells[1].Text);
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }
}
    
