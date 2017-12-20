<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TravelEnquiry.aspx.cs" Inherits="TravelEnquiry" %>

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
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    	<script src="/js/jquery.validate.js"></script>
    <script src="/js/jquery-1.8.2.js"></script>
    <style>
         .gray-wide-bg {
                width: 900px;
                background-color: #f9f9f9; 
            }
     </style>    
         
    
 <link rel="stylesheet" href="https://AstuteSolutions.com/distributable-assets/css/AerLingus/formStyle.css"/>


</head>
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
     <script src = "https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js" type="text/javascript"></script>
    <script src="/js/jquery.js"></script>
    <script type="text/javascript">  
        function Count() {  
  
            var i = document.getElementById("_helpQueryAdditionInformation").value.length;
            document.getElementById("_helpQueryCharCount").innerHTML ="Characters Remaining : "+( 1000 - i);

        }

        function validateForm() {
            var x = document.forms["_helpQueryForm"]["_helpQueryFirstName"].value;
            if (x == null || x == "") {
                alert("First name must be filled out");
                return false;
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
                    <table >   
                        <!-- First Row -->            
                        <tr>
                            <td>
                                <label class="visuallyhidden">Select your title</label>
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
                        <!-- Second Row --> 
                        <tr>
                            <td colspan="3">
                                <div class="input-container" >
                                    <input type="email" name="_helpQueryEmail" id="_helpQueryEmail" style="width: 397px" class="form-control inline-label" required="required" title="Please enter your email address" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Email Address</label>
                                </div>
                                <div class="input-container" >
                                    <input type="email" name="email" id="email" style="width: 398px" title="Please confirm your email address" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Confirm Email Address</label>
                                </div>
                            </td>
                        </tr>
                        <!-- Second Row --> 
                        <!-- Third Row --> 
                        <tr>
                            <td>
                                <label class="visuallyhidden">Select your Country</label>
                                <asp:XmlDataSource ID="_helpQueryCountriesSource" runat="server" DataFile="Countries.xml" XPath="Countries/country" ></asp:XmlDataSource>
                                <div class="input-container" >
                                    <select class=" dropdown-toggle" name="_helpQueryCountryList" id="_helpQueryCountryList" style="width:260px;height:30px;text-align:left" required="required">                        
                                    </select>
                                </div>
                            </td>
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
                        <!-- End of Third Row --> 
                        <!-- Fourth Row --> 
                        <tr>             
                            
                        </tr>
                        <!-- End of Fourth Row --> 
                        <!-- Fifth Row --> 
                         <tr>
                            <td class="auto-style1">
                                <label class="visuallyhidden">Select AerClub Tier</label>
                                <select  class=" dropdown-toggle" style="height:30px;width:260px" name="_helpQueryAerClubDropDown" id="_helpQueryAerClubDropDown" runat="server"    >
                                    <option value="Selected" selected="selected">AerClub Tier</option>
                                    <option value="Concierge" >Concierge</option>
                                    <option value="Platinum">Platinum</option>
                                    <option value="Silver" >Silver</option>
                                    <option value="Green" >Green</option>
                                    <option value="Not a Member">Not a member</option>
                                </select>
                            </td>
                            <td class="auto-style1">
                                <div class="input-container" >
                                    <input type="text" maxlength="16" name="_helpQueryAerClubmembershipId" id="_helpQueryAerClubmembershipId" style="display: none; width: 260px" pattern="[0-9]{16}" required title="Please Enter your 16 Digit AerClub Membership Number" disabled="disabled" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">AerClub Membership Number</label>
                                </div>
                            </td> 
                            </tr>
                    </table>
               
             <table>
          <tr>
              <td colspan="2">
                         <h2 class="xl2 tealGreen"> Flight Information (if applicable)</h2>
                         <div>To add more than one flight, simply click the '+' sign:</div>
                  </td>
        </tr>
                 <tr>
                   <td>
                    <div class="input-container" >
                        <input type="text" id="_helpQuerybookingReferenceNumber" name="_helpQuerybookingReferenceNumber" style="width: 260px; text-transform: uppercase" pattern="^[2][0-9a-zA-Z]{5}" maxlength="6" title="Enter your booking reference. Must start with a 2, contain letters and numbers" class="form-control inline-label" onblur="checkvalue(this)"/>
                        <label class="form-control-label">Booking Reference</label>
                    </div>
                     
                    </td>
                     <td>
                    <div class="input-container" >
                        <input type="text" name="_helpQueryFlightNumber" id="_helpQueryFlightNumber" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="Please enter your 3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                    <label class="form-control-label">Flight Number</label>
                    </div>
                    </td>
                    <td>
                        <asp:TextBox  ID="_helpQueryDateOfFlight" runat="server" Text="Flight Date"  title="Please enter your flight date, Day-Month-Year" Width="260px" Height="30px"  CssClass="textboxborder" required="required" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="DateValidator" ControlToValidate="_helpQueryDateOfFlight" InitialValue="Flight Date" runat="server"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <button type="button" title="Add another flight" id="addFlightsButton1" class="transparentBtn" aria-label="Click to add an additional flight">+</button>                    
                    </td>
                </tr>
                <tr>
                    
                </tr>
            </table>
                    <div class="input-container" id="secondFlightInfoDiv" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container">
                                        <input type="text" id="FlightNumber2" name="FlightNumber2" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="Please enter your 3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Number</label> 
                                    </div>
                                </td>
                                <td>
                                    <asp:TextBox  ID="dateOfFlight2" runat="server" Text="Flight Date"  title="Please enter your flight date, Day-Month-Year" Width="260px" Height="30px"  CssClass="textboxborder" required="required" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="DateValidator2" ControlToValidate="dateOfFlight2" InitialValue="Flight Date" runat="server"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <button type="button" title="Add another flight" id="addFlightsButton2" class="transparentBtn" aria-label="Click to add an additional flight">+</button>
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
                                        <input type="text" id="FlightNumber3" name="FlightNumber3" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Number</label> 
                                    </div>
                                </td>
                                <td>
                                    <asp:TextBox  ID="dateOfFlight3" runat="server" Text="Flight Date" title="Please enter your flight date, Day-Month-Year"  Width="260px" Height="30px"  CssClass="textboxborder" required="required" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="DateValidator3" ControlToValidate="dateOfFlight3" InitialValue="Flight Date" runat="server"></asp:RequiredFieldValidator>
                                </td>
                                
                                <td>
                                    <button type="button" title="Add another flight" id="addFlightsButton3" class="transparentBtn" aria-label="Click to add an additional flight">+</button>
                                </td>
                                <td>
                                    <button type="button" title="Remove this flight" id="removeFlightsButton3" class="transparentBtn" aria-label="Click to remove a flight">-</button>
                                </td> 

                            </tr>
                        </table>
                    </div>  
                    <div class="input-container" id="fourthFlightInfoDiv" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    <div class="input-container">
                                        <input type="text" id="FlightNumber4" name="FlightNumber4" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Flight Number</label> 
                                    </div>
                                </td>
                                <td>
                                    <asp:TextBox  ID="dateOfFlight4" runat="server" Text="Flight Date"  title="Please enter your flight date, Day-Month-Year" Width="260px" Height="30px"  CssClass="textboxborder" required="required" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="DateValidator4" ControlToValidate="dateOfFlight4" InitialValue="Flight Date" runat="server"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <button type="button" title="Remove this flight" id="removeFlightsButton4" class="transparentBtn" aria-label="Click to remove a flight">-</button>
                                </td> 
                            </tr>
                        </table>
                    </div>  
            <table style="width: 100%">
            </table>
            <table>
             <tr>    
                <td> <h2 class="xl2 tealGreen"> How can we help? </h2></td>
             </tr>            
             <tr>
                    <td>
                           <label class="visuallyhidden">Select a Help Request</label>
                           <asp:DropDownList CssClass="dropdown-toggle" ID="_helpQueryTypeDropDownList"  runat="server"  Height="30px" Width="260px">
                            <asp:ListItem Text="Select help request" Value="Selected"></asp:ListItem>
                            <asp:ListItem Text="AerClub/Frequent Flyer" Value="A"></asp:ListItem>
                            <asp:ListItem Text="Need information" Value="H"></asp:ListItem>
                            <asp:ListItem Text="Need help with a booking" Value="I"></asp:ListItem>
                            <asp:ListItem Text="Request a document" Value="R"></asp:ListItem>
                            <asp:ListItem Text="Website issue" Value="W"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="QuerytypeValidator" ControlToValidate="_helpQueryTypeDropDownList" InitialValue="Selected" runat="server"/>
                    </td>
                    <td>
                        <label class="visuallyhidden">Select a Specific Help Request</label>
                        <select class=" dropdown-toggle" id="_helpQueryDefList" name="_helpQueryDefList"  runat="server" style="height:30px;width:260px" required>
                             <option value="" selected="selected">-- Please select --</option>
                        </select>
                       <asp:RequiredFieldValidator ID="_helpQueryDefListValidator" ControlToValidate="_helpQueryDefList" InitialValue="Default" runat="server" Enabled="false"/>
                    </td>
           </tr>
       
        
       </table>
        <br/>
        <label style="width: 90%"> Please use the comments section below to provide additional information that can assist us with your request. 
                                    For example, if adding a frequent flyer number to your booking, include the airline and number; if requesting a seat, 
                                    include your preference and we will accommodate where possible.
        </label>
        <table>
            <tr>
                <td> 
                    <h2 class="xl2 tealGreen"> Comments</h2>  
                </td>
            </tr>     
       </table>
         <p>  Please do not enter any payment card details into any data fields such as credit/debit card numbers and/or security codes. </p> 
        <div>
            <table style="width: 100%">
                  <tr>
                <td>
              <asp:TextBox TextMode="MultiLine" onkeyup="Count()" Height="100" Width="525" id="_helpQueryAdditionInformation" maxlength="1000" runat="server" aria-label="Please provide any additional information to assist us with your enquiry."></asp:TextBox>

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
        
       <div style="margin-left: 350px;padding:20px" >
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
   <script>
        $("#_helpQueryDateOfFlight").datepicker({ dateFormat: 'dd-M-yy' });
        $("#dateOfFlight2").datepicker({ dateFormat: 'dd-M-yy' });
        $("#dateOfFlight3").datepicker({ dateFormat: 'dd-M-yy' });
        $("#dateOfFlight4").datepicker({ dateFormat: 'dd-M-yy' });
                            
     $("#_helpQueryCountryList").change(function () {
          $("#_helpQueryTelephoneCode").val(this.value);
         
      });

      $("#_helpQueryAerClubDropDown").change(function () {
          if(this.value!="Selected" && this.value!="Not a Member")
          {
              $("#_helpQueryAerClubmembershipId").attr("disabled", false);
              $("#_helpQueryAerClubmembershipId").show();
              ValidatorEnable(document.getElementById("_helpQueryDefListValidator"), true);
          } else {
              $("#_helpQueryAerClubmembershipId").attr("disabled", true);
              $("#_helpQueryAerClubmembershipId").hide();
              ValidatorEnable(document.getElementById("_helpQueryDefListValidator"), false);
          }
      });

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
          var firstoption = '-- Please select --';
          var firsthtml = '<option value="">' + firstoption + '</option>';
          var selecthtml = '';

          $(xml).find(xmlnode).each(function () {

              var selecttext = $(this).find('ID').attr('value');
              var selectvalue = $(this).find('RC').attr('value');
              selecthtml += '<option value="' + selectvalue + '">' + selecttext + '</option>';
          });

          $(selectid).html(firsthtml + selecthtml);
      }

      $("#_helpQueryTypeDropDownList").change(function () {
          if (this.value != "Selected") {
              $("#_helpQueryDefList").attr("Disabled", false);
              $("#_requestRefundReasonInfo2").empty();
          } else {
              $("#_helpQueryDefList").attr("Disabled", true);
          }

          if (this.value == "A") {
              setSelectQuery('#_helpQueryDefList', 'HelpInfo.xml', 'AerClub');
          }

          if (this.value == "H") 
          {   
              setSelectQuery('#_helpQueryDefList', 'HelpInfo.xml', 'Info'); 
          }

          if (this.value == "I") 
          {
              setSelectQuery('#_helpQueryDefList', 'HelpInfo.xml', 'Description');
          }

          if (this.value == "R") 
          {
              setSelectQuery('#_helpQueryDefList', 'HelpInfo.xml', 'Receipt');
          }
          
          if(this.value == "W")
          {
              setSelectQuery('#_helpQueryDefList', 'HelpInfo.xml', 'WebIssue');
          }

          if(this.value == "O")
          {
              setSelectQuery('#_helpQueryDefList', 'HelpInfo.xml', 'Other');
          }

         
      });

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
                            function checkvalue(value)
                            {
                                var inputelement = document.getElementById(value.id);
                                if (value.id == "email")
                                {
                                    var email = document.getElementById("_helpQueryEmail");
                                    
                                    if (inputelement.value != email.value)
                                    {
                                       
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
