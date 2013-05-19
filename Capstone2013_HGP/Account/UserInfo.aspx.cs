using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Capstone2013_HGP.Account
{
    public partial class UserInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MembershipUser mu = Membership.GetUser();
                txtEmail.Text = mu.Email;
            }
            
            cbMember.Attributes.Add("onmouseup", "DisplayDiv()");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (cbMember.Checked)
            {
                if (IsCardNumberValid(txtCCNumber.Text))
                {
                    SaveUserInfo();
                }
                else
                {
                    lblCardValid.Text = "Not a valid card number.";
                }
            }
            else
            {
                SaveUserInfo();
            }
        }

        void SaveUserInfo()
        {
            bool isMember = false;
            bool getNewsletter = false;

            int age = Convert.ToInt32(txtAge.Text);

            if (cbMember.Checked)
            {
                isMember = true;
            }

            if (cbNewsletter.Checked)
            {
                getNewsletter = true;
            }

            string connStr = ConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(connStr);
            SqlCommand insCust = new SqlCommand("spInsertCustomer", sqlConn);
            insCust.CommandType = CommandType.StoredProcedure;

            //Parameters
            insCust.Parameters.Add(new SqlParameter("@email", txtEmail.Text));
            insCust.Parameters.Add(new SqlParameter("@firstName", txtFirstName.Text));
            insCust.Parameters.Add(new SqlParameter("@lastName", txtLastName.Text));
            insCust.Parameters.Add(new SqlParameter("@age", age));
            insCust.Parameters.Add(new SqlParameter("@newsLetter", getNewsletter));
            insCust.Parameters.Add(new SqlParameter("@isMember", isMember));
            insCust.Parameters.Add(new SqlParameter("@address1", txtAddress1.Text));
            insCust.Parameters.Add(new SqlParameter("@address2", txtAddress2.Text));
            insCust.Parameters.Add(new SqlParameter("@city", txtCity.Text));
            insCust.Parameters.Add(new SqlParameter("@stateCode", txtState.Text));
            insCust.Parameters.Add(new SqlParameter("@zipCode", txtZipcode.Text));

            sqlConn.Open();
            insCust.ExecuteNonQuery();

            Response.Redirect("~/");
        }

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
    }
}