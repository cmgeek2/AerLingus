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
            sEmailFormId1 = ConfigurationManager.AppSettings["USAMealFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["USAMealFormId2"];
            sUSAorOther = "NA";

        }
        else
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["OthersMealFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["OthersMealFormId2"];
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
        sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
        sbBodyTextString.AppendLine("Guest Title: " + Request.Form["_helpQuerySalutation"]);
        sbBodyTextString.AppendLine("Guest Given Name: " + Request.Form["FirstName"]);
        sbBodyTextString.AppendLine("Guest Last Name: " + Request.Form["LastName"]);
        sbBodyTextString.AppendLine("Guest Meal Requested: " + Request.Form["Guest1MealDropDownList"]);

        // AerClub Info
        if (Request.Form["aerClubDropDown"] != "AerClub Tier")
        {
            sbBodyTextString.AppendLine("AerClub Tier: " + Request.Form["aerClubDropDown"]);
            sbBodyTextString.AppendLine("AerClub Member ID: " + Request.Form["_helpQueryAerClubmembershipId"]);
            sbBodyTextString.AppendLine("CountryACStatus: " + sUSAorOther + Request.Form["aerClubDropDown"]);
        }
        else
        {
            sbBodyTextString.AppendLine("AerClub Tier: " + "");
            sbBodyTextString.AppendLine("AerClub Member ID: " + "");
            sbBodyTextString.AppendLine("CountryACStatus: " + "");

        }
        
        // Get additional guests info
        if (Request.Form["Guest2MealDropDownList"] != "")
        {
            sbBodyTextString.AppendLine("Second Guest First Name: " + Request.Form["secondGuestFirstName"]);
            sbBodyTextString.AppendLine("Second Guest Last Name: " + Request.Form["secondGuestLastName"]);
            sbBodyTextString.AppendLine("Second Guest Meal Requested: " + Request.Form["Guest2MealDropDownList"]);
        }

        if (Request.Form["Guest3MealDropDownList"] != "")
        {
            sbBodyTextString.AppendLine("Third Guest First Name: " + Request.Form["thirdGuestFirstName"]);
            sbBodyTextString.AppendLine("Third Guest Last Name: " + Request.Form["thirdGuestLastName"]);
            sbBodyTextString.AppendLine("Third Guest Meal Requested: " + Request.Form["Guest3MealDropDownList"]);
        }

        if (Request.Form["Guest4MealDropDownList"] != "")
        {
            sbBodyTextString.AppendLine("Fourth Guest First Name: " + Request.Form["fourthGuestFirstName"]);
            sbBodyTextString.AppendLine("Fourth Guest Last Name: " + Request.Form["fourthGuestLastName"]);
            sbBodyTextString.AppendLine("Fourth Guest Meal Requested: " + Request.Form["Guest4MealDropDownList"]);
        }

        if (Request.Form["Guest5MealDropDownList"] != "")
        {
            sbBodyTextString.AppendLine("Fifth Guest First Name: " + Request.Form["fifthGuestFirstName"]);
            sbBodyTextString.AppendLine("Fifth Guest Last Name: " + Request.Form["fifthGuestLastName"]);
            sbBodyTextString.AppendLine("Fifth Guest Meal Requested: " + Request.Form["Guest5MealDropDownList"]);
        }

        if (Request.Form["Guest6MealDropDownList"] != "")
        {
            sbBodyTextString.AppendLine("Sixth Guest First Name: " + Request.Form["sixthGuestFirstName"]);
            sbBodyTextString.AppendLine("Sixth Guest Last Name: " + Request.Form["sixthGuestLastName"]);
            sbBodyTextString.AppendLine("Sixth Guest Meal Requested: " + Request.Form["Guest6MealDropDownList"]);
        }




        string countrycode = _helpQueryTelephoneCode.SelectedValue;
        sbBodyTextString.AppendLine("Country: " + Request.Form["_helpQueryCountryList"]);
        char[] delimiterChars = { '(', ')' };
        string[] code = _helpQueryTelephoneCode.SelectedItem.ToString().Split(delimiterChars);
        sbBodyTextString.AppendLine("Telephone: " + code[1] + " " + Request.Form["_helpQueryTelephoneNumber"]);

        
        
        sbBodyTextString.AppendLine("Additional Requests: " + AdditionalRequests.Text);


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
            _helpMessage.To.Add(ConfigurationManager.AppSettings["USAMealToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["USAMealSubject"];
        }
        else
        {
            _helpMessage.To.Add(ConfigurationManager.AppSettings["OthersMealToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["OthersMealSubject"];
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
            SMTPServer.Send(_helpMessage);
            Response.Redirect("ThankYou.aspx?sender=SpecialMealRequest.aspx&message=" + Server.UrlEncode("Special Meal"));


            _helpMessage.Dispose();
        }
        catch (SmtpException smtpEx)
        {

        }

    }

}