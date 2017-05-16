<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SpecialAssistance.aspx.cs" Inherits="SpecialAssistance"  EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="js/style-2.css" />
     <link rel="stylesheet" href="js/screen.css"/>
     <link rel="stylesheet" href="js/Style-3.css" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    	<script src="/js/jquery.validate.js"></script>
    <script src="/js/jquery-1.8.2.js"></script>
         <style>
             .input-container {
  display: inline-block;
  vertical-align: top;
  position: relative;
  max-width: 100%;
}

.inline-label {
  padding: 10px;
}
label{
    font-weight:400;
}

/* style that just styles the input */
.form-control {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 1px;
  border-top-left-radius: 1px;
/*  just adds the inset shadow  */
  background-clip: padding-box;
  border-width: 1px;
/*  default styles for the input  */
  display: block;
  padding: 19px 2px 3px;
 }

select{
     border: solid  #d3d3d3;
  border-width:.02px
}

.textboxborder{
     border: solid  #d3d3d3;
     color: #777;
  border-width:.02px
}

.form-control ~ .form-control-label {
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  -ms-transition: all 0.5s ease;
  transition: all 0.5s ease;
  -webkit-transform-origin: 0%;
  -moz-transform-origin: 0%;
  -ms-transform-origin: 0%;
  transform-origin: 0%;
  position: absolute;
  color: #777;
  cursor: text; 
  left: 2px;
  top: .85em;
  pointer-events: none;
  white-space: nowrap;
  max-width: 100%;
  text-overflow: ellipsis;
  overflow: hidden;
  padding-right: 1px;
}
.form-control:focus {
  color: #008374;
  outline: none;
  border: 0px solid #008374;
  -webkit-box-shadow: 0px 0px 2px 0px #008374;
  box-shadow: 0px 0px 2px 0px #008374;
}
.form-control:focus ~ .form-control-label {
  color: #008374;
      will-change: all;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    -o-transition: all 0.2s ease;
    -ms-transition: all 0.2s ease;
    transition: all 0.2s ease;
    -webkit-transform: scale(0.5 );
    -ms-transform: scale(0.5 );
    transform: scale(0.5);
    -webkit-transform: scale(0.5);
    -moz-transform: scale(0.5);
    -o-transform: scale(0.5);
    -ms-transform: scale(0.5);
    transform: scale(0.5);
    top: .086em;
    max-width: 130%;
}

.form-control.filled ~ .form-control-label {
    color: #008374;
      will-change: all;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    -o-transition: all 0.2s ease;
    -ms-transition: all 0.2s ease;
    transition: all 0.2s ease;
    -webkit-transform: scale(0.5 );
    -ms-transform: scale(0.5 );
    transform: scale(0.5);
    -webkit-transform: scale(0.5);
    -moz-transform: scale(0.5);
    -o-transform: scale(0.5);
    -ms-transform: scale(0.5);
    transform: scale(0.5);
    top: 0.086em;
    max-width: 130%;
}
select {
    direction: ltr;
    color:#555;
    padding-top: 4px;

}

label {
  display: inline-block;
  margin-bottom: 12px;
}
td{
    width:1.15em;
    height:1.55em;
    border:none;
    padding-bottom:5px;
    padding-top:5px;
    padding-right:10px
}


#_helpQueryForm label {
		width: 250px;
	}

#_helpQueryForm label.error, #_helpQueryForm input.submit {
		margin-left: 253px;
	}

.inputError{
    border: solid  #ff0000;
    border-width:.02px
}

textboxclass{
      width:1.95em;
    height:1.55em;
    padding-bottom:5px;
    padding-top:5px;
    padding-right:10px
}

.ui-datepicker {
   background: #333;
   border: 1px solid #555;
   color: #EEE;
 }
             .auto-style1 {
                 height: 2em;
             }

  

    </style>
 <link rel="stylesheet" href="https://AstuteSolutions.com/distributable-assets/css/AerLingus/formStyle.css"/>


</head>
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
     <script src"https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js" type="text/javascript"></script>
    <script src="/js/jquery.js"></script>
    <script type="text/javascript">  
        function Count() {  
  
            var i = document.getElementById("_helpQueryAdditionInformation").value.length;
            document.getElementById("_helpQueryCharCount").innerHTML ="Characters Remaining : "+( 1000 - i);

        }

        function validateForm() {
            var x = document.forms["_helpQueryForm"]["_helpQueryFirstName"].value
            if (x == null || x == "") {
                alert("First name must be filled out");
                return false;
            }
        }
      
    </script>  

   
  
<body>
  
   
    
   
    <div id="page1" data-role="page">
    <form id="_helpQueryForm"  runat="server" autocomplete="off" >
        <div>
    
        <div style="margin-left: 80px; margin-right: 172px;width:824;height:auto;margin-top:10px"  class="gray-12-bg ">
            <div style="margin-left: 30px" >
                 <br />
              
                
      
                <h2 class="xl2 tealGreen"> Contact Information</h2>
         <table >
             
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
                 <input type="text" style="width:260px" id="helpQueryFirstName" title="Please enter your first name" name="helpQueryFirstName"  class="form-control inline-label  " required="required" onblur="checkvalue(this)">
                    <label class="form-control-label">First Name</label>
                    </div>
              </td>
                <td>
                <div class="input-container" >
                 <input type="text" style="width:260px" id="helpQueryLastName" title="Please enter your family name" name="helpQueryLastName" class="form-control inline-label" required="required" onblur="checkvalue(this)">
                 <label class="form-control-label">Family Name</label>
                </div>
            </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="input-container" >
                    <input  type="email" name="_helpQueryEmail" id="_helpQueryEmail" style="width:360px"  class="form-control inline-label"  required="required" onblur="checkvalue(this)">
                    <label class="form-control-label">Email Address</label>
                    </div>
              
                  <div class="input-container" >
                    <input type="email" name="email" id="email" style="width:360px"  class="form-control inline-label" required="required" onblur="checkvalue(this)" >
                    <label class="form-control-label">Confirm Email Address</label>
                    </div>
            </td>
            </tr>
             <tr>
             <td>
                  <asp:XmlDataSource ID="_helpQueryCountriesSource" runat="server" DataFile="Countries.xml" XPath="Countries/country" ></asp:XmlDataSource>
                  <div class="input-container" >
                    <select class=" dropdown-toggle" name="_helpQueryCountryList" id="_helpQueryCountryList" style="width:260px;height:30px;text-align:left" required>
                        
                        </select>
                  
                    </div>
             </td>
             </tr>
            <tr>
              
            <td>
                <asp:XmlDataSource ID="_helpQueryCountryCode" runat="server" DataFile="CountryCodes.xml" XPath="CountryCode/AreaCode"></asp:XmlDataSource>
                <asp:DropDownList  CssClass=" dropdown-toggle"  ID="_helpQueryTelephoneCode" Height="30px"  runat="server" Width="260px"  DataSourceID="_helpQueryCountryCode" DataTextField="name" DataValueField="value"></asp:DropDownList>
                
               </td>
                <td>
                   <div class="input-container" >
                    <input type="text" style="width:260px"  required pattern="[0-9]{5,12}" maxlength="12" title="Please use area code and local number" name="_helpQueryTelephoneNumber" id="_helpQueryTelephoneNumber" class="form-control inline-label" required="required" onblur="checkvalue(this)">
                    <label class="form-control-label">Telephone Number</label>
                    </div>
               
                
               
            </td>
            </tr>
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
                    <input type="text" maxlength="16" name="_helpQueryAerClubmembershipId" id="_helpQueryAerClubmembershipId" style="display:none;width:260px" pattern="[0-9]{16}" required title="Please Enter your 16 Digit AerClub Membership Number"  disabled="disabled" class="form-control inline-label" onblur="checkvalue(this)">
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
                    <input type="text" name="_helpQueryFlightNumber" id="_helpQueryFlightNumber" maxlength="4" style="width:260px" pattern="[0-9]{3,4}" title="3 or 4 digit flight number"  class="form-control inline-label" onblur="checkvalue(this)">
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
                                 }
                              );
                            </script>
                    <asp:TextBox  ID="_helpQueryDateOfFlight" runat="server" Text="Flight Date"   Width="260px" Height="30px"  CssClass="textboxborder" required="required" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="DateValidator" ControlToValidate="_helpQueryDateOfFlight" InitialValue="Flight Date" runat="server"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                   <td>
                    <div class="input-container" >
                     <input type="text" id="_helpQuerybookingReferenceNumber" name="_helpQuerybookingReferenceNumber" style="width:260px;text-transform:uppercase"  pattern="^[2][0-9a-zA-Z]{5}" maxlength="6" title="Must start with a 2, contain letters and numbers" class="form-control inline-label" onblur="checkvalue(this)">

                    <label class="form-control-label">Booking Reference</label>
                    </div>
                     
                    </td>
                </tr>
              <tr>
                 <td>&nbsp</td>
             </tr>
             <tr>
             <td colspan="2"> <h2 class="xl2 tealGreen"> Request Disability Assistance </h2></td>
            </tr>
            
                <tr>
                    <td>
                         
                           <asp:DropDownList CssClass="dropdown-toggle" ID="_helpQueryTypeDropDownList"  runat="server"  Height="30px" Width="260px">
                            <asp:ListItem Text="Select Query Type" Value="Selected"></asp:ListItem>
                            <asp:ListItem Text="Wheelchair" Value="W"></asp:ListItem>
                            <asp:ListItem Text="Mobility Device" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Cognitive Disability" Value="C"></asp:ListItem>
                            <asp:ListItem Text="Oxygen" Value="X"></asp:ListItem>
                            <asp:ListItem Text="Medical Device" Value="D"></asp:ListItem>
                            <asp:ListItem Text="Service Animal" Value="S"></asp:ListItem>
                            <asp:ListItem Text="Other Special Needs" Value="O"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="QuerytypeValidator" ControlToValidate="_helpQueryTypeDropDownList" InitialValue="Selected" runat="server"/>
                    </td>
                    <td>
                   
                        <select class=" dropdown-toggle" id="_helpQueryDefList" name="_helpQueryDefList"  runat="server" style="height:30px;width:260px" required>
                             <option value="" selected="selected">-- Please Select --</option>
                        </select>
                       <asp:RequiredFieldValidator ID="_helpQueryDefListValidator" ControlToValidate="_helpQueryDefList" InitialValue="Default" runat="server" Enabled="false"/>
                    </td>
                </tr>
                 
                 <tr>
                     <td>
                         
                           <asp:DropDownList CssClass="dropdown-toggle" ID="_helpQueryTypeDropDownList2"  runat="server"  Height="30px" Width="260px">
                            <asp:ListItem Text="Select Query Type" Value="Selected"></asp:ListItem>
                            <asp:ListItem Text="Wheelchair" Value="W"></asp:ListItem>
                            <asp:ListItem Text="Mobility Device" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Cognitive Disability" Value="C"></asp:ListItem>
                            <asp:ListItem Text="Oxygen" Value="X"></asp:ListItem>
                            <asp:ListItem Text="Medical Device" Value="D"></asp:ListItem>
                            <asp:ListItem Text="Service Animal" Value="S"></asp:ListItem>
                            <asp:ListItem Text="Other Special Needs" Value="O"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="_QueryTypeValidator2" ControlToValidate="_helpQueryTypeDropDownList2" InitialValue="Selected" runat="server"/>
                    </td>
                    <td>
                   
                        <select class=" dropdown-toggle" id="_helpQueryDefList2" name="_helpQueryDefList2"  runat="server" style="height:30px;width:260px" >
                             <option value="" selected="selected">-- Please Select --</option>
                        </select>
                       <asp:RequiredFieldValidator ID="_helpQueryDefListValidator2" ControlToValidate="_helpQueryDefList2" InitialValue="Default" runat="server" Enabled="false"/>
                    </td>
                 </tr>
                 
                 <tr>
                     <td>
                         
                           <asp:DropDownList CssClass="dropdown-toggle" ID="_helpQueryTypeDropDownList3"  runat="server"  Height="30px" Width="260px">
                            <asp:ListItem Text="Select Query Type" Value="Selected"></asp:ListItem>
                            <asp:ListItem Text="Wheelchair" Value="W"></asp:ListItem>
                            <asp:ListItem Text="Mobility Device" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Cognitive Disability" Value="C"></asp:ListItem>
                            <asp:ListItem Text="Oxygen" Value="X"></asp:ListItem>
                            <asp:ListItem Text="Medical Device" Value="D"></asp:ListItem>
                            <asp:ListItem Text="Service Animal" Value="S"></asp:ListItem>
                            <asp:ListItem Text="Other Special Needs" Value="O"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="_QueryTypeValidator3" ControlToValidate="_helpQueryTypeDropDownList3" InitialValue="Selected" runat="server"/>
                    </td>
                    <td>
                   
                        <select class=" dropdown-toggle" id="_helpQueryDefList3" name="_helpQueryDefList3"  runat="server" style="height:30px;width:260px" >
                             <option value="" selected="selected">-- Please Select --</option>
                        </select>
                       <asp:RequiredFieldValidator ID="_helpQueryDefListValidator3" ControlToValidate="_helpQueryDefList3" InitialValue="Default" runat="server" Enabled="false"/>
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
            </div>
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
          if(this.value!="Selected")
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
              var selectvalue = $(this).find('ID').attr('value');
              selecthtml += '<option value="' + selectvalue + '">' + selecttext + '</option>';
          });

          $(selectid).html(firsthtml + selecthtml);

          var requestType = $('#<%=_helpQueryTypeDropDownList2.ClientID%>').val();
          if (requestType == "M") {
              $('#<%=_helpQueryDefList2.ClientID%> option:selected').text("Power wheelchair");
          }


      }

      $("#_helpQueryTypeDropDownList").change(function () {
          if (this.value != "Selected") {
              $("#_helpQueryDefList").attr("Disabled", false);
          } else {
              $("#_helpQueryDefList").attr("Disabled", true);
          }

          if (this.value == "W") 
          {   
              setSelectQuery('#_helpQueryDefList', 'SpecialAssistance.xml', 'Wheelchair'); 
          }

          if (this.value == "M") 
          {
              setSelectQuery('#_helpQueryDefList', 'SpecialAssistance.xml', 'Mobility');
          }

          if (this.value == "C") 
          {
              setSelectQuery('#_helpQueryDefList', 'SpecialAssistance.xml', 'Cognitive');
          }
          
          if(this.value == "X")
          {
              setSelectQuery('#_helpQueryDefList', 'SpecialAssistance.xml', 'Oxygen');
          }

          if(this.value == "D")
          {
              setSelectQuery('#_helpQueryDefList', 'SpecialAssistance.xml', 'Medical');
          }

          if(this.value == "S")
          {
              setSelectQuery('#_helpQueryDefList', 'SpecialAssistance.xml', 'Animal');
          }

          if(this.value == "O")
          {
              setSelectQuery('#_helpQueryDefList', 'SpecialAssistance.xml', 'Other');
          }

      });

      

      $("#_helpQueryTypeDropDownList2").change(function () {
          if (this.value != "Selected") {
              $("#_helpQueryDefList2").attr("Disabled", false);
          } else {
              $("#_helpQueryDefList2").attr("Disabled", true);
          }

          if (this.value == "W") {
              setSelectQuery('#_helpQueryDefList2', 'SpecialAssistance.xml', 'Wheelchair');
          }

          if (this.value == "M") {
              setSelectQuery('#_helpQueryDefList2', 'SpecialAssistance.xml', 'Mobility');
              //$('#<%=_helpQueryDefList2.ClientID%> option:selected').text("Power wheelchair");
          }

          if (this.value == "C") {
              setSelectQuery('#_helpQueryDefList2', 'SpecialAssistance.xml', 'Cognitive');
          }

          if (this.value == "X") {
              setSelectQuery('#_helpQueryDefList2', 'SpecialAssistance.xml', 'Oxygen');
          }

          if (this.value == "D") {
              setSelectQuery('#_helpQueryDefList2', 'SpecialAssistance.xml', 'Medical');
          }

          if (this.value == "S") {
              setSelectQuery('#_helpQueryDefList2', 'SpecialAssistance.xml', 'Animal');
          }

          if (this.value == "O") {
              setSelectQuery('#_helpQueryDefList2', 'SpecialAssistance.xml', 'Other');
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
