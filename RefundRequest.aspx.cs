using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RefundRequest : System.Web.UI.Page
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
            sEmailFormId1 = ConfigurationManager.AppSettings["USARefundFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["USARefundFormId2"];
            sUSAorOther = "NA";

        }
        else
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["OthersRefundFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["OthersRefundFormId2"];
            sUSAorOther = "Other";

        }

        StringBuilder sbBodyTextString = new StringBuilder();

        //splitting this into 2
        sbBodyTextString.AppendLine("Guest Type: " + guestGroup.SelectedValue);
        sbBodyTextString.AppendLine("EmailFormId1: " + sEmailFormId1);
        sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
        sbBodyTextString.AppendLine("Reference Number: " + Request.Form["_helpQuerybookingReferenceNumber"]);
        sbBodyTextString.AppendLine("Flight Date: " + Request.Form["_helpQueryDateOfFlight"]);
        sbBodyTextString.AppendLine("Flight Number: " + Request.Form["_helpQueryFlightNumber"]);

        sbBodyTextString.AppendLine("Refund Reason Type 1: " + Request.Form["refundReasonDropDownList1"]);
        sbBodyTextString.AppendLine("Refund Reason 1: " + Request.Form["refundReason1"]);

        // Guest Information
        sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);
        sbBodyTextString.AppendLine("GuestTitle: " + Request.Form["_helpQuerySalutation"]);
        sbBodyTextString.AppendLine("Guest Given Name: " + (Request.Form["helpQueryFirstName"]).ToUpper());
        sbBodyTextString.AppendLine("Guest Last Name: " + (Request.Form["helpQueryLastName"]).ToUpper());

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
            sbBodyTextString.AppendLine("Internal Case Number: " + Request.Form["internalCaseNumber"]);
        }
        else
        {
            //starting part 2
            sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
            string countrycode = CountryCode.SelectedValue;
            sbBodyTextString.AppendLine("Country: " + Request.Form["_helpQueryCountryList"]);
            char[] delimiterChars = { '(', ')' };
            string[] code = CountryCode.SelectedItem.ToString().Split(delimiterChars);
            sbBodyTextString.AppendLine("Telephone: " + code[1] + " " + Request.Form["_helpQueryTelephoneNumber"]);
            
  
        }

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

        // Address information
        sbBodyTextString.AppendLine("Address 1: " + Request.Form["address1"]);
        sbBodyTextString.AppendLine("Address 2: " + Request.Form["address2"]);
        sbBodyTextString.AppendLine("Town/City: " + Request.Form["townCity"]);
        sbBodyTextString.AppendLine("Country: " + Request.Form["_helpQueryCountryList"]);
        sbBodyTextString.AppendLine("County/State: " + Request.Form["countryState"]);
        sbBodyTextString.AppendLine("Postal/Zip Code: " + Request.Form["zipCode"]);


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

        // Additional refund reasons info.
        if (refundReasonDropDownList2.SelectedIndex > 0)
        {
            sbBodyTextString.AppendLine("Refund Reason Type 2: " + Request.Form["refundReasonDropDownList2"]);
            sbBodyTextString.AppendLine("Refund Reason 2: " + Request.Form["refundReason2"]);
        }

        if (refundReasonDropDownList3.SelectedIndex > 0)
        {
            sbBodyTextString.AppendLine("Refund Reason Type 3: " + Request.Form["refundReasonDropDownList3"]);
            sbBodyTextString.AppendLine("Refund Reason 3: " + Request.Form["refundReason3"]);
        }

        if (refundReasonDropDownList4.SelectedIndex > 0)
        {
            sbBodyTextString.AppendLine("Refund Reason Type 3: " + Request.Form["refundReasonDropDownList4"]);
            sbBodyTextString.AppendLine("Refund Reason 3: " + Request.Form["refundReason4"]);
        }

        sbBodyTextString.AppendLine("Comments: " + _helpQueryAdditionInformation.Text);

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
            _helpMessage.To.Add(ConfigurationManager.AppSettings["USARefundToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["USARefundSubject"];
        }
        else
        {
            _helpMessage.To.Add(ConfigurationManager.AppSettings["OthersRefundToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["OthersRefundFormId"];
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
            Response.Redirect("ThankYou.aspx?sender=RefundRequest.aspx&message=" + Server.UrlEncode("Refund"));

            _helpMessage.Dispose();
        }
        catch (SmtpException smtpEx)
        {

        }

    }

    
}