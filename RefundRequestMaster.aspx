<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RefundRequestMaster.aspx.cs" Inherits="RefundRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="js/style-2.css" />
        <link rel="stylesheet" href="js/screen.css"/>
        <link rel="stylesheet" href="js/Style-3.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://AstuteSolutions.com/distributable-assets/css/AerLingus/formStyle.css"/>
        <link rel="stylesheet" href="css/Common.css"/>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="/js/jquery.validate.js"></script>
        <script src="/js/jquery-1.8.2.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
            <h4 class="xl2 tealGreen" style="font-size: 1em">Representative Information</h4>
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
        </div> 
</asp:Content>

