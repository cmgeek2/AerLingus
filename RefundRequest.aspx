<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RefundRequest.aspx.cs" Inherits="RefundRequest" EnableEventValidation="false" %>

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
    <script src="js/common.js"></script>
    <style>
        .gray-wide-bg {
            width: 900px;
            background-color: #f9f9f9;
        } 

     </style>
    
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
          var relationshipToGuestDiv = document.getElementById('relationshipToGuestDiv');
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
          var relationshipDropDown = document.getElementById('relationshipToGuestDiv');
          relationshipDropDown.style.display = "block";
          var divRepName = document.getElementById('representativeName');
          divRepName.style.display = "block";
            
          var aerClubDropDown = document.getElementById('_helpQueryAerClubDropDown');
          aerClubDropDown.style.display = "none";
          var relationshipToGuestDiv = document.getElementById('relationshipToGuestDiv');
          relationshipToGuestDiv.style.display = 'block';
      }

      function countrySelected()
      {
          var country = $('#_helpQueryCountryList').find(":selected").text();
          if (country == "United States of America")
          {
              $('#countryState').attr('maxlength', 2);
              $('#countryState').css({ 'text-transform': "uppercase" });

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
            <div style="margin-left: 80px; margin-right: 172px;height:auto;margin-top:10px"  class="gray-wide-bg ">
                <div style="margin-left: 30px" >
                    <h2 class="xl2 tealGreen"> Contact Information</h2>
                    <br/>
                    <div class="input-container" id="radioButtonContainer">
                        
                        <asp:RadioButtonList runat="server" ID="guestGroup" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="radio-inline" onclick="radioButtonClicked()">
                            <asp:ListItem Text="I am the guest" Value="guest" Selected="True"/>
                            <asp:ListItem Text="I am the representative of the guest" Value="representative" />
                        </asp:RadioButtonList>
                    </div>
                    
                    <h4 id="header2" class="xl2 tealGreen" style="font-size: 1em">Guest Information</h4>                            
                    <table >   
                        <!-- First Row -->            
                        <tr>
                            <td>
                                <select class="dropdown-toggle" runat="server" id="_helpQuerySalutation" style="height: 30px; width: 260px"></select>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px; text-transform: capitalize" id="helpQueryFirstName" title="Please enter your first name" name="helpQueryFirstName" class="form-control inline-label  " required="required" onblur="checkvalue(this); autoPopulateFirstGuestName();"/>
                                    <label class="form-control-label">First Name</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px; text-transform: capitalize" id="helpQueryLastName" title="Please enter your family name" name="helpQueryLastName" class="form-control inline-label" required="required" onblur="checkvalue(this); autoPopulateFirstGuestLastName(); "/>
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
                                    <select class="dropdown-toggle" runat="server" id="representativeSalutation" style="height: 30px; width: 260px"></select>
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
                        <input type="text" name="repCompanyName" id="repCompanyName" style="width: 395px" class="form-control inline-label" onblur="checkvalue(this)"/>
                        <label class="form-control-label">Company Name</label>
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
                    <table>
                        <!-- Address Row --> 
                        <tr>
                            <td >
                                <div class="input-container" >
                                    <input type="text" name="address1" id="address1" style="width: 395px" class="form-control inline-label" required="required" pattern="\d+(\s\S+)+" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Address 1</label>
                                </div> 
                            </td>
                            <td>
                                <div class="input-container">  
                                    <input type="text" name="address2" id="address2" style="width: 395px" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Address 2</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table> 
                        <tr>
                            <td colspan="3">
                                <div class="input-container" >
                                    <input type="text" name="townCity" id="townCity" maxlength="20" style="width: 260px" title="town or city" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Town/City</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" name="countryState" id="countryState" maxlength="20" style="width: 260px;" title="country or state" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">County/State</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" name="zipCode" id="zipCode" maxlength="20" style="width: 260px" title="postal zip code" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Postal/Zip Code</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div id="relationshipToGuestDiv" style="display: none">
                        <table>
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <select class=" dropdown-toggle" style="height:30px;width:260px" name="relationshipToGuestDropDown" id="relationshipToGuestDropDown" runat="server"></select>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" name="internalCaseNumber" id="internalCaseNumber" maxlength="20" style="width: 260px" title="postal zip code" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Internal Case Number</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                    </div>
                    
                        
                    <!-------------------------------------------------------------------------------------------------------------------- -->
                    <table>
                         <tr>
                            <td class="auto-style1">
                                <select  class=" dropdown-toggle" style="height:30px;width:260px" name="_helpQueryAerClubDropDown" id="_helpQueryAerClubDropDown" runat="server">
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
               
                    <table style="width: 100%">
                        <tr>
                            <td colspan="2">
                                <h2 class="xl2 tealGreen"> Flight Information</h2>
                            </td>
                        </tr>
                    </table>
                    <div>To add more than one flight, simply click the '+' sign:</div>
                    <!------------- Flight Section ------------------- -->
                    <div class="input-container" id="mainFlightInfoDiv">
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" name="_helpQueryFlightNumber" id="_helpQueryFlightNumber" maxlength="4" style="width: 260px" title="Please select a valid date" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Number</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container">
                                        <input type="text" id="_helpQueryDateOfFlight" name="_helpQueryDateOfFlight" style="width: 260px" title="Please select a date" required="required" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Date </label> 
                                    </div>
                                </td>  
                                <td>
                                    <div class="input-container" >
                                        <input type="text" id="_helpQuerybookingReferenceNumber" name="_helpQuerybookingReferenceNumber" style="width: 260px; text-transform: uppercase" pattern="^[2][0-9a-zA-Z]{5}" maxlength="6" title="Must start with a 2, contain letters and numbers" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Booking Reference</label>
                                    </div>                               
                                </td>    
                                <td>
                                    <button type="button" title="Add another flight" id="addFlightsButton1" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>                  
                            </tr>
                        </table>
                    </div>
                    <div class="input-container" id="secondFlightInfoDiv" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container">
                                        <input type="text" id="QueryFlightNumber2" name="QueryFlightNumber2" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Number</label> 
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container">
                                        <input type="text" id="dateOfFlight2" name="dateOfFlight2" maxlength="4" style="width: 260px"  title="Please select a valid date" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Date</label> 
                                    </div>
                                </td>
                                <td>
                                    <button type="button" title="Add another flight" id="addFlightsButton2" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>
                                <td>
                                    <button type="button" title="Remove this flight" id="removeFlightsButton2" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td>  
                            </tr>    
                        </table>
                    </div>
                    <div class="input-container" id="thirdFlightInfoDiv" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container">
                                        <input type="text" id="QueryFlightNumber3" name="QueryFlightNumber3" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Number</label> 
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container">
                                        <input type="text" id="dateOfFlight3" name="dateOfFlight3" maxlength="4" style="width: 260px"title="Please select a valid date" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Date</label> 
                                    </div>
                                </td>
                                
                                <td>
                                    <button type="button" title="Add another flight" id="addFlightsButton3" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>
                                <td>
                                    <button type="button" title="Remove this flight" id="removeFlightsButton3" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td> 

                            </tr>
                        </table>
                    </div>  
                    <div class="input-container" id="fourthFlightInfoDiv" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container">
                                        <input type="text" id="QueryFlightNumber4" name="QueryFlightNumber4" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Number</label> 
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container">
                                        <input type="text" id="dateOfFlight4" name="dateOfFlight4" maxlength="4" style="width: 260px" title="Please select a valid date" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Date</label> 
                                    </div>
                                </td>
                                <td>
                                    <button type="button" title="Remove this flight" id="removeFlightsButton4" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td> 
                            </tr>
                        </table>
                    </div>  
                    <!------------------------------------------------- -->
                    <br/>
                    <table style="width: 100%">
                        <tr>
                            <td colspan="2">
                                <h2 class="xl2 tealGreen"> Additional Guests (if applicable)</h2>
                            </td>
                        </tr>
                    </table>
                    <div>To add more than one guest, simply click the '+' sign:</div>
                    <div class="input-container" id="guest1div">
                        <table>
                            <tr>
                                <td>
                                    <select class="dropdown-toggle" runat="server" id="salutationGuest1" style="height: 30px; width: 260px"></select>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="firstGuestFirstName" name="firstGuestFirstName" class="form-control inline-label"  />
                                        <label class="form-control-label">First Name</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="firstGuestLastName"  name="firstGuestLastName" class="form-control focus inline-label" />
                                        <label class="form-control-label">Family Name</label>
                                    </div>
                                </td>
                                <td>
                                    <button type="button" title="Add another guest" id="addGuest1" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="input-container" id="guest2div" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <select class="dropdown-toggle" runat="server" id="salutationGuest2" style="height: 30px; width: 260px"></select>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="secondGuestFirstName" name="secondGuestFirstName" class="form-control inline-label"  onblur="checkvalue(this)"/>
                                        <label class="form-control-label">First Name</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="secondGuestLastName"  name="secondGuestLastName" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Family Name</label>
                                    </div>
                                </td>
                                <td>
                                    <button type="button" title="Add another guest" id="addGuest2" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>
                                <td>
                                    <button type="button" title="Remove this guest" id="removeGuest2" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td> 
                            </tr>
                        </table>
                    </div>
                    <div class="input-container" id="guest3div" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <select class="dropdown-toggle" runat="server" id="salutationGuest3" style="height: 30px; width: 260px"></select>              
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="thirdGuestFirstName" name="thirdGuestFirstName" class="form-control inline-label"  onblur="checkvalue(this)"/>
                                        <label class="form-control-label">First Name</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="thirdGuestLastName"  name="thirdGuestLastName" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Family Name</label>
                                    </div>
                                </td>
                                <td>
                                    <button type="button" title="Add another guest" id="addGuest3" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>
                                <td>
                                    <button type="button" title="Remove this guest" id="removeGuest3" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td> 
                            </tr>
                        </table>
                    </div>
                    <div class="input-container" id="guest4div" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <select class="dropdown-toggle" runat="server" id="salutationGuest4" style="height: 30px; width: 260px"></select>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="fourthGuestFirstName" name="fourthGuestFirstName" class="form-control inline-label" onblur="checkvalue(this)" />
                                        <label class="form-control-label">First Name</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="fourthGuestLastName"  name="fourthGuestLastName" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Family Name</label>
                                    </div>
                                </td>
                                <td>
                                    <button type="button" title="Add another guest" id="addGuest4" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>
                                <td>
                                    <button type="button" title="Remove this guest" id="removeGuest4" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td> 
                            </tr>
                        </table>
                    </div>
                    <div class="input-container" id="guest5div" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <select class="dropdown-toggle" runat="server" id="salutationGuest5" style="height: 30px; width: 260px"></select>               
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="fifthGuestFirstName" name="fifthGuestFirstName" class="form-control inline-label" onblur="checkvalue(this)" />
                                        <label class="form-control-label">First Name</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="fifthGuestLastName"  name="fifthGuestLastName" class="form-control inline-label" onblur="checkvalue(this) "/>
                                        <label class="form-control-label">Family Name</label>
                                    </div>
                                </td>
                                <td>
                                    <button type="button" title="Add another guest" id="addGuest5" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>
                                <td>
                                    <button type="button" title="Remove this guest" id="removeGuest5" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td> 
                            </tr>
                        </table>
                    </div>
                    <div class="input-container" id="guest6div" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <select class="dropdown-toggle" runat="server" id="salutationGuest6" style="height: 30px; width: 260px"></select>             
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="sixthGuestFirstName" name="sixthGuestFirstName" class="form-control inline-label" onblur="checkvalue(this)" />
                                        <label class="form-control-label">First Name</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="sixthGuestLastName"  name="sixthGuestLastName" class="form-control inline-label" onblur="checkvalue(this)" />
                                        <label class="form-control-label">Family Name</label>
                                    </div>
                                </td>
                                <td>
                                    <button type="button" title="Remove this guest" id="removeGuest6" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td> 
                            </tr>
                        </table>
                    </div>

                    <!------------------------------------------------- -->                           
                    <table style="width: 100%">
                        <tr>
                            <td> <h2 class="xl2 tealGreen"> Reason for Refund </h2></td>
                        </tr>
                        <tr>
                            <td colspan="3">*Please select the reason you are requesting a refund.</td>
                            
                        </tr>
                        <tr>
                            <td colspan="3">If you have more than one reason please choose the additional reasons </td>              
                        </tr>
                    </table>
                    <!-------------------------------------------------------------------------------------------------------------- -->
                    <!------ Refund Section ------------- -->
                    <div>To add more than one reason, simply click the '+' sign:</div>
                    <div class="input-container" id="refundReason1Div">
                        <table>
                            <tr>
                            <td>
                                <select class="dropdown-toggle" runat="server" id="refundReasonDropDownList1" style="height: 30px; width: 396px"></select>
                            </td>
                            <td>
                                <select class=" dropdown-toggle" id="refundReason1" name="refundReason1"  runat="server" style="height:30px;width:396px" required="required">
                                    <option value="">-- Please Select --</option>
                                </select>
                                <asp:RequiredFieldValidator ID="refundReason1Validator" ControlToValidate="refundReason1" InitialValue="Default" runat="server" Enabled="false"/>
                            </td>
                                <td>
                                    <button type="button" title="Add another guest" id="addRefundReason1" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>
                        </tr>
                        </table>
                    </div>
                    <div class="input-container" id="refundReason2Div" style="display: none">
                        <table>
                            <tr>
                            <td>
                                 <select class="dropdown-toggle" runat="server" id="refundReasonDropDownList2" style="height: 30px; width: 396px"></select>                 
                            </td>
                            <td>
                                <select class=" dropdown-toggle" id="refundReason2" name="refundReason2" disabled="True" runat="server" style="height:30px;width:396px" >
                                    <option value="selected" selected="selected">-- Please Select --</option>
                                </select>
                            </td>
                                <td>
                                    <button type="button" title="Add another guest" id="addRefundReason2" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>
                                <td>
                                    <button type="button" title="Remove this guest" id="removeRefundReason2" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td>
                        </tr>
                        </table>
                    </div>
                    <div class="input-container" id="refundReason3Div" style="display: none">
                        <table>
                            <tr>
                            <td>
                                <select class="dropdown-toggle" runat="server" id="refundReasonDropDownList3" style="height: 30px; width: 396px"></select> 
                            </td>
                            <td>
                                <select class=" dropdown-toggle" id="refundReason3" name="refundReason3" disabled="True"  runat="server" style="height:30px;width:396px" >
                                    <option value="selected" selected="selected">-- Please Select --</option>
                                </select>
                            </td>
                                <td>
                                    <button type="button" title="Add another guest" id="addRefundReason3" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>
                                <td>
                                    <button type="button" title="Remove this guest" id="removeRefundReason3" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td>
                        </tr>
                        </table>
                    </div>
                    <div class="input-container" id="refundReason4Div" style="display: none">
                        <table>
                            <tr>
                            <td>
                                <select class="dropdown-toggle" runat="server" id="refundReasonDropDownList4" style="height: 30px; width: 396px"></select>
                            </td>
                            <td>
                                <select class=" dropdown-toggle" id="refundReason4" name="refundReason4" disabled="True"  runat="server" style="height:30px;width:396px" >
                                    <option value="selected" selected="selected">-- Please Select --</option>
                                </select>
                            </td>
                                <td>
                                    <button type="button" title="Remove this guest" id="removeRefundReason4" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td>
                        </tr>
                        </table>
                    </div>  
                    <!-------------------------------------------------------------------------------------------------------------- -->  
                    <table style="width: 100%">    
                        <tr>
                            <td> 
                                <h2 class="xl2 tealGreen"> Comments</h2>  
                            </td>
                         </tr>           
                    </table>
                    <p>  Please use the comments section below to provide additional information that can assist us with your request. </p>
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
                            <tr><td colspan="3"><font  face="ARIAL" size="1" >Maximum size limit 5 MB</font></td></tr>
                        </table>
                    </div>        
                    <div style="margin-left: 350px;padding:20px" >      
                        <asp:Button ID="Submitbtn" CssClass="button button-standard button-shamrockGreen-gradient" runat="server" Text="Submit"  ValidationGroup="Submit" OnClick="SubmitButton_Click"></asp:Button>
                </div>
            </div>
            </div>
        <!--
            </div>Internal 
            -->
    </form>
   
  
    
   </div> 
    <div style="margin:80px">
        
          
    </div>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script type="text/javascript">
         
         setSelect('#_helpQuerySalutation', 'Titles.xml', 'title', 'Title');
         setSelect('#_helpQueryCountryList', 'Countries.xml', 'countries', 'Select Country');
         setSelect('#relationshipToGuestDropDown', 'Relationships.xml', 'relationship', 'Relationship to the guest');
         setSelect('#_helpQueryAerClubDropDown', 'AerClubTiers.xml', 'tier', 'AerClub Tier');
         setSelect('#representativeSalutation', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest1', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest2', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest3', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest4', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest5', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest6', 'Titles.xml', 'title', 'Title');
         setSelect('#refundReasonDropDownList1', 'RefundReasons.xml', 'reason', 'Refund Reason');
         setSelect('#refundReasonDropDownList2', 'RefundReasons.xml', 'reason', 'Refund Reason');
         setSelect('#refundReasonDropDownList3', 'RefundReasons.xml', 'reason', 'Refund Reason');
         setSelect('#refundReasonDropDownList4', 'RefundReasons.xml', 'reason', 'Refund Reason');
         

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

         
         //------------------------------------------------------------------------------------------------
         // Flights section
         //------------------------------------------------------------------------------------------------
         $("#addFlightsButton1")
             .click(function () {
                 addButtonclicked(1, "flights");
             });
         $('#addFlightsButton1').mouseup(function () { this.blur() });
         

         $('#addFlightsButton2')
             .click(function() {
                 addButtonclicked(2, "flights");
             });
         $('#removeFlightsButton2').click(function () {
             removeButtonClicked(2, "flights");
         });

         $('#addFlightsButton2').mouseup(function () { this.blur() });
         

         $('#addFlightsButton3').click(function() {
             addButtonclicked(3, "flights");
         });

         $('#removeFlightsButton3').click(function () {
             removeButtonClicked(3, "flights");
         });
         $('#addFlightsButton3').mouseup(function () { this.blur() });


        
         $('#removeFlightsButton4').click(function () {
             removeButtonClicked(4, "flights");
         });
         //------------------------------------------------------------------------------------------------
         // Guests section
         //------------------------------------------------------------------------------------------------
         // Guest 1 
         $('#addGuest1').click(function () {
             addButtonclicked(1, "guest");
         });
         $('#addGuest1').mouseup(function () { this.blur() });
         // Guest 2
         $('#addGuest2').click(function () {
             addButtonclicked(2, "guest");
         });
         $('#removeGuest2').click(function () {
             removeButtonClicked(2, "guest");

         });
         $('#addGuest2').mouseup(function () { this.blur() });
         // Guest 3
         $('#addGuest3').click(function () {
             addButtonclicked(3, "guest");
         });
         $('#removeGuest3').click(function () {
             removeButtonClicked(3, "guest");

         });
         $('#addGuest3').mouseup(function () { this.blur() });
         // Guest 4
         $('#addGuest4').click(function () {
             addButtonclicked(4, "guest");
         });
         $('#removeGuest4').click(function () {
             removeButtonClicked(4, "guest");
         });
         $('#addGuest4').mouseup(function () { this.blur() });
         // Guest 5
         $('#addGuest5').click(function () {
             addButtonclicked(5, "guest");
         });
         $('#removeGuest5').click(function () {
             removeButtonClicked(5, "guest");

         });
         $('#addGuest5').mouseup(function () { this.blur() });
         // Guest 6
         $('#removeGuest6')
             .click(function() {
                 removeButtonClicked(6, "guest");
             });
         //------------------------------------------------------------------------------------------------
         // Refund section
         $("#addRefundReason1")
             .click(function() {
                 addButtonclicked(1, "refund");
             });
         $('#addRefundReason1').mouseup(function () { this.blur() });
         $("#addRefundReason2")
             .click(function () {
                 addButtonclicked(2, "refund");
             });
         $('#addRefundReason2').mouseup(function () { this.blur() });
         $("#addRefundReason3")
             .click(function () {
                 addButtonclicked(3, "refund");
             });
         $('#addRefundReason3').mouseup(function () { this.blur() });

         $("#removeRefundReason2")
             .click(function () {
                 removeButtonClicked(2, "refund");
             });

         $("#removeRefundReason3")
             .click(function () {
                 removeButtonClicked(3, "refund");
             });

         $("#removeRefundReason4")
             .click(function () {
                 removeButtonClicked(4, "refund");
             });
         //------------------------------------------------------------------------------------------------
         
         
         function addButtonclicked(guestNumber, option) {
             var buttons = new Array();
             if (option == "guest")
                 buttons = ["guest1div", "guest2div", "guest3div", "guest4div", "guest5div", "guest6div"];
             if (option == "refund")
                 buttons = ["refundReason1Div", "refundReason2Div", "refundReason3Div", "refundReason4Div"];
             if (option == "flights")
                 buttons = ["firstFlightInfoDiv", "secondFlightInfoDiv", "thirdFlightInfoDiv", "fourthFlightInfoDiv"];
             var currentIndex = guestNumber - 1;
             if (currentIndex == 0 || currentIndex == 1) {
                 var guestDiv = document.getElementById(buttons[currentIndex + 1]);
                 guestDiv.style.display = "block";
             } else {
                 var guestDiv2 = document.getElementById(buttons[currentIndex - 1]);
                 if (guestDiv2.style.display == "none")
                     guestDiv2.style.display = "block";
                 else {
                     guestDiv2 = document.getElementById(buttons[currentIndex + 1]);
                     guestDiv2.style.display = "block";
                 }
             }
         }

         function removeButtonClicked(buttonNumber, option) {
             var currentIndex = buttonNumber - 1;
             var controlNumber = String(buttonNumber);
             var controlName = "";
             var buttons = new Array();
             if (option == "guest") {
                 buttons = ["guest1div", "guest2div", "guest3div", "guest4div", "guest5div", "guest6div"];
                 if (buttonNumber == 2) {
                     document.getElementById('salutationGuest2').selectedIndex = 0;
                     document.getElementById('secondGuestFirstName').value = "";
                     renoveFilledClassForElement('secondGuestFirstName');
                     document.getElementById('secondGuestLastName').value = "";
                     renoveFilledClassForElement('secondGuestLastName');
                 }else if (buttonNumber == 3) {
                     document.getElementById('salutationGuest3').selectedIndex = 0;
                     document.getElementById('thirdGuestFirstName').value = "";
                     renoveFilledClassForElement('thirdGuestFirstName');
                     document.getElementById('thirdGuestLastName').value = "";
                     renoveFilledClassForElement('thirdGuestLastName');
                 }else if (buttonNumber == 4) {
                     document.getElementById('salutationGuest4').selectedIndex = 0;
                     document.getElementById('fourthGuestFirstName').value = "";
                     renoveFilledClassForElement('fourthGuestFirstName');
                     document.getElementById('fourthGuestLastName').value = "";
                     renoveFilledClassForElement('fourthGuestLastName');
                 }else if (buttonNumber == 5) {
                     document.getElementById('salutationGuest5').selectedIndex = 0;
                     document.getElementById('fifthGuestFirstName').value = "";
                     renoveFilledClassForElement('fifthGuestFirstName');
                     document.getElementById('fifthGuestLastName').value = "";
                     renoveFilledClassForElement('fifthGuestLastName');
                 }else if (buttonNumber == 6) {
                     document.getElementById('salutationGuest6').selectedIndex = 0;
                     document.getElementById('sixthGuestFirstName').value = "";
                     renoveFilledClassForElement('sixthGuestFirstName');
                     document.getElementById('sixthGuestLastName').value = "";
                     renoveFilledClassForElement('sixthGuestLastName');
                 }
             }
                 
             if (option == "refund") {
                 buttons = ["refundReason1Div", "refundReason2Div", "refundReason3Div", "refundReason4Div"];
                 controlName = "refundReasonDropDownList" + controlNumber;
                 document.getElementById(controlName).selectedIndex = 0;
                 controlName = "refundReason" + controlNumber;
                 document.getElementById(controlName).selectedIndex = 0;
             }
                 
             if (option == "flights") {
                 buttons = ["firstFlightInfoDiv", "secondFlightInfoDiv", "thirdFlightInfoDiv", "fourthFlightInfoDiv"];
                 controlName = "QueryFlightNumber" + controlNumber;
                 document.getElementById(controlName).value = "";
                 renoveFilledClassForElement(controlName);
                 controlName = "dateOfFlight" + controlNumber;
                 document.getElementById(controlName).value = "";
             }
                            
             var guestDiv = document.getElementById(buttons[currentIndex]);
             guestDiv.style.display = "none";

             
         }



         $("#refundReasonDropDownList1").change(function () {
             if (this.value != "") {
                 $("#refundReason1").attr("Disabled", false);
             } else {
                 $("#refundReason1").attr("Disabled", true);
             }

             if (this.value == "Flight Related") {
                 setSelectQuery('#refundReason1', 'RefundRequestInfo.xml', 'FlightRelated');
                 return;
             }

             if (this.value == "Fee Related") {
                 setSelectQuery('#refundReason1', 'RefundRequestInfo.xml', 'FeeRelated');
                 return;
             }

             if (this.value == "Other")
             {
                 $('#refundReason1').append($('<option>',
                 {
                     value: "Please Use Comments Section",
                     text: "Please Use Comments Section"
                 }));
                 document.getElementById('refundReason1').selectedIndex = 1;
                 $('#refundReason1').attr("Disabled", true);
                 return;
             }

         });

         $("#refundReason1")
             .change(function() {
                 if (this.selectedIndex  != 0) {
                     $("#<%=refundReasonDropDownList2.ClientID %>").attr('disabled', false);
                 } else {
                     //Reset the other drop downs
                     $("#refundReasonDropDownList2").prop('selectedIndex', 0);
                     $("#refundReasonDropDownList3").prop('selectedIndex', 0);
                     $("#refundReasonDropDownList4").prop('selectedIndex', 0);
                     $('#refundReason2').prop('selectedIndex', 0);
                     $('#refundReason3').prop('selectedIndex', 0);
                     $('#refundReason4').prop('selectedIndex', 0);
                     //Disable the other drop downs
                     $("#refundReasonDropDownList2").attr('disabled', true);
                     $("#refundReasonDropDownList3").attr('disabled', true);
                     $("#refundReasonDropDownList4").attr('disabled', true);
                    
                     $("#refundReason2").attr('disabled', true);
                     $("#refundReason3").attr('disabled', true);
                     $("#refundReason4").attr('disabled', true);

                 }
             });


         $("#refundReasonDropDownList2").change(function () {
             if (this.value != "") {
                 $("#refundReason2").attr("Disabled", false);
             } else {
                 $("#refundReason2").attr("Disabled", true);
             }

             if (this.value == "Flight Related") {
                 setSelectQuery('#refundReason2', 'RefundRequestInfo.xml', 'FlightRelated');
                 return;
             }

             if (this.value == "Fee Related") {
                 setSelectQuery('#refundReason2', 'RefundRequestInfo.xml', 'FeeRelated');
                 return;
             }

             if (this.value == "Other") {
                 $('#refundReason2').append($('<option>',
                 {
                     value: "Please Use Comments Section",
                     text: "Please Use Comments Section"
                 }));
                 document.getElementById('refundReason2').selectedIndex = 1;
                 $('#refundReason2').attr("Disabled", true);
                 return;
             }

         });




         $("#refundReason2")
             .change(function () {
                 if (this.selectedIndex != 0) {
                     $("#refundReasonDropDownList3").attr('disabled', false);
                 } else {
                     //Reset the other drop downs
                     $("#refundReasonDropDownList3").prop('selectedIndex', 0);
                     $("#refundReasonDropDownList4").prop('selectedIndex', 0);
                     $('#refundReason2').prop('selectedIndex', 0);
                     $('#refundReason3').prop('selectedIndex', 0);
                     $('#refundReason4').prop('selectedIndex', 0);
                     //Disable the other drop downs
                     $("#refundReasonDropDownList3").attr('disabled', true);
                     $("#refundReasonDropDownList4").attr('disabled', true);
                     $("#refundReason3").attr('disabled', true);
                     $("#refundReason4").attr('disabled', true);
                 }
             });

         $("#refundReasonDropDownList3").change(function () {
             if (this.value != "") {
                 $("#refundReason3").attr("Disabled", false);
             } else {
                 $("#refundReason3").attr("Disabled", true);
             }

             if (this.value == "Flight Related") {
                 setSelectQuery('#refundReason3', 'RefundRequestInfo.xml', 'FlightRelated');
                 return;
             }

             if (this.value == "Fee Related") {
                 setSelectQuery('#refundReason3', 'RefundRequestInfo.xml', 'FeeRelated');
                 return;
             }

             if (this.value == "Other") {
                 $('#refundReason3').append($('<option>',
                 {
                     value: "Please Use Comments Section",
                     text: "Please Use Comments Section"
                 }));
                 document.getElementById('refundReason3').selectedIndex = 1;
                 $('#refundReason3').attr("Disabled", true);
                 return;
             }

         });

         $("#refundReason3").change(function() {
             if (this.selectedIndex != 0) {
                 $("#refundReasonDropDownList4").attr('disabled', false);
             } else {
                 $("#refundReasonDropDownList4").prop('selectedIndex', 0);
                 $('#refundReason4').prop('selectedIndex', 0);
                 $("#refundReason4").attr('disabled', true);
                 $("#refundReasonDropDownList4").attr('disabled', true);
             }
         });

         $("#refundReasonDropDownList4").change(function () {
             if (this.value != "") {
                 $("#refundReason4").attr("Disabled", false);
             } else {
                 $("#refundReason4").attr("Disabled", true);
             }

             if (this.value == "Flight Related") {
                 setSelectQuery('#refundReason4', 'RefundRequestInfo.xml', 'FlightRelated');
                 return;
             }

             if (this.value == "Fee Related") {
                 setSelectQuery('#refundReason4', 'RefundRequestInfo.xml', 'FeeRelated');
                 return;
             }

             if (this.value == "Other") {
                 $('#refundReason4').append($('<option>',
                 {
                     value: "Please Use Comments Section",
                     text: "Please Use Comments Section"
                 }));
                 document.getElementById('refundReason4').selectedIndex = 1;
                 $('#refundReason4').attr("Disabled", true);
                 return;
             }

         });

         $('#_helpQuerySalutation')
             .change(function() {
                 var salutation = this.selectedIndex;
                 var target = document.getElementById("salutationGuest1");
                 target.selectedIndex = salutation;


             });


         function autoPopulateFirstGuestName() {
             var firstName = document.getElementById('helpQueryFirstName').value;
             document.getElementById('firstGuestFirstName').classList.add('filled');
             var firstGuestName = document.getElementById('firstGuestFirstName');
             firstGuestName.value = firstName;
         }

         function autoPopulateFirstGuestLastName() {
             var lastName = document.getElementById('helpQueryLastName').value;
             document.getElementById('firstGuestLastName').classList.add('filled');
             var firstGuestLastName = document.getElementById('firstGuestLastName');
             firstGuestLastName.value = lastName;
         }

         function renoveFilledClassForElement(elementName) {
             var element = document.getElementById(elementName);
             element.classList.remove('filled');
         }

         $('#_helpQueryDateOfFlight').change(function () {
             var newValue = this.value;
             if (newValue != "") {
                 document.getElementById('_helpQueryDateOfFlight').classList.add('filled');
             } else {
                 document.getElementById('_helpQueryDateOfFlight').classList.remove('filled');
             }

         });

         $('#dateOfFlight2').change(function () {
             var newValue = this.value;             
             if (newValue != "") {
                 document.getElementById('dateOfFlight2').classList.add('filled');
             } else {
                 document.getElementById('dateOfFlight2').classList.remove('filled');
             }
         });

         $('#dateOfFlight3').change(function () {
             var newValue = this.value;
             if (newValue != "") {
                 document.getElementById('dateOfFlight3').classList.add('filled');
             } else {
                 document.getElementById('dateOfFlight3').classList.remove('filled');
             }
         });

         $('#dateOfFlight4').change(function () {
             var newValue = this.value;
             if (newValue != "") {
                 document.getElementById('dateOfFlight4').classList.add('filled');
             } else {
                 document.getElementById('dateOfFlight4').classList.remove('filled');
             }
         });
     
                        
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
                        
                            
                            
         function CheckFile(file) {

             isValidFile = CheckFileSize(file);

             return isValidFile;
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


        
     </script>
     
</body>
</html>

