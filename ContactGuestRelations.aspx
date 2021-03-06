﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactGuestRelations.aspx.cs" Inherits="ContactGuestRelations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title> 
    <link rel="stylesheet" href="js/style-2.css" />
     <link rel="stylesheet" href="js/screen.css"/>
     <link rel="stylesheet" href="js/Style-3.css" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
     <link rel="stylesheet" href="css/Common.css"/>
     <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src = "https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js" type="text/javascript"></script>
    <script src="/js/jquery.js"></script>
    <script src="js/common.js"></script>

     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    	<script src="/js/jquery.validate.js"></script>
    <script src="/js/jquery-1.8.2.js"></script>
     <style>
         .gray-wide-bg {
                width: 1024px;
                background-color: #f9f9f9; 
            }
     </style>    
     
 <link rel="stylesheet" href="https://AstuteSolutions.com/distributable-assets/css/AerLingus/formStyle.css"/>
    

</head>

  
  <script type="text/javascript">
      function Count() {

          var i = document.getElementById("AdditionalRequests").value.length;
          document.getElementById("CharCount").innerHTML = "Characters Remaining : " + (1000 - i);

      }

      function validateForm() {
          var x = document.forms["specialMealRequestForm"]["FirstName"].value;
          if (x == null || x == "") {
              alert("First name must be filled out");
              return false;
          }
      }

      $(function () {
          $("#departFlightDate").datepicker({ dateFormat: 'dd-M-yy' });
      }
      );

  </script>  
    
                         
                         

   
  
<body>
    <div id="page1" data-role="page">
        <form id="contactGuestRelationsForm" runat="server" autocomplete="off">
            <div style="margin-left: 80px; margin-right: 172px;height:auto;"  class="gray-wide-bg ">
                <div style="margin-left: 30px">
                    <br/>
                    <div>
                        <h2 style="margin-top: 30px" id="RefNumberheader" class="xl2 tealGreen">Case/Reference Number</h2>
                        <p>Please enter your case/reference number</p>
                    </div>
                    <div class="input-container" >
                        <asp:TextBox type="text" style="width: 260px" ID="updateCaseID" MaxLength="7" Title="Please enter your case number" CssClass="form-control inline-label  "  runat="server" onblur="checkvalue(this)"/>
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
                </div>
                <div style="margin-left: 30px" >
                    <h2 class="xl2 tealGreen"> Contact Information</h2>
                    <br/>
                    <div class="input-container" id="radioButtonContainer">
                        
                        <asp:RadioButtonList runat="server" ID="guestGroup" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="radio-inline " onclick="radioButtonClicked()">
                            <asp:ListItem Text="I am the guest" Value="guest" Selected="True" Class="radio-inline-button"/>
                            <asp:ListItem Text="I am the representative of the guest" Value="representative"  Class="radio-inline-button"/>
                        </asp:RadioButtonList>
                        <br/>
                        <br/>
                    </div>                    
                    <h4 id="header2" class="xl2 tealGreen" style="font-size: 1em">Guest Information</h4> 
                    <div class="input-container" id="guestNameDiv">
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container">
                                        <select class="dropdown-toggle" name="guestSalutation" id="guestSalutation" style="width: 260px; height: 30px; text-align: left"></select>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px" id="FirstName" title="Please enter your first name" name="FirstName" class="form-control inline-label  " required="required" onblur="checkvalue(this); autoPopulateFirstGuestName();"/>
                                        <label class="form-control-label">First Name</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px" id="LastName" title="Please enter your family name" name="LastName" class="form-control inline-label" required="required" onblur="checkvalue(this); autoPopulateFirstGuestLastName();"/>
                                        <label class="form-control-label">Family Name</label>
                                    </div>
                                </td>
                            </tr>
                        </table>       
                    </div>
                    
                    <!-- Representative Section -->
                    <div class="input-container" id="representativeName" style="display: none;">
                        <h4 id="header1" class="xl2 tealGreen" style="font-size: 1em">Representative Information</h4>
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container">
                                        <select class="dropdown-toggle" name="representativetSalutation" id="representativetSalutation" style="width: 260px; height: 30px; text-align: left"></select>
                                    </div>
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
                        <div class="input-container" id="repCompanyNameDiv" style="display: none">
                        <input type="text" name="repCompanyName" id="repCompanyName" style="width: 395px" class="form-control inline-label" onblur="checkvalue(this)"/>
                        <label class="form-control-label">Company Name</label>
                    </div> 
                    </div>  
                    <!-- ---------------------- -->
                    
                    <!-- Email section --> 
                    <table>                         
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <input type="email" name="_helpQueryEmail" id="_helpQueryEmail" style="width: 395px" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Email Address</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="email" name="email" id="email" style="width:395px" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Confirm Email Address</label>
                                </div>
                            </td>
                        </tr>                         
                    </table>  
                    <!-- --------------- -->
                    <!-- Country and phone number section -->
                    <table>                         
                         
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <select class=" dropdown-toggle" name="countriesList" id="countriesList" style="width:260px;height:30px;text-align:left" required="required" onchange="countrySelected()"></select>
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
                    <!-- ------------------------------ -->
                    <!-- ------- Address section ----------> 
                    <table>
                        <tr>
                            <td >
                                <div class="input-container" >
                                    <input type="text" name="address1" id="address1" style="width: 395px" class="form-control inline-label" required="required" title="Must contain house number and street address" pattern="\d+(\s\S+)+" onblur="checkvalue(this)"/>
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
                                    <input type="text" name="countryState" id="countryState" maxlength="20" style="width: 260px;" title="county or state" class="form-control inline-label" onblur="checkvalue(this)"/>
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
                    <!-- ---------------------------------->
                        <div id="relationshipToGuestDropDownDiv" style="display: none">
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
                    <!-- ------------------------------------>
                    <table>
                         <tr>
                            <td class="auto-style1">
                                <select  class=" dropdown-toggle" style="height:30px;width:260px" name="aerClubDropDown" id="aerClubDropDown" runat="server"></select>
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
                                <h2 class="xl2 tealGreen"> Flight Information (if applicable)</h2>
                            </td>
                        </tr>
                    </table>
                    
                    <!------------- Flight Section ------------------- -->
                    <div class="input-container" id="mainFlightInfoDiv">
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" name="flightNumber" id="flightNumber" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" required="required" title="3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Number</label>
                                    </div>
                                </td>
                                <td> 
                                    <div class="input-container">
                                        <input type="text"  id="dateOfFlight" name="dateOfFlight" style="width: 260px"  title="Please enter a valid date" required="required" class="form-control inline-label"/>
                                        <label id="departureFlightDateLabel" class="form-control-label">Flight Date</label> 
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
                                        <input type="text"  id="dateOfFlight2" name="dateOfFlight2" style="width: 260px"  title="Please enter a valid date"  class="form-control inline-label"/>
                                        <label id="departureFlightDateLabel2" class="form-control-label">Flight Date</label> 
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
                                        <input type="text"  id="dateOfFlight3" name="dateOfFlight3" style="width: 260px"  title="Please enter a valid date" class="form-control inline-label"/>
                                        <label id="departureFlightDateLabel3" class="form-control-label">Flight Date</label> 
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
                                        <input type="text"  id="dateOfFlight4" name="dateOfFlight4" style="width: 260px"  title="Please enter a valid date" class="form-control inline-label"/>
                                        <label id="departureFlightDateLabel4" class="form-control-label">Flight Date</label> 
                                    </div>
                                </td>
                                <td>
                                    <button type="button" title="Remove this flight" id="removeFlightsButton4" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td> 
                            </tr>
                        </table>
                    </div>  
                    <!------------------------------------------------- -->
                    <table style="width: 100%">
                        <tr>
                            <td colspan="2">
                                <h2 class="xl2 tealGreen"> Traveler Information </h2>
                                Please list all travelers that pertain to this flight. Click the '+' to add additional travelers.
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <div class="input-container" id="guest1div">
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container">
                                        <select class="dropdown-toggle" name="salutationGuest1" id="salutationGuest1" style="width: 260px; height: 30px; text-align: left"></select>
                                    </div>
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
                                    <div class="input-container">
                                        <select class="dropdown-toggle" name="salutationGuest2" id="salutationGuest2" style="width: 260px; height: 30px; text-align: left"></select>
                                    </div>
               
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
                                    <div class="input-container">
                                        <select class="dropdown-toggle" name="salutationGuest3" id="salutationGuest3" style="width: 260px; height: 30px; text-align: left"></select>
                                    </div>              
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
                                    <div class="input-container">
                                        <select class="dropdown-toggle" name="salutationGuest4" id="salutationGuest4" style="width: 260px; height: 30px; text-align: left"></select>
                                    </div>
               
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
                                    <div class="input-container">
                                        <select class="dropdown-toggle" name="salutationGuest5" id="salutationGuest5" style="width: 260px; height: 30px; text-align: left"></select>
                                    </div>
               
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
                                    <div class="input-container">
                                        <select class="dropdown-toggle" name="salutationGuest6" id="salutationGuest6" style="width: 260px; height: 30px; text-align: left"></select>
                                    </div>             
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
                    <table style="width: 100%">
                        <tr>
                            <td colspan="2">
                                <h2 class="xl2 tealGreen">Issue</h2>
                            </td>
                        </tr>
                    </table>

                    <div id="issue1">
                        <table >
                            <tr>
                                <td>
                                    <select class="dropdown-toggle" name="generalIssuesDropdown" id="generalIssuesDropdown" style="width: 260px; height: 30px; text-align: left"></select>
                                </td>
                                <td>
                                    <select class="dropdown-toggle" name="specificIssueDropdown" id="specificIssueDropdown" style="width: 260px; height: 30px; text-align: left">
                                        <option value="">Please Select</option>
                                    </select>
                                </td>
                                <td>
                                    <div class="input-container" id="BaggageReferenceNumber" style="display: none">
                                        <input type="text" id="baggageReferenceNumber" name="baggageReferenceNumber" style="width: 260px; text-transform: uppercase" maxlength="10" title="Enter your baggage reference." class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label id="baggageReferenceLabel" class="form-control-label">Baggage Reference</label>
                                    </div> 
                                </td>
                                <td>
                                    <button type="button" title="Add another guest" id="addIssue1" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    
                <div id="issue2" style="display: none">
                    <table >
                        <tr>
                            <td>
                                <select class="dropdown-toggle" name="generalIssuesDropdown2" id="generalIssuesDropdown2" style="width: 260px; height: 30px; text-align: left"></select>
                            </td>
                            <td>
                                <select class="dropdown-toggle" name="specificIssueDropdown2" id="specificIssueDropdown2" style="width: 260px; height: 30px; text-align: left">
                                    <option value="">Please Select</option>
                                </select>
                            </td>
                            <td>
                                <div class="input-container"  id="BaggageReferenceNumber2" style="display: none">
                                    <input type="text" id="baggageReferenceNumber2" name="baggageReferenceNumber2" style="width: 260px; text-transform: uppercase" maxlength="10" title="Enter your baggage reference." class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label id="baggageReferenceLabel2" class="form-control-label">Baggage Reference</label>
                                </div> 
                            </td>
                            <td>
                                <button type="button" title="Add another guest" id="addIssue2" class="transparentBtn" aria-label="Click to add an additional request">+</button>
                            </td>
                            <td>
                                <button type="button" title="Remove this guest" id="removeIssue2" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                            </td>

                        </tr>
                    </table>
                </div>

                <div id="issue3" style="display: none">
                    <table >
                        <tr>
                            <td>
                                <select class="dropdown-toggle" name="generalIssuesDropdown3" id="generalIssuesDropdown3" style="width: 260px; height: 30px; text-align: left"></select>
                            </td>
                            <td>
                                <select class="dropdown-toggle" name="specificIssueDropdown3" id="specificIssueDropdown3" style="width: 260px; height: 30px; text-align: left">
                                    <option value="">Please Select</option>
                                </select>
                            </td>
                            <td>
                                <div class="input-container"  id="BaggageReferenceNumber3" style="display: none">
                                    <input type="text" id="baggageReferenceNumber3" name="baggageReferenceNumber2" style="width: 260px; text-transform: uppercase" maxlength="10" title="Enter your baggage reference." class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label id="baggageReferenceLabel2" class="form-control-label">Baggage Reference</label>
                                </div> 
                            </td>
                            <td>
                                <button type="button" title="Remove this guest" id="removeIssue3" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                            </td> 
                        </tr>
                    </table>
                </div>
                    

                    
                    <div id ="claimTypeGroup" style="display: none">
                        <br/>
                        <table>
                            <tr>
                                <td style="width: 20%" valign="top">
                                    <table>
                                        <tr>
                                            <p>What type of expenses are you claiming for?</p>
                                        </tr>
                                    </table>    
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <asp:CheckBox runat="server" Text ="Hotels / accomodations" ID="Hotels"/>
                                        </tr>
                                    </table> 
                                    <table>
                                        <tr>
                                            <asp:CheckBox runat="server" Text ="Meals / refreshments" ID ="Meals"/>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <asp:CheckBox runat="server" Text="Transport" ID="Transport"/>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <asp:CheckBox runat="server" Text="Other" ID="Other"/>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    
                    
                    <table style="width: 100%">
                        <tr >
                            <td style="width: 45%">
                                <p>Is your issue related to travel on Aer Lingus Regional services?</p>
                            </td>
                            <td colspan="2">
                                <div class="input-container">   
                                    <asp:RadioButtonList runat="server" ID="regionalFlight"  RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="radio-inline" >
                                        <asp:ListItem Text="Yes" Value="Yes" Class="radio-inline-button"/>
                                        <asp:ListItem Text="No" Value="No" Selected="True" Class="radio-inline-button"/>
                                    </asp:RadioButtonList>
                                    <br/>
                                    <br/>
                                </div>
                            </td>
                        </tr>
                        <tr >
                            <td style="width: 40%">
                                <p>Do you need a letter for your insurance?</p>
                            </td>
                            <td colspan="2">
                                <div class="input-container">   
                                    <asp:RadioButtonList runat="server" ID="insuranceGroup"  RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="radio-inline" >
                                        <asp:ListItem Text="Yes" Value="Yes" Class="radio-inline-button"/>
                                        <asp:ListItem Text="No" Value="No" Selected="True" Class="radio-inline-button"/>
                                    </asp:RadioButtonList>
                                    <br/>
                                    <br/>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td colspan="2">
                                <h2 class="xl2 tealGreen">Comments</h2>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td style="font-size: 12px">As with any standard email, any emails containing your personal data sent to or from Aer Lingus will travel in a non-encrypted format.</td>
                        </tr>
                        <tr>
                            <td style="font-size: 12px; font-weight: bolder">Please do not enter any payment card details into any data fields such as credit/debit card numbers and/or security codes</td>
                        </tr>
                        <tr>
                            <td style="font-size: 12px" >Please provide additional information</td>
                        </tr>
                    </table>
                    <div>
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:TextBox TextMode="MultiLine" onkeyup="Count()" Height="100" Width="525" id="comments" maxlength="2000" runat="server"></asp:TextBox>
                                    <br />
                                    <label id="charCount" runat="server" style="font-size: 12px" >Characters Remaining :2000</label>
                                </td>
                            </tr>
                        </table>
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
                    <div style="margin-left: 350px;padding:20px" >      
                        <asp:Button ID="Submitbtn" CssClass="button button-standard button-shamrockGreen-gradient" runat="server" Text="Submit"  ValidationGroup="Submit" OnClick="SubmitButton_Click" ></asp:Button>
                    </div>
                </div>    
            </div>
        </form>
    </div>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">

         $(function () {
             $("#dateOfFlight").datepicker({ dateFormat: 'dd-M-yy' });
             $("#dateOfFlight2").datepicker({ dateFormat: 'dd-M-yy' });
             $("#dateOfFlight3").datepicker({ dateFormat: 'dd-M-yy' });
             $("#dateOfFlight4").datepicker({ dateFormat: 'dd-M-yy' });
         });

         setSelect('#guestSalutation', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest1', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest2', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest3', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest4', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest5', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest6', 'Titles.xml', 'title', 'Title');
         setSelect('#representativetSalutation', 'Titles.xml', 'title', 'Title');
         setSelect('#countriesList', 'Countries.xml', 'countries', 'Select Country');
         setSelect('#relationshipToGuestDropDown', 'Relationships.xml', 'relationship', 'Relationship to the guest');
         setSelect('#aerClubDropDown', 'AerClubTiers.xml', 'tier', 'AerClub Tier');
         setSelect('#generalIssuesDropdown', 'ContactGuestIssues.xml', 'issue', 'Please Select');
         setSelect('#generalIssuesDropdown2', 'ContactGuestIssues.xml', 'issue', 'Please Select');
         setSelect('#generalIssuesDropdown3', 'ContactGuestIssues.xml', 'issue', 'Please Select');

         $('#generalIssuesDropdown')
             .change(function () {
                 var dropdown2Option = document.getElementById('generalIssuesDropdown2').selectedIndex;
                 var dropdown3Option = document.getElementById('generalIssuesDropdown3').selectedIndex;
                 switch(this.selectedIndex) {
                     case 0:
                     {
                         $("#specificIssueDropdown").empty();
                         $("#specificIssueDropdown").append($('<option>', {
                             value: '',
                             text: 'Please Select'

                         }));
                         $("#BaggageReferenceNumber").css("display", "none");
                         if (dropdown2Option != 7 && dropdown3Option != 7)
                             $("#claimTypeGroup").css("display", "none");
                         break;
                     }
                     case 1:
                     {
                         $("#specificIssueDropdown").empty();
                         setSelect('#specificIssueDropdown', 'AerClubFrequentFlyer.xml', 'option', 'Please Select');
                         $("#BaggageReferenceNumber").css("display", "none");
                         if (dropdown2Option != 7 && dropdown3Option != 7)
                            $("#claimTypeGroup").css("display", "none");
                         break;
                     }
                     case 2:
                     {
                         $("#specificIssueDropdown").empty();
                         setSelect('#specificIssueDropdown', 'AirportExperience.xml', 'option', 'Please Select');
                         $("#BaggageReferenceNumber").css("display", "none");
                         if (dropdown2Option != 7 && dropdown3Option != 7)
                            $("#claimTypeGroup").css("display", "none");
                         break;
                     }
                     case 3:
                         {
                             $("#specificIssueDropdown").empty();
                             setSelect('#specificIssueDropdown', 'BaggageIrregularities.xml', 'issue', 'Please Select');
                             $("#BaggageReferenceNumber").css("display", "block");
                             if (dropdown2Option != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                             break;
                     }
                     case 4:
                     {
                         $("#specificIssueDropdown").empty();
                         setSelect('#specificIssueDropdown', 'BookingWebsiteIssues.xml', 'issue', 'Please Select');
                         $("#BaggageReferenceNumber").css("display", "none");
                         if (dropdown2Option != 7 && dropdown3Option != 7)
                            $("#claimTypeGroup").css("display", "none");
                         break;
                     }

                     case 5:
                     {
                         $("#specificIssueDropdown").empty();
                         setSelect('#specificIssueDropdown', 'Compliment.xml', 'option', 'Please Select');
                         $("#BaggageReferenceNumber").css("display", "none");
                         if (dropdown2Option != 7 && dropdown3Option != 7)
                            $("#claimTypeGroup").css("display", "none");
                         break;
                     }

                     case 6:
                         {
                             $("#specificIssueDropdown").empty();
                             setSelect('#specificIssueDropdown', 'Ec261.xml', 'option', 'Please Select');
                             $("#BaggageReferenceNumber").css("display", "none");
                             if (dropdown2Option != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                             break;
                         }

                     case 7:
                         {
                             $("#specificIssueDropdown").empty();
                             setSelect('#specificIssueDropdown', 'FlightDelayDisruption.xml', 'issue', 'Please Select');
                             $("#BaggageReferenceNumber").css("display", "none");
                             $("#claimTypeGroup").css("display",  "block");
                             break;
                         }

                     case 8:
                         {
                             $("#specificIssueDropdown").empty();
                             setSelect('#specificIssueDropdown', 'InFlightExperience.xml', 'option', 'Please Select');
                             $("#BaggageReferenceNumber").css("display", "none");
                             if (dropdown2Option != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                             break;
                         }

                     case 9:
                         {
                             $("#specificIssueDropdown").empty();
                             setSelect('#specificIssueDropdown', 'SpecialAssistanceGuestRelations.xml', 'option', 'Please Select');
                             $("#BaggageReferenceNumber").css("display", "none");
                             if (dropdown2Option != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                             break;
                         }
                     

                 }
             });


         $('#generalIssuesDropdown2')
              .change(function () {
                 var dropdownOption = document.getElementById('generalIssuesDropdown').selectedIndex;
                 var dropdown3Option =document.getElementById('generalIssuesDropdown3').selectedIndex;
                  switch (this.selectedIndex) {
                      case 0:
                          {
                              $("#specificIssueDropdown2").empty();
                              $("#specificIssueDropdown2").append($('<option>', {
                                  value: '',
                                  text: 'Please Select'
                              }));
                              $("#BaggageReferenceNumber2").css("display", "none");
                              if (dropdownOption != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                              break;
                          }
                      case 1:
                          {
                              $("#specificIssueDropdown2").empty();
                              setSelect('#specificIssueDropdown2', 'AerClubFrequentFlyer.xml', 'option', 'Please Select');
                              $("#BaggageReferenceNumber2").css("display", "none");
                              if (dropdownOption != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                              break;
                          }
                      case 2:
                          {
                              $("#specificIssueDropdown2").empty();
                              setSelect('#specificIssueDropdown2', 'AirportExperience.xml', 'option', 'Please Select');
                              $("#BaggageReferenceNumber2").css("display", "none");
                              if (dropdownOption != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                              break;
                          }
                      case 3:
                          {
                              $("#specificIssueDropdown2").empty();
                              setSelect('#specificIssueDropdown2', 'BaggageIrregularities.xml', 'issue', 'Please Select');
                              $("#BaggageReferenceNumber2").css("display", "block");
                              if (dropdownOption != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                              break;
                          }
                      case 4:
                          {
                              $("#specificIssueDropdown2").empty();
                              setSelect('#specificIssueDropdown2', 'BookingWebsiteIssues.xml', 'issue', 'Please Select');
                              $("#BaggageReferenceNumber2").css("display", "none");
                              if (dropdownOption != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                              break;
                          }

                      case 5:
                          {
                              $("#specificIssueDropdown2").empty();
                              setSelect('#specificIssueDropdown2', 'Compliment.xml', 'option', 'Please Select');
                              $("#BaggageReferenceNumber2").css("display", "none");
                              if (dropdownOption != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                              break;
                          }

                      case 6:
                          {
                              $("#specificIssueDropdown2").empty();
                              setSelect('#specificIssueDropdown2', 'Ec261.xml', 'option', 'Please Select');
                              $("#BaggageReferenceNumber2").css("display", "none");
                              if (dropdownOption != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                              break;
                          }

                      case 7:
                          {
                              $("#specificIssueDropdown2").empty();
                              setSelect('#specificIssueDropdown2', 'FlightDelayDisruption.xml', 'issue', 'Please Select');
                              $("#BaggageReferenceNumber2").css("display", "none");
                              $("#claimTypeGroup").css("display", "block");
                              break;
                          }

                      case 8:
                          {
                              $("#specificIssueDropdown2").empty();
                              setSelect('#specificIssueDropdown2', 'InFlightExperience.xml', 'option', 'Please Select');
                              $("#BaggageReferenceNumber2").css("display", "none");
                              if (dropdownOption != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                              break;
                          }

                      case 9:
                          {
                              $("#specificIssueDropdown2").empty();
                              setSelect('#specificIssueDropdown2', 'SpecialAssistanceGuestRelations.xml', 'option', 'Please Select');
                              $("#BaggageReferenceNumber2").css("display", "none");
                              if (dropdownOption != 7 && dropdown3Option != 7)
                                $("#claimTypeGroup").css("display", "none");
                              break;
                          }


                  }
              });


         $('#generalIssuesDropdown3')
               .change(function () {
                   var dropdownOption = document.getElementById('generalIssuesDropdown').selectedIndex;
                   var dropdown2Option = document.getElementById('generalIssuesDropdown2').selectedIndex;
                   switch (this.selectedIndex) {
                       case 0:
                           {
                               $("#specificIssueDropdown3").empty();
                               $("#specificIssueDropdown3").append($('<option>', {
                                   value: '',
                                   text: 'Please Select'
                               }));
                               $("#BaggageReferenceNumber3").css("display", "none");
                               if (dropdownOption != 7 && dropdown2Option != 7)
                                    $("#claimTypeGroup").css("display", "none");
                               break;
                           }
                       case 1:
                           {
                               $("#specificIssueDropdown3").empty();
                               setSelect('#specificIssueDropdown3', 'AerClubFrequentFlyer.xml', 'option', 'Please Select');
                               $("#BaggageReferenceNumber3").css("display", "none");
                               if (dropdownOption != 7 && dropdown2Option != 7)
                                    $("#claimTypeGroup").css("display", "none");
                               break;
                           }
                       case 2:
                           {
                               $("#specificIssueDropdown3").empty();
                               setSelect('#specificIssueDropdown3', 'AirportExperience.xml', 'option', 'Please Select');
                               $("#BaggageReferenceNumber3").css("display", "none");
                               if (dropdownOption != 7 && dropdown2Option != 7)
                                    $("#claimTypeGroup").css("display", "none");
                               break;
                           }
                       case 3:
                           {
                               $("#specificIssueDropdown3").empty();
                               setSelect('#specificIssueDropdown3', 'BaggageIrregularities.xml', 'issue', 'Please Select');
                               $("#BaggageReferenceNumber3").css("display", "block");
                               if (dropdownOption != 7 && dropdown2Option != 7)
                                    $("#claimTypeGroup").css("display", "none");
                               break;
                           }
                       case 4:
                           {
                               $("#specificIssueDropdown3").empty();
                               setSelect('#specificIssueDropdown3', 'BookingWebsiteIssues.xml', 'issue', 'Please Select');
                               $("#BaggageReferenceNumber3").css("display", "none");
                               if (dropdownOption != 7 && dropdown2Option != 7)
                                    $("#claimTypeGroup").css("display", "none");
                               break;
                           }

                       case 5:
                           {
                               $("#specificIssueDropdown3").empty();
                               setSelect('#specificIssueDropdown3', 'Compliment.xml', 'option', 'Please Select');
                               $("#BaggageReferenceNumber3").css("display", "none");
                               if (dropdownOption != 7 && dropdown2Option != 7)
                                    $("#claimTypeGroup").css("display", "none");
                               break;
                           }

                       case 6:
                           {
                               $("#specificIssueDropdown3").empty();
                               setSelect('#specificIssueDropdown3', 'Ec261.xml', 'option', 'Please Select');
                               $("#BaggageReferenceNumber3").css("display", "none");
                               if (dropdownOption != 7 && dropdown2Option != 7)
                                    $("#claimTypeGroup").css("display", "none");
                               break;
                           }

                       case 7:
                           {
                               $("#specificIssueDropdown3").empty();
                               setSelect('#specificIssueDropdown3', 'FlightDelayDisruption.xml', 'issue', 'Please Select');
                               $("#BaggageReferenceNumber3").css("display", "none");
                               $("#claimTypeGroup").css("display", "block");
                               break;
                           }

                       case 8:
                           {
                               $("#specificIssueDropdown3").empty();
                               setSelect('#specificIssueDropdown3', 'InFlightExperience.xml', 'option', 'Please Select');
                               $("#BaggageReferenceNumber3").css("display", "none");
                               if (dropdownOption != 7 && dropdown2Option != 7)
                                    $("#claimTypeGroup").css("display", "none");
                               break;
                           }

                       case 9:
                           {
                               $("#specificIssueDropdown3").empty();
                               setSelect('#specificIssueDropdown3', 'SpecialAssistanceGuestRelations.xml', 'option', 'Please Select');
                               $("#BaggageReferenceNumber3").css("display", "none");
                               if (dropdownOption != 7 && dropdown2Option != 7)
                                    $("#claimTypeGroup").css("display", "none");
                               break;
                           }


                   }
               });

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
         



         function Count() {

             var i = document.getElementById("comments").value.length;
             document.getElementById("charCount").innerHTML = "Characters Remaining : " + (1000 - i);

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
             var aerClubDropDown = document.getElementById('aerClubDropDown');
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
             // make necessary fields requiredF
             document.getElementById('representativeFirstName').required = true;
             document.getElementById('representativeLastName').required = true;
             document.getElementById('relationshipToGuestDropDown').required = true;
             document.getElementById('repCompanyName').required = true;
             var relationshipDropDown = document.getElementById('relationshipToGuestDropDownDiv');
             relationshipDropDown.style.display = "block";
             var divRepName = document.getElementById('representativeName');
             divRepName.style.display = "block";

             var aerClubDropDown = document.getElementById('aerClubDropDown');
             aerClubDropDown.style.display = "none";
             var relationshipToGuestDiv = document.getElementById('relationshipToGuestDropDownDiv');
             relationshipToGuestDiv.style.display = 'block';
         }

         function countrySelected() {
             var country = $('#countriesList').find(":selected").text();
             if (country == "United States of America" || country == "Canada") {
                 $('#countryState').attr('maxlength', 2);
                 $('#countryState').css({ 'text-transform': "uppercase" });

             }
             else {
                 $('#countryState').attr('maxlength', 20);
             }

         }

         //------------------------------------------------------------------------------------------------
         // Flights section
         //------------------------------------------------------------------------------------------------
         $("#addFlightsButton1")
             .click(function () {
                 addButtonclicked(1, "flights");
             });
         $('#addFlightsButton1').mouseup(function () { this.blur() });


         $('#addFlightsButton2')
             .click(function () {
                 addButtonclicked(2, "flights");
             });
         $('#removeFlightsButton2').click(function () {
             removeButtonClicked(2, "flights");
         });

         $('#addFlightsButton2').mouseup(function () { this.blur() });


         $('#addFlightsButton3').click(function () {
             addButtonclicked(3, "flights");
         });

         $('#removeFlightsButton3').click(function () {
             removeButtonClicked(3, "flights");
         });
         $('#addFlightsButton3').mouseup(function () { this.blur() });



         $('#removeFlightsButton4').click(function () {
             removeButtonClicked(4, "flights");
         });
        
          //-----------------------------------------------------------------------------------------------
          // Issue section
          //-----------------------------------------------------------------------------------------------
         $('#addIssue1').click(function () {
             addButtonclicked(1, "issue");
         });
         $('#addIssue1').mouseup(function () { this.blur() });
         // Guest 2
         $('#addIssue2').click(function () {
             addButtonclicked(2, "issue");
         });
         $('#removeIssue2').click(function () {
             removeButtonClicked(2, "issue");

         });
         $('#addIssue2').mouseup(function () { this.blur() });
         $('#removeIssue3')
             .click(function () {
                 removeButtonClicked(3, "issue");
         });
         $('#removeIssue3').mouseup(function () { this.blur() });
         $('#removeIssue3')
             .click(function () {
                 removeButtonClicked(3, "issue");
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
             .click(function () {
                 removeButtonClicked(6, "guest");
         });

         function addButtonclicked(guestNumber, option) {
             var buttons = new Array();
             if (option == "guest")
                 buttons = ["guest1div", "guest2div", "guest3div", "guest4div", "guest5div", "guest6div"];
             if (option == "refund")
                 buttons = ["refundReason1Div", "refundReason2Div", "refundReason3Div", "refundReason4Div"];
             if (option == "flights")
                 buttons = ["firstFlightInfoDiv", "secondFlightInfoDiv", "thirdFlightInfoDiv", "fourthFlightInfoDiv"];
             if (option == "issue")
                 buttons = ["issue1", "issue2", "issue3"];
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

         function removeButtonClicked(guestNumber, option) {
             var buttons = new Array();
             if (option == "guest")
                 buttons = ["guest1div", "guest2div", "guest3div", "guest4div", "guest5div", "guest6div"];
             if (option == "refund")
                 buttons = ["refundReason1Div", "refundReason2Div", "refundReason3Div", "refundReason4Div"];
             if (option == "flights")
                 buttons = ["firstFlightInfoDiv", "secondFlightInfoDiv", "thirdFlightInfoDiv", "fourthFlightInfoDiv"];
             if (option == "issue")
                 buttons = ["issue1", "issue2", "issue3"];
             var currentIndex = guestNumber - 1;
             var guestDiv = document.getElementById(buttons[currentIndex]);
             guestDiv.style.display = "none";
         }

         $("#countriesList").change(function () {
             $("#CountryCode").val(this.value);

         });

         $('#dateOfFlight').change(function () {
             var textBox = document.getElementById('dateOfFlight');
             if (textBox.value != "") {
                 textBox.className += "filled";
                 checkvalue(textBox);
             } else {
                 textBox.className.remove("filled");
             }
         });

         $('#dateOfFlight2').change(function () {
             var textBox = document.getElementById('dateOfFlight2');
             if (textBox.value != "") {
                 textBox.className += "filled";
                 checkvalue(textBox);
             } else {
                 textBox.className.remove("filled");
             }
         });

         $('#dateOfFlight3').change(function () {
             var textBox = document.getElementById('dateOfFlight3');
             if (textBox.value != "") {
                 textBox.className += "filled";
                 checkvalue(textBox);
             } else {
                 textBox.className.remove("filled");
             }
         });

         $('#dateOfFlight4').change(function () {
             var textBox = document.getElementById('dateOfFlight4');
             if (textBox.value != "") {
                 textBox.className += "filled";
                 checkvalue(textBox);
             } else {
                 textBox.className.remove("filled");
             }
         });

         $("#aerClubDropDown").change(function () {
             if (this.value != "" && this.value != "Not a Member") {
                 $("#_helpQueryAerClubmembershipId").attr("disabled", false);
                 var div1 = document.getElementById('ClubMembershipDiv');
                 document.getElementById('_helpQueryAerClubmembershipId').required = true;
                 div1.style.display = "block";
             } else {
                 $("#aerClubmembershipId").attr("disabled", true);
                 document.getElementById('_helpQueryAerClubmembershipId').required = false;
                 $("#ClubMembershipDiv").hide();
                 var div2 = document.getElementById('ClubMembershipDiv');
                 div2.style.display = "none";
             }
         });

         $('#guestSalutation')
              .change(function () {
                  var salutation = this.selectedIndex;
                  var target = document.getElementById("salutationGuest1");
                  target.selectedIndex = salutation;


              });

         function autoPopulateFirstGuestName() {
             var firstName = document.getElementById('FirstName').value;
             document.getElementById('firstGuestFirstName').classList.add('filled');
             var firstGuestName = document.getElementById('firstGuestFirstName');
             firstGuestName.value = firstName;
         }

         function autoPopulateFirstGuestLastName() {
             var lastName = document.getElementById('LastName').value;
             document.getElementById('firstGuestLastName').classList.add('filled');
             var firstGuestLastName = document.getElementById('firstGuestLastName');
             firstGuestLastName.value = lastName;
         }

    </script>
     
</body>
</html>

