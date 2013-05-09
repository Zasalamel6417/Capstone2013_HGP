using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capstone2013_HGP.PayPalAPI;

namespace Capstone2013_HGP
{
	public partial class Order : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			
		}

		protected void btnPay_Click(object sender, EventArgs e){
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
					OrderDescription = "Payment Details Sushant",
					OrderTotal = new BasicAmountType()
					{
						currencyID = CurrencyCodeType.USD,
						Value = "100.00"
					}
				};

				sdt.PaymentDetails = new PaymentDetailsType[] { pdt };
				sdt.CancelURL = hosting + "Default.aspx";
				sdt.ReturnURL = hosting + "ExpressCheckoutSuccess.aspx";

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

				Response.Redirect(string.Format("{0}?cmd=_express-checkout&token={1}",
					ConfigurationManager.AppSettings["PayPalSubmitUrl"], resp.Token)); 
			}

		}
	}
}