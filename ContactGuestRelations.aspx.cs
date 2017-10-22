using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Mail;
using System.Text;

public partial class ContactGuestRelations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string caseNumberSent = Request.QueryString["caseid"];
        if (caseNumberSent != null)
        {
            updateCaseID.Text = caseNumberSent;
            updateCaseID.Enabled = false;
        }
        else
        {
            updateCaseID.Enabled = true;
        }
    }

    private string BuildMessageBody(string _FormID)
    {
        string sEmailFormId1;
        string sEmailFormId2;
        string sUSAorOther;
        string lsFormIdBuild = _FormID;
        List<string> expenses = new List<string>();

        //use this if we need to split mailboxes or IDs for processing.
        //form IDs are identical for both on deploy 3/29/2017
        if (lsFormIdBuild == "USA" || lsFormIdBuild == "CAN")
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["USAContactUsFormID"];
            sEmailFormId2 = ConfigurationManager.AppSettings["USAContactUsFormID"];
            sUSAorOther = "NA";

        }
        else
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["OtherContactUsFormID"];
            sEmailFormId2 = ConfigurationManager.AppSettings["OtherContactUsFormID"];
            sUSAorOther = "Other";

        }

        StringBuilder sbBodyTextString = new StringBuilder();
        sbBodyTextString.AppendLine("Case Reference: " + Request.Form["updateCaseID"]);
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
            sbBodyTextString.AppendLine("Relationship to the Guest: " + Request.Form["relationshipToGuestDropDown"]);
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
            sbBodyTextString.AppendLine("Reference Number 2: " + Request.Form["_helpQuerybookingReferenceNumber"]);
        }

        if (Request.Form["QueryFlightNumber3"] != "")
        {
            sbBodyTextString.AppendLine("Flight Date 3: " + Request.Form["dateOfFlight3"]);
            sbBodyTextString.AppendLine("Flight Number 3: " + Request.Form["QueryFlightNumber3"]);
            sbBodyTextString.AppendLine("Reference Number 3: " + Request.Form["_helpQuerybookingReferenceNumber"]);
        }


        if (Request.Form["QueryFlightNumber4"] != "")
        {
            sbBodyTextString.AppendLine("Flight Date 4: " + Request.Form["dateOfFlight4"]);
            sbBodyTextString.AppendLine("Flight Number 4: " + Request.Form["QueryFlightNumber4"]);
            sbBodyTextString.AppendLine("Reference Number 4: " + Request.Form["_helpQuerybookingReferenceNumber"]);
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

         
        if (Hotels.Checked)
        {
            expenses.Add("Hotels");
        }
        if (Meals.Checked)
        {
            expenses.Add(expenses.Count > 0 ? "| Meals" : "Meals");
        }
        if (Transport.Checked)
        {
            expenses.Add(expenses.Count > 0 ? "| Transport" : "Transport");
        }
        if (Other.Checked)
        {
            expenses.Add(expenses.Count > 0 ? "| Other" : "Other");
        }

        sbBodyTextString.AppendLine(" Expenses Type: " + String.Join(" ", expenses.ToArray()));
        sbBodyTextString.AppendLine("Need a letter from insurance: " + insuranceGroup.SelectedValue);



        sbBodyTextString.AppendLine("Comments: " + comments.Text);
        

        return sbBodyTextString.ToString();
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        Page.Validate();


        string selectedCountry = Request.Form["_helpQueryCountryList"];

        MailMessage _helpMessage = new MailMessage();
        //_helpMessage.From = new MailAddress(ConfigurationManager.AppSettings["ContactUsFromAddress"]);

        if (Request.Form["_helpQueryCountryList"] == "USA")
        {
            _helpMessage.To.Add(ConfigurationManager.AppSettings["USAContactUsToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["USAContactUsSubject"];
        }
        else
        {
            //_helpMessage.To.Add(ConfigurationManager.AppSettings["OtherContactUsToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["OtherContactUsSubject"];
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
            SMTPServer.Send(_helpMessage);
            Response.Redirect("ThankYou.aspx?sender=RefundRequest.aspx&message=" + Server.UrlEncode("Refund"));

            _helpMessage.Dispose();
        }
        catch (SmtpException smtpEx)
        {

        }
    }
}