<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RefundRequest.aspx.cs" Inherits="css_RefaundRequest" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--
     <link rel="stylesheet" href="css/NeedHelp.css"/>
    -->       
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
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
     <script src = "https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js" type="text/javascript"></script>
    <script src="/js/jquery.js"></script>
    <script type="text/javascript">
        function Count() {

            var i = document.getElementById("_helpQueryAdditionInformation").value.length;
            document.getElementById("_helpQueryCharCount").innerHTML = "Characters Remaining : " + (1000 - i);

        }

        function validateForm() {
            var x = document.forms["_helpQueryForm"]["_helpQueryFirstName"].value;
            if (x == null || x == "") {
                alert("First name must be filled out");
                return false;
            }
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
            document.getElementById('relationshipToGuestDropDown').required = false;
            document.getElementById('repCompanyName').required = false;
            repCompanyNameDiv.style.display = "none";
            var aerClubDropDown = document.getElementById('_helpQueryAerClubDropDown');
            aerClubDropDown.style.display = "block";
            var relationshipToGuestDiv = document.getElementById('relationshipToGuestDropDownDiv');
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
            document.getElementById('relationshipToGuestDropDown').required = true;
            document.getElementById('repCompanyName').required = true;
            var relationshipDropDown = document.getElementById('relationshipToGuestDropDownDiv');
            relationshipDropDown.style.display = "block";
            var divRepName = document.getElementById('representativeName');
            divRepName.style.display = "block";
            
            var aerClubDropDown = document.getElementById('_helpQueryAerClubDropDown');
            aerClubDropDown.style.display = "none";
            var relationshipToGuestDiv = document.getElementById('relationshipToGuestDropDownDiv');
            relationshipToGuestDiv.style.display = 'block';
        }

        function countrySelected()
        {
            var country = $('#_helpQueryCountryList').find(":selected").text();
            if (country == "United States of America")
            {
                $('#countryState').attr('maxlength', 2);
            }
            else
            {
                $('#countryState').attr('maxlength', 4);
            }
            
        }

    </script>  
    
   
  
<body>
  
   
  <div id="page1" data-role="page">
    <form id="_helpQueryForm"  runat="server" autocomplete="off" >
        <!-- 
        <div>
        -->
            <div style="margin-left: 80px; margin-right: 172px;width:824px;height:auto;margin-top:10px"  class="gray-12-bg ">
                <div style="margin-left: 30px" >
                    <br />
                    <h2 class="xl2 tealGreen"> Contact Information</h2>
                    <br/>
                    <div class="input-container" id="radioButtonContainer">
                        
                        <asp:RadioButtonList runat="server" ID="guestGroup" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="radio-inline" onclick="radioButtonClicked()">
                            <asp:ListItem Text="I am the guest" Value="guest" Selected="True"/>
                            <asp:ListItem Text="I am the representative of the guest" Value="representative" />
                        </asp:RadioButtonList>
                        <br/>
                        <br/>
                    </div>
                    
                    <h4 id="header2" class="xl2 tealGreen" style="font-size: 1em">Guest Information</h4>                            
                    <table >   
                        <!-- First Row -->            
                        <tr>
                            <td>
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="_helpQuerySalutation" Height="30px"  runat="server" Width="260px"  >
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
                                    <input type="text" style="width: 260px" id="helpQueryFirstName" title="Please enter your first name" name="helpQueryFirstName" class="form-control inline-label  " required="required" onblur="checkvalue(this); autoPopulateFirstGuestName();"/>
                                    <label class="form-control-label">First Name</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" id="helpQueryLastName" title="Please enter your family name" name="helpQueryLastName" class="form-control inline-label" required="required" onblur="checkvalue(this); autoPopulateFirstGuestLastName(); "/>
                                    <label class="form-control-label">Family Name</label>
                                </div>
                            </td>
                        </tr>
                        <!-- End First Row -->
                    </table>

                    <div class="input-container" id="representativeName" style="display: none;">
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
                    </div>  

                    <div class="input-container" id="repCompanyNameDiv" style="display: none">
                        <input type="text" name="_helpQueryEmail" id="repCompanyName" style="width: 360px" class="form-control inline-label" onblur="checkvalue(this)"/>
                        <label class="form-control-label">Company Name</label>
                    </div>
                    <table> 
                        <!-- Second Row --> 
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <input type="email" name="_helpQueryEmail" id="_helpQueryEmail" style="width: 260px" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Email Address</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="email" name="email" id="email" style="width: 260px" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
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
                    <table>
                        <!-- Address Row --> 
                        <tr>
                            <td >
                                <div class="input-container" >
                                    <input type="text" name="addres1" id="address1" style="width: 260px" class="form-control inline-label" required="required" pattern="^\s*\S+(?:\s+\S+){2}" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Address 1</label>
                                </div> 
                            </td>
                            <td>
                                <div class="input-container">  
                                    <input type="text" name="address2" id="address2" style="width: 260px" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Address 2</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table> 
                    <!-- End of Address Row --> 
                     <!-- Sixth Row -->
                        <tr>
                            <td colspan="3">
                                <div class="input-container" >
                                    <input type="text" name="townCity" id="townCity" maxlength="20" style="width: 260px" title="town or city" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Town/City</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" name="countryState" id="countryState" maxlength="20" style="width: 260px" title="country or state" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Country/State</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" name="zipCode" id="zipCode" maxlength="20" style="width: 260px" title="postal zip code" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Postaly/Zip Code</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                        <div class="input-container" id="relationshipToGuestDropDownDiv" style="display:none;">
                            <select class=" dropdown-toggle" style="height:30px;width:260px" name="relationshipToGuestDropDown" id="relationshipToGuestDropDown" runat="server">
                                <option value="Selected" selected="selected">Relationship to the guest</option>
                                <option value="Travel Agent">Travel Agent</option>
                                <option value="Consumer Group">Consumer Group</option>
                                <option value="Family">Family</option>
                                <option value="Friend Assistant/Collegue">Friend Assistant/Collegue</option>
                            </select>
                        </div>
                    <!-------------------------------------------------------------------------------------------------------------------- -->
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
               
                    <table>
                        <tr>
                            <td>&nbsp</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <h2 class="xl2 tealGreen"> Flight Information (if applicable)</h2>
                            </td>
                        </tr>
                        <!-------------------------------------------------- -->
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <input type="text" id="_helpQuerybookingReferenceNumber" name="_helpQuerybookingReferenceNumber" style="width: 260px; text-transform: uppercase" pattern="^[2][0-9a-zA-Z]{5}" maxlength="6" title="Must start with a 2, contain letters and numbers" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Booking Reference</label>
                                </div>                               
                            </td>       
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <input type="text" name="_helpQueryFlightNumber" id="_helpQueryFlightNumber" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Flight Number</label>
                                </div>
                            </td>
                             <td>
                                <asp:TextBox  ID="_helpQueryDateOfFlight" runat="server" Text="Flight Date"   Width="260px" Height="30px"  CssClass="textboxborder" required="required" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="DateValidator" ControlToValidate="_helpQueryDateOfFlight" InitialValue="Flight Date" runat="server"></asp:RequiredFieldValidator>
                            </td>                         
                        </tr>
                        <!----------------------------------------------------  -->
                        <tr>
                            <td>
                                <div class="input-container">
                                    <input type="text" id="QueryFlightNumber2" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Flight Number</label> 
                                </div>
                            </td>
                            <td>
                                <asp:TextBox  ID="dateOfFlight2" runat="server" Text="Flight Date"   Width="260px" Height="30px"  CssClass="textboxborder" required="required" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="DateValidator2" ControlToValidate="dateOfFlight2" InitialValue="Flight Date" runat="server"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <!------------------------------------------------- --> 
                        <tr>
                            <td>
                                <div class="input-container">
                                    <input type="text" id="QueryFlightNumber3" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Flight Number</label> 
                                </div>
                            </td>
                            <td>
                                <asp:TextBox  ID="dateOfFlight3" runat="server" Text="Flight Date"   Width="260px" Height="30px"  CssClass="textboxborder" required="required" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="DateValidator3" ControlToValidate="dateOfFlight3" InitialValue="Flight Date" runat="server"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <!------------------------------------------------- -->
                        <tr>
                            <td>
                                <div class="input-container">
                                    <input type="text" id="QueryFlightNumber4" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Flight Number</label> 
                                </div>
                            </td>
                            <td>
                                <asp:TextBox  ID="dateOfFlight4" runat="server" Text="Flight Date"   Width="260px" Height="30px"  CssClass="textboxborder" required="required" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="DateValidator4" ControlToValidate="dateOfFlight4" InitialValue="Flight Date" runat="server"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <div class="input-container">
                                    <input type="text" id="bookingReferenceNumber4" style="width: 260px; text-transform: uppercase" pattern="^[2][0-9a-zA-Z]{5}" maxlength="6" title="Must start with a 2, contain letters and numbers" class="form-control inline-label" onblur="checkvalue(this)"/> 
                                    <label class="form-control-label">Booking Reference</label>   
                                </div>
                            </td>
                        </tr>
                        <!------------------------------------------------- -->
                        <tr>
                            <td>
                                <br/>
                                <br/>
                                <br/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="salutationGuest1" Height="30px"  runat="server" Width="260px"  >
                                    <asp:ListItem Text="Title" Value="Selected"  Selected="True" />
                                    <asp:ListItem Text="Mr" Value="Mr." />
                                </asp:DropDownList>
               
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" id="helpQueryFirstName1" name="helpQueryFirstName2" class="form-control inline-label"  />
                                    <label class="form-control-label">First Name</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" id="helpQueryLastName1"  name="helpQueryLastName" class="form-control focus inline-label" />
                                    <label class="form-control-label">Family Name</label>
                                </div>
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td>
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="salutationGuest2" Height="30px"  runat="server" Width="260px"  >
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
                                    <input type="text" style="width: 260px" id="helpQueryFirstName2" name="helpQueryFirstName2" class="form-control inline-label"  />
                                    <label class="form-control-label">First Name</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" id="helpQueryLastName2"  name="helpQueryLastName" class="form-control inline-label" />
                                    <label class="form-control-label">Family Name</label>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="salutationGuest3" Height="30px"  runat="server" Width="260px"  >
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
                                    <input type="text" style="width: 260px" id="helpQueryFirstName3" name="helpQueryFirstName2" class="form-control inline-label"  />
                                    <label class="form-control-label">First Name</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" id="helpQueryLastName3"  name="helpQueryLastName" class="form-control inline-label" />
                                    <label class="form-control-label">Family Name</label>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="salutationGuest4" Height="30px"  runat="server" Width="260px"  >
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
                                    <input type="text" style="width: 260px" id="helpQueryFirstName4" name="helpQueryFirstName2" class="form-control inline-label"  />
                                    <label class="form-control-label">First Name</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" id="helpQueryLastName4"  name="helpQueryLastName" class="form-control inline-label" />
                                    <label class="form-control-label">Family Name</label>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="salutationGuest5" Height="30px"  runat="server" Width="260px"  >
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
                                    <input type="text" style="width: 260px" id="helpQueryFirstName5" name="helpQueryFirstName2" class="form-control inline-label"  />
                                    <label class="form-control-label">First Name</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" id="helpQueryLastName5"  name="helpQueryLastName" class="form-control inline-label" />
                                    <label class="form-control-label">Family Name</label>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="salutationGuest6" Height="30px"  runat="server" Width="260px"  >
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
                                    <input type="text" style="width: 260px" id="helpQueryFirstName6" name="helpQueryFirstName2" class="form-control inline-label"  />
                                    <label class="form-control-label">First Name</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" id="helpQueryLastName6"  name="helpQueryLastName" class="form-control inline-label" />
                                    <label class="form-control-label">Family Name</label>
                                </div>
                            </td>
                        </tr>
                        

                        <tr>
                            <td>&nbsp</td>
                        </tr>
                        <tr>
                            <td> <h2 class="xl2 tealGreen"> Reason for Refund </h2></td>
                        </tr>
                        <tr>
                            <td colspan="3">*Please select the reason you are requesting a refund.</td>
                            
                        </tr>
                        <tr>
                            <td colspan="3">If you have more than one reason please choose the additional reasons </td>   
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList CssClass="dropdown-toggle" ID="refundReasonDropDownList1"  runat="server"  Height="30px" Width="260px">
                                    <asp:ListItem Text="-- Please Select --" Value="select"></asp:ListItem>
                                    <asp:ListItem Text="Flight Related" Value="flight"></asp:ListItem>
                                    <asp:ListItem Text="Fee Related" Value="fee"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="QuerytypeValidator" ControlToValidate="refundReasonDropDownList1" InitialValue="Selected" runat="server"/>
                            </td>
                            <td>
                                <select class=" dropdown-toggle" id="refundReason1" name="refundReason1"  runat="server" style="height:30px;width:260px" required>
                                    <option value="" selected="selected">-- Please Select --</option>
                                </select>
                                <asp:RequiredFieldValidator ID="refundReason1Validator" ControlToValidate="refundReason1" InitialValue="Default" runat="server" Enabled="false"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:DropDownList CssClass="dropdown-toggle" ID="refundReasonDropDownList2" Enabled="False"  runat="server"  Height="30px" Width="260px">
                                    <asp:ListItem Text="-- Please Select --" Value="select"></asp:ListItem>
                                    <asp:ListItem Text="Flight Related" Value="flight"></asp:ListItem>
                                    <asp:ListItem Text="Fee Related" Value="fee"></asp:ListItem>
                                </asp:DropDownList>
                 
                            </td>
                            <td>
                                <select class=" dropdown-toggle" id="refundReason2" name="refundReason2" disabled="True" runat="server" style="height:30px;width:260px" >
                                    <option value="selected" selected="selected">-- Please Select --</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList CssClass="dropdown-toggle" ID="refundReasonDropDownList3" Enabled="False" runat="server"  Height="30px" Width="260px">
                                    <asp:ListItem Text="-- Please Select --" Value="select"></asp:ListItem>
                                    <asp:ListItem Text="Flight Related" Value="flight"></asp:ListItem>
                                    <asp:ListItem Text="Fee Related" Value="fee"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <select class=" dropdown-toggle" id="refundReason3" name="refundReason3" disabled="True"  runat="server" style="height:30px;width:260px" >
                                    <option value="selected" selected="selected">-- Please Select --</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList CssClass="dropdown-toggle" ID="refundReasonDropDownList4" Enabled="False"  runat="server"  Height="30px" Width="260px">
                                    <asp:ListItem Text="-- Please Select --" Value="select"></asp:ListItem>
                                    <asp:ListItem Text="Flight Related" Value="flight"></asp:ListItem>
                                    <asp:ListItem Text="Fee Related" Value="fee"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <select class=" dropdown-toggle" id="refundReason4" name="refundReason4" disabled="True"  runat="server" style="height:30px;width:260px" >
                                    <option value="selected" selected="selected">-- Please Select --</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1">
                                <p>Do you need a letter from your insurance?</p>
                            </td>
                            <td colspan="2">
                                <div class="input-container">   
                                    <asp:RadioButtonList runat="server" ID="RadioButtonList1" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="radio-inline" onclick="radioButtonClicked()">
                                        <asp:ListItem Text="Yes" Value="yes" />
                                        <asp:ListItem Text="No" Value="no" Selected="True"/>
                                    </asp:RadioButtonList>
                                    <br/>
                                    <br/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp</td>
                        </tr>
                        <tr>
                            <td> 
                                <h2 class="xl2 tealGreen"> Comments</h2>  
                            </td>
                         </tr>
                        
                        
                        
                        

            
       </table>
          <p>  Please do not enter any payment card details into any data fields such as credit/debit card numbers and/or security codes. </p>
        <div>
            <table width="100%">
                  <tr>
                <td>
              <asp:TextBox TextMode="MultiLine" onkeyup="Count()" Height="100" Width="525" id="_helpQueryAdditionInformation" maxlength="1000" runat="server"></asp:TextBox>

                    <br />
                  <font size="2">  <label id="_helpQueryCharCount" runat="server"  >Characters Remaining :1000</label> </font>
                </td>
                </tr>
                 <tr>
			<td colspan="3"> Please upload all the relevant documentation with your request so it can be processed.</td>
		</tr>

                <tr>
                    <td colspan="3">

                        <asp:Label BorderWidth="0" ID="_helpQueryFileUploadLabel" runat="server" Text="File To Upload:"></asp:Label>
                           
                        <asp:FileUpload ID="_helpQueryFileUploader" onchange="return CheckFile(this);" runat="server" />
                    </td>
                </tr>
                <tr><td><font  face="ARIAL" size="1" >Maximum size limit 5 MB</font></td></tr>
            </table>
        </div>
        
        <br />
        <br />
      
       <div style="margin-left: 200px;padding:20px" >
      
           <asp:Button ID="Submitbtn" CssClass="button button-standard button-shamrockGreen-gradient" runat="server" Text="Submit"  ValidationGroup="Submit" OnClick="SubmitButton_Click"></asp:Button>
        </div>
            </div>
            </div>
        <!--
            </div>
            -->
    </form>
   
  
    
   </div> 
    <div style="margin:80px">
        
          
    </div>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script type="text/javascript">
         
         $(function () {
             $("#_helpQueryDateOfFlight").datepicker({ dateFormat: 'dd-M-yy' });
             $("#dateOfFlight2").datepicker({ dateFormat: 'dd-M-yy' });
             $("#dateOfFlight3").datepicker({ dateFormat: 'dd-M-yy' });
             $("#dateOfFlight4").datepicker({ dateFormat: 'dd-M-yy' });
         });

         $("#_helpQueryCountryList").change(function () {
             $("#_helpQueryTelephoneCode").val(this.value);

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

         $("#refundReasonDropDownList1").change(function () {
             if (this.value != "select") {
                 $("#_refundReason1").attr("Disabled", false);
             } else {
                 $("#refundReason1").attr("Disabled", true);
             }

             if (this.value == "flight") {
                 setSelectQuery('#refundReason1', 'RefundRequestInfo.xml', 'FlightRelated');
                 return;
             }

             if (this.value == "fee") {
                 setSelectQuery('#refundReason1', 'RefundRequestInfo.xml', 'FeeRelated');
                 return;
             }
         });

         $("#refundReason1")
             .change(function() {
                 if (this.selectedIndex  != 0) {
                     $("#<%=refundReasonDropDownList2.ClientID %>").attr('disabled', false);
                 } else {
                     //Reset the other drop downs
                     $("#<%=refundReasonDropDownList2.ClientID %>").prop('selectedIndex', 0);
                     $("#<%=refundReasonDropDownList3.ClientID %>").prop('selectedIndex', 0);
                     $("#<%=refundReasonDropDownList4.ClientID %>").prop('selectedIndex', 0);
                     $('#refundReason2').prop('selectedIndex', 0);
                     $('#refundReason3').prop('selectedIndex', 0);
                     $('#refundReason4').prop('selectedIndex', 0);
                     //Disable the other drop downs
                     $("#<%=refundReasonDropDownList2.ClientID %>").attr('disabled', true);
                     $("#<%=refundReasonDropDownList3.ClientID %>").attr('disabled', true);
                     $("#<%=refundReasonDropDownList4.ClientID %>").attr('disabled', true);
                    
                     $("#refundReason2").attr('disabled', true);
                     $("#refundReason3").attr('disabled', true);
                     $("#refundReason4").attr('disabled', true);

                 }
             });


         $("#refundReasonDropDownList2").change(function () {
             if (this.value != "select") {
                 $("#refundReason2").attr("Disabled", false);
             } else {
                 $("#refundReason2").attr("Disabled", true);
             }

             if (this.value == "flight") {
                 setSelectQuery('#refundReason2', 'RefundRequestInfo.xml', 'FlightRelated');
                 return;
             }

             if (this.value == "fee") {
                 setSelectQuery('#refundReason2', 'RefundRequestInfo.xml', 'FeeRelated');
                 return;
             }

         });

         $("#refundReason2")
             .change(function () {
                 if (this.selectedIndex != 0) {
                     $("#<%=refundReasonDropDownList3.ClientID %>").attr('disabled', false);
                 } else {
                     //Reset the other drop downs
                     $("#<%=refundReasonDropDownList3.ClientID %>").prop('selectedIndex', 0);
                     $("#<%=refundReasonDropDownList4.ClientID %>").prop('selectedIndex', 0);
                     $('#refundReason2').prop('selectedIndex', 0);
                     $('#refundReason3').prop('selectedIndex', 0);
                     $('#refundReason4').prop('selectedIndex', 0);
                     //Disable the other drop downs
                     $("#<%=refundReasonDropDownList3.ClientID %>").attr('disabled', true);
                     $("#<%=refundReasonDropDownList4.ClientID %>").attr('disabled', true);
                     $("#refundReason3").attr('disabled', true);
                     $("#refundReason4").attr('disabled', true);
                 }
             });

         $("#refundReasonDropDownList3").change(function () {
             if (this.value != "Selected") {
                 $("#refundReason3").attr("Disabled", false);
                 //$("#_requestRefundReasonInfo2").empty();
             } else {
                 $("#refundReason3").attr("Disabled", true);
             }

             if (this.value == "flight") {
                 setSelectQuery('#refundReason3', 'RefundRequestInfo.xml', 'FlightRelated');
                 return;
             }

             if (this.value == "fee") {
                 setSelectQuery('#refundReason3', 'RefundRequestInfo.xml', 'FeeRelated');
                 return;
             }

         });

         $("#refundReasonDropDownList4").change(function () {
             if (this.value != "Selected") {
                 $("#refundReason4").attr("Disabled", false);
             } else {
                 $("#refundReason4").attr("Disabled", true);
             }

             if (this.value == "flight") {
                 setSelectQuery('#refundReason4', 'RefundRequestInfo.xml', 'FlightRelated');
                 return;
             }

             if (this.value == "fee") {
                 setSelectQuery('#refundReason4', 'RefundRequestInfo.xml', 'FeeRelated');
                 return;
             }

         });

         $('#_helpQuerySalutation')
             .change(function() {
                 var salutation = this.value;
                 $('#<%=salutationGuest1.ClientID%> option:selected').text(salutation);
                 
                
             });

         function autoPopulateFirstGuestName() {
             var firstName = document.getElementById('helpQueryFirstName').value;
             document.getElementById('helpQueryFirstName1').classList.add('filled');
             var firstGuestName = document.getElementById('helpQueryFirstName1');
             firstGuestName.value = firstName;
         }

         function autoPopulateFirstGuestLastName() {
             var lastName = document.getElementById('helpQueryLastName').value;
             document.getElementById('helpQueryLastName1').classList.add('filled');
             var firstGuestLastName = document.getElementById('helpQueryLastName1');
             firstGuestLastName.value = lastName;
         }


     </script>
                        <script type="text/javascript">
                            var validFileSize = 5 * 1024 * 1024;

                            function CheckFileSize(file) {
                                /*global document: false */
                                var fileSize = file.files[0].size;
                                var isValidFile = false;
                                if (fileSize !== 0 && fileSize <= validFileSize) {
                                    isValidFile = true;
                                }
                                else {
                                    file.value = null;
                                    alert("File Size Should be Greater than 0 and less than 5 MB.");
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

