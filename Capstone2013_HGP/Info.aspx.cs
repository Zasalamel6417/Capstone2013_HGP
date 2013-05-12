using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration.Assemblies;
using System.Web.Configuration;

namespace Capstone2013_HGP
{
    public partial class Info : System.Web.UI.Page
    {
        
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EVent"] != null)
            {
                Tevent.Text = Session["EVent"].ToString();
                Tevent.Enabled = false;
                Tartist.Text = Session["Artist"].ToString();
                Tdate.Text = Session["Date"].ToString();
                Ttime.Text = Session["Time"].ToString();
                Tvenue.Text = Session["Venue"].ToString();
                Tprice.Text = Session["Price"].ToString();
                Tsection.Text = Session["Section"].ToString();
                Tuname.Text = Session["Uname"].ToString();
                //Response.Write("User Name:" + " " + Request.QueryString["username"]);
                //Response.Write("here" + Session["Artist"].ToString());
            }
         

        }

    
    }
}