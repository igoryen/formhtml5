/**
 * 
 */
String.prototype.replaceAt=function(index, character) {
    return this.substr(0, index) + character + this.substr(index+character.length);
}

/*
String.prototype.lpad = function(padString, length) {
    var str = this;
    while (str.length < length)
        str = padString + str;
    return str;
}
*/

function pad(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}

function xmlEncode(sStrIn){																	
	var xmlStr = sStrIn;															
	var reg;
	if ((xmlStr != null) && (xmlStr.length > 0)){  											
		xmlStr = xmlStr.replace(/\&/g, "&amp;");												
		xmlStr = xmlStr.replace(/\</g, "&lt;");												
		xmlStr = xmlStr.replace(/\>/g, "&gt;");												
		xmlStr = xmlStr.replace(/\"/g, "&quot;");											
		xmlStr = xmlStr.replace(/\'/g, "&apos;");											
	}																						
	return xmlStr;																			
} 

/*function getParameterByName(name, url) {
    if (!url) {
      url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}*/

function getParameterByName(name, url) {
    var match = RegExp('[?&]?' + name + '=([^&]*)').exec(url);
    return match && decodeURIComponent(match[1].replace(/\+/g, ' '));
}

function isBase64Encoded(sBase64) {
	var theRegExp = /^([0-9a-zA-Z+/]{4})*(([0-9a-zA-Z+/]{2}==)|([0-9a-zA-Z+/]{3}=))?$/;
	return (sBase64 && theRegExp.test(sBase64));
}

//JIRA: NE-2342 - Allow replace placeholders for a given string
String.prototype.format = String.prototype.f = function() {
    var s = this,
        i = arguments.length;

    while (i--) {
        s = s.replace(new RegExp('\\{' + i + '\\}', 'gm'), arguments[i]);
    }
    return s;
};