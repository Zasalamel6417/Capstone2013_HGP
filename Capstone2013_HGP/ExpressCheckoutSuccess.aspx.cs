using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capstone2013_HGP.PayPalAPI;
using System.Configuration;

namespace Capstone2013_HGP
{
	public partial class ExpressCheckoutSuccess : System.Web.UI.Page
	{
		PayPalAPIAAInterfaceClient client = new PayPalAPIAAInterfaceClient();

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				string token = Request.QueryString["token"];


				CustomSecurityHeaderType type = new CustomSecurityHeaderType();
				type.Credentials = new UserIdPasswordType()
				{
					Username = ConfigurationManager.AppSettings["PP_APIUsername"],
					Password = ConfigurationManager.AppSettings["PP_APIPassword"],
					Signature = ConfigurationManager.AppSettings["PP_APISignature"]
				};

				// build getdetails request
				GetExpressCheckoutDetailsReq req = new GetExpressCheckoutDetailsReq()
				{
					GetExpressCheckoutDetailsRequest = new GetExpressCheckoutDetailsRequestType()
					{
						Version = "60.0",
						Token = token
					}
				};

				// query PayPal for transaction details
				GetExpressCheckoutDetailsResponseType resp =
					client.GetExpressCheckoutDetails(ref type, req);
				//UtilPayPalAPI.HandleError(resp);
				if (resp.Errors != null && resp.Errors.Length > 0)
				{
					// errors occured
					throw new Exception("Exception(s) occured when calling PayPal. First exception: " +
						resp.Errors[0].LongMessage);
				}

				GetExpressCheckoutDetailsResponseDetailsType respDetails = resp.GetExpressCheckoutDetailsResponseDetails;


				// setup UI and save transaction details to session
				lblMessage.Text = string.Format(
					"Dear {0} {1}, everything is set for {2} {3} transaction to take place. Click on button below to commit transaction",
					respDetails.PayerInfo.PayerName.FirstName,
					respDetails.PayerInfo.PayerName.LastName,
					respDetails.PaymentDetails[0].OrderTotal.Value,
					respDetails.PaymentDetails[0].OrderTotal.currencyID
				);

				Session["CheckoutDetails"] = resp;
			}
		}

		protected void finishTransactionButton_Click(object sender, EventArgs e)
		{
			// get transaction details
			GetExpressCheckoutDetailsResponseType resp = Session["CheckoutDetails"] as GetExpressCheckoutDetailsResponseType;

			CustomSecurityHeaderType type = new CustomSecurityHeaderType();
			type.Credentials = new UserIdPasswordType()
			{
				Username = ConfigurationManager.AppSettings["PP_APIUsername"],
				Password = ConfigurationManager.AppSettings["PP_APIPassword"],
				Signature = ConfigurationManager.AppSettings["PP_APISignature"]
			};

			// prepare for commiting transaction
			DoExpressCheckoutPaymentReq payReq = new DoExpressCheckoutPaymentReq()
			{
				DoExpressCheckoutPaymentRequest = new DoExpressCheckoutPaymentRequestType()
				{
					Version = "60.0",
					DoExpressCheckoutPaymentRequestDetails = new DoExpressCheckoutPaymentRequestDetailsType()
					{
						Token = resp.GetExpressCheckoutDetailsResponseDetails.Token,
						PaymentAction = PaymentActionCodeType.Sale,
						PaymentActionSpecified = true,
						PayerID = resp.GetExpressCheckoutDetailsResponseDetails.PayerInfo.PayerID,
						PaymentDetails = new PaymentDetailsType[] {
							new PaymentDetailsType()
							{
								OrderTotal = new BasicAmountType()
								{
									currencyID = CurrencyCodeType.USD,
									Value = "100.0"
								}
							}
						}
					}
				}
			};

			// commit transaction and display results to user
			DoExpressCheckoutPaymentResponseType doResponse =
				client.DoExpressCheckoutPayment(ref type, payReq);

			if (doResponse.Errors != null && doResponse.Errors.Length > 0)
			{
				// errors occured
				throw new Exception("Exception(s) occured when calling PayPal. First exception: " +
					doResponse.Errors[0].LongMessage);
			}

			lblMessage.Text = "Payment was successfully processed!";
			finishTransactionButton.Visible = false;
		}
	}
}