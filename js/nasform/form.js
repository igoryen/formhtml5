/* The scripts in this file will deal with form initialisation, 
 * form data entry and form submission processes. 
 * */

/* Define some global variables */


function getServerURL() {
	return 
		location.protocol 
			+ '//' + location.hostname 
			+ (location.port ? (':' + location.port) : '');
} 

//The information from Java Application and JSP.
function getServerUrl() {
	return $('#serverURL').val();
}

function getAppURL() {
	return $('#applicationURL').val();
}

function getAutoSaveFlag() {
	return $('#autoSaveFlag').val();
}

function getRequestSource(){
	return $('#requestSource').val();
}

function getHtml5LocationMapCentre() {
	return $('#html5_locationmap_centre').val();
}

function getHtml5LocationMapZoom() {
	return $('#html5_locationmap_zoom').val();
}

function getHtml5LocationMapMarker() {
	return $('#html5_locationmap_marker').val();
}

//Setup form language in "#languageID" hidden field.
function setFormLanguage() {
 	$("#languageID").val(formLanguage);	
	console.log("lang:" + $("#languageID").val());
}

//Get languageID from "#languageID" hidden field.
function getFormLanguage() {
 	return formLanguage;	
}

function isFieldExisted(sField) {
	var bVal = false;
	var field =  document.getElementById(sField);
	if (typeof(field) != 'undefined' && field != null)
	{
		bVal = true;
	} else {
		bVal = false;
	}	
	return bVal;
}

function isEmpty(str) {
	var bVal = true;
	if(str != "" && str != null) {
		bVal = false;
	}
	return bVal;
}

function trimString(str) 																	
{ 																							
	return str.replace(/^\s+/g, '').replace(/\s+$/g, ''); 									
}

function isJSON(obj) {
	var bJSON = true;
	try {
		var str = JSON.stringify(obj);
//		console.log("JSON string: " + str);
	} catch (e) {
//		console.log("Not JSON!");
		bJSON = false;
	}	
	return bJSON;
}


function validateFormField(oRequiredField) {
//	console.log("oRequiredField: " + isJSON(oRequiredField));
	
//	debugger;
	
	var retVal = true;

	for(var subformName in oRequiredField) {
		for(var fieldName in oRequiredField[subformName]) {	
			var sField = fieldName;
			if(isFieldExisted(sField)) {
				var val = document.getElementById(sField).value;
//				console.log("fieldName: " + fieldName + " " + "value: " + val);
				if(isEmpty(val)) {
//					console.log("fieldName: " + fieldName + " " + "value: " + val);
					document.getElementById(sField).style.backgroundColor = "yellow";
					retVal = false;
				}
			}
		}
	}
	
	if(retVal == false) {
		popUpMsg("infoPopUp", "Please fill the required field!");
	}
	
	return retVal;
	
}

function getRadioElementValue(sField) {
	
	var radioValue = "";
	
	if(isFieldExisted(sField)) {
		var radios = document.getElementsByName(sField);
		for(var i = 0; i < radios.length; i++){
			if(radios[i].checked){
				radioValue = radios[i].value;
			}
		}
	}
	
	return radioValue;
	
}

function setRadioElementValue(sField, sValue) {
	
	var radioValue = "";
	
	if(isFieldExisted(sField)) {
		var radios = document.getElementsByName(sField);
		for(var i = 0; i < radios.length; i++){
			if(radios[i].value == sValue){
				radios[i].checked = "true";
			}
		}
	}
	
}

function getCheckboxElementValue(sField) {
	var checkBoxValue = "";
	if(isFieldExisted(sField)) {
	    if (document.getElementById(sField).checked) {
	    	checkBoxValue = document.getElementById(sField).value;
	    }
	}
    return checkBoxValue;
}

function setCheckboxElementValue(sField, sValue) {
	if(isFieldExisted(sField)) {
	    if (sValue == 1) {
	    	document.getElementById(sField).checked = "true";
	    } 
	}
}


//Get the parameter value by parameter name which is passed through this html call.
function getQueryVariable(variable) {
  	var query = window.location.search.substring(1);
  	var vars = query.split("&");
  	for (var i=0;i<vars.length;i++) {
  	    var pair = vars[i].split("=");
  	    if (pair[0] == variable) {
  	      return pair[1];
  	    }
	    } 
//	    console.log('Query Variable ' + variable + ' not found');
}	

//Fields in oExcludeFields will be not be initialised from the saved data. 
function initForm(oFormFields, oExcludeFields) {	
//	console.log("inside of initForm");
//	console.log("json fields:" + JSON.stringify(oFormFields));
//	debugger;

	for(var subformName in oFormFields) {
		var oSubformFields = oFormFields[subformName];
		
		if(oExcludeFields) {
			var oSubformExcludeFields = oExcludeFields[subformName];		
			var currentSubformExcludeFields = Object.keys(oSubformExcludeFields);
			
			console.log("currentSubformExcludeFields: " + currentSubformExcludeFields);
		} else {
			console.log("There is no carryon field list for this form type!");
		}
		
		for(var key in oSubformFields) {
			var sField = key;			
			var bPopulateField = true;
			
			if(oExcludeFields) {
				if(currentSubformExcludeFields != null && currentSubformExcludeFields.length > 0) {
					//debugger;
					if(isStrInArray(sField, currentSubformExcludeFields))  {
						bPopulateField = false;
					}
				}
			}
			
			if(bPopulateField) {
			
				if(oSubformFields[sField] != "" && isFieldExisted(sField)) {
					//console.log(oFormFields[key]);			
					var sVal = oSubformFields[key];
					//JIRA: NE-2181 - element ID for radio button must be unique
					//  ... so, also get Element by Name if by ID not found.
					//  Use jQuery to manipulate the element value
					var selector = "#" + sField;
					var elm = $(selector);
					if (!elm.length) {
						//Find element by name
						selector = "input[name=" + sField + "]";
						var elm = $(selector);
						if (elm.length > 1) {
							console.log("WARNING: more than one instance found for field: '" + sField + "' while selecting by Input Element Name in subform '" + subformName + "'");
						}
						if (!elm[0]) {
							console.log("WARNING: Element for field '" + sField + "' was not found in subform '" + subformName + "'.");
							continue;
						}
					}
					//if(document.getElementById(sField).type == "radio" ) {	
					if(elm.attr('type') == "radio" || elm.attr('type') == 'checkbox') {	
						//setRadioElementValue(elm, sVal)
						$(selector + "[value='" + sVal + "']").prop('checked', true);
					} else {
						elm.val(sVal);
					}
					//else if (elm.attr('type') == "checkbox") {
					//	setCheckboxElementValue(elm, sVal)
					//} else {
						//document.getElementById(elm).value = sVal;
					//	elm.val(sVal);
					//}				
				}
			}
		}
	}
}
                   

function delayTimes(i, times, secs) {           
   setTimeout(function () {    
      //Put your code here.   
	  console.log("Please wait " + secs + "ms!");
      i++;                     
      if (i < times) {            
    	  delayTimes(i, times, secs);             
      }                        
   }, secs)
}

function createXML(btnName, formView) {

	if(btnName == "complete") {
		formView.putFieldValue("complete_flag", 0 , "1");			
//		alert("Your PDF report has been created!");
	} if(btnName == "save" || btnName == "review" || btnName == "switchView") {
		//LOCATIONMAP_IMAGE_SUBFORM_IDX has been defined in appResource.js.
		//Click "Save", "Review" and "Switch view" button, does not submit location map image data.
		debugger;
		var idx = LOCATIONMAP_IMAGE_SUBFORM_IDX[formId];
		if(idx) {
//			console.log("locationmap_image: \n" + formView.getFieldValue("locationmap_image", idx));
			formView.putFieldValue("locationmap_image", idx , "");
			console.log("locationmap_image: \n" + formView.getFieldValue("locationmap_image", idx));
		}
	} else {
		formView.putFieldValue("complete_flag", 0 , "0");
//		alert("Your form data has been saved!");
	}
			
	var oFields = formView.getFormFields();
	
	xmlStr = getFinalXMLStr(oFields);
		
   	console.log("xmlStr:" + xmlStr);
	
	return xmlStr;								
}
	
function getFinalXMLStr(oFields) {
	var sForm = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><form1>";
	for(var subformName in oFields) {
		var sSubform = "<subform>";
		for(var fieldName in oFields[subformName]) {
			var sField = fieldName;
			
			var sVal = ""; 
			
			if(isFieldExisted(sField)) { //Field is existed visibly.
				if(document.getElementById(sField).type == "radio" ) {	
					sVal = getRadioElementValue(sField);
				} else if (document.getElementById(sField).type == "checkbox") {
					sVal = getCheckboxElementValue(sField);
				} else {
					sVal = document.getElementById(sField).value;
				}
			} else { //Field is existed as invisibly.
				sVal = oFields[subformName][fieldName];
			}
			
			
//			console.log(sField + (isFieldExisted(sField)?" existed, ":" not existed, ") + " : " + sVal + " is" + (isEmpty(sVal)?" empty!":" not empty!") + "\n");
			
			//If the field is image field, the value is the image file name. Like "appReqNum_fieldName.png".
			//Commented out after done NE-2225.
//		    console.log("Before isFieldInJSON..");
//			if(isFieldInJSON(sField, formView.getImageField())) {
//				sVal = appReqNum+"_"+sField+".png";
//			}
						
			sSubform = sSubform + (
							isEmpty(sVal)
								? ("<" + sField + "/>")
								:(("<" + sField + ">")+sVal+("</" + sField + ">"))
						  ) 
		}

		
		sSubform = sSubform + "</subform>";
		sForm = sForm + sSubform;
		
	}
	
	sForm = sForm + "</form1>"
	
	//Deal with field value like appraiser_company "T. McCormick & Assoc";
	sForm = sForm.replace(/\&/g, "&amp;"); 
	
//	sForm = xmlEncode(sForm);
	
//	console.log("Submission XML: " + sForm);
	
	return sForm;
}

//FormView() is class which deals with form fields.
function FormView() {
	
	//oFormFields is JSON Object like: 	
	//	{
	//		"subform_0": {
	//			"cred_id": "tm",
	//			"form_ID": "91",
	//
	//		},
	//		"subform_1": {
	//			"page_num_02": "",
	//			"doc_number_01": "",
	//			"file_number_01": "",
	//
	//		},
	//		"subform_2": {
	//			"save": "",
	//			"review": "",
	//			"complete": "",
	//			"page_num_03": "",
	//		}
	//	}	
		
	
	
	this.oFormFields = {}; 
	
	this.oRequiredField = {};
	
	this.oLabel = {};
	
	this.oReadOnlyField = {};
	
	this.oImageField = {};
	
	this.oMapOption = null;
	
	this.oInitMapCentre = null;
	
	this.getFormFields = function() {
		return this.oFormFields;
	};
	
	this.setFormFields = function(oFields) {
		this.oFormFields = oFields;
	};
	
	this.getRequiredField = function() {
//		console.log("this.oRequiredField: " + Array.isArray(this.oRequiredField));
		return this.oRequiredField;
	};
	
	this.setRequiredField = function(oFields) {
//		console.log("oFields: " + Array.isArray(oFields));
		this.oRequiredField = oFields;
	};	
	
	this.getLabelFields = function() {
		return this.oLabel;
	};
	
	this.setLabelFields = function(obj) {
//		console.log("oFields: " + Array.isArray(oFields));
		this.oLabel = obj;
	};	
	
	this.getReadOnlyFields = function() {
		return this.oReadOnlyField;
	};
	
	this.setReadOnlyFields = function(oFields) {
		this.oReadOnlyField = oFields;
		enableReadOnlyFields(oFields);
	};
	
	this.setImageField = function(obj) {
		this.oImageField = obj;
	}
	
	this.getImageField = function() {
		return this.oImageField;
	}	
	
	this.setMapOption = function(obj) {
		this.oMapOption = obj;
	}
	
	this.getMapOption = function() {
		return this.oMapOption;
	} 
	
	this.setInitMapCentre = function(obj) {
		this.oInitMapCentre = obj;
	}
	
	this.getInitMapCentre = function() {
		return this.oInitMapCentre;
	} 	
	
	this.putFieldValue = function(sField, iSubform, value) {
		var subformName = "subform_" + iSubform;
		//Modification to avoide error "Cannot set property 'complete_flag' of undefined"
		if (this.oFormFields[subformName] && this.oFormFields[subformName][sField]) {
			this.oFormFields[subformName][sField] = value;
		}
	}

	this.getFieldValue = function(sField, iSubform) {
		var subformName = "subform_" + iSubform;
		return	this.oFormFields[subformName][sField];	
	}

	//Update some field value in subform[0] by oList which is JSON object. For instance,
	//	var oList = {
	//			"app_password2" : 	"31035aaca4",
	//			"super_password2":	"31035aaca4"
	//	}
	
	this.updateFormFields = function(oList) {  
		for(var key in oList) {
			this.putFieldValue(key, 0, oList[key]);
		}
	}
		
}

//Get image base64 data.
function getBase64Data(canvasId, imgId) {
	console.log("Begin getBase64Data..");
	
	var img = document.getElementById(imgId);
	var data = document.getElementById(canvasId);
    
    console.log("Mid getBase64Data..1");
    
	var ctx = data.getContext("2d");
	ctx.drawImage(img, 580, 640);
	
    console.log("Mid getBase64Data..2");
	
	var sTmp = data.toDataURL();
	
    console.log("Mid getBase64Data..3" + sTmp);
	
	if(!isEmpty(sTmp)) {
		return sTmp.replace(/^data:image\/(png|jpg);base64,/, "");
		console.log("End getBase64Data and return data.");
	} else {
		console.log("End getBase64Data and return empty.");
		return "";
	}

} 

//New get image function.
function convertImgToDataURLviaCanvas(url, callback, canvasId) {
//function convertImgToDataURLviaCanvas(url, canvasId) {
	  var img = new Image();
	  var dataURL;
	  img.crossOrigin = 'Anonymous';
	  img.onload = function() {
//	    var canvas = document.createElement('CANVAS');
		var canvas = document.getElementById(canvasId);
	    var ctx = canvas.getContext('2d');
	    canvas.height = this.height;
	    canvas.width = this.width;
	    ctx.drawImage(this, 0, 0);
	    var sTmp = canvas.toDataURL();

	    if(!isEmpty(sTmp)) {
	    	
//	    	debugger;
	    	
//	    	console.log("Map data before remove header: " + sTmp);
	    	
	    	var sTmp = sTmp.replace(/^data:image\/(png|jpg);base64,/, "");
	    	
            /* Shrink the image */
	    	
	    	
            var sUrl = $('#applicationURL').val() + "/servlet/com.visionmax.servlet.CommandServlet?command=resizeimage";
            
            console.log("sUrl: " + sUrl);
            
            var oImg = $.param({
                width: 580,
                height: 640,
                sBase64: sTmp,
                headers : {'Content-Type': 'application/x-www-form-urlencoded'}
            });
                                 
    		$.post(sUrl, 
    			oImg,
    			function(data) {
	    			if(!isEmpty(data)) {
	    		    	callback(data);
	    			} else {
	    				console.log("Resize data error!");
	    			}
				});	                            
            /* End Shrink */ 	    	
	    		    		

	    }
	    canvas = null;	    

	  };
	  img.src = url;

}


//Redraw image function.
function redrawCanvasViaBase64(canvasId, data) {
	  console.log("Begin to redraw..");
	  var img = new Image();
	  img.crossOrigin = 'Anonymous';
	  img.onload = function() {
		var canvas = document.getElementById(canvasId);
	    var ctx = canvas.getContext('2d');
	    canvas.height = this.height;
	    canvas.width = this.width;
	    ctx.drawImage(this, 0, 0);
	  };
	  img.src = data;
	  console.log("End to redraw..");

}


//Get JSON object from database.
function getFormJSON(formId, countryCode, formLanguage, colName, callback) {
	var sUrl = $('#applicationURL').val() + "/servlet/com.visionmax.servlet.CommandServlet?command=getformjson";
	$.get(sUrl
			+ "&formId="				+ formId
			+ "&countryCode="			+ countryCode
			+ "&formLanguage="			+ formLanguage
			+ "&colName="  				+ colName 
			+ "&timestamp=" 			+ new Date().getTime(),
		function(data, status){	
//			console.log("json fields:" + data);						
			obj = JSON.parse(data);
			callback(obj);

	});
}

//populate a drop down list by an string array.
function populateDropDown(oField, list) {
//	console.log("populate start.." + list);
	if(oField != null) { 
		oField.empty();		
		$.each(list, function(index, value) {
			oField.append("<option>" + value + "</option>");
		});	
//		console.log("populate end..");
	}
}

//Pop up a message pop-up windows
function popUpMsg(fieldId, str) {
	var id = "#" + fieldId;
    var btnNames = {}; 
    btnNames['Close'] = function(){ 
    	$(this).dialog('close'); 
    }; 
    
    var oParagrah = $(id).find('p');
    //and then get the text
//    alert(oParagrah.text());
//    debugger;
    oParagrah.text(str);
    
    $(function(){ 
        $(id).dialog({ 
        	resizable: false, 
        	height: 180, 
        	width: 400,
        	modal: true,
        	buttons: btnNames 
        });		
    });
}

//Show a message in the screen.
function showMsg(msg) {	
	hideView(); //JIRA: NE-2223 
    $("#message_area").html("<p><font size='5'>"+msg+"</font></p>");	    
    $("#message_area").show();
}

//JIRA: NE-2223
function hideView() {
	$('#loading-indicator').hide();
    $("#tab_area").hide();
    $("#title_area").hide();
    $("#navigate_area").hide();
    $("#pdf_area").hide();
    $("#map_area_01").hide();
    $("#map_area_02").hide();    
    $("#map_area").hide();   
    $("#addendum_area").hide();
}

//Process preview button.
//Move this function into formMainController and rename it to ngProcessPreview()
//function processPreview() {
//	
//    $("#previewBtn").click(function(event) {
//    	
////    	delayTimes(1, 10, 3000);
//    	
//    	var appUrl = getAppURL();
//    	
//		var sPreviewBtnName = "";
//		debugger;
//    	if(formView.getLabelFields()) {
//    		sPreviewBtnName = formView.getLabelFields().previewBtnName;
//    	}	    	
//    	
//    	$("#previewBtn").attr('value', sPreviewBtnName);
//    	
//    	if($("#tab_area").is(':visible')) {
//    		
//			$('#tab_area').toggle('show');
//			$('#navigate_area').toggle('show');
//			$('#loading-indicator').show();
//			$('#map_area').hide();
//			    		
//			//Create xmlStr prior to previewing.
//			var xmlStr = createXML("save", formView);
//			
//						////			//Save xml data first. ==> Move save xml data to SubmitFormCmd.
////	        $.post(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=save",
////	                {xmlData: xmlStr},
////	                function(data,status){
////	                	
////	                      console.log("Save data prior to previewing: " + status);	    
////	                      
////	                      if(status == "success") {
////	                    	  
////	                    	debugger;
////	                    	  
//////	                    	var sUrl = appUrl 
//////			        	        		+"/servlet/com.visionmax.servlet.CommandServlet?command=previewpdf&formId="
//////			        	        		+formId+"&appReqNum="+appReqNum+"&process=preview"+"&timestamp="+new Date().getTime();
//			
//							var sUrl = appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=html5_preview";
//
//	                    	  	                    	  	                    	  
//	              	        $.post(sUrl,
//	              	        		
//	            	    	        {xmlData: xmlStr},
//	            	    	        
//	            	    	        function(data, status) {
//	            	    	        	
////            	    						debugger;	            	    	        	
//	            	    	        	 
//	            	    	        		//console.log("PDF has been created in file server.");
//	            	    	        		
//	            	    					event.preventDefault();	            	    					
//	            	    					
//	            	    					// The following section is for displaying PDF in a new tab in browser.	 
//	            	    					
//	            	    					var obj       = $("#pdf_obj");
//	            	    					var objdata   = $(obj).attr('data');
//	            	    					var container = $(obj).parent();
//	            	    					
//
//	            	    					var newUrl = appUrl 
//	            	    						+"/servlet/com.visionmax.servlet.CommandServlet?command=getfilestream&appReqNum="+appReqNum
//	            	    						+"&process=html5_preview"+"&timestamp="+new Date().getTime();
//	            	    					
////	            	    					debugger;
//	            	    					            	    					            	    						            	    				
//	            	    					// The following section is commented out for showing the PDF in the windows itself.
//	            	    					/*
//	            	    					var win = window.open(newUrl, '_self');
//	            	    					if (win) {
//	            	    					    //Browser has allowed it to be opened
//	            	    					    win.focus();
//	            	    					} else {
//	            	    					    //Browser has blocked it
//	            	    					    alert('Please allow popups for this website');
//	            	    					}	
//	            	    					
//	            	    					*/
//	            	    					
//	            	    				            	    				
//	            	    					// The following section is for displaying PDF in a new tab in browser.
//	            	    					
//	            	    					$(obj).attr('data', newUrl);
//	            	    							    					
//	            	    					console.log("objdata:" + $(obj).attr('data'));
//	            	    					
//	            	    					var newobj  = $(obj).clone();
//	            	    					$(obj).remove();
//	            	    					$(container).append( newobj );
//	            	    					
//	            	    					$('#pdf_area').toggle('show');	            	    						            	    					
//	            	    					          	    						            	    		            	    						            	    						            	    						            	    					
//	            	    					$('#loading-indicator').hide();	 
//	            	    					
//	            	    					
//	            	    					/* Change the preview button caption to "Close".
//	            	    					
//		            	    					var sClosePreviewBtnName = "";
//	
//		            	    		        	if(formView.getLabelFields()) {
//		            	    		        		sClosePreviewBtnName = formView.getLabelFields().closePreviewBtnName;
//		            	    		        	}	    					
//		            	    					
//		            	    					$("#previewBtn").attr('value', sClosePreviewBtnName);
//	            	    					
//	            	    					*/
//	            	    					
//	            	    					console.log("PDF loading is done.");		    	        		
//	            	    	        		
//	            	    	        	});		                    	  
//	                    	  
////	                      } else {
////	                    	  console.log("Saving data is not successful!");
////	                      }
////	                      
////	                });	
//						
//		
//    	} else {
//	         $('#tab_area').toggle('show');
//			 $('#navigate_area').toggle('show');
//	         $('#pdf_area').toggle('show');	
//	         processLocationMap();
//    	}			
//
//    		    	
//    });	
//}


//The following function will display "go back" button in topFrame.
function displayGoBackBtn() {
	debugger;
	//Show "Go Back" button.
	parent.frames["topFrame"].document.getElementById("goBackBtnId").style.display="block";
	//Hide "Quick search".
	parent.frames["topFrame"].document.getElementById("qsearch").style.display="none";
	
	console.log("Go Back button has been displayed.");
	
}


//Process Work as PDF button.
function processWorkAsPdf() {
    $("#workAsPdfBtn").click(function(event) {
    	
//    	debugger;
    	
		$('#loading-indicator').show();
    	
    	var appUrl = getAppURL();

//		var sUrl = appUrl 
//					+"/servlet/com.visionmax.servlet.CommandServlet?command=workaspdf&appReqNum="+appReqNum
//					+"&formId="+formId+"&timestamp="+new Date().getTime();
		
		var sUrl = appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=html5_offline";	
		
		$.post(
				sUrl,
        		
    	        {xmlData: createXML("workAsPdf", formView)},
    	        
    	        function(data, status){
    	        	if(status == "success") {	 
    	        		console.log("PDF has been created in file server.");
    	        		
    					event.preventDefault();
    					
    					var newUrl = appUrl 
						+"/servlet/com.visionmax.servlet.CommandServlet?command=getfilestream&appReqNum="+appReqNum
						+"&process=html5_offline"+"&timestamp="+new Date().getTime();
    					
//    					debugger;
    					
    					if(!detectEdge()) {    					
    						savePDFAsFile(appReqNum, newUrl);
    					} else {
    						downloadURI(appReqNum, newUrl);
    					}
    					
    					$('#loading-indicator').hide();

    					console.log("PDF saving is done.");		
    					   	        		
    	        	}
    	        }
    	        
		);	   		
		    		    	
    });	
}

//Init certification section. This function is not used anymore and replaced 
//by directive 'forceModelUpdate' and scope functon 'signatureDataURL()' in 'appSigPad.js'.
function initCertification() {
    $('.nav-pills a[href="#menu7"]').click(function(event) {
    	//debugger;
    	console.log("Begin to load signature image..");
    	
    	var asPhotoField = ["appraiser_signature",
    	                    "supervisor_signature"    	                    
    	                    ];
    	    	
    	var CANVAS_EMPTY_BASE64 = "iVBORw0KGgoAAAANSUhEUgAAAVoAAACWCAYAAACfDEANAAAEyklEQVR4Xu3UsQ0AAAjDMPr/01yRzRzQwULZOQIECBBIBZauGydAgACBE1pPQIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBAQWj9AgACBWEBoY2DzBAgQEFo/QIAAgVhAaGNg8wQIEBBaP0CAAIFYQGhjYPMECBB4j7kAl7f9VyAAAAAASUVORK5CYII=";
    	
    	for(var i=0; i<asPhotoField.length; i++) { 
    		
  			var sImageDataId = "#"+asPhotoField[i];
  			
    		var sTmp = $(sImageDataId).val();
    		
    		if(!isEmpty(sTmp) && sTmp != CANVAS_EMPTY_BASE64) {
    		
	    		sTmp = "data:image/png;base64," + sTmp;
	    		
	    		sCanvasId = asPhotoField[i] + "_section";
	    		
	    		redrawCanvasViaBase64(sCanvasId, sTmp);
	    			        	
	        	console.log("Signature image has been reloaded.");
    		}
    	}
    	
    });		
}

//Process complete button - will br replace by ngProcessComplete() and moved into formMainController
/*function processComplete() {
	
	var appUrl = getAppURL();
	
    $("#completeBtn").click(function(){
    	//debugger;
    	if(validateFormField(formView.getRequiredField())
    			&& verifyMemberNumber()) {
    		console.log("Begin to submit the completed report..");
    		$('#loading-indicator').show();

	        $.post(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=html5_complete",
	        		
	        {xmlData: createXML("complete", formView)},
	        function(data,status){
//	            console.log("Data: " + data + "\nStatus: " + status);
	        	var sCompleteMsg = "";
	        	if(formView.getLabelFields()) {
	        		sCompleteMsg = formView.getLabelFields().completeMsg;
	        	}
	        	showMsg(sCompleteMsg);
//		        popUpMsg("infoPopUp", "Your report has been submitted successfully!");
	        });		        
    	} 

    });
}*/

//Verify Member Number for Scotiabank, BMO etc.
function verifyMemberNumber() {
	var bOk = true;
	var appUrl = getAppURL();
	
	//Get the parameter value for verifymembernumber servlet.
	var appMemberNumber = $("#app_aic_member_number").val(); 						
	var appReqNum = $("#file_number").val();					
	var appraiserDesignation = $("#appraiser_designation").val();			
	var clientName = $("#client_name").val();				
	var superMemberNumber = $("#super_aic_member_number").val();				
	var supervisorDesignation = $("#super_appraiser_designation").val();	
	
	var sUrl = appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=verifymembernumber" 
			+ "&app_aic_member_number=" + appMemberNumber
			+ "&file_number=" + appReqNum
			+ "&appraiser_designation=" + appraiserDesignation
			+ "&client_name=" + clientName
			+ "&super_aic_member_number=" + superMemberNumber		
			+ "&super_appraiser_designation=" + supervisorDesignation
			+ "&timestamp=" + new Date().getTime();
	
	$.ajax({
	     async: false,
	     type: 'GET',
		 url: sUrl,
		 success: function(data, status) {
			 
//				console.log("data:" + data);	
//				debugger;
			 
				if(!isEmpty(data)) {
					if(data == "valid") {
						bOk = true;
					} else if(data == "invalid") {
						bOk = false;
					}				
				} else {
					console.log("Call to LC Verify member number web service does not return \"valid\" or \"invalid\"!");
				}		
			}
	});
	
	if(!bOk) {
//		debugger;
		popUpMsg("infoPopUp", "To complete this request the report must be signed by an Approved Appraiser!");
	}
		
	return bOk;
	
}

//Process save button.
//Move this function into formMainController and rename it to ngProcessSave
/*function processSave() {
	
	var appUrl = getAppURL();
	
    $("#saveBtn").click(function(){
    	$('#loading-indicator').show();
        $.post(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=save",
        {xmlData: createXML("save", formView)},
        function(data,status){
//          console.log("Data: " + data + "\nStatus: " + status);
        	var sSaveMsg = "";
        	if(formView.getLabelFields()) {
//        		debugger;
        		sSaveMsg = formView.getLabelFields().saveMsg;
        	}
        	
        	showMsg(sSaveMsg);		
						
//			popUpMsg("infoPopUp", sSaveMsg);
	        
        });	        
    });		
}*/

//Process review button.
//Move this function into formMainController and rename it to ngProcessReview()
/*function processReview() {
	
	var appUrl = getAppURL();
	
    $("#reviewBtn").click(function(){    	
    	if(validateFormField(formView.getRequiredField())
    			&& verifyMemberNumber()) {
	    	$('#loading-indicator').show();
	        $.post(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=review",
	        {xmlData: createXML("review", formView)},
	        function(data,status){
	//          console.log("Data: " + data + "\nStatus: " + status);
	        	var sSaveMsg = "";
	        	if(formView.getLabelFields()) {
	        		sSaveMsg = formView.getLabelFields().saveMsg;
	        	}	        	
	        	showMsg(sSaveMsg);
	        });	 
    	} 

    });		
}*/

//Process next and previous buttons
function processNextAndPrev() {
	$('#nextBtn').click(function () {
//		debugger;
		$('.nav-pills>.active').next('li').find('a').get(0).click();
	});
		
	$('#previousBtn').click(function () {
		$('.nav-pills>.active').prev('li').find('a').get(0).click();
	});		
}

//Init photo section.
function initPhoto() {
	$('.nav-pills a[href="#menu8"]').click(function(event) {
		console.log("Loading Photo..");
		var asPhotoField = ["additional_image1",
		                    "additional_image2",
		                    "additional_image3",
		                    "additional_image4",
		                    "additional_image5",
		                    "additional_image6",	    	                    
		                    ];
		//debugger;
		for(var i=0; i<asPhotoField.length; i++) { 
				var sImageDataId = "#"+asPhotoField[i];
			var sTmp = $(sImageDataId).val();
			console.log(asPhotoField[i] + " data is " + (isEmpty(sTmp)?"empty.":"not empty."));
			if(!isEmpty(sTmp)) {
				var photoData =  "data:image/png;base64," + sTmp;
				var sImageSectionId = sImageDataId + "_section";
				$(sImageSectionId).attr("src", photoData);
			} 
		}
		
	});
}


//Init location map section.
/*function processLocationMap() {
	
	$('.nav-pills a[href="#menu9"]').click(function(event) {
		$.when(initMap()).then(
				function () {
//					window.alert("Ready to show Map!");
					$('#map_area').show();
				});
		
	});
	
}
*/

//Init location map section.
function processLocationMap(bSigned) {
		$.when(initMap(bSigned)).then(
				function () {
//					window.alert("Ready to show Map!");
					$('#map_area').show();
				});
}

//This function will init Google map.
function initMap(bSigned) {
	 
//	debugger;
	  
	/* Using Latitude and Longtitude */ 
		
	var oCurrentMapOption;
	
    var originalCentre = {lat: 0, lng: 0};        
//    var sAddress = "43.849891,-79.425715";     

    var sAddress = getPropertyAddressString();
    
    console.log("Property address is: " + sAddress);
    
    var mapDiv = document.getElementById('map_area');
    
    var map = new google.maps.Map(mapDiv, {
      zoom: 14,
      center: originalCentre,
      disableDefaultUI: bSigned,
      draggable: !bSigned,
      scrollwheel: !bSigned,
      disableDoubleClickZoom: bSigned
    });
    
//    var marker = new google.maps.Marker({
//      position: originalCentre,
//      map: map
//    });
           
    /* Using Address */
	   var geocoder = new google.maps.Geocoder();
	   
	   //The Location map has been initilized!
	   oCurrentMapOption = formView.getMapOption();
	   
	   
	   //Callback funtion will get static map.
	    var getStaticMap = function getStaticMap() {
	        //window.alert('Map was clicked!');
	    	
	    	var oCentre = map.getCenter();
	    	
	    	oCurrentMapOption = {
	    		centre : {},
	    		zoom: 0
	    	};
	    	
	    	oCurrentMapOption['centre'] = oCentre;
	                    
	        var sCentre = oCentre.toString().replace(/\(/,"").replace(/\)/,"");
	        
	        $('#html5_locationmap_centre').val(sCentre);
	        	        
	        var sZoom = map.getZoom();
	        
	        $('#html5_locationmap_zoom').val(sZoom);	        
	            	
	    	oCurrentMapOption['zoom'] = sZoom;
	    	
	    	formView.setMapOption(oCurrentMapOption);
	    		    	
	        console.log("Zoom level: " + sZoom + "\n" + "Center in: " + sCentre);
	              
	//          console.log("sCentre: " + sCentre.replace(/\(/,""));
	        
	        var sAddress = getPropertyAddressString();
	        
	        CallGoogleStaticAPI(sCentre, sAddress, sZoom);
	        
	   }	   
	   
	   if(oCurrentMapOption == null) {	
		   //Get the map according to current property address.
//		   debugger;
		   
		   map.setZoom(14); //Init property address zoom is 14.
		   
		   geocoder.geocode({
		      'address': sAddress
		   }, function(results, status) {
			      if(status == google.maps.GeocoderStatus.OK) {
			    	  
//			    	 debugger; 

			    	 var initPosition = results[0].geometry.location; //Property Address in latitude and longitude.	
			    	 
				     var sInitCentre = initPosition.toString().replace(/\(/,"").replace(/\)/,"");
				        
				     $('#html5_locationmap_marker').val(sInitCentre);	//Init Centre Position is the position of marker. It is going to be saved into xml.		    	 
			    	 
			    	 formView.setInitMapCentre(initPosition);
			    	 
			         new google.maps.Marker({
			            position: initPosition,
			            map: map
			         });
			         
			         console.log("Initial location from property address: " + initPosition);
			         
			         map.setCenter(initPosition);
			         			         
			         //Get static map.
			         getStaticMap();	
			         
			         console.log("Initial Map is Ok!");
			         		         			         
			   } else {				   
				   console.log("Can not get the map of property address from Google!");				   
			   }
		   });  
	   } else {
		   geocoder.geocode({
			      'location': oCurrentMapOption['centre'] //Current centre should be the one that changed.
			   }, function(results, status) {
				      if(status == google.maps.GeocoderStatus.OK) {
				    	 
				    	  
				    	 var currentPosition  = results[0].geometry.location;
				    	 var currentZoom = oCurrentMapOption['zoom'];
				    	 
				         new google.maps.Marker({
				            position: formView.getInitMapCentre(), //Marker position should always be the address of property.
				            map: map
				         });
				         
				         console.log("Current Position: " + currentPosition);
				         
				         map.setCenter(currentPosition);
				         
				         map.setZoom(currentZoom);
				         
				         //Get static map.
				         getStaticMap();
				         
				         console.log("Current Map is Ok!");
				   }
			   }); 		   

	   }
    
//    var infowindow = new google.maps.InfoWindow({
//        content: 'Change the zoom level',
//        position: originalCentre
//    });
    
//   infowindow.open(map);


	/* Add Listener */
    // For map zoom
    map.addListener('zoom_changed', function() {
        //infowindow.setContent('Zoom: ' + map.getZoom());
        getStaticMap();
    });  
    
    // For map drag
    map.addListener('drag', function() {
        //infowindow.setContent('Zoom: ' + map.getZoom());
        getStaticMap();
    });      
                    
    // Add a DOM event here to show an alert if the DIV containing the while map is clicked.
    google.maps.event.addDomListener(mapDiv, 'click', getStaticMap);

	
    
} 

//Get corrent property element fieldname functions, there are special field name on Progress Inspection form.
function getPropetyElementFieldName(sName) {
	var sRet = sName;
	
	//formName is global variable in FormHeader.jsp defined.
	
	if(formName == "ProgressInspectionEnglish" || formName == "ProgressInspectionFrench") {
		sRet = "pi_" + sName;
	}
	
	return sRet;
}

//Get property address string.
function getPropertyAddressString() {
	
	var sTmp = "";	
	var sAddress = "";
	
	console.log("formName: " + formName);
	
	sTmp = trimString(document.getElementById(getPropetyElementFieldName("property_address")).value);
	if (sTmp == "") {
		console.log("An address must be entererd, to display on the map");
		good = false;
	}
	sAddress = sTmp;
	
	sTmp = trimString(document.getElementById(getPropetyElementFieldName("subj_city")).value);
	if (sTmp == "") {
		console.log("A city must be entererd, to display on the map");
		good = false;
	}
	sAddress += "," + sTmp;
	
	sTmp = trimString(document.getElementById(getPropetyElementFieldName("subj_province")).value);
	if (sTmp == "") {
		console.log("A province must be entererd, to display on the map");
		good = false;
	}
	sAddress += "," + sTmp;
	
	sTmp = trimString(document.getElementById(getPropetyElementFieldName("subj_postal_code")).value);
	if (sTmp != "") {
		sAddress += "," + sTmp;
	}

	return sAddress;	
	
}

//Get static map data by call Google Static API and save it into "locationMap" field.
function CallGoogleStaticAPI(sCentre, sAddress, sZoom) {
	
	var good = true;
	
	var appUrl = getAppURL();
	
	var sMarkers = "color:red|label:S|" + sAddress;	
					
	var newUrl = appUrl + "/GoogleURLSigner?center=" + sCentre + "&markers=" + sMarkers + "&zoom=" + sZoom;
	
	console.log("newUrl:" + newUrl);
	
	newUrl = newUrl + "&timestamp=" + new Date().getTime();

	if(good) {
		
//		debugger;
		
		var getURL = 
			function getURL(sData) {
				$("#locationmap_image").val(sData);
			}
		convertImgToDataURLviaCanvas(newUrl, getURL, "mapCanvas");
		
		
	} else {
		console.log("Property address information is incorrect!");
	}		
	
	
}

/* The following code will get all of initial fields and its value for form.
 * Note: oLabel object is created by ng-init='initLabels({})', 
 * of which initLabels is defined in formMainController.js.
 * The value of labels are from the Java Resource file.
 */

function initFieldWithDefault(oLabel) {
	
	var appUrl = getAppURL();
//	debugger;
	//$.get(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=getdocjson&appReqNum="+appReqNum+"&process="+process, 
	//	);	
	
	var sUrl = appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=getdocjson&appReqNum="+appReqNum+"&process="+process+"&requestSource="+requestSource+"&timestamp="+new Date().getTime();

	$.ajax({
	     async: false,
	     type: 'GET',
		 url: sUrl,
		 success: function(data, status){

//				console.log("init json fields:" + data);	
				//debugger;
				if(data != "") {
				
					var obj = JSON.parse(data);
								
					formView.setFormFields(obj);
					
//					debugger;
					
					/* Reset the form_id inside of json data from database, 
					 * make sure it conforms to the one in current session. 
					 * The appraiser will get correct language setting in html5 form when they switch languages,  
					 * For instance, The previewed PDF will become French if html5 page is using French. */					
					formView.putFieldValue("form_ID", 0, formId);
					formView.putFieldValue("server_url",0, serverURL);
					formView.putFieldValue("wsurl_by_lcserver",0, webServerURLForLCCall);
					
//					debugger;
					
					formView.setLabelFields(oLabel);
					
//					initConstructionStageInfo();					
					
					//CARRYON_FIELD_LIST is defined in appResource.js.
					initForm(formView.getFormFields(), CARRYON_FIELD_LIST[formId]);
										
					initMapOption(); //This function has to be run after initForm().
					
					//Init password fields.
//					var oList = {
//							"app_password2" : 	"31035aaca4",
//							"super_password2":	"31035aaca4"
//					}	
					
//					formView.updateFormFields(oList);
				
				} else {
					alert("No initial data from database.");
				}
				
//				console.log(JSON.stringify(formView.getFormFields()));			
			}
	});
}

/* 
 * Init MapOption according to the hidden fields 
 * html5_locationmap_centre and html5_locationmap_zoom
 */
function initMapOption() {
	
//	debugger;
	
	var oCurrentMapOption = null;
	
	var sCentre = getHtml5LocationMapCentre(); //Saved location map centre string.
	
	var sZoom = getHtml5LocationMapZoom(); //Saved zoom string.
	
	var sMarker = getHtml5LocationMapMarker(); //Saved marker string.
	
	if (!isEmpty(sCentre) 
			&&  !isEmpty(sZoom)
			&&  !isEmpty(sMarker)) { //if there is saved live map option.
		
		//Get saved centre info.
		
		var oCentre = {}; //Dynamic Centre.
		
    	oCurrentMapOption = {
	    		centre: {},
	    		zoom: 0
	    	}; 
    	
//    	debugger;
    	
    	var latlngArr = sCentre.split(",");
    	 	
    	oCentre['lat'] = parseFloat(latlngArr[0]);
    	oCentre['lng'] = parseFloat(latlngArr[1]);
    	
    	oCurrentMapOption['centre'] = oCentre;
    	
    	oCurrentMapOption['zoom'] = parseFloat(sZoom);
   	
    	formView.setMapOption(oCurrentMapOption);
    	
    	//Get marker info.
    	
    	var oInitMarkerAsCentre = {}; //Init Centre Position.
    	
    	var markerLatlngArr = sMarker.split(",");
    	
    	oInitMarkerAsCentre['lat'] = parseFloat(markerLatlngArr[0]);
    	oInitMarkerAsCentre['lng'] = parseFloat(markerLatlngArr[1]);
    	
    	formView.setInitMapCentre(oInitMarkerAsCentre); //Add this line will make sure the marker shown.
	}
}

//The following code will get the required field information in JSON.
//Move this function into formMainController
/*function getRequiredFieldInfo() {
	
	var appUrl = getAppURL();	

	$.get(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=getformjson"
				+ "&formId="		+	formId
				+ "&countryCode="	+	countryCode
				+ "&formLanguage="	+	formLanguage
				+ "&colName="   	+	"required_field_json"
				+ "&timestamp=" 	+ new Date().getTime(), 
				function(data, status){
		
//		console.log("json fields:" + data);			
		
		var obj = JSON.parse(data);
		
		formView.setRequiredField(obj);	
					
//		console.log(JSON.stringify(formView.getRequiredField()));			
	});	
}*/

//The following code will get the readOnly field information in JSON.
function getReadOnlyFieldInfo() {
	
	var appUrl = getAppURL();	

	$.get(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=getformjson"
				+ "&formId="		+	formId
				+ "&countryCode="	+	countryCode
				+ "&formLanguage="	+	formLanguage
				+ "&colName="   	+	"readonly_field_json"
				+ "&timestamp=" 	+ new Date().getTime(), 
				function(data, status){
		
//		debugger;
		
		console.log("json fields:" + data);			
		
		var obj = JSON.parse(data);
		
		formView.setReadOnlyFields(obj);	
					
//		console.log(JSON.stringify(formView.getRequiredField()));			
	});	
}

//The following code will get the image field information in JSON.
function getImageFieldInfo() {
	
	var appUrl = getAppURL();	

	$.get(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=getformjson"
				+ "&formId="		+	formId
				+ "&countryCode="	+	countryCode
				+ "&formLanguage="	+	formLanguage
				+ "&colName="   	+	"image_field_json"
				+ "&timestamp=" 	+ new Date().getTime(), 
				function(data, status){
		
		console.log("json fields:" + data);			
		
		var obj = JSON.parse(data);
			
		formView.setImageField(obj);	
		
	});	
}

//Enable readonly attribute of fields in the list.
function enableReadOnlyFields(oReadOnlyField) {	
//	debugger;
	for(var subformName in oReadOnlyField) {
		for(var fieldName in oReadOnlyField[subformName]) {	
			var sField = fieldName;
			if(isFieldExisted(sField)) {
				var sFieldId = "#" + sField;
				$(sFieldId).attr("readonly", "readonly");
			}
		}
	}	
}

//Check if the fieldname is in the JSON object.
function isFieldInJSON(name, oJson) {	
	var bVal = false;
	if(oJson) {
		for(var subformName in oJson) {
			for(var fieldName in oJson[subformName]) {	
				if(name == fieldName) {
					console.log("Image field name: " + name);
					bVal = true;
				}
			}
		}
	} else {
		console.log("Image field list is empty!");
	}
	return bVal;
}

//JIRA: NE-2297 - function `populateDropdownField()` replaced with `dropdownFieldPromise` - to ensure populateing DDL values before initializing form fields.
//The following code will populate all of dropdown menu with JSON saved in database.
function populateDropdownField() {

	oDropdownField = {
		"client_province" : "province_json",
		"appraiser_province": "province_json"
	};
	
	var dropDownFieldList = Object.keys(oDropdownField);
	
	
	var getDropdownFunc = 
		function getDropdownFunc(asVal) {
//			console.log("drop down list:" + asVal);
			var oDropdown = $("#" + dropDownFieldList[0]);
			populateDropDown(oDropdown, asVal);
		};
		
	
	getFormJSON(formId, countryCode, formLanguage, oDropdownField[dropDownFieldList[0]], getDropdownFunc);	
}

//Init construction_stage_title and construction_stage_allowed fields and set them to empty.
//function initConstructionStageInfo() {
//
//	var list = ["construction_stage_title", "construction_stage_allowed"];	
//	
//	for(var i=0; i < list.length; i++) {
//		var oList = getConstructionStageList(CONSTRUCTION_STAGE_NUM_OF_ROWS, list[i]);
//		formView.updateFormFields(oList);		
//	}
//
////	console.log("oFormFields after init construction stage:\n" + JSON.stringify(formView.getFormFields()));		
//}

//Return a JSON object with name and value pairs.
//function getConstructionStageList(len, name) {
//	
//	var oList = {};
//	
//	for(var i=0; i<len; i++) {
//		var newKey = "";
//
//		newKey = name + "_" + pad(i+1, 2);
//		
//		oList[newKey] = "";
//
//	}
//	
//	return oList;
//	
//}

//Process auto save function.
function doAutoSave() {
	
	var bIsAutoSave = getAutoSaveFlag();
	console.log("bIsAutoSave: " + bIsAutoSave);
//	debugger;
	if(bIsAutoSave == "Y") {
	    var refreshId = setInterval(
	    	function () {   	
		    	var appUrl = getAppURL();    	
		    	$('#loading-indicator').show();
		        $.post(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=save",
		        {xmlData: createXML("save", formView)},
		        function(data, status){
		//          console.log("Data: " + data + "\nStatus: " + status);
		    		$('#loading-indicator').hide();
		    	    console.log(getTimeNow() + ' ==> Auto save successfully!');		
		        });        
	    	}, 
	    AUTO_SAVE_INTERVAL);   
	}
	
}

//Get time string in format "YYYY-MM-DD hh:mm:ss"
function getTimeNow() {
	var rightNow = new Date();
	//rightNow.setUTCDate(0);
	var sTime = rightNow.toISOString();
	console.log("Current time: " + sTime);
	var sTime = sTime.slice(0,19).replace(/T/g," ");
	return sTime;
}

function destroyClickedElement(event)
{
    document.body.removeChild(event.target);
}

//Save PDF as file
function savePDFAsFile(appReqNum, sUrl)
{
//	debugger;	
 
    var downloadLink = document.createElement("a");
    downloadLink.download = appReqNum + "(" + getTimeNow() + ").pdf";
    downloadLink.innerHTML = "Download File";
    downloadLink.href = sUrl;
    downloadLink.onclick = destroyClickedElement;
    downloadLink.style.display = "none";
    document.body.appendChild(downloadLink);
 
    downloadLink.click();
	
}

function saveBlobAsFile(appReqNum, sUrl)
{
    var pdfToSave = sUrl;
    var pdfToSaveAsBlob = new Blob([pdfToSave], {type:"application/pdf"});
    var pdfToSaveAsURL = window.URL.createObjectURL(pdfToSaveAsBlob);
 
    var downloadLink = document.createElement("a");
    downloadLink.download = appReqNum + "(" + getTimeNow() + ").pdf";
    downloadLink.innerHTML = "Download File";
    downloadLink.href = pdfToSaveAsURL;
    downloadLink.onclick = destroyClickedElement;
    downloadLink.style.display = "none";
    document.body.appendChild(downloadLink);
 
    downloadLink.click();
}

function downloadURI(appReqNum, uri) //For IE or Edge
{
    var link = document.createElement("a");
    link.download = appReqNum + "(" + getTimeNow() + ").pdf";;
    link.href = uri;
    link.click();
}

//This function will be used for detecting IE version.
function detectIE() {
    var ua = window.navigator.userAgent;

    var msie = ua.indexOf('MSIE ');
    if (msie > 0) {
        // IE 10 or older => return version number
        return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
    }

    var trident = ua.indexOf('Trident/');
    if (trident > 0) {
        // IE 11 => return version number
        var rv = ua.indexOf('rv:');
        return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
    }

    var edge = ua.indexOf('Edge/');
    if (edge > 0) {
        // Edge (IE 12+) => return version number
        return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
    }

    // other browser
    return false;
}

//This function will be used for detecting Windows Edge version.
function detectEdge() {
    var ua = window.navigator.userAgent;

    var edge = ua.indexOf('Edge/');
    if (edge > 0) {
        // Edge (IE 12+) => return version number
        return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
    }

    return false;
}

//Is the string in arraylist, yes - return true, no - return false 
function isStrInArray(str, arrayList) {
	var result = false;
	//app.alert(!(str.indexOf("Other") != -1) || (str.indexOf("Autre") != -1));
	for(var i=0; i < arrayList.length; i++) {
		if(str == arrayList[i])
			result = true;			
	}
		
	return result && !((str.indexOf("Other") != -1) || (str.indexOf("Autre") != -1));
} 

