<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SpecialMealRequest.aspx.cs" Inherits="SpecialMealRequest" EnableEventValidation="false" %>

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

     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    	<script src="/js/jquery.validate.js"></script>
    <script src="/js/jquery-1.8.2.js"></script>
         
     
 <link rel="stylesheet" href="https://AstuteSolutions.com/distributable-assets/css/AerLingus/formStyle.css"/>
    

</head>

  
  <script type="text/javascript">
      function Count() {  
  
          var i = document.getElementById("_helpQueryAdditionInformation").value.length;
          document.getElementById("_helpQueryCharCount").innerHTML ="Characters Remaining : "+( 1000 - i);

      }

      function validateForm() {
          var x = document.forms["specialMealRequestForm"]["helpQueryFirstName"].value
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
    <input type="hidden" id="disabilityDisplayed" value="1"/>
    <div id="page1" data-role="page">
    <form id="specialMealRequestForm"  runat="server" autocomplete="off" >
        <div>   
        <div style="margin-left: 80px; margin-right: 172px;width:824px;height:auto;margin-top:10px"  class="gray-12-bg ">
            <div style="margin-left: 30px" >
                 <br />     
                <h2 class="xl2 tealGreen"> Contact Information</h2>
         <table >
             
            <tr>
            <td>
                <label class="visuallyhidden">Select your title</label>
                <div class="input-container" >
                    <select class=" dropdown-toggle" name="_helpQuerySalutation" id="_helpQuerySalutation" style="width:260px;height:30px;text-align:left" >                        
                    </select>
                </div>
              
              </td>
                <td>
                 <div class="input-container" >
                    <input type="text" style="width: 260px" id="_helpQueryFirstName" title="Please enter your first name" name="helpQueryFirstName" class="form-control inline-label  " required="required" onblur="checkvalue(this); autoPopulateFirstGuestName();"/>
                    <label class="form-control-label">First Name</label>
                 </div>
              </td>
                <td>
                <div class="input-container" >
                    <input type="text" style="width: 260px" id="_helpQueryLastName" title="Please enter your family name" name="helpQueryLastName" class="form-control inline-label" required="required" onblur="checkvalue(this); autoPopulateFirstGuestLastName();"/>
                 <label class="form-control-label">Family Name</label>
                </div>
            </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="input-container" >
                        <input type="email" name="_helpQueryEmail" id="_helpQueryEmail" title="Please enter your email address" style="width: 397px" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                    <label class="form-control-label">Email Address</label>
                    </div>
              
                  <div class="input-container" >
                      <input type="email" name="email" id="email" style="width: 398px" title="Please confirm your email address" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                    <label class="form-control-label">Confirm Email Address</label>
                    </div>
            </td>
            </tr>
             <tr>
             <td>
                 <label class="visuallyhidden">Select your Country</label>
                  <asp:XmlDataSource ID="_helpQueryCountriesSource" runat="server" DataFile="Countries.xml" XPath="Countries/country" ></asp:XmlDataSource>
                  <div class="input-container" >
                        <select class=" dropdown-toggle" name="_helpQueryCountryList" id="_helpQueryCountryList" style="width:260px;height:30px;text-align:left" required="required" > 
                        </select>                 
                  </div>
             </td>
             </tr>
            <tr>
              
            <td>
                <label class="visuallyhidden">Select your Telephone Country Code</label>
                <asp:XmlDataSource ID="_helpQueryCountryCode" runat="server" DataFile="CountryCodes.xml" XPath="CountryCode/AreaCode"></asp:XmlDataSource>
                <asp:DropDownList  CssClass=" dropdown-toggle"  ID="_helpQueryTelephoneCode" Height="30px"  runat="server" Width="260px"  DataSourceID="_helpQueryCountryCode" DataTextField="name" DataValueField="value"></asp:DropDownList>
                
               </td>
                <td>
                   <div class="input-container" >
                       <input type="text" style="width: 260px" pattern="[0-9]{5,12}" maxlength="12" title="Please enter your phone number - area code and local number" name="_helpQueryTelephoneNumber" id="_helpQueryTelephoneNumber" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                    <label class="form-control-label">Telephone Number</label>
                    </div>
            </td>
            </tr>
             </table>
            <br/>
            <br/>
             <div><h2 class="xl2 tealGreen"> Flight Information (if applicable)</h2></div>  
             <table style="width: 100%">
                 <tr>
                     <td>
                         <div class="input-container" style="margin-left: 20px;">
                             <br/>
                            <asp:RadioButtonList runat="server" ID="flightGroup" RepeatLayout="Flow" RepeatDirection="Horizontal" Class="radio-inline" onclick="radioButtonClicked()">
                                <asp:ListItem Text="Departure Flight" Value="Departure" Selected="True" Class="radio-inline-button"/>
                                <asp:ListItem Text="Return Flight" Value="Return" Class="radio-inline-button"/>
                                <asp:ListItem Text="Both" Value="Both" Class="radio-inline-button"/>
                            </asp:RadioButtonList>
                            <br/>
                            <br/>
                         </div>
                     </td>                     
                 </tr>
            </table>
            <div class="input-container" id="departureFlightDiv">
                <table>
                    <tr>
                        <td>
                            <div class="input-container" >
                                <input type="text" name="departureFlightNumber" id="departureFlightNumber" maxlength="4" style="width: 260px" required="required" pattern="[0-9]{3,4}" title="Please enter your 3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                <label  id="departureFlightNumberLabel"  class="form-control-label">Departure Flight Number</label>
                            </div>
                        </td>
                        <td>
                            <div class="input-container">
                                <input type="text"  id="departFlightDate" name="departFlightDate" style="width: 260px"  title="Please enter a valid date" required="required" class="form-control inline-label" onblur="checkvalue(this)"/>
                                <label id="departureFlightDateLabel" class="form-control-label">Departure Flight Date</label> 
                            </div>
                        </td>
                        <td>
                            <div class="input-container" >
                                <input type="text" id="bookingReferenceNumber" name="bookingReferenceNumber" style="width: 260px; text-transform: uppercase" required="required" pattern="^[2][0-9a-zA-Z]{5}" maxlength="6" title="Enter your booking reference. Must start with a 2, contain letters and numbers" class="form-control inline-label" onblur="checkvalue(this)"/>
                                <label id="bookingReferenceLabel" class="form-control-label">Booking Reference</label>
                            </div> 
                        </td>                
                    </tr>               
                </table>    
            </div>
            <div class="input-container" id="returningFlightdiv" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container">
                                        <input type="text" id="ReturnFlightNumber" name="ReturnFlightNumber" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="Please enter your 3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Return Flight Number</label> 
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container">
                                        <input type="text" id="returnFlightDate" name="returnFlightDate" title="" style="width: 260px;" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label id="returnFlightDateLabel" class="form-control-label">Return Flight Date</label>
                                    </div>     
                                </td>
                            </tr>    
                        </table>
            </div> 
            <!------------------------------------------------- -->
                    <br/><br/><br/>
            <div class="input-container" style="width: 100%"> <h2 class="xl2 tealGreen"> Meal Request</h2></div>
            <div>To add more than one request, simply click the '+' sign:</div>
                
                    <div class="input-container" id="guest1div">
                        <table>
                            <tr>
                                <td>
                                    <label class="visuallyhidden">Select your title</label>
                                    <div class="input-container" >
                                        <select class=" dropdown-toggle" name="salutationGuest1" id="salutationGuest1" style="width:80px;height:30px;text-align:left" >                        
                                        </select>
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
                                    <asp:DropDownList CssClass="dropdown-toggle" ID="Guest1MealDropDownList" Height="30px" runat="server" Width="260px"/>                                      
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
                                    <label class="visuallyhidden">Select your title</label>
                                    <div class="input-container" >
                                        <select class=" dropdown-toggle" name="salutationGuest2" id="salutationGuest2" style="width:260px;height:30px;text-align:left" >                        
                                        </select>
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
                                    <asp:DropDownList CssClass="dropdown-toggle" ID="Guest2MealDropDownList" Height="30px" runat="server" Width="260px"/>
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
                                   <label class="visuallyhidden">Select your title</label>
                                    <div class="input-container" >
                                        <select class=" dropdown-toggle" name="salutationGuest3" id="salutationGuest3" style="width:260px;height:30px;text-align:left" >                        
                                        </select>
                                    </div>              
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="thirdGuestFirstName2" name="thirdGuestFirstName2" class="form-control inline-label"  onblur="checkvalue(this)"/>
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
                                    <asp:DropDownList CssClass="dropdown-toggle" ID="Guest3MealDropDownList" Height="30px" runat="server" Width="260px"/>
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
                                    <label class="visuallyhidden">Select your title</label>
                                    <div class="input-container" >
                                        <select class=" dropdown-toggle" name="salutationGuest4" id="salutationGuest4" style="width:260px;height:30px;text-align:left" >                        
                                        </select>
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
                                    <asp:DropDownList CssClass="dropdown-toggle" ID="Guest4MealDropDownList" Height="30px" runat="server" Width="260px"/>
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
                                    <label class="visuallyhidden">Select your title</label>
                                    <div class="input-container" >
                                        <select class=" dropdown-toggle" name="salutationGuest5" id="salutationGuest5" style="width:260px;height:30px;text-align:left" >                        
                                        </select>
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
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="fifthGuestLastName"  name="fifthGuestFirstName" class="form-control inline-label" onblur="checkvalue(this) "/>
                                        <label class="form-control-label">Family Name</label>
                                    </div>
                                </td>
                                <td>
                                    <asp:DropDownList CssClass="dropdown-toggle" ID="Guest5MealDropDownList" Height="30px" runat="server" Width="260px"/>
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
                                    <label class="visuallyhidden">Select your title</label>
                                    <div class="input-container" >
                                        <select class=" dropdown-toggle" name="salutationGuest6" id="salutationGuest6" style="width:260px;height:30px;text-align:left" >                        
                                        </select>
                                    </div>             
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="helpQueryFirstName6" name="helpQueryFirstName2" class="form-control inline-label" onblur="checkvalue(this)" />
                                        <label class="form-control-label">First Name</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px; text-transform: capitalize" id="helpQueryLastName6"  name="helpQueryLastName" class="form-control inline-label" onblur="checkvalue(this)" />
                                        <label class="form-control-label">Family Name</label>
                                    </div>
                                </td>
                                <td>
                                    <asp:DropDownList CssClass="dropdown-toggle" ID="Guest6MealDropDownList" Height="30px" runat="server" Width="260px"/>
                                </td>
                                <td>
                                    <button type="button" title="Remove this guest" id="removeGuest6" class="transparentBtn" aria-label="Click to remove an additional request">-</button>
                                </td> 
                            </tr>
                        </table>
                    </div>
                    <!------------------------------------------------- -->                            
            <table>  
                <tr>
                    <td>&nbsp</td>
                </tr>
                <tr>
                    <td style="width: 100%"> 
                        <h2 class="xl2 tealGreen"> Additional Requests</h2>  
                    </td>
                </tr>            
            </table>
            <p>Any additional requests?</p>
            <div>
            <table style="width: 100%">
                <tr>
                    <td>
                        <asp:TextBox TextMode="MultiLine" onkeyup="Count()" Height="100" Width="525" id="_helpQueryAdditionInformation" maxlength="1000" runat="server" aria-label="Please provide any additional information to assist us with your request."></asp:TextBox>
                        <br />
                        <font size="2">  <label id="_helpQueryCharCount" runat="server"  >Characters Remaining :1000</label> </font>
                    </td>
                </tr>
                <tr>
			        <td colspan="3">* if travelling in our Business Class cabin your request for (KSML) must be done at least 48 hours prior to flight departure.</td>
		        </tr>
            </table>
        </div>
        
        <br />
        <br />
      
       <div style="margin-left: 320px;padding:20px" >
      
           <asp:Button ID="Submitbtn" CssClass="button button-standard button-shamrockGreen-gradient" runat="server" Text="Submit"  ValidationGroup="Submit" OnClick="SubmitButton_Click"></asp:Button>
        </div>
            </div>
            </div>
            </div>
    </form>
   
  
    
   </div> 
    <div style="margin:80px">
        
          
    </div>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script type="text/javascript">
         
         $("#departFlightDate").datepicker({ dateFormat: 'dd-M-yy' });
         $("#returnFlightDate").datepicker({ dateFormat: 'dd-M-yy' });

         $("#_helpQueryCountryList").change(function () {
             $("#_helpQueryTelephoneCode").val(this.value);
         
         });

         $('#returnFlightDate').change(function() {
             var textBox = document.getElementById('returnFlightDate');
             if (textBox.value != "") {
                 textBox.className += "filled";
                 checkvalue(textBox);
             } else {
                 textBox.className.remove("filled");
             }
         });

         $('#departFlightDate').change(function () {
             var textBox = document.getElementById('departFlightDate');
             if (textBox.value != "") {
                 textBox.className += "filled";
                 checkvalue(textBox);
             } else {
                 textBox.className.remove("filled");
             }
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

         function removeButtonClicked(guestNumber, option) {
             var buttons = new Array();
             if (option == "guest")
                 buttons = ["guest1div", "guest2div", "guest3div", "guest4div", "guest5div", "guest6div"];
             if (option == "refund")
                 buttons = ["refundReason1Div", "refundReason2Div", "refundReason3Div", "refundReason4Div"];
             if (option == "flights")
                 buttons = ["firstFlightInfoDiv", "secondFlightInfoDiv", "thirdFlightInfoDiv", "fourthFlightInfoDiv"];
             var currentIndex = guestNumber - 1;
             var guestDiv = document.getElementById(buttons[currentIndex]);
             guestDiv.style.display = "none";


         }

         //Populate drop downs
         setSelect('#_helpQuerySalutation', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest1', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest2', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest3', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest4', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest5', 'Titles.xml', 'title', 'Title');
         setSelect('#salutationGuest6', 'Titles.xml', 'title', 'Title');
         setSelect('#_helpQueryCountryList', 'Countries.xml', 'countries', 'Select Country');
         setSelect('#Guest1MealDropDownList', 'Meals.xml', 'meal', 'Select your meal');
         setSelect('#Guest2MealDropDownList', 'Meals.xml', 'meal', 'Select your meal');
         setSelect('#Guest3MealDropDownList', 'Meals.xml', 'meal', 'Select your meal');
         setSelect('#Guest4MealDropDownList', 'Meals.xml', 'meal', 'Select your meal');
         setSelect('#Guest5MealDropDownList', 'Meals.xml', 'meal', 'Select your meal');
         setSelect('#Guest6MealDropDownList', 'Meals.xml', 'meal', 'Select your meal');



         function setSelect(selectid, xmlpath, xmlnode, firstOption) {
             var loadingtext = '-- Loading --';
             var loadinghtml = '<option value="">' + loadingtext + '</option>';
             var randomno = Math.ceil(Math.random() * 999);

             $(selectid).html(loadinghtml);

             $.ajax({
                 url: xmlpath + '?=rn' + randomno,
                 success: function (xml) {
                     parseSelectXML(xml, selectid, xmlnode, firstOption);
                 },
                 error: function (xhr, ajaxOptions, thrownError) {
                     alert(xhr.status);
                     alert(thrownError);
                 }
             });
         }
     

         function parseSelectXML(xml, selectid, xmlnode, firstOption) {
             var firstoption = firstOption;
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
                     parseSelectXML1(xml, selectid, xmlnode);
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
                 var selectvalue = $(this).find('RC').attr('value');
                 selecthtml += '<option value="' + selectvalue + '{' + selecttext + '">' + selecttext + '</option>';
             });

             $(selectid).html(firsthtml + selecthtml);
         }

         function radioButtonClicked() {
             var radioSelected = $('#<%= flightGroup.ClientID %> input:checked').val();
             if (radioSelected != 'Both') {
                 document.getElementById('returningFlightdiv').style.display = "none";
                 changeFlightLabels(radioSelected);
                 $('#ReturnFlightNumber').removeAttr("required");
                 $('#returnFlightDate').removeAttr("required");
             }
                 
             else {
                 changeFlightLabels("Departure");
                 document.getElementById('returningFlightdiv').style.display = "block";
                 $('#ReturnFlightNumber').attr("required", "true");
                 $('#returnFlightDate').attr("required", "true");
             }
         }

         function changeFlightLabels(msg) {
             var flightNumberText = msg + ' Flight Number';
             var label = document.getElementById('departureFlightNumberLabel');
             label.innerHTML = flightNumberText;
             var flightDateText = msg + ' Flight Date';
             var label2 = document.getElementById('departureFlightDateLabel');
             label2.innerHTML = flightDateText;


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


         (function ($) {
             $("#specialMealRequestForm").validate({
                 rules: {

                     _helpQueryEmail: {
                         required: true
                     },
                     email: {
                         required: true,
                         equalTo: "#_helpQueryEmail"
                     },

                     _helpQueryFirstName: "required",
                     _helpQueryLastName: "required"
                 },
                 messages: {
                     helpQueryFirstName: "Please enter your firstname",
                     helpQueryLastName: "Please enter your lastname"

                 }

             });
         });

         $('#_helpQuerySalutation')
             .change(function () {
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
     
    </script>
     
</body>
</html>
