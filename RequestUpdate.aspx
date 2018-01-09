<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RequestUpdate.aspx.cs" Inherits="RequestUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="js/style-2.css" />
    <link rel="stylesheet" href="js/screen.css"/>
    <link rel="stylesheet" href="js/Style-3.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/Common.css"/>
    <link rel="stylesheet" href="https://AstuteSolutions.com/distributable-assets/css/AerLingus/formStyle.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/js/jquery.validate.js"></script>
    <script src="/js/jquery-1.8.2.js"></script>
    
</head>
<body>
  
   
  <div id="page1" data-role="page">
    <form id="requestUpdateForm"  runat="server" autocomplete="off" >
        <div id="FirstInner" style="margin-left: 80px; margin-right: 172px;width:824px;height:auto;margin-top:10px"  class="gray-12-bg ">
                <div style="margin-left: 30px" >
                    <br />
                    <div>
                        <h2 id="RefNumberheader" class="xl2 tealGreen">Case/Reference Number</h2>
                        <p>Please enter your case/reference number</p>
                    </div>
                    <div class="input-container" >
                         <asp:TextBox type="text" style="width: 260px" ID="updateCaseID" MaxLength="7" Title="Please enter your case number" CssClass="form-control inline-label  " required="required"  runat="server" onblur="checkvalue(this)"/>
                         <asp:RangeValidator runat="server" id="rangeValidator1"
                             style="color:red;"
                             ValidationGroup="Submit" 
                             ErrorMessage="Please enter a number between 500000 and 9999999"
                             ControlToValidate="updateCaseID"
                             MaximumValue="9999999"
                             MinimumValue="500000"
                             Type="Integer">                             
                         </asp:RangeValidator>
                    </div>
                    <h2 class="xl2 tealGreen"> Contact Information</h2>
                    <div class="input-container" id="radioButtonContainer">
                        <asp:RadioButtonList runat="server" ID="guestGroup" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="radio-inline" onclick="radioButtonClicked()">
                            <asp:ListItem Text="I am the guest" Value="guest" Selected="True"/>
                            <asp:ListItem Text="I am the representative of the guest" Value="representative" style="margin-left: 100px"/>
                        </asp:RadioButtonList>
                    </div>
                    
                    <h4 id="header2" class="xl2 tealGreen" style="font-size: 1em">Guest Information</h4>                            
                    <table >   
                        <!-- First Row -->            
                        <tr>
                            <td>
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="_helpQuerySalutation"  Height="30px"  runat="server" Width="260px"  >
                                <asp:ListItem Text="Title" Value="Selected"  Selected="True" />
                                <asp:ListItem Text="Mr" Value="Mr." />
                                <asp:ListItem Text="Mrs" Value="Mrs." />
                                <asp:ListItem Text="Ms" Value="Ms." />
                                <asp:ListItem Text="Miss" Value="Miss." />
                                <asp:ListItem Text="Dr" Value="Dr." />
                                </asp:DropDownList>
               
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" id="helpQueryFirstName" title="Please enter your first name" name="helpQueryFirstName" class="form-control inline-label  " required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">First Name</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" id="helpQueryLastName" title="Please enter your family name" name="helpQueryLastName" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Family Name</label>
                                </div>
                            </td>
                        </tr>
                        <!-- End First Row -->
                    </table>
                    <div class="input-container" id="representativeName" style="display: none">
                        <h4 id="header1" class="xl2 tealGreen" style="font-size: 1em">Representative Information</h4>
                        <table>
                            <tr>
                                <td>
                                        <asp:DropDownList  CssClass="dropdown-toggle"  ID="RepresentativeDropDownList" Height="30px"  runat="server" Width="260px"  >
                                        <asp:ListItem Text="Title" Value="Selected"  Selected="True" />
                                        <asp:ListItem Text="Mr" Value="Mr." />
                                        <asp:ListItem Text="Mrs" Value="Mrs." />
                                        <asp:ListItem Text="Ms" Value="Ms." />
                                        <asp:ListItem Text="Miss" Value="Miss." />
                                        <asp:ListItem Text="Dr" Value="Dr." />
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px" id="representativeFirstName" title="Please enter your first name" name="representativeFirstName" class="form-control inline-label  "  onblur="checkvalue(this)"/>
                                        <label class="form-control-label">First Name</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px" id="representativeLastName" title="Please enter your family name" name="representativeLastName" class="form-control inline-label"  onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Family Name</label>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container" id="repCompanyNameDiv" style="display: none">
                                        <input type="text" name="repCompanyName" id="repCompanyName" style="width: 260px" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Company Name</label>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div> 
                    
                    <table> 
                        <!-- Second Row --> 
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <input type="email" name="_helpQueryEmail" id="_helpQueryEmail" style="width: 395px" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Email Address</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="email" name="email" id="email" style="width: 395px" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Confirm Email Address</label>
                                </div>
                            </td>
                        </tr>
                        <!-- Second Row --> 
                    </table>
                    <table>                         
                        <!-- Country and Phone Number Row --> 
                        <tr>
                            <td>
                                <asp:XmlDataSource ID="_helpQueryCountriesSource" runat="server" DataFile="Countries.xml" XPath="Countries/country" ></asp:XmlDataSource>
                                <div class="input-container" >
                                    <select class=" dropdown-toggle" name="_helpQueryCountryList" id="_helpQueryCountryList" style="width:260px;height:30px;text-align:left" required onchange="countrySelected()">
                        
                                     </select>
                  
                                </div>
                            </td>
                            <td>
                                <asp:XmlDataSource ID="_helpQueryCountryCode" runat="server" DataFile="CountryCodes.xml" XPath="CountryCode/AreaCode"></asp:XmlDataSource>
                                <asp:DropDownList  CssClass=" dropdown-toggle"  ID="CountryCode" Height="30px"  runat="server" Width="260px"  DataSourceID="_helpQueryCountryCode" DataTextField="name" DataValueField="value"></asp:DropDownList>
                             </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" pattern="[0-9]{5,12}" maxlength="12" title="Please use area code and local number" name="_helpQueryTelephoneNumber" id="_helpQueryTelephoneNumber" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Telephone Number</label>
                                </div>             
                            </td>
                         </tr>
                    </table>
                    <!-- End Country and Phone Number Row -->
                    
                    <!-------------------------------------------------------------------------------------------------------------------- -->
                    <div class="input-container" id="aerClubInfoDiv">
                        <table>
                            <tr>
                                <td class="auto-style1">
                                    <select  class=" dropdown-toggle" style="height:30px;width:260px" name="_helpQueryAerClubDropDown" id="_helpQueryAerClubDropDown" runat="server">
                                        <option value="Selected" selected="selected">AerClub Tier</option>
                                        <option value="Concierge" >Concierge</option>
                                        <option value="Platinum">Platinum</option>
                                        <option value="Silver" >Silver</option>
                                        <option value="Green" >Green</option>
                                        <option value="Not a Member">Not a member</option>
                                    </select>
                                </td>
                             
                                <td class="auto-style1" id="ClubMembership">
                                    <div class="input-container" id="ClubMembershipDiv" style="display:none;">
                                        <input type="text" maxlength="16" name="_helpQueryAerClubmembershipId" id="_helpQueryAerClubmembershipId" style="width: 260px" pattern="[0-9]{16}" title="Please Enter your 16 Digit AerClub Membership Number" disabled="disabled" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">AerClub Membership Number</label>
                                    </div>
                                </td> 
                             </tr>
                        </table>    
                                                     
                    </div>
                    <!-------------------------------------------------------------------------------------------------------------------- -->
                    <div class="input-container" id="relationToGuestDiv" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <select class=" dropdown-toggle" style="height:30px;width:260px" name="relationshipToGuestDropDown" id="relationshipToGuestDropDown" runat="server">
                                        <option value="Selected" selected="selected">Relationship to the guest</option>
                                        <option value="Assistant/Colleague">Assistant/Colleague</option>
                                        <option value="Consumer Group">Consumer Group</option>
                                        <option value="Family/Friend">Family/Friend</option>
                                        <option value="GSA/GHA">GSA/GHA</option>
                                        <option value="Legal Representative">Legal Representative</option>
                                        <option value="Travel Agent/Tour Operator">Travel Agent/Tour Operator</option>
                                        <option value="Travel Management Company">Travel Management Company</option>
                                    </select>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px" id="companyCaseNumber" title="Please enter your case number" name="companyCaseNumber" class="form-control inline-label  " onblur="checkvalue(this);"/>
                                        <label class="form-control-label">Internal Case Number</label>
                                    </div>
                                </td>
                                
                            </tr>
                        </table>
                        
                    </div>
                    <!-------------------------------------------------------------------------------------------------------------------- -->
                    <table>                        
                        <tr>
                            <td> 
                                <h2 class="xl2 tealGreen"> Additional Information</h2>  
                            </td>
                         </tr>
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <input type="text" id="bookingReferenceNumber" name="bookingReferenceNumber" style="width: 260px; text-transform: uppercase"  pattern="^[2][0-9a-zA-Z]{5}" maxlength="6" title="Enter your booking reference. Must start with a 2, contain letters and numbers" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label id="bookingReferenceLabel" class="form-control-label">Booking Reference</label>
                                </div> 
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" id="baggageReferenceNumber" name="baggageReferenceNumber" style="width: 260px; text-transform: uppercase" maxlength="10" title="Enter your baggage reference." class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label id="baggageReferenceLabel" class="form-control-label">Baggage Reference</label>
                                </div> 
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <p>  Please do not enter any payment card details into any data fields such as credit/debit card numbers and/or security codes. </p>
                    <div>
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:TextBox TextMode="MultiLine" onkeyup="Count()" Height="100" Width="525" id="_helpQueryAdditionInformation" maxlength="1000" runat="server"></asp:TextBox>
                                    <br />
                                    <font size="2">  <label id="_helpQueryCharCount" runat="server"  >Characters Remaining :1000</label> </font>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="bankDiv" style="display: block;">
                        <div style="margin-left: 20px;" >
                            <asp:CheckBox runat="server" ID="bankCheckBox" Text="Click here to add bank details"  CssClass="checkbox"/>
                        </div> 
                        <div id="bankInfoDiv" style="display: none;">
                            <table>
                                <tr>
                                    <td>
                                        <div class="input-container" >
                                            <input type="text" id="accountHolderName" name="accountHolderName" maxlength="40" style="width: 260px" title="Account Holder Name" class="form-control inline-label  " onblur="checkvalue(this)" />
                                            <label class="form-control-label">Account Holder Name</label>
                                        </div>
                                        </td>
                                        <td>
                                            <div class="input-container" >
                                                <input type="text" id="accountNumber" name="accountNumber" maxlength="25" style="width: 260px" title="Account Number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                                <label class="form-control-label">Account Number</label>
                                            </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="input-container" >
                                            <input type="text" id="bankName" name="bankName" maxlength="40" style="width: 260px" title="Bank Name" class="form-control inline-label  " onblur="checkvalue(this)" />
                                            <label class="form-control-label">Bank Name</label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-container" >
                                            <label class="visuallyhidden">Select your Bank's Country</label>
                                            <asp:XmlDataSource ID="xmlBankCountry" runat="server" DataFile="BankCountries.xml" XPath="BankCountry/Country"></asp:XmlDataSource>
                                            <asp:DropDownList  CssClass=" dropdown-toggle"  ID="BankCountry" Height="30px"  runat="server" Width="260px"  DataSourceID="xmlBankCountry" DataTextField="name" DataValueField="value"></asp:DropDownList>                                
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-container" >
                                            <label class="visuallyhidden">Select your Currency</label>
                                            <asp:XmlDataSource ID="xmlCurrency" runat="server" DataFile="Currency.xml" XPath="BankCurrency/Currency"></asp:XmlDataSource>
                                            <asp:DropDownList  CssClass=" dropdown-toggle"  ID="Currency" Height="30px"  runat="server" Width="260px"  DataSourceID="xmlCurrency" DataTextField="name" DataValueField="value"></asp:DropDownList>                                
                                        </div>
                                    </td>
                                </tr>
                        
                                <tr>
                                    <td>
                                        <div class="input-container" >
                                            <input type="text"  id="swiftCode" name="swiftCode" maxlength="15" style="width: 260px" title="Swift (BIC) Code" class="form-control inline-label  " onblur="checkvalue(this)" />
                                            <label class="form-control-label">Swift (BIC) Code</label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-container" >
                                            <input type="text"  id="ibanNumber" name="ibanNumber" maxlength="34" style="width: 260px" title="IBAN Number" class="form-control inline-label  "  onblur="checkvalue(this)" />
                                            <label class="form-control-label">IBAN Number</label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-container" >
                                            <input type="text"  id="codeNumber" name="codeNumber" maxlength="15" style="width: 260px" title="Sort Code/Routing Number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                            <label class="form-control-label">Sort Code/Routing Number</label>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br/>
                        <br/>
                    </div>
                    <table width="900">
                        <tr>
                            <td colspan="3"> Please upload all the relevant documentation with your request so it can be processed.</td>
                        </tr>
                        <tr>
                            <td colspan="3">To add more than one file, simply click the '+' sign:</td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <asp:Label BorderWidth="0" ID="_helpQueryFileUploadLabel" runat="server" Text="File To Upload:"></asp:Label>  
                                <asp:FileUpload ID="_helpQueryFileUploader"  onchange="return CheckFile(this);" runat="server" />
                            </td>
                            <td>    
                                <button type="button" title="Add another file" id="addFile2" class="transparentBtn" aria-label="Click to add an additional file">+</button>
                            </td>
                            </tr>
                    </table>
                    <div id="file2" style="display: none;">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label BorderWidth="0" ID="_helpQueryFileUploadLabel2" runat="server" Text="File To Upload:"></asp:Label>  
                                    <asp:FileUpload ID="_helpQueryFileUploader2"  onchange="return CheckFile(this);" runat="server" />
                                </td>
                                <td>    
                                    <button type="button" title="Add another file" id="addFile3" class="transparentBtn" aria-label="Click to add an additional file">+</button>
                                </td>
                                <td>
                                    <button type="button" title="Remove file" id="removeFile2" class="transparentBtn" aria-label="Click to remove an additional file">-</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="file3" style="display: none;">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label BorderWidth="0" ID="_helpQueryFileUploadLabel3" runat="server" Text="File To Upload:"></asp:Label>  
                                    <asp:FileUpload ID="_helpQueryFileUploader3"  onchange="return CheckFile(this);" runat="server" />
                                </td>
                                <td>    
                                    <button type="button" title="Add another file" id="addFile4" class="transparentBtn" aria-label="Click to add an additional file">+</button>
                                </td>
                                <td>
                                    <button type="button" title="Remove file" id="removeFile3" class="transparentBtn" aria-label="Click to remove an additional file">-</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="file4" style="display: none;">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label BorderWidth="0" ID="_helpQueryFileUploadLabel4" runat="server" Text="File To Upload:"></asp:Label>  
                                        <asp:FileUpload ID="_helpQueryFileUploader4"  onchange="return CheckFile(this);" runat="server" />
                                    </td>
                                    <td>    
                                        <button type="button" title="Add another file" id="addFile5" class="transparentBtn" aria-label="Click to add an additional file">+</button>
                                    </td>
                                    <td>
                                        <button type="button" title="Remove file" id="removeFile4" class="transparentBtn" aria-label="Click to remove an additional file">-</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="file5" style="display: none;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label BorderWidth="0" ID="_helpQueryFileUploadLabel5" runat="server" Text="File To Upload:"></asp:Label>  
                                            <asp:FileUpload ID="_helpQueryFileUploader5"  onchange="return CheckFile(this);" runat="server" />
                                        </td>
                                        <td>
                                            <button type="button" title="Remove file" id="removeFile5" class="transparentBtn" aria-label="Click to remove an additional file">-</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                    <table width="100%">
                        <tr>
                            <td colspan="3"><font  face="ARIAL" size="1" >Maximum size limit 3 MB per file. The combined file size cannot exceed 10 MB.</font></td>
                        </tr>
                    </table>
                <div style="margin-left: 350px" >
                    <asp:Button ID="Submitbtn" CssClass="button button-standard button-shamrockGreen-gradient" runat="server" Text="Submit"  ValidationGroup="Submit" OnClick="SubmitButton_Click"></asp:Button>
                </div>

    </form> 
  </div>  
            
            
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script type="text/javascript">

// show files div
        $(document).ready(function () {
            $("#addFile2").click(function () {
             $("#file2").show();
                });
            });
        $(document).ready(function () {
            $("#addFile3").click(function () {
             $("#file3").show();
                });
            });

        $(document).ready(function () {
            $("#addFile4").click(function () {
             $("#file4").show();
                });
            });
        $(document).ready(function () {
            $("#addFile5").click(function () {
             $("#file5").show();
                });
            });
//hide files div
            $(document).ready(function () {
            $("#removeFile2").click(function () {
             $("#file2").hide();
                });
            });
        $(document).ready(function () {
            $("#removeFile3").click(function () {
             $("#file3").hide();
                });
            });

        $(document).ready(function () {
            $("#removeFile4").click(function () {
             $("#file4").hide();
                });
            });
        $(document).ready(function () {
            $("#removeFile5").click(function () {
             $("#file5").hide();
                });
            });

//date picker
         $(function () {
             $("#_helpQueryDateOfFlight").datepicker({ dateFormat: 'dd-M-yy' });
             $("#dateOfFlight2").datepicker({ dateFormat: 'dd-M-yy' });
             $("#dateOfFlight3").datepicker({ dateFormat: 'dd-M-yy' });
             $("#dateOfFlight4").datepicker({ dateFormat: 'dd-M-yy' });
         });

         $("#_helpQueryCountryList").change(function () {
             $("#CountryCode").val(this.value);

         });

         $("#_helpQueryAerClubDropDown").change(function () {
             if(this.value!="Selected" && this.value!="Not a Member") 
             {
                 $("#_helpQueryAerClubmembershipId").attr("disabled", false);
                 var div1 = document.getElementById('ClubMembershipDiv');
                 document.getElementById('_helpQueryAerClubmembershipId').required = true;
                 div1.style.display = "block";
                 ValidatorEnable(document.getElementById("_helpQueryDefListValidator"), true);
             } else {
                 $("#_helpQueryAerClubmembershipId").attr("disabled", true);
                 document.getElementById('_helpQueryAerClubmembershipId').required = false;
                 $("#ClubMembershipDiv").hide();
                 var div2 = document.getElementById('ClubMembershipDiv');
                 div2.style.display = "none";
                 ValidatorEnable(document.getElementById("_helpQueryDefListValidator"), false);
             }
         });

            //$("#_helpQueryCountryList").change(function () {
             //if(this.value!="USA" && this.value!="IRL" && this.value!="CAN" && this.value!="GBR" ) 
             //{
             //    var div1 = document.getElementById('bankDiv');
             //    div1.style.display = "block";
             //} else {
             //    var div1 = document.getElementById('bankDiv');
             //    div1.style.display = "none";
             //}
         //});

         $("#<%=bankCheckBox.ClientID %>").change(function() {
             var bankDiv = document.getElementById('bankInfoDiv');
             var checked = this.checked;
             if (checked == true) {
                 bankDiv.style.display = "block";
                 //Commenting the next three lines out since it might be required.
                 //document.getElementById('bankName').required = true;
                 //document.getElementById('accountHolderName').required = true;
                 //document.getElementById('accountNumber').required = true;
             } else {
                 bankDiv.style.display = "none";
             } 
                 

         });


         setSelect('#_helpQueryCountryList', 'Countries.xml', 'countries');

         function setSelect(selectid, xmlpath, xmlnode) {
             var loadingtext = '-- Loading --';
             var loadinghtml = '<option value="">' + loadingtext + '</option>';
             var randomno = Math.ceil(Math.random() * 999);

             $(selectid).html(loadinghtml);

             $.ajax({
                 url: xmlpath + '?=rn' + randomno,
                 success: function (xml) {
                     parseSelectXML(xml, selectid, xmlnode)
                 },
                 error: function (xhr, ajaxOptions, thrownError) {
                     alert(xhr.status);
                     alert(thrownError);
                 }
             });
         }

        

         

         function parseSelectXML(xml, selectid, xmlnode) {
             var firstoption = 'Select Country';
             var firsthtml = '<option value="">' + firstoption + '</option>';
             var selecthtml = '';

             $(xml).find(xmlnode).each(function () {

                 var selecttext = $(this).find('ID').attr('value');
                 var selectvalue = $(this).find('Name').attr('value');
                 selecthtml += '<option value="' + selectvalue + '">' + selecttext + '</option>';
             });

             $(selectid).html(firsthtml + selecthtml);
         }




         function IsEmail(email) {
             var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
             if (!regex.test(email)) {
                 return false;
             } else {
                 return true;
             }
         }

         function setSelectQuery(selectid, xmlpath, xmlnode) {
             var loadingtext = '-- Loading --';
             var loadinghtml = '<option value="">' + loadingtext + '</option>';
             var randomno = Math.ceil(Math.random() * 999);

             $(selectid).html(loadinghtml);

             $.ajax({
                 url: xmlpath + '?=rn' + randomno,
                 success: function (xml) {
                     parseSelectXML1(xml, selectid, xmlnode)
                 },
                 error: function (xhr, ajaxOptions, thrownError) {
                     alert(xhr.status);
                     alert(thrownError);
                 }
             });
         }

         
         function parseSelectXML1(xml, selectid, xmlnode) {
             var firstoption = '-- Please Select --';
             var firsthtml = '<option value="">' + firstoption + '</option>';
             var selecthtml = '';

             $(xml).find(xmlnode).each(function () {

                 var selecttext = $(this).find('ID').attr('value');
                 var selectvalue = $(this).find('ID').attr('value');
                 selecthtml += '<option value="' + selectvalue + '">' + selecttext + '</option>';
             });

             $(selectid).html(firsthtml + selecthtml);
         }

         function radioButtonClicked() {
             var radioSelected = $('#<%= guestGroup.ClientID %> input:checked').val();
             if (radioSelected == 'guest') {
                 guestRadioBtnSelected();
             } else {
                 repRadioBtnSelected();
             }
         }

         function guestRadioBtnSelected() {
             // hide representative name input row
             var divRepName = document.getElementById('representativeName');
             // hide company name input row
             divRepName.style.display = "none";
             var repCompanyNameDiv = document.getElementById('repCompanyNameDiv');
             document.getElementById('representativeFirstName').required = false;
             document.getElementById('representativeLastName').required = false;
             var aerClubDiv = document.getElementById('aerClubInfoDiv');
             aerClubDiv.style.display = "block";
             document.getElementById('relationshipToGuestDropDown').required = false;

             document.getElementById('repCompanyName').required = false;
             repCompanyNameDiv.style.display = "none";
             var aerClubDropDown = document.getElementById('_helpQueryAerClubDropDown');
             aerClubDropDown.style.display = "block";
             var relationshipToGuestDiv = document.getElementById('relationToGuestDiv');
             relationshipToGuestDiv.style.display = 'none';
         }

         function repRadioBtnSelected() {
             // show representative name input row
             var divRepName = document.getElementById('representativeName');
             divRepName.style.display = "block";
             // show company name input row
             var repCompanyNameDiv = document.getElementById('repCompanyNameDiv');
             repCompanyNameDiv.style.display = "block";
             // make necessary fields required
             document.getElementById('representativeFirstName').required = true;
             document.getElementById('representativeLastName').required = true;
             document.getElementById('repCompanyName').required = true;
             var aerClubDiv = document.getElementById('aerClubInfoDiv');
             aerClubDiv.style.display = "none";
             var relationshipToGuestDiv = document.getElementById('relationToGuestDiv');
             relationshipToGuestDiv.style.display = 'block';
             document.getElementById('relationshipToGuestDropDown').required = true;
             
         }

         


     </script>
                        <script type="text/javascript">
                            var validFileSize = 3 * 1024 * 1024;
                            var maxTotalFileSize = 10 * 1024 * 1024;
                            var totalFileSize = 0; 

                            function CheckFileSize(file) {
                                /*global document: false */
                                var fileSize = file.files[0].size;
                                totalFileSize = totalFileSize + fileSize;
                                var isValidFile = false;
                                if (fileSize !== 0 && fileSize <= validFileSize) {
                                    isValidFile = true;
                                }
                                else {
                                    file.value = null;
                                    alert("File Size Should be Greater than 0 and less than 3 MB.");
                                }

                                if (totalFileSize < maxTotalFileSize){
                                    isValidFile = true;
                                }
                                else {
                                    file.value = null;
                                    totalFileSize = totalFileSize - fileSize; //remvoving value
                                    alert("The combined file size cannot exceed 10 MB.");
                                }
                                return isValidFile;
                            }
                        </script>
                            <script type="text/javascript">
                                function CheckFile(file) {

                                    isValidFile = CheckFileSize(file);

                                    return isValidFile;
                                }
                                function checkvalue(value) {
                                    var inputelement = document.getElementById(value.id);
                                    if (value.id == "email") {
                                        var email = document.getElementById("_helpQueryEmail");

                                        if (inputelement.value != email.value) {

                                            alert("Emails do not match");
                                            $("#Submitbtn").attr("disabled", true);

                                        } else {
                                            $("#Submitbtn").attr("disabled", false);
                                        }
                                    }

                                    if (inputelement.value != "") {
                                        inputelement.classList.add("filled");
                                    } else if (inputelement.value == "") {
                                        inputelement.classList.remove("filled");
                                    }

                                }


                                $(function () {
                                    $("#_helpQueryForm").validate({
                                        rules: {

                                            _helpQueryEmail: {
                                                required: true
                                            },
                                            email: {
                                                required: true,
                                                equalTo: "#_helpQueryEmail"
                                            },

                                            helpQueryFirstName: "required",
                                            helpQueryLastName: "required"
                                        },
                                        messages: {
                                            helpQueryFirstName: "Please enter your firstname",
                                            helpQueryLastName: "Please enter your lastname",

                                        }

                                    });
                                });

                                $.validator.setDefaults({
                                    submitHandler: function () {
                                        alert("submitted!");
                                    }
                                });
                            </script>
     
</body>
</html>
