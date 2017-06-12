using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SpecialMealRequest : System.Web.UI.Page
{
    /// <summary>
    /// Page load Event Triggers as soon as page loads loads the list of countries from the xml
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {



    }

    /// <summary>
    /// Build message body for the email in plain text
    /// </summary>
    /// <param name="_FormID"></param>
    /// <returns></returns>
    private string BuildMessageBody(string _FormID)
    {

        string sEmailFormId1;
        string sEmailFormId2;
        string sUSAorOther;
        string lsFormIdBuild = _FormID;
        //use this if we need to split mailboxes or IDs for processing.
        //form IDs are identical for both on deploy 3/29/2017
        if (lsFormIdBuild == "USA" || lsFormIdBuild == "CAN")
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["USASAFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["USASAFormId2"];
            sUSAorOther = "NA";

        }
        else
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["OthersSAFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["OthersSAFormId2"];
            sUSAorOther = "Other";

        }


        StringBuilder sbBodyTextString = new StringBuilder();
        //splitting this into 2. Pre-processing and when pulled from queue
        sbBodyTextString.AppendLine(sEmailFormId1);
        sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
        sbBodyTextString.AppendLine("Flight Type: " + flightGroup.SelectedValue);
        sbBodyTextString.AppendLine("Booking Reference Number: " + Request.Form["bookingReferenceNumber"]);
        if (flightGroup.SelectedValue == "Departure" || flightGroup.SelectedValue == "Both")
        { 
            sbBodyTextString.AppendLine("Departure Flight Number: " + Request.Form["departureFlightNumber"]);
            sbBodyTextString.AppendLine("Departure Flight Date: " + Request.Form["departFlightDate"]);
            if (flightGroup.SelectedValue == "Both")
            {
                sbBodyTextString.AppendLine("Return Flight Number: " + Request.Form["ReturnFlightNumber"]);
                sbBodyTextString.AppendLine("Return Flight Date: " + Request.Form["returnFlightDate"]);
            }
        }
        else
        {       
            sbBodyTextString.AppendLine("Return Flight Number: " + Request.Form["departureFlightNumber"]);
            sbBodyTextString.AppendLine("Return Flight Date: " + Request.Form["departFlightDate"]);
        }
        
        //starting part 2
        sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);
        sbBodyTextString.AppendLine("GuestTitle: " + Request.Form["_helpQuerySalutation"]);
        sbBodyTextString.AppendLine("Guest Given Name: " + Request.Form["helpQueryFirstName"]);
        sbBodyTextString.AppendLine("Guest Last Name: " + Request.Form["helpQueryLastName"]);
        sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
        string countrycode = _helpQueryTelephoneCode.SelectedValue;
        sbBodyTextString.AppendLine("Country: " + Request.Form["_helpQueryCountryList"]);
        char[] delimiterChars = { '(', ')' };
        string[] code = _helpQueryTelephoneCode.SelectedItem.ToString().Split(delimiterChars);
        sbBodyTextString.AppendLine("Telephone: " + code[1].ToString() + " " + Request.Form["_helpQueryTelephoneNumber"]);

        
        
        sbBodyTextString.AppendLine("Additional Requests: " + _helpQueryAdditionInformation.Text);


        return sbBodyTextString.ToString();
    }
    /// <summary>
    /// Submits the request to the server 
    /// On Completion -success redirrects to thankyou page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        Page.Validate();

        string sendingPage = "SpecialAssistance.aspx";
        string selectedCountry = Request.Form["_helpQueryCountryList"];
        MailMessage _helpMessage = new MailMessage();
        _helpMessage.From = new MailAddress(ConfigurationManager.AppSettings["ContactUsFromAddress"]);

        if (Request.Form["_helpQueryCountryList"] == "USA" || Request.Form["_helpQueryCountryList"] == "CAN")
        {
            _helpMessage.To.Add(ConfigurationManager.AppSettings["USASAToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["USASASubject"];
        }
        else
        {
            _helpMessage.To.Add(ConfigurationManager.AppSettings["OthersSAToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["OthersSASubject"];
        }

        string _messgebody = BuildMessageBody(Request.Form["_helpQueryCountryList"]);
        SmtpClient SMTPServer = new SmtpClient();
        AlternateView PlainText;
        PlainText = AlternateView.CreateAlternateViewFromString(_messgebody, null, "text/plain");
        _helpMessage.AlternateViews.Add(PlainText);
        _helpMessage.BodyEncoding = Encoding.UTF8;
        _helpMessage.SubjectEncoding = Encoding.UTF8;

        try
        {
            //SMTPServer.Send(_helpMessage);
            Response.Redirect("ThankYou.aspx?sender=SpecialAssistance.aspx&message=" + Server.UrlEncode("Special Assistance"));


            _helpMessage.Dispose();
        }
        catch (SmtpException smtpEx)
        {

        }

    }

}