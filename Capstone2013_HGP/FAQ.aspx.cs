using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Net.Mail;



namespace Capstone2013_HGP
{

	public partial class FAQ : System.Web.UI.Page
	{



		public SmtpClient client = new SmtpClient();

		public MailMessage msge = new MailMessage();



		//message.To.Add(to);

		public System.Net.NetworkCredential mycred = new System.Net.NetworkCredential("hgpnashville123@gmail.com", "Homegrown123");



		protected void Page_Load(object sender, EventArgs e)
		{



		}



		protected void btnsend_Click(object sender, EventArgs e)
		{

			string sendto = "hgpnashville123@gmail.com";

			string sendfrom = txtfrom.Text.ToString().Trim();

			string sub = txtsub.Text.ToString();

			string body = txtarea.Text.ToString();

			try
			{



				client.Host = "smtp.gmail.com";

				client.Port = 587;

				client.UseDefaultCredentials = false;

				client.Credentials = mycred;

				client.EnableSsl = true;



				MailAddress to1 = new MailAddress(sendto);

				MailAddress from = new MailAddress(sendfrom);

				msge.Body = body;

				msge.From = from;

				msge.To.Add(to1);

				msge.Subject = sub;









				client.Send(msge);

				lblmsge.Text = "Your Message was successfully Sent, A member of our support staff will respond to your questions/concerns within 24hrs.";

				txtfrom.Text = "";

				txtarea.Text = "";

				txtsub.Text = "";

				txtfrom.Focus();



			}

			catch (Exception ex)
			{

				lblmsge.Text = ("" + ex).ToString();

				txtfrom.Text = "";

				txtarea.Text = "";

				txtsub.Text = "";

				txtfrom.Focus();



			}





		}

	}

}