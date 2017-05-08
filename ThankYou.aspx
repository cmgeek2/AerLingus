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
    <style> 
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
    margin-top:100px;
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
</head>
    <body style="align-items:center">
        <div  style="align-content:center;width:600px;height:150px;border:2px solid #73AD21 ; background-color:#F8FDEC;border-radius:10px;align-content:center">
            <table>
                <tr><td>
            <table >
                <tr>
                    <td style="padding:10px">
                        <asp:Image ImageUrl="~/Images/RightImage.png" width="125px" height="130px"    runat="server"></asp:Image>

                    </td>
                    <td>
                        <table >
                            <tr><td style="padding-bottom:20px" class="auto-style2" ><span class="tealGreen xxl">Help Request Sent Successfully</span></td></tr>
                            <tr><td class="auto-style2" style="padding-bottom:20px"><span class="tealGreen xsmall-table">Thank You</span></td></tr>
                            <tr><td class="auto-style2" style="padding-bottom:20px">
                               
                                <span class="tealGreen xsmall-table">Your Help Request has been Sent Successfully</span></td></tr>
                        </table>
                    </td>
                   
                    </tr>
            </table>
                    </td><td  style="vertical-align:top;padding-top:8px" class="auto-style1">
                         <a href="NeedHelp.aspx" class="button circle circle-xs float-right circle-x button-gray" >
                                <span class="icon"  data-icon="&times"></span>
                                 </a>
                       
                </table>
             
        </div>
        
</body>
</html>