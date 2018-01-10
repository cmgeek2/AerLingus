<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ContactUs.ErrorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="js/style-2.css" />
    <link rel="stylesheet" href="js/screen.css"/>
    <link rel="stylesheet" href="js/Style-3.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/Common.css"/>
    <link rel="stylesheet" href="https://AstuteSolutions.com/distributable-assets/css/AerLingus/formStyle.css"/>
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
        var baseURL = getQueryVariable("sender");
        alert(error1);
    </script>
</head>
<body>
    <div class="DivBody" align="center">
        <div class="DivForm">
            <div id="BlockText" style="text-align: center; width:430;">
            <br><br>
                <p>There was an error in the submission of your request.  Please try your submission again.</p>
                <script type="text/javascript">
                    document.write("<p>To go back to the previous page, click <a href='" + baseURL + "'> here</a></p>");
                </script>
               <br><br>
            </div>
            <div id="error_msg"></div>
        </div>
    </div>
</body>
</html>
