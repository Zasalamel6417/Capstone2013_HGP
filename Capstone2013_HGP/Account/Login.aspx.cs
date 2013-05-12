using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone2013_HGP.Account
{
	public partial class Login : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			RegisterHyperLink.NavigateUrl = "Register";
			OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];

			var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
			if (!String.IsNullOrEmpty(returnUrl))
			{
				RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
			}

            
		}

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            // please don't use User.IsInRole here , because it will not be populated yet at this stage.
            //This should redirect to the appropriate page depending on the username login.
            if (Roles.IsUserInRole(Login1.UserName, "Agent"))
                Response.Redirect("~/Default.aspx");
            else if (Roles.IsUserInRole(Login1.UserName, "Manager"))
                Response.Redirect("~/Account/Manage.aspx");
        }
	}
}