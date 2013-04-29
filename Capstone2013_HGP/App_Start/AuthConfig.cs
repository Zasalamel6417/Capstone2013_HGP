using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Membership.OpenAuth;

namespace Capstone2013_HGP
{
	internal static class AuthConfig
	{
		public static void RegisterOpenAuth()
		{
			// See http://go.microsoft.com/fwlink/?LinkId=252803 for details on setting up this ASP.NET
			// application to support logging in via external services.

			//OpenAuth.AuthenticationClients.AddTwitter(
			//    consumerKey: "your Twitter consumer key",
			//    consumerSecret: "your Twitter consumer secret");

			OpenAuth.AuthenticationClients.AddFacebook(
				appId: "163287753832694",
				appSecret: "0822dd29d6cc81dbcdd8768e89592924",
				extraData: new { Icon = "../Images/facebook.png" });

			//OpenAuth.AuthenticationClients.AddMicrosoft(
			//    clientId: "your Microsoft account client id",
			//    clientSecret: "your Microsoft account client secret");

			OpenAuth.AuthenticationClients.AddGoogle(extraData: new { Icon = "../Images/google.png" });
		}
	}
}