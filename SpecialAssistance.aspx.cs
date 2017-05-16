using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SpecialAssistance : System.Web.UI.Page
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
   
    protected string BuildMessageBody(string _FormID)
    {
        
        string sEmailFormId1;
        string sEmailFormId2;
        string sUSAorOther;
        string lsFormIdBuild = _FormID;
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
        //splitting this into 2. Pre-processing and when pulled from queue
        sbBodyTextString.AppendLine("EmailFormId1: " + sEmailFormId1);
        sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
        sbBodyTextString.AppendLine("Flight Date: " + _helpQueryDateOfFlight.Text.ToString());
        sbBodyTextString.AppendLine("Flight Number: " + Request.Form["_helpQueryFlightNumber"]);
        sbBodyTextString.AppendLine("Reference Number: " + Request.Form["_helpQuerybookingReferenceNumber"]);
        sbBodyTextString.AppendLine("Query Type: " + _helpQueryTypeDropDownList.SelectedItem);
        sbBodyTextString.AppendLine("Query Definition: " + Request.Form["_helpQueryDefList"]);
        if (Request.Form["_helpQueryTypeDropDownList2"] != "Selected")
        {
            sbBodyTextString.AppendLine("Query type 2: " + Request.Form["_helpQueryTypeDropDownList2"]);
            sbBodyTextString.AppendLine("Query Definition 2: " + Request.Form["_helpQueryDefList2"]);

            if (Request.Form["_helpQueryTypeDropDownList2"] != "Selected")
            {
                sbBodyTextString.AppendLine("Query type 3: " + Request.Form["_helpQueryTypeDropDownList3"]);
                sbBodyTextString.AppendLine("Query Definition 3: " + Request.Form["_helpQueryDefList3"]);
            }
        }

        //starting part 2
        sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);
        sbBodyTextString.AppendLine("GuestTitle: " + _helpQuerySalutation.SelectedValue.ToString());
        sbBodyTextString.AppendLine("Guest Given Name: " +Request.Form["helpQueryFirstName"]);
        sbBodyTextString.AppendLine("Guest Last Name: " + Request.Form["helpQueryLastName"]);
	    sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
        string countrycode = _helpQueryTelephoneCode.SelectedValue;
        sbBodyTextString.AppendLine("Country: " + Request.Form["_helpQueryCountryList"]);
        char[] delimiterChars = {  '(', ')' };
        string[] code = _helpQueryTelephoneCode.SelectedItem.ToString().Split(delimiterChars);
        sbBodyTextString.AppendLine("Telephone: " +code[1].ToString() +" " + Request.Form["_helpQueryTelephoneNumber"]);
        if (Request.Form["_helpQueryAerClubDropDown"]!="Selected")
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

        // Collecting data from Request Disability Assistance
        sbBodyTextString.AppendLine("Disability Query type: " + Request.Form["_helpQueryTypeDropDownList"]);
        sbBodyTextString.AppendLine("First Disability Selected: " + Request.Form["_helpQueryDefList"]);
        // Get additional disability info if set
        


        sbBodyTextString.AppendLine("Comments: " + _helpQueryAdditionInformation.Text.ToString());


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
       
        if(_helpQueryFileUploader.HasFile)
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