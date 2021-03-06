using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequestUpdate: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string caseNumberSent = Request.QueryString["caseid"];
        if (caseNumberSent != null)
        {
            updateCaseID.Text = caseNumberSent;
        //    updateCaseID.Enabled = false;
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
        bool isGuest;
        //use this if we need to split mailboxes or IDs for processing.
        //form IDs are identical for both on deploy 3/29/2017
        if (lsFormIdBuild == "USA" || lsFormIdBuild == "CAN")
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["USAUpdateFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["USAUpdateFormId2"];
            sUSAorOther = "NA";

        }
        else
        {
            sEmailFormId1 = ConfigurationManager.AppSettings["OthersUpdateFormId1"];
            sEmailFormId2 = ConfigurationManager.AppSettings["OthersUpdateFormId2"];
            sUSAorOther = "Other";

        }

        StringBuilder sbBodyTextString = new StringBuilder();
        sbBodyTextString.AppendLine("Case Reference: " + Request.Form["updateCaseID"]);
        sbBodyTextString.AppendLine("Guest Type: " + guestGroup.SelectedValue);
        // if the user is a representative of the guest, collect representative information.
        if (guestGroup.SelectedValue != "guest")
        {
            //splitting this into 2
            sbBodyTextString.AppendLine(sEmailFormId1);
            sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
            

            // Guest Information
            //sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);
            sbBodyTextString.AppendLine("GuestTitle: " + _helpQuerySalutation.SelectedValue);
            sbBodyTextString.AppendLine("Guest Given Name: " + Request.Form["helpQueryFirstName"]);
            sbBodyTextString.AppendLine("Guest Last Name: " + Request.Form["helpQueryLastName"]);
            // Representative information
            //sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);
            sbBodyTextString.AppendLine("Internal Case Number: " + Request.Form["companyCaseNumber"]);
            sbBodyTextString.AppendLine("RepresentativeTitle: " + RepresentativeDropDownList.SelectedValue);
            sbBodyTextString.AppendLine("Representative Given Name: " + Request.Form["representativeFirstName"]);
            sbBodyTextString.AppendLine("Representative Last Name: " + Request.Form["representativeLastName"]);
            sbBodyTextString.AppendLine("Representative Email: " + Request.Form["_helpQueryEmail"]);
            sbBodyTextString.AppendLine("Representative Company Name: " + Request.Form["repCompanyName"]);
            sbBodyTextString.AppendLine("Country: " + Request.Form["_helpQueryCountryList"]);
            char[] delimiterChars = { '(', ')' };
            string[] code = CountryCode.SelectedItem.ToString().Split(delimiterChars);
            sbBodyTextString.AppendLine("Telephone: " + code[1].ToString() + " " + Request.Form["_helpQueryTelephoneNumber"]);
            sbBodyTextString.AppendLine("Relationship to guest: " + Request.Form["relationshipToGuestDropDown"]);

            string countrycode = CountryCode.SelectedValue;
        }
        else
        {
            //splitting this into 2. Pre-processing and when pulled from queue
            //sbBodyTextString.AppendLine("EmailFormId1: " + sEmailFormId1);
            sbBodyTextString.AppendLine("Email: " + Request.Form["_helpQueryEmail"]);
            
            //starting part 2
            //sbBodyTextString.AppendLine("EmailFormId2: " + sEmailFormId2);
            sbBodyTextString.AppendLine("GuestTitle: " + _helpQuerySalutation.SelectedValue);
            sbBodyTextString.AppendLine("Guest Given Name: " + Request.Form["helpQueryFirstName"]);
            sbBodyTextString.AppendLine("Guest Last Name: " + Request.Form["helpQueryLastName"]);
            sbBodyTextString.AppendLine("Email: " + Request.Form["email"]);
            string countrycode = CountryCode.SelectedValue;
            sbBodyTextString.AppendLine("Country: " + Request.Form["_helpQueryCountryList"]);
            char[] delimiterChars = { '(', ')' };
            string[] code = CountryCode.SelectedItem.ToString().Split(delimiterChars);
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
                
        }
        sbBodyTextString.AppendLine("Booking Reference: " + Request.Form["bookingReferenceNumber"]);
        sbBodyTextString.AppendLine("Baggage Reference: " + Request.Form["baggageReferenceNumber"]);

        // Capture bank information
        if (bankCheckBox.Checked)
        {
            sbBodyTextString.AppendLine("Bank Name: " + Request.Form["bankName"]);
            sbBodyTextString.AppendLine("Country of Bank: " + Request.Form["BankCountry"]);
            sbBodyTextString.AppendLine("Currency: " + Request.Form["Currency"]);
            sbBodyTextString.AppendLine("Account Holder Name: " + Request.Form["accountHolderName"]);
            sbBodyTextString.AppendLine("Account Number: " + Request.Form["accountNumber"]);
            sbBodyTextString.AppendLine("Swift (BIC) Code: " + Request.Form["swiftCode"]);
            sbBodyTextString.AppendLine("IBAN Number: " + Request.Form["ibanNumber"]);
            sbBodyTextString.AppendLine("Code Number: " + Request.Form["codeNumber"]);
        }    

        sbBodyTextString.AppendLine("Comments: " + _helpQueryAdditionInformation.Text.ToString());

        return sbBodyTextString.ToString(); 
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        Page.Validate();


        string selectedCountry = Request.Form["_helpQueryCountryList"];
        MailMessage _helpMessage = new MailMessage();
        _helpMessage.From = new MailAddress(ConfigurationManager.AppSettings["ContactUsFromAddress"]);
        if (Request.Form["_helpQueryCountryList"] == "USA" || Request.Form["_helpQueryCountryList"] == "CAN")
        {
            _helpMessage.To.Add(ConfigurationManager.AppSettings["USAUpdateToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["USAUpdateSubject"];
        }
        else
        {
            _helpMessage.To.Add(ConfigurationManager.AppSettings["OthersUpdateToAddress"]);
            _helpMessage.Subject = ConfigurationManager.AppSettings["OthersUpdateSubject"];
        }

        string _messgebody = BuildMessageBody(Request.Form["_helpQueryCountryList"]);
        SmtpClient SMTPServer = new SmtpClient();
        AlternateView PlainText;
        PlainText = AlternateView.CreateAlternateViewFromString(_messgebody, null, "text/plain");
        _helpMessage.AlternateViews.Add(PlainText);
        _helpMessage.BodyEncoding = Encoding.UTF8;
        _helpMessage.SubjectEncoding = Encoding.UTF8;

        //file upload
        if (_helpQueryFileUploader.HasFile)
        {

            _helpMessage.Attachments.Add(new System.Net.Mail.Attachment(_helpQueryFileUploader.PostedFile.InputStream, _helpQueryFileUploader.FileName));
        }
        
        if (_helpQueryFileUploader2.HasFile)
        {

            _helpMessage.Attachments.Add(new System.Net.Mail.Attachment(_helpQueryFileUploader2.PostedFile.InputStream, _helpQueryFileUploader2.FileName));
        }
        
        
        if (_helpQueryFileUploader3.HasFile)
        {

            _helpMessage.Attachments.Add(new System.Net.Mail.Attachment(_helpQueryFileUploader3.PostedFile.InputStream, _helpQueryFileUploader3.FileName));
        }
        
        
        //send message
        try
        {
            SMTPServer.Send(_helpMessage);
            Response.Redirect("ThankYou.aspx?sender=RequestUpdate.aspx&message=" + Server.UrlEncode("Request Update"));


            _helpMessage.Dispose();
        }
        catch (SmtpException smtpEx)
        {
            var ls = smtpEx.ToString().Replace("\r", "").Replace("\n", "");
            Response.Redirect("ErrorPage.aspx?sender=RequestUpdate.aspx&error=" + ls);
        }

    }

    
}