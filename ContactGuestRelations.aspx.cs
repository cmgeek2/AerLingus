﻿using System;
using System.Configuration;
using System.Net.Mail;
using System.Text;

public partial class ContactGuestRelations : System.Web.UI.Page
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

        //splitting this into 2
        sbBodyTextString.AppendLine("Guest Type: " + guestGroup.SelectedValue);
        sbBodyTextString.AppendLine("EmailFormId1: " + sEmailFormId1);
        sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
        sbBodyTextString.AppendLine("Reference Number: " + Request.Form["_helpQuerybookingReferenceNumber"]);
        sbBodyTextString.AppendLine("Flight Date: " + Request.Form["dateOfFlight"]);
        sbBodyTextString.AppendLine("Flight Number: " + Request.Form["flightNumber"]);

        // Guest Information
        sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);
        sbBodyTextString.AppendLine("GuestTitle: " + Request.Form["guestSalutation"]);
        sbBodyTextString.AppendLine("Guest Given Name: " + (Request.Form["FirstName"]).ToUpper());
        sbBodyTextString.AppendLine("Guest Last Name: " + (Request.Form["LastName"]).ToUpper());

        // if the user is a representative of the guest, collect representative information.
        if (guestGroup.SelectedValue != "guest")
        {
            // Representative information
            sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);
            sbBodyTextString.AppendLine("RepresentativeTitle: " + Request.Form["representativeSalutation"]);
            sbBodyTextString.AppendLine("Representative Given Name: " + (Request.Form["representativeFirstName"]).ToUpper());
            sbBodyTextString.AppendLine("Representative Last Name: " + (Request.Form["representativeLastName"]).ToUpper());
            sbBodyTextString.AppendLine("Representative Email: " + Request.Form["_helpQueryEmail"]);
            sbBodyTextString.AppendLine("Representative Company Name: " + Request.Form["repCompanyName"]);
            sbBodyTextString.AppendLine("Relationship to the Guest: " + Request.Form["relationsipToGuestDropDown"]);
        }
        else
        {
            //starting part 2
            sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
            string countrycode = CountryCode.SelectedValue;
            sbBodyTextString.AppendLine("Country: " + Request.Form["countriesList"]);
            char[] delimiterChars = { '(', ')' };
            string[] code = CountryCode.SelectedItem.ToString().Split(delimiterChars);
            sbBodyTextString.AppendLine("Telephone: " + code[1] + " " + Request.Form["_helpQueryTelephoneNumber"]);


        }

        // Get address information
        sbBodyTextString.AppendLine("Address 1: " + Request.Form["address1"]);
        sbBodyTextString.AppendLine("Address 2: " + Request.Form["address2"]);
        sbBodyTextString.AppendLine("Town/City: " + Request.Form["townCity"]);
        sbBodyTextString.AppendLine("Country/State: " + Request.Form["countryState"]);
        sbBodyTextString.AppendLine("Posta/Zip Code: " + Request.Form["zipCode"]);

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

        // Get additional flights information
        if (Request.Form["QueryFlightNumber2"] != "")
        {
            sbBodyTextString.AppendLine("Flight Date 2: " + Request.Form["dateOfFlight2"]);
            sbBodyTextString.AppendLine("Flight Number 2: " + Request.Form["QueryFlightNumber2"]);
        }

        if (Request.Form["QueryFlightNumber3"] != "")
        {
            sbBodyTextString.AppendLine("Flight Date 3: " + Request.Form["dateOfFlight3"]);
            sbBodyTextString.AppendLine("Flight Number 3: " + Request.Form["QueryFlightNumber3"]);
        }


        if (Request.Form["QueryFlightNumber4"] != "")
        {
            sbBodyTextString.AppendLine("Flight Date 4: " + Request.Form["dateOfFlight4"]);
            sbBodyTextString.AppendLine("Flight Number 4: " + Request.Form["QueryFlightNumber4"]);
        }

        // Additional guests information
        if (Request.Form["salutationGuest2"] != "")
        {
            sbBodyTextString.AppendLine("Guest 2 Title: " + Request.Form["salutationGuest2"]);
            sbBodyTextString.AppendLine("Guest 2 Given Name: " + (Request.Form["secondGuestFirstName"]).ToUpper());
            sbBodyTextString.AppendLine("Guest 2 Last Name: " + (Request.Form["secondGuestLastName"]).ToUpper());
        }

        if (Request.Form["salutationGuest3"] != "")
        {
            sbBodyTextString.AppendLine("Guest 3 Title: " + Request.Form["salutationGuest3"]);
            sbBodyTextString.AppendLine("Guest 3 Given Name: " + (Request.Form["thirdGuestFirstName"]).ToUpper());
            sbBodyTextString.AppendLine("Guest 3 Last Name: " + (Request.Form["thirdGuestLastName"]).ToUpper());
        }

        if (Request.Form["salutationGuest4"] != "")
        {
            sbBodyTextString.AppendLine("Guest 4 Title: " + Request.Form["salutationGuest4"]);
            sbBodyTextString.AppendLine("Guest 4 Given Name: " + (Request.Form["fourthGuestFirstName"]).ToUpper());
            sbBodyTextString.AppendLine("Guest 4 Last Name: " + Request.Form["fourthGuestLastName"]);
        }

        if (Request.Form["salutationGuest5"] != "")
        {
            sbBodyTextString.AppendLine("Guest 5 Title: " + Request.Form["salutationGuest5"]);
            sbBodyTextString.AppendLine("Guest 5 Given Name: " + (Request.Form["fifthGuestFirstName"]).ToUpper());
            sbBodyTextString.AppendLine("Guest 5 Last Name: " + (Request.Form["fifthGuestLastName"]).ToUpper());
        }

        if (Request.Form["salutationGuest6"] != "")
        {
            sbBodyTextString.AppendLine("Guest 6 Title: " + Request.Form["salutationGuest6"]);
            sbBodyTextString.AppendLine("Guest 6 Given Name: " + (Request.Form["sixthGuestFirstName"]).ToUpper());
            sbBodyTextString.AppendLine("Guest 6 Last Name: " + (Request.Form["sixthGuestLastName"]).ToUpper());
        }

        //Issues selected
        sbBodyTextString.AppendLine("General Issue: " + Request.Form["generalIssuesDropdown"]);
        sbBodyTextString.AppendLine("Specific Issue: " + Request.Form["specificIssueDropdown"]);
        sbBodyTextString.AppendLine("Baggage Reference: " + Request.Form["baggageReferenceNumber"]);

        sbBodyTextString.AppendLine("Need a Property Irregularity Report from insurance: " + propertyIrregularityGroup.SelectedValue);
        sbBodyTextString.AppendLine("Need a letter from insurance: " + insuranceGroup.SelectedValue);



        sbBodyTextString.AppendLine("Comments: " + comments.Text);
        

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

        if (fileUploader.HasFile)
        {

            _helpMessage.Attachments.Add(new System.Net.Mail.Attachment(fileUploader.PostedFile.InputStream, fileUploader.FileName));
        }
        try
        {
            //SMTPServer.Send(_helpMessage);
            Response.Redirect("ThankYou.aspx?sender=RefundRequest.aspx&message=" + Server.UrlEncode("Refund"));

            _helpMessage.Dispose();
        }
        catch (SmtpException smtpEx)
        {

        }
    }
}