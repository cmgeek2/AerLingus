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
        //form ID is now based on Guest or Rep to assist with processing 11/15/17 Paumyr
        if (guestGroup.SelectedValue != "guest")
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["RepRefundFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["RepRefundFormId2"];
            sUSAorOther = "NA";
        }
        else
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["GuestRefundFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["GuestRefundFormId2"];
            sUSAorOther = "Other";

        }

        StringBuilder sbBodyTextString = new StringBuilder();

        //splitting this into 2
        sbBodyTextString.AppendLine(sEmailFormId1);
        sbBodyTextString.AppendLine("Guest Type: " + guestGroup.SelectedValue);
        sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);

        // Guest Information
        sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);


        // if the user is a representative of the guest, collect representative information.
        if (guestGroup.SelectedValue != "guest")
        {
            // Guest Information
            sbBodyTextString.AppendLine("Guest Title: " + Request.Form["_helpQuerySalutation"]);
            sbBodyTextString.AppendLine("Guest Given Name: " + (Request.Form["helpQueryFirstName"]).ToUpper());
            sbBodyTextString.AppendLine("Guest Last Name: " + (Request.Form["helpQueryLastName"]).ToUpper());
            
            // Representative information
            sbBodyTextString.AppendLine("Representative Title: " + Request.Form["representativeSalutation"]);
            sbBodyTextString.AppendLine("Representative Given Name: " + (Request.Form["representativeFirstName"]).ToUpper());
            sbBodyTextString.AppendLine("Representative Last Name: " + (Request.Form["representativeLastName"]).ToUpper());
            sbBodyTextString.AppendLine("Representative Email: " + Request.Form["_helpQueryEmail"]);
            sbBodyTextString.AppendLine("Representative Company Name: " + Request.Form["repCompanyName"]);
            sbBodyTextString.AppendLine("Relationship to the Guest: " + Request.Form["relationshipToGuestDropDown"]);
            sbBodyTextString.AppendLine("Internal Case Number: " + Request.Form["internalCaseNumber"]);
            // Address information
            sbBodyTextString.AppendLine("Representative Address 1: " + Request.Form["address1"]);
            sbBodyTextString.AppendLine("Representative Address 2: " + Request.Form["address2"]);
            sbBodyTextString.AppendLine("Representative Town/City: " + Request.Form["townCity"]);
            sbBodyTextString.AppendLine("Representative Country: " + Request.Form["_helpQueryCountryList"]);
            if (Request.Form["_helpQueryCountryList"] == "USA" || Request.Form["_helpQueryCountryList"] == "CAN")
            {
                sbBodyTextString.AppendLine("Representative State: " + Request.Form["countryState"]);
            }
            else
            {
                sbBodyTextString.AppendLine("Representative County: " + Request.Form["countryState"]);    
            }
            sbBodyTextString.AppendLine("Representative Postal/Zip Code: " + Request.Form["zipCode"]);
            string countrycode = CountryCode.SelectedValue;
            char[] delimiterChars = { '(', ')' };
            string[] code = CountryCode.SelectedItem.ToString().Split(delimiterChars);
            sbBodyTextString.AppendLine("Representative Telephone: " + code[1] + " " + Request.Form["_helpQueryTelephoneNumber"]);
        }
        else
        {
            // Guest Only Information
            sbBodyTextString.AppendLine("Guest Title: " + Request.Form["_helpQuerySalutation"]);
            sbBodyTextString.AppendLine("Guest Given Name: " + (Request.Form["helpQueryFirstName"]).ToUpper());
            sbBodyTextString.AppendLine("Guest Last Name: " + (Request.Form["helpQueryLastName"]).ToUpper());
            sbBodyTextString.AppendLine("Guest Email: " + Request.Form["_helpQueryEmail"]);
            // Address information
            sbBodyTextString.AppendLine("Guest Address 1: " + Request.Form["address1"]);
            sbBodyTextString.AppendLine("Guest Address 2: " + Request.Form["address2"]);
            sbBodyTextString.AppendLine("Guest Town/City: " + Request.Form["townCity"]);
            sbBodyTextString.AppendLine("Guest Country: " + Request.Form["_helpQueryCountryList"]);
            if (Request.Form["_helpQueryCountryList"] == "USA" || Request.Form["_helpQueryCountryList"] == "CAN")
            {
                sbBodyTextString.AppendLine("Guest State: " + Request.Form["countryState"]);
            }
            else
            {
                sbBodyTextString.AppendLine("Guest County: " + Request.Form["countryState"]);    
            }
            sbBodyTextString.AppendLine("Guest Postal/Zip Code: " + Request.Form["zipCode"]);
            string countrycode = CountryCode.SelectedValue;
            char[] delimiterChars = { '(', ')' };
            string[] code = CountryCode.SelectedItem.ToString().Split(delimiterChars);
            sbBodyTextString.AppendLine("Guest Telephone: " + code[1] + " " + Request.Form["_helpQueryTelephoneNumber"]);
            
  
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

        sbBodyTextString.AppendLine("Reference Number: " + Request.Form["_helpQuerybookingReferenceNumber"]);
        sbBodyTextString.AppendLine("Flight Date: " + Request.Form["_helpQueryDateOfFlight"]);
        sbBodyTextString.AppendLine("Flight Number: " + Request.Form["_helpQueryFlightNumber"]);

        sbBodyTextString.AppendLine("Refund Reason Type 1: " + Request.Form["refundReasonDropDownList1"]);
        sbBodyTextString.AppendLine("Refund Reason 1 Route: " + RefundReasonList.SelectedValue + " " + Request.Form["refundReason1"]);
        sbBodyTextString.AppendLine("Refund Reason 1: " + Request.Form["refundReason1"]);

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

        // Additional refund reasons info.
        if (Request.Form["refundReasonDropDownList2"] != "")
        {
            sbBodyTextString.AppendLine("Refund Reason Type 2: " + Request.Form["refundReasonDropDownList2"]);
            sbBodyTextString.AppendLine("Refund Reason 2: " + Request.Form["refundReason2"]);
        }

        if (Request.Form["refundReasonDropDownList3"] != "")
        {
            sbBodyTextString.AppendLine("Refund Reason Type 3: " + Request.Form["refundReasonDropDownList3"]);
            sbBodyTextString.AppendLine("Refund Reason 3: " + Request.Form["refundReason3"]);
        }

        if (Request.Form["refundReasonDropDownList4"] != "")
        {
            sbBodyTextString.AppendLine("Refund Reason Type 4: " + Request.Form["refundReasonDropDownList4"]);
            sbBodyTextString.AppendLine("Refund Reason 4: " + Request.Form["refundReason4"]);
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