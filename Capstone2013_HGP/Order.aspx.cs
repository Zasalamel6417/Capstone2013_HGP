using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Capstone2013_HGP.PayPalAPI;
using System.Text.RegularExpressions;
using System.Web.Security;
using System.Data;

namespace Capstone2013_HGP
{
    public partial class Order1 : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;

        double tax = .0525;

        string SubTotal
        {
            get
            {
                return Session["SubTotal"] as string;
            }
            set
            {
                Session["SubTotal"] = value;
            }
        }

        string totalCost
        {
            get
            {
                return Session["totalCost"] as string;
            }
            set
            {
                Session["totalCost"] = value;
            }
        }

        string SessionTax
        {
            get
            {
                return Session["SessionTax"] as string;
            }
            set
            {
                Session["SessionTax"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            //Get Logged in user
            MembershipUser mu = Membership.GetUser();

            //If the page is not a postback, Get the time check if it's less than 7 days.
            //If so, don't display the pickup check box.
            //Get total cost from hidden Details View, set it in the SessionProperty.
            //Set subTotal SessionProperty
            //Determine whether user is a member.
            if (!IsPostBack)
            {
                DateTime startDate = DateTime.Parse(dvOrderInfo.Rows[9].Cells[1].Text);
                double ts = (startDate - DateTime.Today).TotalDays;

                if (ts < 7)
                {
                    cbMail.Visible = false;
                    lblMail.Text = "You will need to pick your tickets up from will call.";
                }
                

                totalCost = Regex.Replace(dvOrderInfo.Rows[14].Cells[1].Text, "[^0-9.]", "");

                double cost = Convert.ToDouble(totalCost);
                double taxCost;
                double subTotal;
                bool member;

                Label lblTax = ((Label)dvOrderInfo.FindControl("lblTax"));
                Label lblSubTotal = ((Label)dvOrderInfo.FindControl("lblSubTotal"));

                //Calculate tax and subtotal
                taxCost = (cost * tax);
                subTotal = ((cost * tax) + cost);

                //set session state propery
                SubTotal = subTotal.ToString();
                SessionTax = taxCost.ToString();

                //Set each value for the order.
                lblTax.Text = taxCost.ToString("C");
                lblSubTotal.Text = subTotal.ToString("C");

                txtDetailEvent.Text = dvOrderInfo.Rows[2].Cells[1].Text;
                txtDetailQty.Text = dvOrderInfo.Rows[13].Cells[1].Text;
                txtDetailPrice.Text = dvOrderInfo.Rows[12].Cells[1].Text;

                txtDetailTax.Text = taxCost.ToString("C");
                txtDetailSubTotal.Text = subTotal.ToString("C");

                //If user exists, Determin if the user is a member. If so, set the discount recieved to 15%
                if (mu != null)
                {
                    txtEmail.Text = mu.Email;
                    txtEmail.Enabled = false;

                    SqlConnection sqlConn = new SqlConnection(connStr);
                    SqlCommand sqlCmd = new SqlCommand("SELECT isMember FROM Customer WHERE email=@email", sqlConn);
                    sqlCmd.Parameters.Add(new SqlParameter("@email", mu.Email));
                    sqlConn.Open();

                    member = (bool)sqlCmd.ExecuteScalar();

                    if (member)
                    {
                        ddlDiscount.SelectedIndex = 3;
                        ddlDiscount.SelectedItem.Text = "Member -- 15% Discount";
                        ddlDiscount.Enabled = false;
                        txtDetailTotal.Text = (subTotal - (subTotal * 0.15)).ToString("C");
                    }
                    else
                    {
                        txtDetailTotal.Text = txtDetailSubTotal.Text;
                    }
                }
                else
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
            }

            //If the page is postback, depending on the RadioButton pressed, keep the Credit Card Div displayed or Hidden.
            if (IsPostBack)
            {
                if (radCredit.Checked)
                {
                    CCInfo.Attributes["style"] = "display: block;";
                }
                else
                {
                    CCInfo.Attributes["style"] = "display: none;";
                }
            }

            //radCredit.Attributes.Add("onmouseup", "DisplayDiv()");
            //radPaypal.Attributes.Add("onmouseup", "HideDiv()");
        }

        /// <summary>
        /// On click, this will get the users email, and get their unique custID. Depending on the radio button checked, it will either send the user to PayPal with order information.
        /// Or, it will verify the CreditCard entered into the CCNumber Text Box is in fact a Valid Credit Card.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnPay_Click(object sender, EventArgs e)
        {
			MembershipUser mu = Membership.GetUser();
			SqlConnection sqlConn = new SqlConnection(connStr);
			SqlCommand sqlCmd = new SqlCommand("SELECT custID FROM Customer WHERE email=@email", sqlConn);
			sqlCmd.Parameters.Add(new SqlParameter("@email", mu.Email));
			sqlConn.Open();
			int custID = ((int)sqlCmd.ExecuteScalar());

            if (radPaypal.Checked)
            {
                PayPalAPIAAInterfaceClient paypalAAInt = new PayPalAPIAAInterfaceClient();
                string hosting = ConfigurationManager.AppSettings["HostingPrefix"];

                CustomSecurityHeaderType type = new CustomSecurityHeaderType();
                type.Credentials = new UserIdPasswordType()
                {
                    Username = ConfigurationManager.AppSettings["PP_APIUsername"],
                    Password = ConfigurationManager.AppSettings["PP_APIPassword"],
                    Signature = ConfigurationManager.AppSettings["PP_APISignature"]
                };

                SetExpressCheckoutRequestDetailsType sdt = new SetExpressCheckoutRequestDetailsType();
                sdt.NoShipping = "1";
                PaymentDetailsType pdt = new PaymentDetailsType()
                {
					OrderDescription = "HGP Event Ticket Purchase: " + dvOrderInfo.Rows[2].Cells[1].Text,
                    OrderTotal = new BasicAmountType()
                    {
                        currencyID = CurrencyCodeType.USD,
                        Value = Convert.ToDecimal(Regex.Replace(txtDetailTotal.Text, "[^0-9.]", "")).ToString()
                    },
					PaymentAction = PaymentActionCodeType.Sale,
					PaymentActionSpecified = true,
                };

                sdt.PaymentDetails = new PaymentDetailsType[] { pdt };
                sdt.CancelURL = hosting + "Default.aspx";
				sdt.ReturnURL = hosting + "ThankYou.aspx?custID=" + custID.ToString();

                SetExpressCheckoutReq req = new SetExpressCheckoutReq()
                {
                    SetExpressCheckoutRequest = new SetExpressCheckoutRequestType()
                    {
                        SetExpressCheckoutRequestDetails = sdt,
                        Version = "60.0"
                    }
                };

                var resp = paypalAAInt.SetExpressCheckout(ref type, req);
                if (resp.Errors != null && resp.Errors.Length > 0)
                {
                    // errors occured
                    throw new Exception("Exception(s) occured when calling PayPal. First exception: " +
                        resp.Errors[0].LongMessage);
                }

				SubmitOrder(Convert.ToInt32(ddlDiscount.SelectedValue));

                Response.Redirect(string.Format("{0}?cmd=_express-checkout&token={1}",
                    ConfigurationManager.AppSettings["PayPalSubmitUrl"], resp.Token));
            }

            if (radCredit.Checked)
            {
				//MembershipUser mu = Membership.GetUser();
				//SqlConnection sqlConn = new SqlConnection(connStr);
				//SqlCommand sqlCmd = new SqlCommand("SELECT custID FROM Customer WHERE email=@email", sqlConn);
				//sqlCmd.Parameters.Add(new SqlParameter("@email", mu.Email));
				//sqlConn.Open();
				//int custID = ((int)sqlCmd.ExecuteScalar());

                //Check if text boxes are empty
                //Server side validation best way when using two checkout methods.
                if (txtCCNumber.Text != "" && txtSecCode.Text != "" && txtExpDate.Text != "" && txtNameOnCard.Text != "")
                {
                    //If creditcard is valid, submit the order to the database and send user to the ThankYou page.
                    if (IsCardNumberValid(txtCCNumber.Text))
                    {
                        SubmitOrder(Convert.ToInt32(ddlDiscount.SelectedValue));

                        Response.Redirect("~/ThankYou.aspx?custID=" + custID.ToString());
                    }
                    else
                    {
                        lblStatus.Text = "Invalid Card Number";
                    }
                }
                else
                {
                    lblStatus.Text = "Missing some information";
                }
            }
        }

        /// <summary>
        /// If the discount selected is changed, recalculate taxes and total. If user is not a member, they will be able to, and then it will add $5 and re calculate taxes and total.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlDiscount_SelectedIndexChanged(object sender, EventArgs e)
        {
            double subTotal = Convert.ToDouble(SubTotal);

            //SelectedIndex 1 = Senior, SelectedIdex 2 = Student
            if (ddlDiscount.SelectedIndex == 1 || ddlDiscount.SelectedIndex == 2)
            {
                double totalCost = (subTotal - (subTotal * 0.10));

                txtDetailSubTotal.Text = Convert.ToDouble(SubTotal).ToString("C");
                txtDetailTax.Text = Convert.ToDouble(SessionTax).ToString("C");

                txtDetailTotal.Text = totalCost.ToString("C");
            }

            //Selected Index 0 = No Discount
            if (ddlDiscount.SelectedIndex == 0)
            {
                double totalCost = (subTotal + (subTotal * 0.10));
                txtDetailSubTotal.Text = Convert.ToDouble(SubTotal).ToString("C");
                txtDetailTax.Text = Convert.ToDouble(SessionTax).ToString("C");

                txtDetailTotal.Text = subTotal.ToString("C");
            }

            //SelectedIndex 3 = Member/Become Member
            if (ddlDiscount.SelectedIndex == 3)
            {
                double cost = Convert.ToDouble(totalCost);
                double addedMemberCost = cost + 5.0;

                double newSubTotal = (addedMemberCost * tax) + addedMemberCost;

                txtDetailSubTotal.Text = newSubTotal.ToString("C");
                txtDetailTax.Text = (addedMemberCost * tax).ToString("C");

                txtDetailTotal.Text = (addedMemberCost - (addedMemberCost * 0.15)).ToString("C");
            }
        }

        /// <summary>
        /// Checks to see if the credit card is valid
        /// </summary>
        /// <param name="cardNumber">String from the txtCCNumber text box</param>
        /// <returns>True if valid, false if not</returns>
        public static bool IsCardNumberValid(string cardNumber)
        {
            int i, checkSum = 0;

            // Compute checksum of every other digit starting from right-most digit
            for (i = cardNumber.Length - 1; i >= 0; i -= 2)
                checkSum += (cardNumber[i] - '0');

            // Now take digits not included in first checksum, multiple by two,
            // and compute checksum of resulting digits
            for (i = cardNumber.Length - 2; i >= 0; i -= 2)
            {
                int val = ((cardNumber[i] - '0') * 2);
                while (val > 0)
                {
                    checkSum += (val % 10);
                    val /= 10;
                }
            }

            // Number is valid if sum of both checksums MOD 10 equals 0
            return ((checkSum % 10) == 0);
        }

        /// <summary>
        /// Submit the order to the server. Add each element to the order and order details table.
        /// </summary>
        /// <param name="discountID">Discount given at checkout.</param>
        void SubmitOrder(int discountID)
        {

            SqlConnection sqlConn = new SqlConnection(connStr);
            SqlCommand addOrderCmd = new SqlCommand("AddOrder", sqlConn);
            addOrderCmd.CommandType = CommandType.StoredProcedure;
            
            addOrderCmd.Parameters.Add(new SqlParameter("@eventID", Convert.ToInt32(dvOrderInfo.Rows[0].Cells[1].Text)));
            addOrderCmd.Parameters.Add(new SqlParameter("@email", txtEmail.Text));
            addOrderCmd.Parameters.Add(new SqlParameter("@total", Convert.ToDecimal(Regex.Replace(txtDetailTotal.Text, "[^0-9.]", ""))));
            addOrderCmd.Parameters.Add(new SqlParameter("@isPickup", cbMail.Checked));
            addOrderCmd.Parameters.Add(new SqlParameter("@discount", discountID));
            addOrderCmd.Parameters.Add(new SqlParameter("@quantity", Convert.ToInt32(txtDetailQty.Text)));
            addOrderCmd.Parameters.Add(new SqlParameter("@sectionID", int.Parse(Request.QueryString["sectionID"].ToString())));

            sqlConn.Open();

            if (ddlDiscount.SelectedIndex == 3)
            {
                SqlCommand makeMember = new SqlCommand("UPDATE Customer SET isMember = 'True' WHERE email=@email", sqlConn);
                makeMember.Parameters.Add(new SqlParameter("@email", txtEmail.Text));
                makeMember.ExecuteNonQuery();
            }

            addOrderCmd.ExecuteNonQuery();

            sqlConn.Close();
        }
    }
}