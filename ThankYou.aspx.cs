using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ContactUs
{
    public partial class ThankYou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sSiteName = ConfigurationManager.AppSettings["SiteName"];


            string sSiteTitle = ConfigurationManager.AppSettings["SiteTitle"];
            Page.Title = sSiteTitle;
        }
    }
}
