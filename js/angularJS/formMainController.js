/*
 * Angular Controller: formMainController
 */
var app = angular.module('myApp');
app.requires.push('angularConditionalValidation');
app.requires.push('ngDialog');
''
//Shared service 'signatureLocking' used to interface controllers.
app.factory('signatureLocking', function($rootScope) {
	var theService = {};
	theService.signatureStatus = {};
	theService.clearSignature = {};
	theService.userRoles = {};
	theService.userRoles.APPRAISER = 'appraiser';
	theService.userRoles.SUPERVISOR = 'supervisor';
	theService.userRoles.NO_ROLE = 'NO_ROLE';
	
	/* Encrytion method for app_password2 field exit event in NAS form. */
	theService.encrypt = function (str, pwd) {
		if(pwd == null || pwd.length <= 0) {
			
        	var sPasswordErrorMsg2 = "";
//        	debugger;
        	var oLabel = formView.getLabelFields();
        	if(oLabel) {
        		sPasswordErrorMsg2 = oLabel.passwordErrorMsg2;
        	}	
        	popUpMsg("infoPopUp", sPasswordErrorMsg2);
        	
			return null;
		}
		var prand = "";
		for(var i=0; i<pwd.length; i++) {
		  prand += pwd.charCodeAt(i).toString();
		}
		var sPos = Math.floor(prand.length / 5);
		var mult = parseInt(prand.charAt(sPos) + prand.charAt(sPos*2) + prand.charAt(sPos*3) + prand.charAt(sPos*4) + prand.charAt(sPos*5));
		var incr = Math.ceil(pwd.length / 2);
		var modu = Math.pow(2, 31) - 1;
		if(mult < 2) {
        	var oLabel = formView.getLabelFields();
        	if(oLabel) {
        		sPasswordErrorMsg3 = oLabel.passwordErrorMsg3;
        	}	
        	popUpMsg("infoPopUp", sPasswordErrorMsg3);			
		  return null;
		}
		var salt = Math.round(Math.random() * 1000000000) % 100000000;
		prand += salt;
		while(prand.length > 10) {
		  prand = (parseInt(prand.substring(0, 10)) + parseInt(prand.substring(10, prand.length))).toString();
		}
		prand = (mult * prand + incr) % modu;
		var enc_chr = "";
		var enc_str = "";
		for(var i=0; i<str.length; i++) {
		  enc_chr = parseInt(str.charCodeAt(i) ^ Math.floor((prand / modu) * 255));
		  if(enc_chr < 16) {
		    enc_str += "0" + enc_chr.toString(16);
		  } else enc_str += enc_chr.toString(16);
		  prand = (mult * prand + incr) % modu;
		}
		salt = salt.toString(16);
		while(salt.length < 8)salt = "0" + salt;
		enc_str += salt;
		return enc_str;		
	}
	
	/* Decrytion method for app_password2 field exit event in NAS form. */
	theService.decrypt = function (str, pwd) {
		if(str == null || str.length < 8) {
	        	var oLabel = formView.getLabelFields();
	        	if(oLabel) {
	        		sPasswordErrorMsg3 = oLabel.passwordErrorMsg3;
	        	}	        	
	        	popUpMsg("infoPopUp", sPasswordErrorMsg3);			

			    return;
		}
		if(pwd == null || pwd.length <= 0) {
    	 var oLabel = formView.getLabelFields();
    	 if(oLabel) {
    		  //sPasswordErrorMsg5 = $scope.oLabel.passwordErrorMsg5;
    		 sPasswordErrorMsg5 = oLabel.passwordErrorMsg5;
    	  }	
    	  popUpMsg("infoPopUp", sPasswordErrorMsg5);
		  return;
		}
		var prand = "";
		for(var i=0; i<pwd.length; i++) {
		  prand += pwd.charCodeAt(i).toString();
		}
		var sPos = Math.floor(prand.length / 5);
		var mult = parseInt(prand.charAt(sPos) + prand.charAt(sPos*2) + prand.charAt(sPos*3) + prand.charAt(sPos*4) + prand.charAt(sPos*5));
		var incr = Math.round(pwd.length / 2);
		var modu = Math.pow(2, 31) - 1;
		var salt = parseInt(str.substring(str.length - 8, str.length), 16);
		str = str.substring(0, str.length - 8);
		prand += salt;
		while(prand.length > 10) {
		  prand = (parseInt(prand.substring(0, 10)) + parseInt(prand.substring(10, prand.length))).toString();
		}
		prand = (mult * prand + incr) % modu;
		var enc_chr = "";
		var enc_str = "";
		for(var i=0; i<str.length; i+=2) {
		  enc_chr = parseInt(parseInt(str.substring(i, i+2), 16) ^ Math.floor((prand / modu) * 255));
		  enc_str += String.fromCharCode(enc_chr);
		  prand = (mult * prand + incr) % modu;
		}
		return enc_str;
	};

	theService.getUserRoles = function () {
		return theService.userRoles;
	}
	theService.getNO_ROLE = function () {
		return theService.userRoles.NO_ROLE;
	}
	
	theService.isUserRoleAppraiser = function (prmUserRole) {
		return prmUserRole === theService.userRoles.APPRAISER;
	}

	theService.isUserRoleSupervisor = function (prmUserRole) {
		return prmUserRole === theService.userRoles.SUPERVISOR;
	}

	theService.isSignatureForAppraiser = function ($scope) {
		var sigUser = $scope.userRole;
		if (!sigUser) {
			console.log("isSignatureForAppraiser: $scope.userRole is not defined.")
			$scope.userRole = theService.userRoles.NO_ROLE;
			sigUser = $scope.userRole;
		}
		return theService.isUserRoleAppraiser(sigUser);
	}
	theService.isSignatureForSupervisor = function ($scope) {
		var sigUser = $scope.userRole;
		if (!sigUser) {
			console.log("isSignatureForSupervisor: $scope.userRole is not defined.")
			$scope.userRole = theService.userRoles.NO_ROLE;
			sigUser = $scope.userRole;
		}
		return theService.isUserRoleSupervisor(sigUser);
	}
	theService.setAppraiser = function ($scope) {
		$scope.userRole = theService.userRoles.APPRAISER;
	}
	
	theService.setSupervisor = function ($scope) {
		$scope.userRole = theService.userRoles.SUPERVISOR;
	}

	theService.setNO_ROLE = function ($scope) {
		$scope.userRole = theService.userRoles.NO_ROLE;
	}
	
	theService.password1Exit = function ($scope) {
		//debugger;
		var pwd;
		var sigUser = $scope.userRole;
		theService.signatureStatus[sigUser] = $scope.isSigned;
		theService.clearSignature[sigUser] = $scope.clearSignature;
		if (!$scope.isSigned() && $scope.password1) {
			$scope.password2 = theService.encrypt($scope.password1, $scope.rawSignatureB64());
			if ($scope.password2) {
	        	var sFormLockCorrectMsg = "";
	        	if(formView.getLabelFields()) {
	        		sFormLockCorrectMsg = $scope.oLabel.formLockCorrectMsg;
	        	}				
	        	popUpMsg("infoPopUp", sFormLockCorrectMsg + '\'' + $scope.password1 + '\'');
			} else {
				var sFormLockErrorMsg = "";
	        	if(formView.getLabelFields()) {
	        		sFormLockErrorMsg = $scope.oLabel.formLockErrorMsg;
	        	}				
	        	popUpMsg("infoPopUp", sFormLockErrorMsg);
			}
			$scope.password1 = null;
		} else if ($scope.password1 && $scope.isSigned()) {
			pwd = theService.decrypt($scope.password2, $scope.rawSignatureB64());
			console.log('decrypt pwd = ', pwd);
			if ($scope.password1 === pwd) {
				//$scope.password1 = null;
				//$scope.password2 = null;
				//debugger;
				theService.clearSignature[sigUser]();
				if (theService.isSignatureForAppraiser($scope)) {
					theService.clearSignature[theService.userRoles.SUPERVISOR]();
				}
	        	var passwordCorrectMsg = "";
	        	if(formView.getLabelFields()) {
	        		passwordCorrectMsg = $scope.oLabel.passwordCorrectMsg;
	        	}	
	        	popUpMsg("infoPopUp", passwordCorrectMsg);
			} else {
	        	var sPasswordErrorMsg1 = "";
	        	if(formView.getLabelFields()) {
	        		sPasswordErrorMsg1 = $scope.oLabel.passwordErrorMsg1;
	        	}	
	        	popUpMsg("infoPopUp", sPasswordErrorMsg1);
				$scope.password1 = null;
			}
		}
		//console.log('Password1Exit - userRole = ', userRole);
	}
	

	theService.isAppraiserSigned = function () {
		var userRole = theService.userRoles.APPRAISER;
		//debugger;
		if (theService.signatureStatus[userRole] === undefined) {
			theService.signatureStatus[userRole] = function (){ return false };
		}
		return theService.signatureStatus[userRole]();
	}
	theService.isSupervisorSigned = function () {
		var userRole = theService.userRoles.SUPERVISOR;
		//debugger;
		if (theService.signatureStatus[userRole] === undefined) {
			theService.signatureStatus[userRole] = function (){ return false };
		}
		return theService.signatureStatus[userRole]();
	}
	theService.clearAppraiserSignature = function () {
		var userRole = theService.userRoles.APPRAISER;
		theService.clearSignature[userRole]();
	}
	theService.clearSupervisorSignature = function () {
		var userRole = theService.userRoles.SUPERVISOR;
		theService.clearSignature[userRole]()
	}	
	return theService;
})

app.controller('formMainController', ['$scope', '$timeout', '$http', '$rootScope', 'signatureLocking', '$q', 'ngDialog',
                function($scope, $timeout, $http, $rootScope, signatureLocking, $q, ngDialog) {
	var mainController = this;
	$scope.redrawCanvas = function() {
		//console.log('redrawCanvas');
		var triggerResize = function () {
			//console.log('inside trigger resize function');
			$scope.$broadcast('resize::resize')
		};
		$timeout(triggerResize, 250);
	}
	$scope.appraiser_name = "";	
	$scope.isAppraiserSigned = signatureLocking.isAppraiserSigned;
	$scope.isSupervisorSigned = signatureLocking.isSupervisorSigned;
	$scope.clearAppraiserSignature = signatureLocking.clearAppraiserSignature;
	$scope.isPhotoSizeValid = function (fileSize, maxPhotoSize) {
		if (!maxPhotoSize) {
			maxPhotoSize = (1024*1024);
		}
		var result = fileSize < maxPhotoSize;
		if (!result) {
			//popUpMsg("infoPopUp", "The selected file size of '" + (Math.round(fileSize / 1024.0 * 100) / 100).toLocaleString() + "MB' must be less than 1MB");
			var fileSizeMB = (Math.round(fileSize / 1024.0 / 1024.0 * 100) / 100).toLocaleString();
			var maxFileSizeMB = (Math.round(maxPhotoSize / 1024.0 / 1024.0 * 100) / 100).toLocaleString();
			var msgFromatted = $scope.oLabel.maxFileSizeMsg.format(fileSizeMB, maxFileSizeMB);
			ngDialog.open({
			    //template: "<p>The selected file size of " + (Math.round(fileSize / 1024.0 / 1024.0 * 100) / 100).toLocaleString() + "MB must be less than " + (Math.round(maxPhotoSize / 1024.0 / 1024.0 * 100) / 100).toLocaleString() + "MB</p>",
				template: msgFromatted,
			    plain: true
			});
		}
		return result;
	}
	
	var activeTabList = {
			home: "HOME",
			client: "CLIENT",
			appraiser: "APPRAISER",
			property: "PROPERTY",
			services: "SERVICES",
			neighbourhood: "NEIGHBOURHOOD",
			comparable: "COMPARABLE",
			definition: "DEFINITION",
			constructionStage: "CONSTRUCTIONSTAGE",
			cost: "COST",
			certification: "CERTIFICATION",
			photo: "PHOTO",
			locationMap: "LOCATIONMAP",
			addendum: "ADDENDUM"
			};
	
	$scope.activeTab = "";
		
	$scope.setActiveTabHome = function() {
		$scope.activeTab = activeTabList.home;
	}
	
	$scope.setActiveTabClient = function() {
		$scope.activeTab = activeTabList.client;
	}
	$scope.setActiveTabAppraiser = function() {
		$scope.activeTab = activeTabList.appraiser;
	}
	
	$scope.setActiveTabProperty = function() {
		$scope.activeTab = activeTabList.property;
	}
	
	$scope.setActiveTabServices = function() {
		$scope.activeTab = activeTabList.services;
	}
	
	$scope.setActiveTabNeighbourhood = function() {
		$scope.activeTab = activeTabList.neighbourhood;
	}	
	
	$scope.setActiveTabComparable = function() {
		$scope.activeTab = activeTabList.comparable;
	}
	
	$scope.setActiveTabDefinition = function() {
		$scope.activeTab = activeTabList.definition;
	}	
	
	$scope.setActiveTabConstructionStage = function() {
		$scope.activeTab = activeTabList.constructionStage;
	}
	
	$scope.setActiveTabCost = function() {
		$scope.activeTab = activeTabList.cost;
	}	
	
	$scope.setActiveTabCertification = function() {
		$scope.activeTab = activeTabList.certification;
	}

	$scope.setActiveTabPhoto = function() {
		$scope.activeTab = activeTabList.photo;
	}
	
	$scope.setActiveTabLocationMap = function() {
		$scope.activeTab = activeTabList.locationMap;
	}
	
	$scope.setActiveTabAddendum = function() {
		$scope.activeTab = activeTabList.addendum;
	}
		
	$scope.hideLiveMap = false;

	$scope.doHideLiveMap = function () {
		$scope.hideLiveMap = true;
	}
	
	$scope.doShowLiveMap = function () { 
		$scope.mainPromise.then(function(success) {
			$scope.hideLiveMap = false;
//			debugger;
			$timeout(function () {
				processLocationMap(($scope.isAppraiserSigned() || $scope.isSupervisorSigned()));		
			}, 0)						
		});
	}
	
	//Make sure the code used to initialize the Form using jQuery is run before any 
	//Angular code that depends on jQuery. 
	//debugger;
	function getRequiredFieldInfo() {
		
		var q = $q.defer();
		var appUrl = getAppURL();	

		$.get(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=getformjson"
					+ "&formId="		+	formId
					+ "&countryCode="	+	countryCode
					+ "&formLanguage="	+	formLanguage
					+ "&colName="   	+	"required_field_json"
					+ "&timestamp=" 	+ new Date().getTime(), 
					function(data, status){
			
			//console.log("json fields:" + data);			
			
			var obj = JSON.parse(data);
			
			formView.setRequiredField(obj);
			q.resolve('success');
			// console.log(JSON.stringify(formView.getRequiredField()));			
		});
		return q.promise;
	}
	
	function getDropdownFieldPromise() {
		var q = $q.defer();
		
//		debugger;
		
		//Populate "Provice" select field.
		oDropdownField = {
				"client_province" : "province_json",
				"appraiser_province": "province_json"
			};
			
		var dropDownFieldList = Object.keys(oDropdownField);
		var getDropdownFunc = 
			function getDropdownFunc(asVal) {
//					console.log("drop down list:" + asVal);
				for(var i=0; i<dropDownFieldList.length; i++) {
					var oDropdown = $("#" + dropDownFieldList[i]);
					populateDropDown(oDropdown, asVal);
					console.log(dropDownFieldList[i] + ' populateDropDown completed.');
				}
				q.resolve('success');
			};
		getFormJSON(formId, countryCode, formLanguage, oDropdownField[dropDownFieldList[0]], getDropdownFunc);
		return q.promise;
	};
	
	$scope.dropdownFieldPromise = getDropdownFieldPromise ();

	//The following code will get the required field information in JSON.
	$scope.requiredFieldsPromise = getRequiredFieldInfo(); 

	$scope.runProcessAndInit = function () {
		//debugger;
		var q = $q.defer();		//Create a promise controller
		angular.element(document).ready(function(){
			//$scope.$apply(function () {
				//Process complete button - will br replace by ngProcessComplete().
				//processComplete();

				//Process save button - will be replace by ngProcessSave()
				//processSave();
				
				//Process review button - will be replace by ngProcessReview()
				//processReview();
			    
			    //Process preview button.- will be replace by ngProcessPreview()
			    //processPreview();
			    
			    //Process Work as PDF button.
			    processWorkAsPdf();
			    
			    //Init certification section.
			    //This function is replaced by directive 'forceModelUpdate' and scope functon 'signatureDataURL()' in 'appSigPad.js'.
				//initCertification();   
			    
			    //Init photo section.
			    //This function is replace with directive 'load-photo' and "loadPhoto()" angular based function of Photos Controller
				//initPhoto();
			    
			    //Init location map section. Changed to live google map.
				//processLocationMap();
			    
			    //The following code will get all of initial fields and its value for form.
				//debugger;
				initFieldWithDefault($scope.oLabel);
				
				//The following code will get the required field information in JSON.
				//The following code was moved to be executed earlier
				//$scope.requiredFieldsPromise = getRequiredFieldInfo(); 
				
				//The following code will get the readOnly field information in JSON.
				getReadOnlyFieldInfo();		
				
				//The following code will get the image field information in JSON.
				//getImageFieldInfo();
				
				//The following code will populate all of dropdown menu with JSON saved in database.
				//JIRA: NE-2297 - function `populateDropdownField()` replaced with `dropdownFieldPromise` - to ensure populateing DDL values before initializing form fields.
				//populateDropdownField();
				
				//Process auto save function.
				doAutoSave();
				
				//Next and Previous buttons.
				processNextAndPrev();
											
			//})
			q.resolve('success');	//notify execution is completed successfully - inside document 'ready' event.
		})
		return q.promise; 	//return the promise object.
	}
	
	//This is used to indicate Promise is Done and will be used in HTML to apply conditional styles using `ng-class`
	$scope.mainPromiseResolved = false;
	//debugger;
	//Run the initialization code, and get the promise - store it in the scope variable, 
	// which will available to nested child controllers.
	//JIRA: NE-2297 - ensure to populate drop-down values before initializing form fields.
	$scope.mainPromise = $scope.dropdownFieldPromise.then(function (result){
		return $scope.runProcessAndInit()
		});
	//When the promise is completed successfully, boradcast a model-update event 
	//to sync 'input' elements with ngModel scope variabels. This uses directive 'forceModelUpdate'
	$scope.mainPromise.then(function(success) {
		//debugger;
		$scope.$broadcast('event:force-model-update');
		$scope.mainPromiseResolved = true;
		//Localization for Construction Stage Titles
		//Run after a little while to ensure model is updated using force-model-update.
		$timeout(function () {
					$scope.setConstructionStageTitles();					
				}, 100);
		return 'main promise done';
	})
	$scope.sigRoles = {};
	$scope.initSigRoles = function (prmAppPasswordLbl, prmSupPasswordLbl, prmAppSignatureLbl, prmSupSignatureLbl) {
		//debugger;
		$scope.sigRoles[signatureLocking.userRoles.APPRAISER] = 
		                   {
		                	userRole: signatureLocking.userRoles.APPRAISER,
		                	signatureHeader: prmAppSignatureLbl,
		                	signatureTypeScribble: 'appSignatureTypeScribble',
		                	signatureTypeCertificate: 'appSignatureTypeCertificate',
		                	signatureType: 'appSignatureType',
		                	signatureBase64: 'appraiser_signature',
		                	passwordLbl: prmAppPasswordLbl,
		                	password1: 'app_password1',
		                	password2: 'app_password2',
		                	id_name: 'appraiser_name',
		                	roleNameModel: '',  //used for 'ng-model' to bind 'appraiser_name'
		                	aic_member_number: 'app_aic_member_number',
		                	designation: 'appraiser_designation',
		                	date_signed: 'date_signed_appraiser',
		                	date_inspection: 'appraiser_date_inspection',
		                	license_info: 'appraiser_license_info'
		                   };
		$scope.sigRoles[signatureLocking.userRoles.SUPERVISOR] =
		                   {
		                	userRole: signatureLocking.userRoles.SUPERVISOR,
		                	signatureHeader: prmSupSignatureLbl,
		                	signatureTypeScribble: 'supSignatureTypeScribble',
		                	signatureTypeCertificate: 'supSignatureTypeCertificate',
		                	signatureType: 'supSignatureType',
		                	signatureBase64: 'supervisor_signature',
		                	passwordLbl: prmSupPasswordLbl,	                	
		                	password1:'super_password1',
		                	password2:'super_password2',
		                	id_name: 'super_appraiser_name',
		                	roleNameModel:'', //used for 'ng-model' to bind 'super_appraiser_name'
		                	aic_member_number: 'super_aic_member_number',
		                	designation: 'super_appraiser_designation',
		                	date_signed: 'super_appraiser_date_signed',
		                	date_inspection: 'super_appraiser_date_inspection',
		                	license_info: 'super_appraiser_license_info'
		                   };

	}
	
	//JIRA: NE-2223 The following code will get ng-value for fields which needs calculation.
	
	//The value is from two ng-models defined in PropertyInformation.jsp.
	$scope.getSubjCityProv = function () { //Drive-By forms
		return $scope.subj_city + ", " + $scope.subj_province;
	}
	
	//The value is from ng-model defined in neighbourhood.jsp.
	$scope.getExtraordinaryTotalSiteArea = function () { //Drive-By forms
		var sRet = "";
		if($scope.site_area_measure == 3) {
			sRet = $scope.site_area;
		}
		return sRet;
	}
	
	//This function will be used for clicking the element and hide it.
	$scope.clickToHide = function(elementName)  {
		var sName = "#" + elementName;
		$(sName).toggle('show');
	}	
	
	//true means hide.
    $scope.oToggleElementList = {};
    
    $scope.toggleElement = function(elementName, event) {
//    	debugger;     	
        $scope.oToggleElementList[elementName] = !$scope.oToggleElementList[elementName]; 
        if($scope.oToggleElementList[elementName] == true) {
        	$(event.target).parent().css('border-width', '0px');
        	console.log("+ title:" + $(event.target).text());
        	var sTmp = $(event.target).text();
        	$(event.target).text(sTmp.replace(/\-/, "\+"));
        } else if($scope.oToggleElementList[elementName] == false) {
        	$(event.target).parent().css('border-width', '2px');
        	console.log("- title:" + $(event.target).text());
        	var sTmp = $(event.target).text();
        	$(event.target).text(sTmp.replace(/\+/, "\-"));
        	        	
        }
    };	
    
    		
//	$scope.initLabels = function (oLabel) {
//		debugger;
//		$scope.oLabel = oLabel;		
//	}
	
	//This is a new function which will init some labels which is defined in FormMessage.jsp.
	$scope.initLabels = function () {
//		debugger;
		$scope.oLabel = {
				completeMsg: completeMsg,
				saveMsg: saveMsg,
				requiredFieldAlertMsg: requiredFieldAlertMsg,
				formLockCorrectMsg: formLockCorrectMsg,
				formLockErrorMsg: formLockErrorMsg,
				passwordCorrectMsg: passwordCorrectMsg,
				passwordErrorMsg1: passwordErrorMsg1,
				passwordErrorMsg2: passwordErrorMsg2,
				passwordErrorMsg3: passwordErrorMsg3,
				passwordErrorMsg4: passwordErrorMsg4,
				passwordErrorMsg5: passwordErrorMsg5,
				previewBtnName:	   previewBtnName,
				closePreviewBtnName: closePreviewBtnName,
				maxFileSizeMsg: maxFileSizeMsg
			};		
    }	
		
	//Code below is to implement validation using Angular
	//This function 'setAllInputsDirty' is used to manually trigger validation in all 
	//form fields used in the current scope.
	//This is needed to enable/disable validation globally
	var rootForm = "mainForm";
	function setAllInputsDirty(scope) {
		angular.forEach(scope, function(value, key) {
		    // We skip non-form and non-inputs
			if (!value || value.$dirty === undefined) {
				return;
			}
			// Recursively applying same method on all forms included in the form excep the parent form
			if (value.$addControl && key !== "$$parentForm") {
				return setAllInputsDirty(value);
			}
			//Trigger the validation rules
			if (value.$validate){
			    value.$validate();
			}
			// Setting inputs to $dirty, but re-applying its content in itself
			if (value.$setViewValue) {
				//debugger;
				return value.$setViewValue(value.$viewValue);
			}
		});
	}  
	function setRequiredFields(scope) {
		if (!scope) {
			scope = $scope;
		}
		angular.forEach(scope, function(value, key) {
		    // We skip non-form and non-inputs
			if (!value || value.$dirty === undefined) {
				return;
			}
			// Recursively applying same method on all forms included in the form excep the parent form
			if (value.$addControl && key !== "$$parentForm") {
				return setRequiredFields(value);
			}
			var theObj = value;
		});		
	}
	
	$scope.isFieldRequired = function (prmFieldName) {
		var isFound = false;
		var oRequiredField = formView.getRequiredField();
		findField: {
			for(var subformName in oRequiredField) {
				isFound = prmFieldName in oRequiredField[subformName];
				if (isFound) {
					break findField;
				}
			}
		}
		return isFound;
	}
		
	function validateFormField(oRequiredField) {
//		console.log("oRequiredField: " + isJSON(oRequiredField));

		var retVal = true;

		for(var subformName in oRequiredField) {
			for(var fieldName in oRequiredField[subformName]) {	
				var sField = fieldName;
				if(isFieldExisted(sField)) {
					var val = document.getElementById(sField).value;
//					console.log("fieldName: " + fieldName + " " + "value: " + val);
					if(isEmpty(val)) {
						document.getElementById(sField).style.backgroundColor = "yellow";
						retVal = false;
					}
				}
			}
		}
		//debugger;
		retVal = retVal && $scope.mainForm.$valid;
		return retVal;
		
	}	

    //This '$watch()' function is used to call 'changeValidity()' if any change happens to the scope data.
	//For now, this approach will not be used since it is not working 100%.
	//We will now depend on 'enable-validation' directive/add-on which must be added 
	//to each field in the form where applicable
	$scope.$watch(function() {
		$scope.changeValidity();
	}, true);
    /*$scope.changeValidity = function() {
        debugger;
        //This will check if validation is truned off, it will 
        // clear all validation errors
        if ($scope.isValidationRequired === false) {
            for (var error in $scope[rootForm].$error) {
                var theFormName = $scope[rootForm].$error[error][0].$name;
                var theFormObj = $scope[theFormName];            	
                while (theFormObj.$error[error]) {
                    theFormObj.$error[error][0].$setValidity(error, true);
                }
            }
        } else {
        	setAllInputsDirty($scope);
        }
    }*/

    $scope.changeValidity = function(theForm) {
        //debugger;
        //This will check if validation is truned off, it will 
        // clear all validation errors
        if (!theForm) {
          theForm = $scope[rootForm];
        }
        if (!theForm) {
        	return;
        }
        if ($scope.isValidationRequired === false) {
            for (var error in theForm.$error) {
            	errTypeArr = theForm.$error[error];
            	angular.forEach (errTypeArr, function(value, idx) {
                    var theObjName = value.$name;
                    var theObj = value;
                    if (theObj.$addControl) {
                    	//This is a subform, so call the function recursively for each of the children
                    	//Repeat until the subform is valid
                    	//TODO: there is risk of infinite loop.
                    	//  Needs review and improvments if performance becomes an issue.
                    	var isValid=false;
                    	while (!isValid) {
                    		$scope.changeValidity(theObj);
                    		isValid = theObj.$valid;
                    	}
                    } else {
                    	//For the current object, clear the error
                    	while (theObj.$error[error]) {
                    		theObj.$setValidity(error, true);
                      }
                    }
            	})
            }
        } else {
        	setAllInputsDirty($scope);
        }
    }
	//Setup flag to indicate when validation should be executed
	$scope.startExecValidations = function () {
		if (!$scope.isValidationRequired) {
			$scope.isValidationRequired = true;
		}
		//$scope.changeValidity();
	}
	$scope.stopExecValidations = function () {
		if ($scope.isValidationRequired == undefined || $scope.isValidationRequired) {
			$scope.isValidationRequired = false;
		}
		$scope.mainPromise.then(function(success) {
			//$scope.changeValidity()
		})
	}
	$scope.stopExecValidations();
	$scope.testFindField = function () {
		debugger;
		var result;
		var theField = "app_aic_member_number";
		result = isFieldRequired(theField);
		setRequiredFields();		
	}
	
	//JIRA: NE-2255 - Sync Photos
	$scope.ImageOperation = {
			UPLOAD: "upload",
	    	RENDER: "render",
	    	MARKDELETE: "markdelete",
	    	SYNC_LOAD: "syncload",
	    	SYNC_SAVE: "syncsave"
	}
	$scope.syncPhotos = function (syncType, successCallback) {
		//debugger;
		var sAppURL = getAppURL();
		//Get string of Additional Image Fields and Values
		var sAdditionalImages = JSON.stringify($scope.MainController.imagesModel);
		var sUrl = sAppURL + "/PhotoUploadCmd?fileNumber=" + $scope.file_number + "&imageOperation=" + syncType + "&additionalImages=" + sAdditionalImages + "&requestSource=" + getRequestSource();
		$http({
	            method : 'GET',
	            url : sUrl,
	        }).success(function(data, status, headers, config) {
	            console.log(data);
	            if (successCallback) {
	            	successCallback();
	            }
	        }).error(function(data, status, headers, config) {
	            console.log(data);
	        });
	}
	$scope.$on('event:force-model-update', function() {		
		//Sync photos after model is updated and after "file_number" scope variable is modified
		$scope.$watch('file_number', function() {
			$scope.syncPhotosLoad(function () {
				//This will force the image to re-load after Photo Sych is done.
				angular.forEach($scope.MainController.additionalImagesDecache, function (value, key) {
					//Just assign a random value to additionalImagesDecache[key] which will force image refresh for all images
					$scope.MainController.additionalImagesDecache[key] = Math.random();
				})
				
			});
		})
	});
	$scope.syncPhotosLoad = function (successCallback) {
		$scope.syncPhotos($scope.ImageOperation.SYNC_LOAD, successCallback);
	}

    //This function was copied from forms.js and renamed here to ngProcessSave()
	//this is needed in order to integrate validation with Angular.
    $scope.ngProcessSave = function () {
    	$scope.stopExecValidations();
    	var appUrl = getAppURL();
    	$('#loading-indicator').show();
        $.post(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=html5_save",
        {xmlData: createXML("save", formView)},
        function(data,status){
//              console.log("Data: " + data + "\nStatus: " + status);
        	var sSaveMsg = "";
        	if(formView.getLabelFields()) {
//            		debugger;
        		sSaveMsg = formView.getLabelFields().saveMsg;
        	}
        	
        	//Execute Sync Photos - NE-2255
        	showMsg(sSaveMsg);
        	$scope.syncPhotos($scope.ImageOperation.SYNC_SAVE);
    		//popUpMsg("infoPopUp", sSaveMsg);
        });	        
    } 
    
    //Switch views when clicking the switch view button.
    $scope.ngSwitchView = function () {
    	$scope.stopExecValidations();
    	var appUrl = getAppURL();
    	
    	if(hasFullView == "Y") {
    		hasFullView = "N";
    	} else if(hasFullView == "N") {
    		hasFullView = "Y";
    	}
    	
    	
    	$('#loading-indicator').show();
    	

        $.post(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=html5_switchview",        	        		
        {xmlData: createXML("switchView", formView)},
        function(data,status) {

        	console.log ("Call ngSwitchView() status: " + status);
        	
        	//Hide all section of view.
        	hideView();
        	
        	//debugger;
        	
        	var newUrl = appUrl
			+ "/edit.pdf?"
			+ "command=gethtml5form" 
			+ "&appReqNum=" 	+ appReqNum 
			+ "&formId=" 		+ formId 
			+ "&formName="      + formName 								
			+ "&countryCode=" 	+ countryCode
			+ "&formLanguage="	+ formLanguage
			+ "&process="		+ "save"
			+ "&requestSource=" + requestSource
			+ "&hasFullView="   + hasFullView;
        	
        	console.log("newUrl for switching view: " + newUrl);
        	
        	$(location).attr('href', newUrl);
        	
        	//Execute Sync Photos - NE-2255
        	$scope.syncPhotos($scope.ImageOperation.SYNC_SAVE);
    		//popUpMsg("infoPopUp", sSaveMsg);
        });
    	
    	

    } 
    
	//Integrated with Angular.
    //This function was copied from 'forms.js' into the controller and renamed to 'ngProcessReview'.
    //This is needed to ensure validation is integrated with Angular.
	$scope.ngProcessReview = function () {
		
		var appUrl = getAppURL();
		$scope.startExecValidations();
		//Use timeout to give time for validations to be reflected
		$timeout(function(){
	    	if($scope.mainForm.$valid) {
	    		//popUpMsg("infoPopUp", "Form is valid, will submit!");
		    	$('#loading-indicator').show();
		        $.post(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=html5_review",
		        {xmlData: createXML("review", formView)},
		        function(data, status){
		        	//console.log("Data: " + data + "\nStatus: " + status);
		        	var sSaveMsg = "";
		        	if(formView.getLabelFields()) {
		        		sSaveMsg = formView.getLabelFields().saveMsg;
		        	}	        	
		        	showMsg(sSaveMsg);
		        	//Execute Sync Photos - NE-2255
		        	$scope.syncPhotos($scope.ImageOperation.SYNC_SAVE);
		        });	 
	    	} else {		    		
	    		popUpMsg("infoPopUp", "Please fill the required field and clear validation errors!");
	    	}
		}, 100)
    	//$scope.stopExecValidations();
	}
	
	$scope.ngProcessComplete = function () {
		
		var appUrl = getAppURL();
		$scope.startExecValidations();
		$timeout(function(){
			if($scope.mainForm.$valid) {
				if(verifyMemberNumber()) {
		    		console.log("Begin to submit the completed report..");
		    		$('#loading-indicator').show();
			        $.post(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=html5_complete",
			        	{xmlData: createXML("complete", formView)},
			        	function(data,status){
				        	//console.log("Data: " + data + "\nStatus: " + status);
				        	var sCompleteMsg = "";
				        	if(formView.getLabelFields()) {
				        		sCompleteMsg = formView.getLabelFields().completeMsg;
				        	}
				        	showMsg(sCompleteMsg);
				        	$scope.syncPhotos($scope.ImageOperation.SYNC_SAVE);
			        		//popUpMsg("infoPopUp", "Your report has been submitted successfully!");
			        	});
				}
			}
		}, 100);
/*    	if(validateFormField(formView.getRequiredField())
    			&& verifyMemberNumber()) {
    		console.log("Begin to submit the completed report..");
    		$('#loading-indicator').show();
	        $.post(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=html5_complete",
	        {xmlData: createXML("complete", formView)},
	        function(data,status){
	        	//console.log("Data: " + data + "\nStatus: " + status);
	        	var sCompleteMsg = "";
	        	if(formView.getLabelFields()) {
	        		sCompleteMsg = formView.getLabelFields().completeMsg;
	        	}
	        	showMsg(sCompleteMsg);
	        	$scope.syncPhotos($scope.ImageOperation.SYNC_SAVE);
        		//popUpMsg("infoPopUp", "Your report has been submitted successfully!");
	        });
    	}*/
	}
	
	$scope.ngProcessPreview = function() {
			    	
//	    	delayTimes(1, 10, 3000);
	    	
	    	var appUrl = getAppURL();
	    	
			var sPreviewBtnName = "";
			//debugger;
	    	if(formView.getLabelFields()) {
	    		sPreviewBtnName = formView.getLabelFields().previewBtnName;
	    	}	    	
	    	
	    	$("#previewBtn").attr('value', sPreviewBtnName);
	    	
	    	if($("#tab_area").is(':visible')) {
	    		
				$('#tab_area').toggle('show');
				$('#navigate_area').toggle('show');
				if(hasFullView == 'Y') {
					$('#addendum_area').toggle('show');
				}
				$('#loading-indicator').show();
				//$('#map_area').hide();
				$scope.doHideLiveMap();				    		
				//Create xmlStr prior to previewing.
				var xmlStr = createXML("preview", formView);
				
							
//				//Save xml data first. ==> Move save xml data to SubmitFormCmd.
//		        $.post(appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=save",
//		                {xmlData: xmlStr},
//		                function(data,status){
//		                	
//		                      console.log("Save data prior to previewing: " + status);	    
//		                      
//		                      if(status == "success") {
//		                    	  
//		                    	debugger;
//		                    	  
////		                    	var sUrl = appUrl 
////				        	        		+"/servlet/com.visionmax.servlet.CommandServlet?command=previewpdf&formId="
////				        	        		+formId+"&appReqNum="+appReqNum+"&process=preview"+"&timestamp="+new Date().getTime();
				
								var sUrl = appUrl + "/servlet/com.visionmax.servlet.CommandServlet?command=submitform&isGuide=Yes&process=html5_preview";

		                    	  	                    	  	                    	  
		              	        $.post(sUrl,
		              	        		
		            	    	        {xmlData: xmlStr},
		            	    	        
		            	    	        function(data, status) {
		            	    	        	
//	            	    						debugger;	            	    	        	
		            	    	        	 
		            	    	        		//console.log("PDF has been created in file server.");
		            	    	        		
		            	    				//	event.preventDefault();	            	    					
		            	    					
		            	    					// The following section is for displaying PDF in a new tab in browser.	 
		            	    					
		            	    					var obj       = $("#pdf_obj");
		            	    					var objdata   = $(obj).attr('data');
		            	    					var container = $(obj).parent();
		            	    					

		            	    					var newUrl = appUrl 
		            	    						+"/servlet/com.visionmax.servlet.CommandServlet?command=getfilestream&appReqNum="+appReqNum
		            	    						+"&process=html5_preview"+"&timestamp="+new Date().getTime();
		            	    					
//		            	    					debugger;
		            	    					            	    					            	    						            	    				
		            	    					// The following section is commented out for showing the PDF in the windows itself.
		            	    					/*
		            	    					var win = window.open(newUrl, '_self');
		            	    					if (win) {
		            	    					    //Browser has allowed it to be opened
		            	    					    win.focus();
		            	    					} else {
		            	    					    //Browser has blocked it
		            	    					    alert('Please allow popups for this website');
		            	    					}	
		            	    					
		            	    					*/
		            	    					
		            	    				            	    				
		            	    					// The following section is for displaying PDF in a new tab in browser.
		            	    					
		            	    					$(obj).attr('data', newUrl);
		            	    							    					
		            	    		//			console.log("objdata:" + $(obj).attr('data'));
		            	    					
		            	    					var newobj  = $(obj).clone();
		            	    					$(obj).remove();
		            	    					$(container).append( newobj );
		            	    					
		            	    					$('#pdf_area').toggle('show');	            	    						            	    					
		            	    					          	    						            	    		            	    						            	    						            	    						            	    					
		            	    					$('#loading-indicator').hide();	 
		            	    					
		            	    					
		            	    					/* Change the preview button caption to "Close".
		            	    					
			            	    					var sClosePreviewBtnName = "";
		
			            	    		        	if(formView.getLabelFields()) {
			            	    		        		sClosePreviewBtnName = formView.getLabelFields().closePreviewBtnName;
			            	    		        	}	    					
			            	    					
			            	    					$("#previewBtn").attr('value', sClosePreviewBtnName);
		            	    					
		            	    					*/
		            	    					
		            	    	//				console.log("PDF loading is done.");		    	        		
		            	    	        		
		            	    	        	});		                    	  
		                    	  
//		                      } else {
//		                    	  console.log("Saving data is not successful!");
//		                      }
//		                      
//		                });	
							
			
	    	} else {
		         $('#tab_area').toggle('show');
				 $('#navigate_area').toggle('show');
				 if(hasFullView == 'Y') {
					 $('#addendum_area').toggle('show');
				 }
		         $('#pdf_area').toggle('show');	
//		         debugger;
		         if($scope.activeTab == activeTabList.locationMap) {
		        	 $scope.doShowLiveMap();
		         }
	    	}			

	}	
	
	
	var sAppURL = getAppURL();
	var sLang = getFormLanguage();
	$scope.lang = sLang;
	var sUrl = "";
	//JIRA: NE-2143 - fix localization issue for Consturction stage
	//      Make sure title is matching the language selected without changing values;
	var sUrl_en = '/formhtml5/data/ConstructionStage_EN.json';
	var sUrl_fr = '/formhtml5/data/ConstructionStage_FR.json';
	var jsonResourceCmdUrl = "";
	var jsonResourceCmdUrl_en = sAppURL + "/CommandServlet?command=getjsonresource&jsonResourceUrl=" + sUrl_en;
	var jsonResourceCmdUrl_fr = sAppURL + "/CommandServlet?command=getjsonresource&jsonResourceUrl=" + sUrl_fr;
	
	//Get Construction Stage default values based on Language and save result in master variable
	if(sLang == "EN") {
		//sUrl = sUrl_en;
		jsonResourceCmdUrl = jsonResourceCmdUrl_en;
	} else if(sLang == "FR") {
		//sUrl = sUrl_fr;
		jsonResourceCmdUrl = jsonResourceCmdUrl_fr;
	}
	/*jsonResourceCmdUrl = sAppURL 
	+ "/CommandServlet?command=getjsonresource&jsonResourceUrl="
	+ sUrl;*/
	//For Ajax call to work correctly in case of French accented letters,
	//  make sure the soruce file uses character encoding `ISO-8859-1` 
	//  and that the letters are displyed correctly.
	//  Use copy/past from the soruce to fix.
	/*$.ajax({
		async: false,
	    type: 'GET',
		url: jsonResourceCmdUrl,
		//contentType: "application/x-www-form-urlencoded;charset=charset=utf-8",
		//contentType: "application/x-www-form-urlencoded;charset=ISO-8859-15",
		//contentType: "application/x-www-form-urlencoded;charset=ISO-8859-1",
		//contentType: "application/x-www-form-urlencoded;charset=windows-1252",
		//contentType: "application/json;charset=UTF-8",
        //dataType: 'json',
        //beforeSend : function(xhr) {
        //    xhr.setRequestHeader('Accept', "text/html; charset=utf-8");
        //},
        success: function(data, status) {
			//Save copy in master variabel for later use
			mainController.constructionStageMaster = data.records;
		 }
	});*/

	//Get Construction Stage with English titles 
	$.ajax({
		async: false,
	    type: 'GET',
		url: jsonResourceCmdUrl_en,
        success: function(data, status) {
			//Save copy in English Scope variabel for later use
			mainController.constructionStageMaster_en = data.records;
		 }
	});
	//Get Construction Stage with French titles 
	$.ajax({
		async: false,
	    type: 'GET',
		url: jsonResourceCmdUrl_fr,
        success: function(data, status) {
			//Save copy in French Scope variabel for later use
			mainController.constructionStageMaster_fr = data.records;
		 }
	});
	//Set the Construction Stage Master Scope variable according to Language
	$scope.setConstructionStageTitles = function () {
		if ($scope.lang == "EN") {
			mainController.constructionStageMaster = angular.copy(mainController.constructionStageMaster_en);
		} else if ($scope.lang == "FR") {
			mainController.constructionStageMaster = angular.copy(mainController.constructionStageMaster_fr);
		}
		var pi_construction_type = $scope.pi_construction_type_model;
		if (pi_construction_type === "New Construction") {
			//Change the title only if construction type is "New Construction".
			angular.forEach(mainController.constructionStageMaster, function (constructionStageRow, idx) {
				if (mainController.constructionStage[idx].StageDesc !== constructionStageRow.StageDesc) {
					mainController.constructionStage[idx].StageDesc = constructionStageRow.StageDesc;
				}
			})
		}
	}
	
	//Get empty values for consturction stage and store it in the related variable
	sUrl = '/formhtml5/data/ConstructionStage.json';
	jsonResourceCmdUrl = sAppURL 
	+ "/CommandServlet?command=getjsonresource&jsonResourceUrl="
	+ sUrl;
	$.ajax({
	     async: false,
	     type: 'GET',
		 url: jsonResourceCmdUrl,
		 contentType: "application/x-www-form-urlencoded;charset=UTF-8",
		 success: function(data, status) {
			 mainController.constructionStageEmpty = data.records;
		 }
	});
	
	$scope.setConstructionStage = function () {
		var pi_construction_type = $scope.pi_construction_type_model;
		if (!pi_construction_type || (pi_construction_type === "Renovation / Improvements")) {
			mainController.constructionStage = angular.copy(mainController.constructionStageEmpty);
		} else
		if (pi_construction_type === "New Construction") {
			mainController.constructionStage = angular.copy(mainController.constructionStageMaster);
		}
	}
	
	//Click Legend to hide/show the div.
	$scope.hideOrShowDiv = function (id) {
		debugger;
		var currId = "#"+id;
		$(currId).toggle('show');
	}	
	
}]);

//Create 'force-model-update' directive that will respond to the model update event and update the related scope variable.
//This directive will be used against the 'input' element that needs to update its scope variable.
app.directive('forceModelUpdate', function($compile) {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function(scope, element, attrs, ctrl) {
        	//debugger;
            scope.$on('event:force-model-update', function() {
            	var theScope=scope;
            	var theElemVal;
            	if (element.attr('type') === 'radio') {
            		//For radio input, first find the element, then get the value of the check option
            		theElemVal = $(":input[name='"+element[0].name+"']:checked", element.parent).val();
            	} else {
            		theElemVal = element.val();
            	}
                ctrl.$setViewValue(theElemVal);
            });
        }
    }
});

//Directive empty-if-zero
app.directive('emptyIfZero', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, elem, attrs, ngModelCtrl) {
        	//debugger;
            ngModelCtrl.$parsers.push(function (viewValue) {
            	//console.log("ngModelCtrl = ", ngModelCtrl)
                if (viewValue === 0) {
                	ngModelCtrl.$setViewValue('');
                	ngModelCtrl.$render();
                    return ""; // or '0.00' - depending on your requirements
                }
                return viewValue;
            });
            ngModelCtrl.$formatters.push(function (viewValue) {
            	//console.log("ngModelCtrl = ", ngModelCtrl)
                if (viewValue === 0) {
                	ngModelCtrl.$setViewValue('');
                	ngModelCtrl.$render();
                    return ""; // or '0.00' - depending on your requirements
                }
                return viewValue;
            });            
        }
    };
});

//Define directive check-if-required
//This directive will loop over all child input elements and add the required attributes if needed
app.directive('checkIfRequired', ['$compile', '$timeout', '$parse', function ($compile, $timeout, $parse) {
    return {
        /*require: '?ngModel',*/
        link: function (scope, el, attrs, ngModel) {
            /*if (!ngModel) {
                return;
            }*/
			//debugger;
			var children = $(":input", el);
			var saveIsValidationRequired;
			//No need to wait until document ready to add required fields. The line below will be commneted
			//angular.element(document).ready(function (){
			//Run the following as early as possible but just wait (using promise) until 
			//  the list of required fields is retrieved from Database
			scope.requiredFieldsPromise.then(function(success) {
				//If needed, stop validation while adding required attribute
				saveIsValidationRequired = scope.isValidationRequired;	//Save current flag value
				scope.stopExecValidations();
				//remove the attribute `check-if-required` to avoid recursive calls
                el.removeAttr('check-if-required');
                //The line below caused duplication of the table in construction stage, so it is removed and no impact
                //$compile(el[0])(scope);
				angular.forEach(children, function(value, key) {
					try {
						//debugger;  //&& (value.id != "pi_subject_namex" && value.id != "pi_subj_provincex")
						//console.log("value.id: " + value.id);
						
//						if(value.id ==  "super_appraiser_license_info" ) {
//							debugger;
//						}
						
						
						if(typeof (value.id) != 'undefined') {
							if (scope.isFieldRequired(value.id)) {
				                angular.element(value).attr('required', true);
				                //el.removeAttr('check-if-required');
				                $compile(value)(scope);
							}
							//Check if the element is not in "Required" list, and it has an expression to control requried, then
							//... add the attribute 'ng-required' with the expression specified to the element and compile.
							if (!angular.element(value).prop('required') && value.attributes.hasOwnProperty("check-if-required-expr")) {
								var isRequiredExpr = value.attributes["check-if-required-expr"].value;
								angular.element(value).attr('ng-required', isRequiredExpr);
								$compile(value)(scope);
								//No need to use $watch anymore.
								/*scope.$watch(function (){
										var exprValue = $parse(isRequiredExpr)(scope);
										return exprValue;
									}
									, function (oldValue, newValue){
										var isRequired = $parse(isRequiredExpr)(scope);
										if (isRequired) {
							                angular.element(value).attr('required', true);
							                $compile(value)(scope);
										} else {
							                angular.element(value).attr('required', false);
							                $compile(value)(scope);
										}
										var elModel = angular.element(value).controller("ngModel");
										elModel.$setViewValue(elModel.$viewValue);
									})*/
							}
						}
					} catch (e) {
						console.log("There is error happend in checkIfRequired directive:" + e);
					}
				});
				//If saved flag value is ture, enable validation
				if (saveIsValidationRequired) {
					scope.startExecValidations();
				}
			})
			//})
        }
    };
}]);

//JIRA: NE-2297 - On in IE, Date Picker can be edited after locked. 
//      Prevent mousedown events for fieldset if disabled.
app.directive('fieldset', function () {
    return {
        restrict: 'E',
        link: function (scope, elem, attrs) {
        	var fieldset = angular.element(elem)[0];
        	fieldset.onmousedown = function(e) {

        	    if (!e) e = window.event;

        	    if (fieldset.disabled) {

        	        // for IE9+
        	        if (e.preventDefault) {

        	            e.preventDefault();
        	        }
        	        // for IE8-
        	        else {

        	            // actualy does not work
        	            //e.returnValue = false;
        	        }

        	        return false;
        	    }
        	}
        }
    }
});

//JIRA: NE-NE-2342 - Make the dropdown filed editable of 'Other' is selected
//This uses two fields, SELECT and INPUT. The input element is identfied by the attribute 'editable-dropdown'
app.directive('editableDropdown', function (){
	return {
		link: function (scope, elemSel, attrs) {
			//debugger;
			var inpElemID = attrs.editableDropdown;
			var inpElem;
			//The parameter 'elemSel' is the SELECT field
			function initInpElem() {
				if ($(elemSel).is("select")) {
					inpElem = $('#' + inpElemID);
				} else {
					//This is in case the Dropdown is based on DATALIST which is not yet implemented
					//In this case, the input element is actually the same as the dropdown field using DATALIST
					inpElem = elemSel;
				}
			}
			function updateEditable(elm) {
				initInpElem();
				//Copy value from SELECT element to the INPUT Element
				//Use NgModelController to copy value in order to trigger validation for 'inpElem'
				var selectedValue = $(elm).children("option").filter(":selected").text();
				//or var selectedValue = elm.val();
				//TODO: will have to add more control here since the SELECT value and text are not the same
				//      Might cause some issue while rendering value in PDF.
				angular.element(inpElem).controller('ngModel').$setViewValue(elm.val());
				angular.element(inpElem).controller('ngModel').$render();
				makeEditable(elm);
			}
			function makeEditable(selElm) {
				//debugger;
				initInpElem();
				if ($(selElm).is("select")) {
					if (selElm.val() == "Other") {
					      $(inpElem).prop("readonly", false);
					} else {
					      $(inpElem).prop("readonly", true);
				    }
				} else {
				    if (elm.value != "Other" && !$(elm).attr("keypressOff")) {
						$(elm).keypress(function(event) {
						    console.log("keypress preventd")
						  	event.preventDefault();
						})
				    } else {
						$(elm).off("keypress");
						$(elm).attr("keypressOff", true);
						console.log("keypress event removed")
				    }
				}
			}			
			angular.element(document).ready(function(){
				makeEditable(elemSel);
			});
			$(elemSel).change(function () {
				updateEditable(elemSel);
			});
		}
	}
});

//JIRA: NE-2465 - create reusable componenet with photo-list-upload
//	    This directive uses a Data Parameter to show list of photos from the server,
//		in addition to uploading photos to the server using drag-n-drop.
app.directive('photoListUpload', function () {
	return {
		restrict: 'A',
		scope: {
			listData:'=',
			file_number: '=fileNumber',
			imagesModel: '=',
			imagesDescribeModel: '=',
			fieldsetClass: '@',
			containerClass: '@',
			photoClass: '@'
		},
		replace: true,
		templateUrl: '/NAS/formhtml5/templates/photo-list-template.html' 
	};
});