<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ContactUs.ErrorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="ContactUs.css" type="text/css" rel="stylesheet" />    
    <script  type="text/javascript">
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable)
                { return pair[1]; }
            }
        }
        var error1 = decodeURI(getQueryVariable("error"));
        alert(error1);
    </script>
</head>
<body>
    <div class="DivBody" align="center">
        <div class="DivForm">
            <div id="BlockText" style="text-align: center; width:430;">
                <img id="ErrorImage" alt="There was an error in the submission of your request.  Please try your submission again." src="images/error.png"  />
               <br><br>
            </div>
            <div id="error_msg"></div>
        </div>
    </div>
</body>
</html>
