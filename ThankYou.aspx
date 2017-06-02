<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ThankYou.aspx.cs" Inherits="ContactUs.ThankYou" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title></title>
    <link href="ContactUs.css" type="text/css" rel="stylesheet" /> 
     <link rel="stylesheet" href="js/style-2.css" />
     <link rel="stylesheet" href="js/screen.css"/>
     <link rel="stylesheet" href="js/Style-3.css" />
   <script src="/js/jquery.validate.js" type="text/javascript"></script>
    <script src="/js/jquery-1.8.2.js" type="text/javascript"></script>
    <style type="text/css"> 
        #rcorners1 {
            border-radius: 25px;
            background: #73AD21;
            padding: 20px; 
            width: 200px;
            height: 150px;    
        }

        div {
            border-radius: 25px;
            border: 2px solid #73AD21;
            margin-left:auto;
            margin-right:auto;
            width: 500px;
            margin-top:0px;
            height: 150px;    
        }

        span{
            color: blue;
            font-family: verdana;
            font-size: 16px;
        }

        .auto-style1 {
            width: 28px;
        }

        .auto-style2 {
            width: 432px;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById("idHeading").focus();
        });
    </script>
</head>
    
    <body style="align-items:center" onload="window.scrollTo(0,0)">
        <div  style="align-content:center;width:800px;height:150px;border:2px solid #73AD21 ; background-color:#F8FDEC;border-radius:10px;align-content:center">             
            <table style="width: 100%">
                <tr>
                    <td style="padding: 10px; width: 20%">
                        <asp:Image ID="pageImage" ImageUrl="~/Images/RightImage.png" width="125px" height="130px"  AlternateText="Request sent"  runat="server"></asp:Image>
                    </td>
                    <td>
                        <table style="width: 100%" role="presentation">
                            <tr>
                                <td runat="server" style="padding-bottom: 20px" class="auto-style2" id="headingTD"/>     
                            </tr>
                            <tr>
                                <td class="auto-style2" style="padding-bottom:20px"><asp:label runat="server" id="idBody" class="tealGreen xsmall-table">Thank You</asp:label></td>
                            </tr>
                            <tr>
                                <td class="auto-style2" style="padding-bottom:20px">                               
                                    <asp:label runat="server" id="idFooter" class="tealGreen xsmall-table"></asp:label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td  style="vertical-align:top;padding-top:8px" class="auto-style1; width:20%;">
                        <asp:HyperLink runat="server" ID="fromLink" CssClass="button circle circle-xs float-right circle-x button-gray">
                            <span class="icon" role="button" aria-label="Close message" tabindex="0"  data-icon="&times"></span>
                        </asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>       
    </body>
</html>