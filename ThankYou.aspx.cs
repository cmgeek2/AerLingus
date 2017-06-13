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
            string messageHeading = " Request Sent Successfully";
            //var messageFooter = "Your " + Server.UrlDecode(Request.QueryString["message"]) + " Request has been Sent Successfully";
            headingTD.InnerHtml = "<h1 id=\"idHeading\" class=\"tealGreen xxl\"> " + messageHeading + "</h1>";
            fromLink.NavigateUrl = Server.UrlDecode(Request.QueryString["sender"]);
            //idFooter.Text = messageFooter;
        }
    }
}
