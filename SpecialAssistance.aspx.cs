﻿using System;
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
        sbBodyTextString.AppendLine("Reference Number: " + Request.Form["_helpQuerybookingReferenceNumber"]);
        if (_helpQueryDateOfFlight.Text != "Flight Date")
        {
            sbBodyTextString.AppendLine("Flight Date: " + _helpQueryDateOfFlight.Text.ToString());
        }
        else
        {
            sbBodyTextString.AppendLine("Flight Date: ");
        }
        sbBodyTextString.AppendLine("Flight Number: " + Request.Form["_helpQueryFlightNumber"]);
        if (Request.Form["FlightNumber2"] != "")
        {
            if (dateOfFlight2.Text != "Flight Date")
            {
                sbBodyTextString.AppendLine("Flight 2 Date: " + dateOfFlight2.Text);
            }
            else
            {
                sbBodyTextString.AppendLine("Flight 2 Date: ");
            }
            sbBodyTextString.AppendLine("Flight Number 2 : " + Request.Form["FlightNumber2"]);
            sbBodyTextString.AppendLine("Reference Number 2: " + Request.Form["_helpQuerybookingReferenceNumber"]);
        }
        if (Request.Form["FlightNumber3"] != "")
        {
            if (dateOfFlight3.Text != "Flight Date")
            {
                sbBodyTextString.AppendLine("Flight 3 Date: " + dateOfFlight3.Text);
            }
            else
            {
                sbBodyTextString.AppendLine("Flight 3 Date: ");
            }
            sbBodyTextString.AppendLine("Flight Number 3: " + Request.Form["FlightNumber3"]);
            sbBodyTextString.AppendLine("Reference Number 3: " + Request.Form["_helpQuerybookingReferenceNumber"]);
        }
        if (Request.Form["FlightNumber4"] != "")
        {
            if (dateOfFlight4.Text != "Flight Date")
            {
                sbBodyTextString.AppendLine("Flight 4 Date: " + dateOfFlight4.Text);
            }
            else
            {
                sbBodyTextString.AppendLine("Flight 4 Date: ");
            }
            sbBodyTextString.AppendLine("Flight Number 4: " + Request.Form["FlightNumber4"]);
            sbBodyTextString.AppendLine("Reference Number 4: " + Request.Form["_helpQuerybookingReferenceNumber"]);
        }

        sbBodyTextString.AppendLine("Request Type: " + _helpQueryTypeDropDownList.SelectedItem);
        sbBodyTextString.AppendLine("Request Definition: " + Request.Form["_helpQueryDefList"]);
        if (Request.Form["_helpQueryTypeDropDownList2"] != "Selected")
        {
            sbBodyTextString.AppendLine("Request Type 2: " + _helpQueryTypeDropDownList2.SelectedItem);
            sbBodyTextString.AppendLine("Request Definition 2: " + Request.Form["_helpQueryDefList2"]);
            sbBodyTextString.AppendLine("Flight Date 2: " + _helpQueryDateOfFlight.Text.ToString());
            sbBodyTextString.AppendLine("Flight Number 2: " + Request.Form["_helpQueryFlightNumber"]);
            sbBodyTextString.AppendLine("Reference Number 2: " + Request.Form["_helpQuerybookingReferenceNumber"]);

            if (Request.Form["_helpQueryTypeDropDownList3"] != "Selected")
            {
                sbBodyTextString.AppendLine("Request Type 3: " + _helpQueryTypeDropDownList3.SelectedItem);
                sbBodyTextString.AppendLine("Request Definition 3: " + Request.Form["_helpQueryDefList3"]);
                sbBodyTextString.AppendLine("Flight Date 3: " + _helpQueryDateOfFlight.Text.ToString());
                sbBodyTextString.AppendLine("Flight Number 3: " + Request.Form["_helpQueryFlightNumber"]);
                sbBodyTextString.AppendLine("Reference Number 3: " + Request.Form["_helpQuerybookingReferenceNumber"]);
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
       
        if(_helpQueryFileUploader.HasFile)
        {
           
            _helpMessage.Attachments.Add(new System.Net.Mail.Attachment(_helpQueryFileUploader.PostedFile.InputStream, _helpQueryFileUploader.FileName));
        }
        try
        {
            SMTPServer.Send(_helpMessage);
            Response.Redirect("ThankYou.aspx?sender=SpecialAssistance.aspx&message=" + Server.UrlEncode("Special Assistance") );
           

            _helpMessage.Dispose();
        }
        catch (SmtpException smtpEx)
        {

        }

    }


}