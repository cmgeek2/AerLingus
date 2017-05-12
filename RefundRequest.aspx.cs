using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class css_RefaundRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private string BuildMessageBody(string v)
    {
        throw new NotImplementedException();
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        Page.Validate();


        string selectedCountry = Request.Form["_helpQueryCountryList"];
        MailMessage _helpMessage = new MailMessage();
        _helpMessage.From = new MailAddress(ConfigurationManager.AppSettings["ContactUsFromAddress"]);
        if (Request.Form["_helpQueryCountryList"] == "USA")
        {
            _helpMessage.To.Add(ConfigurationManager.AppSettings["USANeedHelpToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["USANeedHelpSubject"];
        }
        else
        {
            _helpMessage.To.Add(ConfigurationManager.AppSettings["OthersNeedHelpToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["OthersNeedHelpFormId"];
        }

        string _messgebody = BuildMessageBody(Request.Form["_helpQueryCountryList"]);
        SmtpClient SMTPServer = new SmtpClient();
        AlternateView PlainText;
        PlainText = AlternateView.CreateAlternateViewFromString(_messgebody, null, "text/plain");
        _helpMessage.AlternateViews.Add(PlainText);
        _helpMessage.BodyEncoding = Encoding.UTF8;
        _helpMessage.SubjectEncoding = Encoding.UTF8;

        if (_helpQueryFileUploader.HasFile)
        {

            _helpMessage.Attachments.Add(new System.Net.Mail.Attachment(_helpQueryFileUploader.PostedFile.InputStream, _helpQueryFileUploader.FileName));
        }
        try
        {
            SMTPServer.Send(_helpMessage);
            Response.Redirect("ThankYou.aspx");


            _helpMessage.Dispose();
        }
        catch (SmtpException smtpEx)
        {

        }

    }

    
}