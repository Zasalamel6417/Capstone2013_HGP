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
    public partial class ThankYou : System.Web.UI.Page
    {
		PayPalAPIAAInterfaceClient client = new PayPalAPIAAInterfaceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
			if (!Page.IsPostBack && Request.QueryString["token"] != null)
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

				Session["CheckoutDetails"] = resp;
			}
        }

		protected void btnFinish_Click(object sender, EventArgs e)
		{
			if (Request.QueryString["token"] != null && Session["CheckoutDetails"] != null)
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
                                    currencyID = resp.GetExpressCheckoutDetailsResponseDetails.PaymentDetails[0].OrderTotal.currencyID,
                                    Value = resp.GetExpressCheckoutDetailsResponseDetails.PaymentDetails[0].OrderTotal.Value
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
			}
			Session["CheckoutDetails"] = null;
			Response.Redirect("~/Default.aspx");
		}
    }
}