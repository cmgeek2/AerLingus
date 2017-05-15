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

    private string BuildMessageBody(string _FormID)
    {
        string sEmailFormId1;
        string sEmailFormId2;
        string sUSAorOther;
        string lsFormIdBuild = _FormID;
        bool isGuest;
        //use this if we need to split mailboxes or IDs for processing.
        //form IDs are identical for both on deploy 3/29/2017
        if (lsFormIdBuild == "USA" || lsFormIdBuild == "CAN")
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["USANeedHelpFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["USANeedHelpFormId2"];
            sUSAorOther = "NA";

        }
        else
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["OthersNeedHelpFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["OthersNeedHelpFormId2"];
            sUSAorOther = "Other";

        }

        StringBuilder sbBodyTextString = new StringBuilder();
        
        // if the user is a representative of the guest, collect representative information.
        if (guestGroup.SelectedValue != "guest")
        {
            //splitting this into 2
            sbBodyTextString.AppendLine("EmailFormId1: " + sEmailFormId1);
            sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
            sbBodyTextString.AppendLine("Flight Date: " + _helpQueryDateOfFlight.Text.ToString());
            sbBodyTextString.AppendLine("Flight Number: " + Request.Form["_helpQueryFlightNumber"]);
            sbBodyTextString.AppendLine("Reference Number: " + Request.Form["_helpQuerybookingReferenceNumber"]);
            sbBodyTextString.AppendLine("Refund Reason Type: " + refundReasonDropDownList1.SelectedItem.ToString());
            sbBodyTextString.AppendLine("Refund Reason: " + Request.Form["refundReason1"]);

            // Guest Information
            sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);
            sbBodyTextString.AppendLine("GuestTitle: " + _helpQuerySalutation.SelectedValue);
            sbBodyTextString.AppendLine("Guest Given Name: " + Request.Form["helpQueryFirstName"]);
            sbBodyTextString.AppendLine("Guest Last Name: " + Request.Form["helpQueryLastName"]);
            // Representative information
            sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);
            sbBodyTextString.AppendLine("RepresentativeTitle: " + RepresentativeDropDownList.SelectedValue);
            sbBodyTextString.AppendLine("Representative Given Name: " + Request.Form["representativeFirstName"]);
            sbBodyTextString.AppendLine("Representative Last Name: " + Request.Form["representativeLastName"]);
            sbBodyTextString.AppendLine("Representative Email: " + Request.Form["_helpQueryEmail"]);
            string countrycode = CountryCode.SelectedValue;
        }
        else
        {
            //splitting this into 2. Pre-processing and when pulled from queue
            sbBodyTextString.AppendLine("EmailFormId1: " + sEmailFormId1);
            sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
            sbBodyTextString.AppendLine("Flight Date: " + _helpQueryDateOfFlight.Text);
            sbBodyTextString.AppendLine("Flight Number: " + Request.Form["_helpQueryFlightNumber"]);
            sbBodyTextString.AppendLine("Reference Number: " + Request.Form["_helpQuerybookingReferenceNumber"]);
            sbBodyTextString.AppendLine("Query Type: " + refundReasonDropDownList1.SelectedItem);
            sbBodyTextString.AppendLine("Query Definition: " + Request.Form["refundReason1"]);

            //starting part 2
            sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);
            sbBodyTextString.AppendLine("GuestTitle: " + _helpQuerySalutation.SelectedValue);
            sbBodyTextString.AppendLine("Guest Given Name: " + Request.Form["helpQueryFirstName"]);
            sbBodyTextString.AppendLine("Guest Last Name: " + Request.Form["helpQueryLastName"]);
            sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
            string countrycode = CountryCode.SelectedValue;
            sbBodyTextString.AppendLine("Country: " + Request.Form["_helpQueryCountryList"]);
            char[] delimiterChars = { '(', ')' };
            string[] code = _helpQueryTelephoneCode.SelectedItem.ToString().Split(delimiterChars);
            sbBodyTextString.AppendLine("Telephone: " + code[1].ToString() + " " + Request.Form["_helpQueryTelephoneNumber"]);
            if (Request.Form["_helpQueryAerClubDropDown"] != "Selected")
            {
                sbBodyTextString.AppendLine("AerClub Tier: " + Request.Form["_helpQueryAerClubDropDown"]);
                sbBodyTextString.AppendLine("AerClub Member ID: " + Request.Form["_helpQueryAerClubmembershipId"]);
                sbBodyTextString.AppendLine("CountryACStatus: " + sUSAorOther + Request.Form["_helpQueryAerClubDropDown"]);
            }
            else
            {
                sbBodyTextString.AppendLine("AerClub Tier: " + "");
                sbBodyTextString.AppendLine("AerClub Member ID: " + "");
                sbBodyTextString.AppendLine("CountryACStatus: " + "");

            }


            sbBodyTextString.AppendLine("Comments: " + _helpQueryAdditionInformation.Text.ToString());
        }
        

        return sbBodyTextString.ToString(); 
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