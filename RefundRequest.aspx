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
    <link rel="stylesheet" href="https://AstuteSolutions.com/distributable-assets/css/AerLingus/formStyle.css"/>
    <link rel="stylesheet" href="css/Common.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/js/jquery.validate.js"></script>
    <script src="/js/jquery-1.8.2.js"></script>
    <style>
        .transparentBtn {
                background-color: Transparent;
                background-repeat:no-repeat;
                border: none;
                cursor:pointer;
                overflow: hidden;
                outline:none;

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

        function guestRadioBtnCanged() {
            var div = document.getElementById('representativeName');
            var comapnyNameDiv = document.getElementById('repCompanyNameDiv');
            div.style.display = "none";
            comapnyNameDiv.style.display = "none";
            var header = document.getElementById('header2');
            header.innerText = "Guest Information";
        }

        function repRadioBtnChanged() {
            var div = document.getElementById('representativeName');
            var comapnyNameDiv = document.getElementById('repCompanyNameDiv');
            div.style.display = "block";
            comapnyNameDiv.style.display = "block";
            var header1 = document.getElementById('header1');
            header1.innerText = "Guest Information";
            var header2 = document.getElementById('header2');
            header2.innerText = "Representative Information"
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
                            <label class="radio-inline">
                                <input type="radio" name="group1" checked="checked" onclick="guestRadioBtnCanged()"/>I am the guest
                            </label> 
                            <label class="radio-inline">
                                <input type="radio" name="group1" onclick="repRadioBtnChanged()"/>I am the representative of the guest
                            </label> 
                            <br/>
                            <br/>
                    </div>
                    
                    <div class="input-container" id="representativeName" style="display: none">
                        <h4 id="header1" class="xl2 tealGreen" style="font-size: 1em">Representative Information</h4>
                        <table>
                            <tr>
                                <td>
                                        <asp:DropDownList  CssClass="dropdown-toggle"  ID="RepresentativeDropDownList1" Height="30px"  runat="server" Width="260px"  >
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
                                        <input type="text" style="width: 260px" id="representativeFirstName" title="Please enter your first name" name="helpQueryFirstName" class="form-control inline-label  " required="required" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">First Name</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-container" >
                                        <input type="text" style="width: 260px" id="representativeLastName" title="Please enter your family name" name="helpQueryLastName" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                        <label class="form-control-label">Family Name</label>
                                    </div>
                                </td>
                            </tr>
                        </table>
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

                    <div class="input-container" id="repCompanyNameDiv" style="display: none">
                        <input type="text" name="_helpQueryEmail" id="repCompanyName" style="width: 360px" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                        <label class="form-control-label">Company Name</label>
                    </div>
                    <table> 
                        <!-- Second Row --> 
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <input type="email" name="_helpQueryEmail" id="_helpQueryEmail" style="width: 360px" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Email Address</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="email" name="email" id="email" style="width: 360px" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Confirm Email Address</label>
                                </div>
                            </td>
                        </tr>
                        <!-- Second Row --> 
                    </table>
                    <table>                         
                        <!-- Third Row --> 
                        <tr>
                            <td>
                                <asp:XmlDataSource ID="_helpQueryCountriesSource" runat="server" DataFile="Countries.xml" XPath="Countries/country" ></asp:XmlDataSource>
                                <div class="input-container" >
                                    <select class=" dropdown-toggle" name="_helpQueryCountryList" id="_helpQueryCountryList" style="width:260px;height:30px;text-align:left" required onchange="countrySelected()">
                        
                                     </select>
                  
                                </div>
                            </td>
                         </tr>
                        <!-- End of Third Row --> 
                        <!-- Fourth Row --> 
                        <tr>             
                            <td>
                                <asp:XmlDataSource ID="_helpQueryCountryCode" runat="server" DataFile="CountryCodes.xml" XPath="CountryCode/AreaCode"></asp:XmlDataSource>
                                <asp:DropDownList  CssClass=" dropdown-toggle"  ID="_helpQueryTelephoneCode" Height="30px"  runat="server" Width="260px"  DataSourceID="_helpQueryCountryCode" DataTextField="name" DataValueField="value"></asp:DropDownList>
                             </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" pattern="[0-9]{5,12}" maxlength="12" title="Please use area code and local number" name="_helpQueryTelephoneNumber" id="_helpQueryTelephoneNumber" class="form-control inline-label" required="required" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Telephone Number</label>
                                </div>             
                            </td>
                        </tr>
                        <!-- End of Fourth Row --> 
                    </table>
                    <table>
                        <!-- Fifth Row --> 
                        <tr>
                            <td >
                                <div class="input-container" >
                                    <input type="text" name="addres1" id="address1" style="width: 360px" class="form-control inline-label" required="required" pattern="^\s*\S+(?:\s+\S+){2}" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Address 1</label>
                                </div> 
                            </td>
                            <td>
                                <div class="input-container">  
                                    <input type="text" name="address2" id="address2" style="width: 360px" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Address 2</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table> 
                        <!-- End of Fifth Row --> 
                        <!-- Sixth Row -->
                        <tr>
                            <td colspan="3">
                                <div class="input-container" >
                                    <input type="text" name="townCity" id="townCity" maxlength="4" style="width: 260px" title="town or city" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Town/City</label>
                                </div>
                            </td>
                        </tr>
                        <!-- End of Sixth Row -->
                        <!-- Seventh Row -->
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <input type="text" name="countryState" id="countryState" maxlength="4" style="width: 260px" title="country or state" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Country/State</label>
                                </div>
                            </td>
                        </tr>
                        <!-- End of Seventh Row -->
                        
                        <!-- Eighth Row -->
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <input type="text" name="zipCode" id="zipCode" maxlength="4" style="width: 260px" title="postal zip code" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Postaly/Zip Code</label>
                                </div>
                            </td>
                        </tr>
                        <!-- End of Eighth Row -->
                        
                        <!-- Nineth Row --> 
                         <tr>
                            <td class="auto-style1">
                                <select  class=" dropdown-toggle" style="height:30px;width:260px" name="_helpQueryAerClubDropDown" id="_helpQueryAerClubDropDown" runat="server"    >
                                    <option value="Selected" selected="selected">AerClub Tier</option>
                                    <option value="Concierge" >Concierge</option>
                                    <option value="Platinum">Platinum</option>
                                    <option value="Silver" >Silver</option>
                                    <option value="Green" >Green</option>
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
                            <td>&nbsp</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <h2 class="xl2 tealGreen"> Flight Information (if applicable)</h2>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <input type="text" name="_helpQueryFlightNumber" id="_helpQueryFlightNumber" maxlength="4" style="width: 260px" pattern="[0-9]{3,4}" title="3 or 4 digit flight number" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Flight Number</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                                <script>
                                    $(function () {
                                        $("#_helpQueryDateOfFlight").datepicker({ dateFormat: 'dd-M-yy' });
                                    });
                                </script>
                                <asp:TextBox  ID="_helpQueryDateOfFlight" runat="server" Text="Flight Date"   Width="260px" Height="30px"  CssClass="textboxborder" required="required" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="DateValidator" ControlToValidate="_helpQueryDateOfFlight" InitialValue="Flight Date" runat="server"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-container" >
                                    <input type="text" id="_helpQuerybookingReferenceNumber" name="_helpQuerybookingReferenceNumber" style="width: 260px; text-transform: uppercase" pattern="^[2][0-9a-zA-Z]{5}" maxlength="6" title="Must start with a 2, contain letters and numbers" class="form-control inline-label" onblur="checkvalue(this)"/>
                                    <label class="form-control-label">Booking Reference</label>
                                </div>
                                <br />
                                <br />
                                <br />
                            </td>                            
                        </tr>

                        <tr>
                            <td>
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="DropDownList11" Height="30px"  runat="server" Width="260px"  >
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
                                    <input type="text" style="width: 260px" id="helpQueryFirstName1" name="helpQueryFirstName2" class="form-control inline-label"  />
                                    <label class="form-control-label">First Name</label>
                                </div>
                            </td>
                            <td>
                                <div class="input-container" >
                                    <input type="text" style="width: 260px" id="helpQueryLastName1"  name="helpQueryLastName" class="form-control inline-label" />
                                    <label class="form-control-label">Family Name</label>
                                </div>
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td>
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="DropDownList2" Height="30px"  runat="server" Width="260px"  >
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
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="DropDownList3" Height="30px"  runat="server" Width="260px"  >
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
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="DropDownList4" Height="30px"  runat="server" Width="260px"  >
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
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="DropDownList5" Height="30px"  runat="server" Width="260px"  >
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
                                <asp:DropDownList  CssClass="dropdown-toggle"  ID="DropDownList6" Height="30px"  runat="server" Width="260px"  >
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
                            <td colspan="3">If you have more than one reason please choose the "+" to add additional reasons </td>   
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList CssClass="dropdown-toggle" ID="_helpQueryTypeDropDownList"  runat="server"  Height="30px" Width="260px">
                                    <asp:ListItem Text="Select Query Type" Value="Selected"></asp:ListItem>
                                    <asp:ListItem Text="Need Information" Value="H"></asp:ListItem>
                                    <asp:ListItem Text="Need Help with a Booking" Value="I"></asp:ListItem>
                                    <asp:ListItem Text="Request a Receipt" Value="R"></asp:ListItem>
                                    <asp:ListItem Text="Website Issue" Value="W"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="QuerytypeValidator" ControlToValidate="_helpQueryTypeDropDownList" InitialValue="Selected" runat="server"/>
                            </td>
                            <td>
                                <select class=" dropdown-toggle" id="_helpQueryDefList" name="_helpQueryDefList"  runat="server" style="height:30px;width:260px" required>
                                    <option value="" selected="selected">-- Please Select --</option>
                                </select>
                                <asp:RequiredFieldValidator ID="_helpQueryDefListValidator" ControlToValidate="_helpQueryDefList" InitialValue="Default" runat="server" Enabled="false"/>
                            </td>
                            <td>
                                <button type="button" class="transparentBtn">+</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Do you need a letter from your insurance?</p>
                            </td>
                            <td colspan="2">
                                <div class="input-container">
                                    
                                    <label class="radio-inline">
                                        <input type="radio" name="insurance" value="yes" />Yes
                                    </label> 
                                    <label class="radio-inline">
                                        <input type="radio" name="insurance" value="no"/>No
                                    </label> 
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
     <script type="text/javascript">
         $("#_helpQueryCountryList").change(function () {
             $("#_helpQueryTelephoneCode").val(this.value);

         });

         $("#_helpQueryAerClubDropDown").change(function () {
             if (this.value != "Selected") {
                 $("#_helpQueryAerClubmembershipId").attr("disabled", false);
                 $("#_helpQueryAerClubmembershipId").show();
                 ValidatorEnable(document.getElementById("_helpQueryDefListValidator"), true);
             } else {
                 $("#_helpQueryAerClubmembershipId").attr("disabled", true);
                 $("#_helpQueryAerClubmembershipId").hide();
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

         $("#_helpQueryTypeDropDownList").change(function () {
             if (this.value != "Selected") {
                 $("#_helpQueryDefList").attr("Disabled", false);
                 $("#_requestRefundReasonInfo2").empty();
             } else {
                 $("#_helpQueryDefList").attr("Disabled", true);
             }

             if (this.value == "H") {
                 setSelectQuery('#_helpQueryDefList', 'HelpInfo.xml', 'Info');
             }

             if (this.value == "I") {
                 setSelectQuery('#_helpQueryDefList', 'HelpInfo.xml', 'Description');
             }

             if (this.value == "R") {
                 setSelectQuery('#_helpQueryDefList', 'HelpInfo.xml', 'Receipt');
             }

             if (this.value == "W") {
                 setSelectQuery('#_helpQueryDefList', 'HelpInfo.xml', 'WebIssue');
             }

             if (this.value == "O") {
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

