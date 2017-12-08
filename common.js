function setSelect(selectid, xmlpath, xmlnode, firstOption, defaultselect) {
    var loadingtext = '-- Loading --';
    var loadinghtml = '<option value="">' + loadingtext + '</option>';
    var randomno = Math.ceil(Math.random() * 999);

    $(selectid).html(loadinghtml);

    $.ajax({
        url: xmlpath + '?=rn' + randomno,
        success: function (xml) {
            parseSelectXML(xml, selectid, xmlnode, firstOption, defaultselect);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
        }
    });
}


function parseSelectXML(xml, selectid, xmlnode, firstOption,defaultselect) {
    var firstoption = firstOption;
    var firsthtml = '<option value="">' + firstoption + '</option>';
    var selecthtml = '';

    $(xml).find(xmlnode).each(function () {

        var selecttext = $(this).find('ID').attr('value');
        var selectvalue = $(this).find('Name').attr('value');
        if (selectvalue == defaultselect){ 
            selecthtml += '<option value="' + selectvalue + '" selected>' + selecttext + '</option>';
            setSelect('#refundReason1', 'RefundRequestInfo.xml', 'FlightRelated', 'Please Select', 'RF CU RQ CX');
        }
        else
        {
            selecthtml += '<option value="' + selectvalue + '">' + selecttext + '</option>';
        }
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