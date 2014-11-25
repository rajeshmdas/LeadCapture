<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeadForm.aspx.cs" Inherits="LnTMfWebLink.LeadForm" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
<meta id="MetaKeywords" name="KEYWORDS" content="Lead Capture Form" />
<meta id="MetaDescription" name="DESCRIPTION" content="Lead Capture Form"/>
<title>L&amp;T Lead Capture Form</title>

<link type="text/css" href="css/style.css"  rel="Stylesheet" />

<% 
   
    LnTMfWebLink.Models.LeadCapture lcf = (LnTMfWebLink.Models.LeadCapture)Session["lead"];
    if (lcf == null)
    {
        lcf = new LnTMfWebLink.Models.LeadCapture();
        
    }
%>
<script type="text/javascript" language="javascript">

window.history.forward(1);
if (navigator.appName == "Netscape" || navigator.appName == "Opera") {
    //document.addEventListener("keydown", my_onkeydown_handler, false);
    document.onkeydown = function (e) {
        var event = window.event || e;
        if (event.keyCode == 116) {
            event.returnValue = false;
            event.keyCode = 0;
            window.status = "We have disabled F5";
            return false;
        }
    }
}
else {
    // document.attachEvent("onkeydown", my_onkeydown_handler);
    document.onkeydown = function (e) {
        var event = window.event || e;
        if (event.keyCode == 116) {
            event.returnValue = false;
            event.keyCode = 0;
            window.status = "We have disabled F5";
            return false;
        }
    }
}

document.oncontextmenu = nocontextmenu;
function nocontextmenu() {
    event.cancelBubble = true
    event.returnValue = false;
    return false;
}


function FrmValidate() {

    document.getElementById("lblMsg").innerHTML = "";
    document.getElementById("lblMsg").style.display = 'none'

    var NameMandate = document.getElementById("NameMandate").value;
    var EmailMandate = document.getElementById("EmailMandate").value;
    var MobileMandate = document.getElementById("MobileMandate").value;
    var AddressMandate = document.getElementById("AddressMandate").value;
    var PincodeMandate = document.getElementById("PincodeMandate").value;
    var CityMandate = document.getElementById("CityMandate").value;

    var Name = document.getElementById("NameVisible").value;
    var Email = document.getElementById("EmailVisible").value;
    var Mobile = document.getElementById("MobileVisible").value;
    var Address = document.getElementById("AddressVisible").value;
    var Pincode = document.getElementById("PincodeVisible").value;
    var City = document.getElementById("CityVisible").value;


    var Nametxt = document.getElementById("txtName").value;
    var Emailtxt = document.getElementById("txtEmail").value;
    var Mobiletxt = document.getElementById("txtMobile").value;
    var Addresstxt = document.getElementById("txtAddress").value;
    var Pincodetxt = document.getElementById("txtPincode").value;

    var Hidvisble = document.getElementById("hidvisible").value;
    var nodata = true;
    var nocity = true;
    var items = '';
    var itemsall = new Array();
    var itemCount = 0;
    if (Hidvisble != "No Data Found") {
        if (Name === "Y") {
            if (NameMandate === "Y") {
                if (Nametxt === "" || Nametxt == "Name") {
                    if (items == '') {
                        items = items + "name"
                    } else {
                        items = items + ", name"
                    }
                    itemsall[itemCount] = "name";
                    itemCount += 1;
                    nodata = false;
                }
            }
        }
             
        if (Email === "Y") {
            if (EmailMandate === "Y") {
                if (Emailtxt === "" || Emailtxt == "Email") {
                    if (items == '') {
                        items = items + "email Id"
                    } else {
                        items = items + ", email Id"
                    }
                    itemsall[itemCount] = "email Id";
                    itemCount += 1;
                    nodata = false;
                }
            }

            if (Emailtxt != "" && Emailtxt != "Email") {
                if (!(emailvalreg(document.getElementById("txtEmail"), 'Invalid Email Id'))) {
                    return false;
                }
            }
        }
        if (Mobile === "Y") {
            if (MobileMandate === "Y") {
                if (Mobiletxt === "" || Mobiletxt == "Mobile") {
                    if (items == '') {
                        items = items + "mobile"
                    } else {
                        items = items + ", mobile"
                    }
                    itemsall[itemCount] = "mobile";
                    itemCount += 1;
                    nodata = false;
                }
            }

            if (Mobiletxt != "" && Mobiletxt != "Mobile") {
                if (Mobiletxt.length != 10) {
                    AlertMsg("Mobile is invalid"); return false
                }
            }
        }
        if (Address === "Y") {
            if (AddressMandate === "Y") {
                if (Addresstxt === "" || Addresstxt == "Address") {
                    if (items == '') {
                        items = items + "address"
                    } else {
                        items = items + ", address"
                    }
                    itemsall[itemCount] = "address";
                    itemCount += 1;
                    nodata = false;
                }
            }
        }
        if (Pincode === "Y") {
            if (PincodeMandate === "Y") {
                if (Pincodetxt === "" || Pincodetxt == "Pincode") {
                    if (items == '') {
                        items = items + "pincode"
                    } else {
                        items = items + ", pincode"
                    }
                    itemsall[itemCount] = "pincode";
                    itemCount += 1;
                    nodata = false;
                }
            }

            if (Pincodetxt != "" && Pincodetxt != "Pincode") {
                if (Pincodetxt.length != 6) {
                    AlertMsg("Pincode is invalid"); return false
                }
            }

        }
        if (City === "Y") {
            if (CityMandate === "Y") {
                var ddlcitys = document.getElementById("ddlCity").options[document.getElementById("ddlCity").selectedIndex].value;
                if (ddlcitys == "- Select City -") {
                    if (items == '') {
                        items = items + "Please select your City"
                        nocity = false;
                    } else {
                        items = items + ", city"
                    }
                    itemsall[itemCount] = "city";
                    itemCount += 1;
                    nodata = false;
                }
            }
        }
               
        if (!nodata) {
            document.getElementById("lblMsg").style.display = 'block';
            if (!nocity) {
                document.getElementById("lblMsg").innerHTML = items;
            } else {
                if (itemCount > 0) {
                    var itmall = "";
                    for (i = 0; i < itemsall.length; i++) {
                        if (itemsall.length > 1 && i == itemsall.length - 1) {
                            itmall = itmall + " and " + itemsall[i];
                            break;
                        } else if (i == 0) {
                            itmall = itmall + itemsall[i];
                        } else {
                            itmall = itmall + ", " + itemsall[i];
                        }
                    }
                }
                document.getElementById("lblMsg").innerHTML = "Please enter your " + itmall;
            }
            return false;
        }
               
    }
    else {
        var ddlcitys = document.getElementById("ddlCity").options[document.getElementById("ddlCity").selectedIndex].value
        if ((Nametxt == "" || Nametxt == "Name") && (Emailtxt == "" || Emailtxt == "Email") && (Mobiletxt == "" || Mobiletxt == "Mobile") && (Addresstxt == "" || Addresstxt == "Address") && (Pincodetxt == "" || Pincodetxt == "Pincode") && (ddlcitys == "- Select City -")) {
            document.getElementById("lblMsg").style.display = 'block';
            document.getElementById("lblMsg").innerHTML = "Please enter any one of field is mandatory.";
            return false;
        }

        if (Emailtxt != "" && Emailtxt != "Email") {
            if (!(emailvalreg(document.getElementById("txtEmail"), 'Invalid Email Id'))) {
                return false;
            }
        }

        if (Mobiletxt != "" && Mobiletxt != "Mobile") {
            if (Mobiletxt.length != 10) {
                AlertMsg("Mobile is invalid"); return false
            }
        }

        if (Pincodetxt != "" && Pincodetxt != "Pincode") {
            if (Pincodetxt.length != 6) {
                AlertMsg("Pincode is invalid"); return false
            }
        }
    }
}

function AllowNumeric(myevent) {
    if (navigator.appName == "Netscape" || navigator.appName == "Opera") {
        var charVal = (myevent.which) ? myevent.which : myevent.charCode;
        if (charVal > 47 && charVal < 58) {
            return true;
        }
        else {
            return false;
        }
    }
    else {
        var charVal = (myevent.which) ? myevent.which : myevent.keyCode
        if (charVal > 47 && charVal < 58) {
            return true;
        }
        else {
            return false;
        }
    }
}

function MobileValidate(myevent) {
    if (navigator.appName == "Netscape" || navigator.appName == "Opera") {
        var charVal = (myevent.which) ? myevent.which : myevent.charCode;
        if (charVal > 47 && charVal < 58) {
            return true;
        }
        else {
            return false;
        }
    }
    else {
        var charVal = (myevent.which) ? myevent.which : myevent.keyCode
        if (charVal > 47 && charVal < 58) {
            return true;
        }
        else {
            return false;
        }
    }
}

function emailvalreg(em, Msg) {
    document.getElementById("lblMsg").innerHTML = "";
    document.getElementById("lblMsg").style.display = 'none'
    var emailval = trim(em.value);

    if (emailval.indexOf(".com.com") != -1) {
        AlertMsg(Msg);
        //em.focus();
        return false;
    }
    var regexp = /^[a-zA-Z][a-zA-Z|0-9|]*([_][a-zA-Z|0-9]+)*([-][a-zA-Z|0-9]+)*([.][a-zA-Z|0-9]+([_][a-zA-Z|0-9]+)*)?@[a-zA-Z][a-zA-Z|0-9|]*\.([a-zA-Z][a-zA-Z|0-9]*(\.[a-zA-Z][a-zA-Z|0-9]*)?)$/;
    if (!regexp.test(emailval)) {
        AlertMsg(Msg);
        return false;
    }
    else {
        document.getElementById("lblMsg").innerHTML = "";
        document.getElementById("lblMsg").style.display = 'none'
        return true;
    }
}

function AlertMsg(Msg) {
    document.getElementById("lblMsg").style.display = 'block';
    document.getElementById("lblMsg").innerHTML = Msg;
    return false;
}

function rtrim(argvalue) {
    while (1) {
        if (argvalue.substring(argvalue.length - 1, argvalue.length) != " ")
            break;
        argvalue = argvalue.substring(0, argvalue.length - 1);
    }
    return argvalue;
}

function ltrim(argvalue) {
    while (1) {
        if (argvalue.substring(0, 1) != " ")
            break;
        argvalue = argvalue.substring(1, argvalue.length);
    }
    return argvalue;
}

function trim(argvalue) {
    var argvalue = ltrim(argvalue);
    return rtrim(argvalue);
}

function VisibleAllControl() {
    var divName = document.getElementById("divName");
    var divEmail = document.getElementById("divEmail");
    var divMobile = document.getElementById("divMobile");
    var divAddress = document.getElementById("divAddress");
    var divPincode = document.getElementById("divPincode");
    var divCity = document.getElementById("divCity");
    divName.style.display = 'block';
    divEmail.style.display = 'block';
    divMobile.style.display = 'block';
    divAddress.style.display = 'block';
    divPincode.style.display = 'block';
    divCity.style.display = 'block';

}

function ControlVisible() {

    var Name = document.getElementById('NameVisible').value;
    var Email = document.getElementById("EmailVisible").value;
    var Mobile = document.getElementById("MobileVisible").value;
    var Address = document.getElementById("AddressVisible").value;
    var Pincode = document.getElementById("PincodeVisible").value;
    var City = document.getElementById("CityVisible").value;

    var divName = document.getElementById("divName");
    var divEmail = document.getElementById("divEmail");
    var divMobile = document.getElementById("divMobile");
    var divAddress = document.getElementById("divAddress");
    var divPincode = document.getElementById("divPincode");
    var divCity = document.getElementById("divCity");

    var NmeEmp = document.getElementById("NmeEmp");
    var EmlEmp = document.getElementById("EmlEmp");
    var MobEmp = document.getElementById("MobEmp");
    var AddEmp = document.getElementById("AddEmp");
    var PinEmp = document.getElementById("PinEmp");
    var CitEmp = document.getElementById("CitEmp");

    var NameMandate = document.getElementById("NameMandate").value;
    var EmailMandate = document.getElementById("EmailMandate").value;
    var MobileMandate = document.getElementById("MobileMandate").value;
    var AddressMandate = document.getElementById("AddressMandate").value;
    var PincodeMandate = document.getElementById("PincodeMandate").value;
    var CityMandate = document.getElementById("CityMandate").value;

    if (Name === "Y") {
        divName.style.display = 'block';
    }
    if (Email === "Y") {
        divEmail.style.display = 'block';
    }

    if (Mobile === "Y") {
        divMobile.style.display = 'block';
    }

    if (Address === "Y") {
        divAddress.style.display = 'block';
    }

    if (Pincode === "Y") {
        divPincode.style.display = 'block';
    }

    if (City === "Y") {
        divCity.style.display = 'block';
    }

    var Hidvisble = document.getElementById("hidvisible").value;

    var starVis = "N";
    if (Hidvisble != "No Data Found") {
        if (Name === "Y") {
            if (NameMandate === "Y") {
                document.getElementById("NmeEmp").style.display = 'block';
                starVis = "Y";
            }
        }

        if (Email === "Y") {
            if (EmailMandate === "Y") {
                document.getElementById("EmlEmp").style.display = 'block';
                starVis = "Y";
            }
        }
        if (Mobile === "Y") {
            if (MobileMandate === "Y") {
                document.getElementById("MobEmp").style.display = 'block';
                starVis = "Y";
            }
        }
        if (Address === "Y") {
            if (AddressMandate === "Y") {
                document.getElementById("AddEmp").style.display = 'block';
                starVis = "Y";
            }
        }
        if (Pincode === "Y") {
            if (PincodeMandate === "Y") {
                document.getElementById("PinEmp").style.display = 'block';
                starVis = "Y";
            }
        }
        if (City === "Y") {
            if (CityMandate === "Y") {
                document.getElementById("CitEmp").style.display = 'block';
                starVis = "Y";
            }
        }
    }

    if (starVis == "Y") {
      //  document.getElementById("Strvisble").style.display = 'block';
    }
    else {
     //   document.getElementById("Strvisble").style.display = 'none';
    }
}

</script>
</head>
<body>
    <div id="bodyMain">
        <form name="FrmLeadVertical" method="post" action="LinkProcess/Action" id="FrmLeadVertical">
                <div class="Content">
                      
                        <div class="Space">
                        </div>
                        <div class="Row" id="divName">
                            <div >
                                <span id="spName" class="spantxt">Name</span> <span id="NmeEmp" class="Starvisible">*</span>
                            </div>
                            <div >
                               <input name="lc_name" type="text" maxlength="75" id="txtName" class="txtBox" autocomplete="off" size="25" oncontextmenu="return false;" oncut="javascript:return false;" oncopy="javascript:return false;" onpaste="javascript:return false;"  />
                            </div>
                        </div>
                   
                        <div class="Row" id="divEmail">
                            <div >
                                <span id="spEmail" class="spantxt">Email</span> <span id="EmlEmp" class="Starvisible">*</span>
                            </div>
                            <div >
                               <input name="lc_email" type="text" maxlength="100" id="txtEmail" class="txtBox" autocomplete="off" size="25" oncontextmenu="return false;" oncut="javascript:return false;" oncopy="javascript:return false;" onpaste="javascript:return false;"  />
                            </div>
                        </div>
                        <div class="Row" id="divMobile">
                            <div >
                                <span id="spMobile" class="spantxt">Mobile</span> <span id="MobEmp" class="Starvisible">*</span>
                            </div>
                            <div >
                               <input name="lc_mobile" type="text" maxlength="10" id="txtMobile" class="txtBox" autocomplete="off" size="25" oncontextmenu="return false;" oncut="javascript:return false;" oncopy="javascript:return false;" onpaste="javascript:return false;"  />
                            </div>
                        </div>
                        <div class="Row" id="divAddress">
                            <div >
                                <span id="spAddress" class="spantxt">Address</span> <span id="AddEmp" class="Starvisible">*</span>
                            </div>
                            <div >
                             <input name="lc_address" type="text" maxlength="100" id="txtAddress" class="txtBox" autocomplete="off" size="25" oncontextmenu="return false;" oncut="javascript:return false;" oncopy="javascript:return false;" onpaste="javascript:return false;"  />
                         </div>
                        </div>
                        <div class="Row" id="divPincode">
                            <div >
                                <span id="spPincode" class="spantxt">Pincode</span> <span id="PinEmp" class="Starvisible">*</span>
                            </div>
                            <div >
                               <input name="lc_pincode" type="text" maxlength="6" id="txtPincode" class="txtBox" autocomplete="off" size="25" oncontextmenu="return false;" oncut="javascript:return false;" oncopy="javascript:return false;" onpaste="javascript:return false;"  />
                            </div>
                        </div>
                        <div class="Row" id="divCity">
                            <div >
                                <span id="spCity" class="spantxt">City</span> <span id="CitEmp" class="Starvisible">*</span>
                            </div>
                            <div >
                                    <select name="lc_city" id="ddlCity" class="ddlList" >
		                            <option value="- Select City -">- Select City -</option>
		                            <option value="Agra">Agra</option>
		                            <option value="Ahmedabad">Ahmedabad</option>
		                            <option value="Bengaluru">Bengaluru</option>
		                            <option value="Bhopal">Bhopal</option>
		                            <option value="Chennai">Chennai</option>
		                            <option value="Coimbatore">Coimbatore</option>
		                            <option value="Delhi">Delhi</option>
		                            <option value="Guntur">Guntur</option>
		                            <option value="Gurgaon">Gurgaon</option>
		                            <option value="Hyderabad">Hyderabad</option>
		                            <option value="Indore">Indore</option>
		                            <option value="Jaipur">Jaipur</option>
		                            <option value="Kanpur">Kanpur</option>
		                            <option value="Kochin">Kochin</option>
		                            <option value="Kolkata">Kolkata</option>
		                            <option value="Kovalam">Kovalam</option>
		                            <option value="Lucknow">Lucknow</option>
		                            <option value="Ludhiana">Ludhiana</option>
		                            <option value="Madurai">Madurai</option>
		                            <option value="Mangalore">Mangalore</option>
		                            <option value="Mumbai">Mumbai</option>
		                            <option value="Mysore">Mysore</option>
		                            <option value="Nagpur">Nagpur</option>
		                            <option value="Nellore">Nellore</option>
		                            <option value="Patna">Patna</option>
		                            <option value="Pune">Pune</option>
		                            <option value="Secunderabad">Secunderabad</option>
		                            <option value="Surat">Surat</option>
		                            <option value="Trivandram">Trivandram</option>
		                            <option value="Vadodara">Vadodara</option>
		                            <option value="Varanasi">Varanasi</option>
		                            <option value="Vijayawada">Vijayawada</option>
		                            <option value="Vishakhapatnam">Vishakhapatnam </option>
		                            <option value="Warangal">Warangal</option>
		                            <option value="Others">Others</option>
	                            </select>
                               
                            </div>
                        </div>
                       
                        <div class="errMsg" id="errMsg">
                        <span class="mdtyField">* denotes mandatory fields</span>
                        </div>
                        <br/>
                        <div class="Rowbtn" id="divbtn">
                          <input type="submit" name="btnSumbit" value="Submit" onclick="return FrmValidate();" id="btnSumbit" class="btnSumbit ofButton ofBlue" />
                        </div>
                        <br/>
                        <div class="errMsg" id="errMsg">
                           <span id="lblMsg" class="btnInnerMsg"></span>
                        </div>
                    </div> <!-- div end for content div -->
            
                    <input type="hidden" name="NameMandate" id="NameMandate" value="Y" />
                    <input type="hidden" name="EmailMandate" id="EmailMandate" value="Y" />
                    <input type="hidden" name="MobileMandate" id="MobileMandate" value="Y" />
                    <input type="hidden" name="AddressMandate" id="AddressMandate" />
                    <input type="hidden" name="PincodeMandate" id="PincodeMandate" />
                    <input type="hidden" name="CityMandate" id="CityMandate" value="Y" />
                    <input type="hidden" name="NameVisible" id="NameVisible" value="Y" />
                    <input type="hidden" name="EmailVisible" id="EmailVisible" value="Y" />
                    <input type="hidden" name="MobileVisible" id="MobileVisible" value="Y" />
                    <input type="hidden" name="AddressVisible" id="AddressVisible" value="Y" />
                    <input type="hidden" name="PincodeVisible" id="PincodeVisible" value="Y" />
                    <input type="hidden" name="CityVisible" id="CityVisible" value="Y" />
                    <input type="hidden" name="hidvisible" id="hidvisible" />

                    <input type="hidden" name="lc_amccode" id="lc_amccode" value="F"/>
                    <input type="hidden" name="lc_applicationid" id="lc_applicationid" value="CAMSWS" />
                    <input type="hidden" name="lc_leadid" id="lc_leadid" value="11" />
                    <input type="hidden" name="lc_campaigncode" id="lc_campaigncode" value="5001" />
                    <input type="hidden" name="lc_target" id="lc_target" value="<%= lcf.Target %>" />
                    <input type="hidden" name="lc_placement" id="lc_placement" value="<%= lcf.Placement %>" />
                    <input type="hidden" name="lc_device" id="lc_device" value="<%= lcf.Device %>" />
                    <input type="hidden" name="lc_creative" id="lc_creative" value="<%= lcf.Creative %>" />
                     <input type="hidden" name="lc_keyword" id="lc_keyword" value="<%= lcf.Keyword %>" />
                    <input type="hidden" name="lc_matchtype" id="lc_matchtype" value="<%= lcf.Match_Type %>" />
                    <input type="hidden" name="lc_network" id="lc_network" value="<%= lcf.Network %>" />
                    <input type="hidden" name="lc_campaignname" id="lc_campaignname" value="<%= lcf.Campaign_Name %>" />
                    <input type="hidden" name="lc_campaigntype" id="lc_campaigntype" value="<%= lcf.Campaign_Type %>" />
    </form>
</div>

<script>ControlVisible();</script>
</body>
</html>
