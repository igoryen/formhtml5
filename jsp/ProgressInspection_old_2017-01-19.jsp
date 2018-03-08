<!DOCTYPE html>
<%@page import="java.net.URL"%>
<%@page import="com.nas.util.LanguageUtilFunction"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/c-1_0-rt.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/fmt-rt.tld" prefix="fmt"%>
<%@ page import="java.util.*" %>

<html lang="en" >	
<head>		
	<%@ page 
	language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import=
	"com.visionmax.workflow.view.FormTree
	,com.visionmax.workflow.app.FormManager
	,com.visionmax.util.AppConfig
	,com.nas.app.AppConstants
	,com.visionmax.components.authentication.AuthenticationToken
	,com.visionmax.util.SysParamsFactory
	,java.util.Date
	,java.util.Hashtable
	,java.text.SimpleDateFormat
	,javax.servlet.jsp.PageContext" %>
	
	
	<%
		//The following lines of code may be required to allow CORS submit.
	    /* response.setHeader("Access-Control-Allow-Origin",  request.getHeader("Origin"));
	    response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
	    response.setHeader("Access-Control-Max-Age", "3600");
	    response.setHeader("Access-Control-Allow-Headers", "x-requested-with"); */
	    
		String lang = (String)request.getAttribute("formLanguage");
		//String appUrl = "/"+getServletContext().getServletContextName();
		String appUrl = AppConfig.getInstance().getSingleValue("applicationURL");
		String appURL = AppConfig.getInstance().getSingleValue("applicationURL");
		SysParamsFactory spf = new SysParamsFactory();
		String isAutoSave = spf.getParamValue("Forms","FORMHTML5_AUTOSAVE_ALLOWED");
		AuthenticationToken token = (AuthenticationToken) request.getSession().getAttribute("token");
		String requestSource = (String)request.getAttribute("requestSource");
	    /*String serverUrl = (String)request.getScheme() 
				+ "://" + (String)request.getServerName() 
				+ (((int)request.getServerPort() == 80 || (int)request.getServerPort() == 443) ? "" : ":"	+ (int)request.getServerPort());	
		*/
		String serverUrl = request.getRequestURL().toString();
		serverUrl = serverUrl.substring(0, serverUrl.indexOf(request.getRequestURI().toString())+1);
		
		String googleMapCryptopKey = AppConstants.GOOGLE_MAP_JAVASCRIPT_CRYPTOP_KEY;
		
		//serverURL = serverURL.getHost();
	//	System.out.println(serverUrl);
	//	System.out.print(request.getRequestURL().toString());
		//String serverUrl = response.encodeURL("http://10.200.12.214:8080/");		
		//serverUrl = response.encodeURL(serverUrl.replace("test.nationwideapprisals.com","testap.nationwideappraisals.com"));
		
		boolean isRequestFromMIP = false;
		if(requestSource != null && AppConstants.REQUEST_SOURCE_MIP.equals(requestSource)){
			isRequestFromMIP = true;
		}else{
			requestSource = "NAS";			
		}
	//	System.out.println(requestSource + isRequestFromMIP);
		String userName = null;
		if (null != token)  {
			userName = token.getUsername();
		}
		
		String language = "English";
	    Object lang_cd = request.getAttribute("formLanguage");
	    if (lang_cd != null)
	    {
	   		language = (String)lang_cd;
	   		pageContext.setAttribute("locale", LanguageUtilFunction.getLanguageLocale(language));
	    }
	%>
		
	<!-- The following section deals with text locale -->
	<fmt:setLocale value="${locale}"/>
	<fmt:setBundle basename="nas.resources.html5form.Html5FormApplicationResources" />
	<%@ include file="FormMessage.jsp" %>
	
	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
	<script type="text/javascript" src="<%=appUrl%>/jsp/scripts/nifty.js"></script>
	<script type="text/javascript" src="<%=appUrl%>/jsp/scripts/final.js"></script>
	<script type="text/javascript" src="<%=appURL%>/jsp/scripts/editwindow.js"></script>
	<%-- <script language="JavaScript" src="<%=appUrl%>/jsp/scripts/popcalendar.js" ></script> --%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
 	<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
	
	<!-- New html5 code -->
	<title><%=progressInspectionTitle%></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">  
	<script src="<%=appUrl%>/formhtml5/js/angularJS/angular.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/angular-animate.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/ui-bootstrap-tpls-1.3.3.js"></script>
    <script src="<%=appUrl%>/formhtml5/js/angularJS/angular-sanitize.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/ng-flow-standalone.js"></script>
    <script src="<%=appUrl%>/formhtml5/js/angularJS/signature_pad.js"></script>
    <script src="<%=appUrl%>/formhtml5/js/angularJS/ng-signature-pad.js"></script>
    <script src="<%=appUrl%>/formhtml5/js/angularJS/angular-conditional-validation.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/util.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/app.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/formMainController.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/ConstructionStageController.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/jquery/1.12.4/jquery.min.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/appSigPad.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/appPhotosController.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/datePicker.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/ngDialog.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/bootstrap/bootstrap.min.js"></script>
    <link href="<%=appUrl%>/formhtml5/css/bootstrap/bootstrap.min.css" rel="stylesheet"> 
    <script src="<%=appUrl%>/formhtml5/js/nasform/appResource.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/nasform/form.js"></script>
	<link href="<%=appUrl%>/formhtml5/css/style.css?id=1" rel="stylesheet"/>
	<link href="<%=appUrl%>/formhtml5/css/ngDialog.css" rel="stylesheet"/>
	<link href="<%=appUrl%>/formhtml5/css/ngDialog-theme-default.css" rel="stylesheet"/>
	<link href="<%=appUrl%>/formhtml5/css/newstyle.css" rel="stylesheet" type="text/css"/>
	
	<!-- For dialog -->
	<link rel="stylesheet" href="<%=appUrl%>/formhtml5/css/jquery-ui.css">
	<script src="<%=appUrl%>/formhtml5/js/jquery/1.12.4/jquery-1.12.4.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/jquery/1.12.4/jquery-ui.js"></script>	
	
	
	 <!-- Google Map API -->
	
    <script
    	src="https://maps.googleapis.com/maps/api/js?key=<%=googleMapCryptopKey%>">
    </script>		
		
	<script lang="javascript">
//	The following varibale list are global ones.
 	var formView = new FormView();
 	var appReqNum = getQueryVariable("appReqNum");
 	var formId = getQueryVariable("formId");
 	var countryCode = getQueryVariable("countryCode");
 	var formLanguage = getQueryVariable("formLanguage");	 	
 	var process = getQueryVariable("process");
 	var requestSource = getQueryVariable("requestSource");
 	var serverURL = "<%=AppConfig.getInstance().getSingleValue("serverURL") %>";
 	var webServerURLForLCCall = "<%=AppConfig.getInstance().getSingleValue("webServerURLForLCCall") %>";
 	 	
 	console.log("process: " + process);
 	
	console.log("language: " + "<%=language%>");
		
 	 	
//	Start document ready fucntions.
//	The code has been moved into formMainController.js.		
//	End of document ready.	
 	
	</script> 

</head>

<body ng-app="myApp" ng-controller="formMainController as MainController" flow-init flow-prevent-drop resize>   
	<!-- initLabels object will init all of the labels from resource file and pass it into main controller. -->	
	<div class="container" ng-init='		
	   initLabels({
		completeMsg: "<%=completeMsg%>",
		saveMsg: "<%=saveMsg %>",
		requiredFieldAlertMsg: "<%=requiredFieldAlertMsg%>",
		formLockCorrectMsg: "<%=formLockCorrectMsg%>",
		formLockErrorMsg: "<%=formLockErrorMsg%>",
		passwordCorrectMsg: "<%=passwordCorrectMsg%>",
		passwordErrorMsg1: "<%=passwordErrorMsg1%>",
		passwordErrorMsg2: "<%=passwordErrorMsg2%>",
		passwordErrorMsg3: "<%=passwordErrorMsg3%>",
		passwordErrorMsg4: "<%=passwordErrorMsg4%>",
		passwordErrorMsg5: "<%=passwordErrorMsg5%>",
		previewBtnName:	   "<%=previewBtnName%>",
		closePreviewBtnName: "<%=closePreviewBtnName%>",
		maxFileSizeMsg: "${maxFileSizeMsg}"
		})'>
	  <div id="config_area" style="display: none">
	  		<input id="serverURL" type="hidden" value="<%=serverUrl%>" />
	  		<input id="applicationURL" type="hidden" value="<%=appUrl%>" />
	  		<input id="autoSaveFlag" type="hidden" value="<%=isAutoSave%>" />
	  		<input id="requestSource" type="hidden" value="<%=requestSource%>" />
	  		<input id="html5_locationmap_centre" type="hidden" value="" />
	  		<input id="html5_locationmap_zoom" type="hidden" value="" />
	  		<input id="html5_locationmap_marker" type="hidden" value="" />
      </div>
	  <div id="message_area" class="centerDiv" style="display: none"></div>
	  <div id="title_area" class="text-center">
		  <span>		  	  			  
		  	  <font size="5"><%=progressInspectionTitle%>	
		  	  <img id="loading-indicator" src="<%=appUrl%>/assets/img/loading.gif" style="display: none">	
		  	  </font>
			  <font size="2">
			  
			  <img id="ngSaveBtn" ng-click="ngProcessSave()" src="<%=appUrl%>/formhtml5/image/save.png" title="<%=saveBtnName%>"
			  	style="position: relative; left:100px; bottom:1px; width:50px; height:50px;"> 
			  <img id="ngReviewBtn" ng-click="ngProcessReview()" src="<%=appUrl%>/formhtml5/image/review.png" title="<%=reviewBtnName%>"
			  	style="position: relative; left: 105px; bottom:0.5px; width:50px; height:50px;">				  	
			  <img id="ngCompleteBtn" ng-click="ngProcessComplete()" src="<%=appUrl%>/formhtml5/image/complete.png" title="<%=completeBtnName%>"
			  	style="position: relative; left: 110px; bottom:1px; width:50px; height:50px;">	
			  <img id="ngPreviewBtn" ng-click="ngProcessPreview()" src="<%=appUrl%>/formhtml5/image/preview.png" title="<%=previewBtnName%>"
			  	style="position: relative; left: 115px; bottom:1px; width:50px; height:50px;">	
			  <img id="workAsPdfBtn" src="<%=appUrl%>/formhtml5/image/offlinepdf.png" title="<%=workAsPdfBtnName%>"
			  	style="position: relative; left: 120px; bottom:1px; width:50px; height:50px;">				  	
			  	
			  <!--  
			  <button id="ngSaveBtn" ng-click="ngProcessSave()"><%=saveBtnName%></button>
			  <button id="ngReviewBtn" ng-click="ngProcessReview()"><%=reviewBtnName%></button>
			  <input id="completeBtn" type="submit" value="<%=completeBtnName%>">
			  <input id="previewBtn" type='button' value="<%=previewBtnName%>">
			  <input id="workAsPdfBtn" type='button' value="<%=workAsPdfBtnName%>">
			  -->
			  
			  </font>	
			  		  
			  <span class="file-number-top"><label>NAS#:&nbsp&nbsp</label><span ng-bind="file_number"></span></span>		   	 
		  </span>
	  </div>

      <!-- <span>Appraiser Signature isSigned() = {{isAppraiserSigned()}}</span> -->  
      <!-- <span>Supervisor Signature isSigned() = {{isSupervisorSigned()}}</span> -->
      <!-- <span>isValidationRequired = {{isValidationRequired}}</span><br>
      <input type="button" ng-click="isValidationRequired = !isValidationRequired" value="Toggle isValidationRequired"/><br>
      <input type="button" ng-click="testFindField()" value="Test Find Field"><br> 
      <br>
      -->
      
	  <div id="tab_area" ng-form="mainForm">
		  <ul  class="nav nav-pills">
		    <li ng-class="{'ng-invalid':mainForm.homeForm.$invalid && mainPromiseResolved}" class="active" ng-click="doHideLiveMap(); setActiveTabHome();"><a data-toggle="pill" href="#home"><%=homeTabName%></a></li>
		    <li ng-class="{'ng-invalid':mainForm.serviceForm.$invalid && mainPromiseResolved}" ng-click="doHideLiveMap(); setActiveTabServices();"><a data-toggle="pill" href="#menu4"><%=servicesTabName%></a></li>
		    <li ng-class="{'ng-invalid':mainForm.certificationForm.$invalid && mainPromiseResolved}" ng-click="redrawCanvas(); doHideLiveMap(); setActiveTabCertification();"><a data-toggle="pill" href="#menu7"><%=certificationTabName%></a></li>
		    <li ng-class="{'ng-invalid':mainForm.photosForm.$invalid && mainPromiseResolved}" ng-click="doHideLiveMap(); setActiveTabPhoto();"><a data-toggle="pill" href="#menu8"><%=photoTabName%></a></li>
		    <li ng-class="{'ng-invalid':mainForm.mapForm.$invalid && mainPromiseResolved}" ng-click="doShowLiveMap(); setActiveTabLocationMap();"><a data-toggle="pill" href="#menu9"><%=locationTabName%></a></li>    
		  </ul>
		  
		  <div class="tab-content">
			<div id="home" class="tab-pane fade in active" ng-form="homeForm">
				<fieldset class="fieldstyle" ng-disabled="isAppraiserSigned()" check-if-required>					
					<legend class="legendstyle">&nbsp;<%=legendGeneral%></legend>
					<div class="formColumn">
						<label class="labelstyle" for=reference_number"><%=clientReferenceNoLbl%></label>
						<input class="inputstyle"
							   type="text" 
							   id="reference_number" 
							   name="reference_number" 
							   ng-model="reference_number" 
							   class="fixedWidthLabel"
							   width="250"
							   maxlength="80"
							   force-model-update>
					</div>					
					<div class="formColumn">
						<label class="labelstyle" for="pi_number"><%=progressInspectionNoLbl%></label>
						<input class="inputstyle" 
						type="text" 
						id="pi_number" 
						class="fixedWidthLabel"
						width="250"
						maxlength="80">	
					</div>					
					<div class="formColumn">
						<label class="labelstyle" for="doc_number"><%=fileNoLbl%></label>
						<input class="inputstyle" 
						type="text" 
						id="doc_number" 
						class="fixedWidthLabel"
						width="250"
						maxlength="80">	
					</div>
					<div class="formColumn">
						<label class="labelstyle" for="file_number"><%=nasNoLbl%></label>
						<input class="inputstyle"  
						type="text" 
						id="file_number" 
						name="file_number" 
						ng-model="file_number" 
						class="fixedWidthLabel"
						width="250"
						maxlength="80"						
						force-model-update>	
						<p></p>
					</div>
				</fieldset>	
				<p>&nbsp;</p>
				<table style="width:100%; height:100%; border:0px;">
					<td style="width: 50%; padding-left:0px; padding-top:0px; padding-bottom:0px; padding-right:5px; vertical-align:top; border:0px">
				    	<fieldset class="fieldstyle" style="height:100%;" ng-disabled="isAppraiserSigned()" check-if-required>
					    	<legend class="legendstyle">&nbsp;<%=legendClient%></legend>
							<div class="formColumn">
								<label class="labelstyle" for="client_name"><%=clientLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="client_name" 
								name="client_name" 
								ng-model="client_name"
								width="250"
								maxlength="80"	
								force-model-update>
							</div>	
							<div class="formColumn">
								<label class="labelstyle" for="client_attention"><%=attentionLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="client_attention" 
								name="client_attention" 
								ng-model="client_attention"
								width="250"
								maxlength="80">	
							</div>
							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<div class="formColumn">
								<label class="labelstyle" for="clien_address"><%=addressLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="client_address" 
								name="client_address"
								ng-model="client_address"
								width="250"
								maxlength="80">
							</div>
							<div class="formColumn">					
								<label class="labelstyle" for="client_city"><%=cityLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="client_city" 
								name="client_city" 
								ng-model="client_city"
								width="250"
								maxlength="80">
							</div>
							<p>&nbsp;</p>
							<p>&nbsp;</p>							
							<div class="formColumn">						
								<label class="labelstyle" for="client_province"><%=provinceLbl%></label>
								<select class="inputstyle" 
									id="client_province" 
									name="client_province" 
									ng-model="client_province"
									width="250"
									maxlength="80">
									<option value=""></option>
								</select>	
							</div>							
							<div class="formColumn">
								<label class="labelstyle" for="client_postal_code"><%=postalCodeLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="client_postal_code" 
								name="client_postal_code" 
								ng-model="client_postal_code"
								width="250"
								maxlength="80">	
							</div>
							<p>&nbsp;</p>
							<p>&nbsp;</p>					
							<div class="formColumn">
								<label class="labelstyle" for="client_phone"><%=phoneLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="client_phone" 
								name="client_phone" 
								ng-model="client_phone"
								width="250"
								maxlength="80">	
							</div>						
							<div class="formColumn">
								<label class="labelstyle" for="client_email"><%=emailLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="client_email" 
								name="client_email" 
								ng-model="client_email"
								width="250"
								maxlength="80">
							</div>
							<p>&nbsp;</p>
							<p>&nbsp;</p>							
							<div class="formColumn" style="padding-bottom:15px;">
								<label class="labelstyle" for="hidden_client_field">&nbsp;</label>
								<input class="inputstyle1"  
								type="text" 
								id="hidden_client_field" 
								name="hidden_client_field" 
								width="250"
								maxlength="80">
								<p></p>
							</div>	
							<p>&nbsp;</p>
							<p>&nbsp;</p>																																		
						</fieldset>
					</td>	
				    <td style="width=50%; padding-left:5px; padding-top:0px; padding-bottom:0px; padding-right:0px; vertical-align:top; border:0px">				
				    	<fieldset class="fieldstyle" style="height:100%;" ng-disabled="isAppraiserSigned()" check-if-required>
					    	<legend class="legendstyle">&nbsp;<%=legendAppraiser%></legend>
					    	<div class="formColumn">
								<label class="labelstyle" for="id_appraiser_name"><%=appraiserLbl%></label>
								<!-- The scope variable 'sigRoles.appraiser.roleNameModel' is reused in certification page  -->
								<input class="inputstyle"
								type="text" 
								id="id_appraiser_name" 
								name="id_appraiser_name" 
								ng-model="sigRoles.appraiser.roleNameModel" 
								width="250"
								maxlength="80"							
								force-model-update>
							</div>						
							<div class="formColumn">
								<label class="labelstyle" for="appraiser_company"><%=companyLbl%></label>
								<input class="inputstyle" 
								type="text" 
								id="appraiser_company" 
								name="appraiser_company" 
								ng-model="appraiser_company"
								width="250"
								maxlength="80"	
								force-model-update>
							</div>
							<p>&nbsp;</p>
							<p>&nbsp;</p>					
							<div class="formColumn">	
								<label class="labelstyle" for="appraiser_address"><%=addressLine1Lbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="appraiser_address" 
								name="appraiser_address" 
								ng-model="appraiser_address" 
								width="250"
								maxlength="80"							
								force-model-update>
							</div>					
							<div class="formColumn">	
								<label class="labelstyle" for="appr_address1"><%=addressLine2Lbl%></label>
								<input class="inputstyle" 
								type="text" 
								id="appr_address1"
								width="250"
								maxlength="80">
							</div>
							<p>&nbsp;</p>
							<p>&nbsp;</p>					
							<div class="formColumn">			
								<label class="labelstyle" for="appraiser_city"><%=cityLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="appraiser_city" 
								name="appraiser_city" 
								ng-model="appraiser_city" 
								force-model-update
								width="250"
								maxlength="80">	
							</div>							
							<div class="formColumn">
								<label class="labelstyle" for="appraiser_province"><%=provinceLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="appraiser_province" 
								name="appraiser_province" 
								ng-model="appraiser_province" 
								force-model-update
								width="250"
								maxlength="80">
							</div>
							<p>&nbsp;</p>
							<p>&nbsp;</p>							
							<div class="formColumn">
								<label class="labelstyle" for="appraiser_postal_code"><%=postalCodeLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="appraiser_postal_code" 
								name="appraiser_postal_code" 
								ng-model="appraiser_postal_code"
								width="250"
								maxlength="80"	
								force-model-update>	
							</div>					
							<div class="formColumn">
								<label class="labelstyle" for="appraiser_phone"><%=phoneLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="appraiser_phone" 
								name="appraiser_phone" 
								ng-model="appraiser_phone"
								class="fixedWidthLabel"
								width="250"
								maxlength="80"							
								force-model-update>	
							</div>
							<p>&nbsp;</p>
							<p>&nbsp;</p>							
							<div class="formColumn" style="padding-bottom:15px;">
								<label class="labelstyle" for="appraiser_email"><%=emailLbl%></label>
								<input class="inputstyle"  
								type="text" 
								id="appraiser_email" 
								name="appraiser_email" 
								ng-model="appraiser_email" 
								appraiser_email 
								width="250"
								maxlength="80"							
								force-model-update>	
								<p></p>		
							</div>		
							<p>&nbsp;</p>
							<p>&nbsp;</p>																			
						</fieldset>	
					</td>
				</table>
				<p>&nbsp;</p>									
				<fieldset class="fieldstyle" ng-disabled="isAppraiserSigned()" check-if-required>
			    	<legend class="legendstyle">&nbsp;<%=legendProperty%></legend>
			    	<div class="formColumn">
						<label class="labelstyle" for="pi_subject_name"><%=applicantNameLbl%></label>
						<input class="inputstyle" 
						type="text" 
						id="pi_subject_name" 
						name="pi_subject_name" 
						ng-model="pi_subject_name"
						width="250"
						maxlength="80"							
						force-model-update>
					</div>															
					<div class="formColumn">
						<label class="labelstyle" for="pi_property_address"><%=propertyAddressLbl%></label>
						<input class="inputstyle"  
						type="text" 
						id="pi_property_address" 
						name="pi_property_address" 
						ng-model="pi_property_address"
						width="250"
						maxlength="80"							
						force-model-update>	
					</div>					
					<div class="formColumn">
						<label class="labelstyle" for="pi_subj_city"><%=cityLbl%></label>
						<input class="inputstyle"  
						type="text" id="pi_subj_city" 
						name="pi_subj_city" 
						ng-model="pi_subj_city" 
						class="fixedWidthLabel"
						width="250"
						maxlength="80"							
						force-model-update>	
					</div>
					<div class="formColumn">
						<label class="labelstyle" for="pi_subj_province"><%=provinceLbl%></label>
						<input class="inputstyle"  
						type="text" 
						id="pi_subj_province" 
						name="pi_subj_province" 
						ng-model="pi_subj_province" 
						class="fixedWidthLabel"
						width="250"
						maxlength="80"	
						force-model-update>	
					</div>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<div class="formColumn">		
						<label class="labelstyle" for="pi_subj_postal_code"><%=postalCodeLbl%></label>
						<input class="inputstyle"  
						type="text" 
						id="pi_subj_postal_code" 
						name="pi_subj_postal_code" 
						ng-model="pi_subj_postal_code"
						class="fixedWidthLabel"
						width="250"
						maxlength="80"	
						force-model-update>	
				    </div>			    
				    <div class="formColumn">
					    <label class="labelstyle" for="pi_legal_description"><%=legalDescriptionLbl%></label>	 
					    <input class="inputstyle"   
					    type="text" 
					    id="pi_legal_description" 
					    name="pi_legal_description" 
					    ng-model="pi_legal_description"
					    style="width: 650px;"
						width="250"
						maxlength="80"	
					    force-model-update>
					</div>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
	    			<div class='input-option-box-style1' style="padding-left:10px">  
    					<div class="formColumn">       
					        <label class="labelstyle" for="pi_construction_type"><%=propertyTypeLbl%></label>
						    <input class="inputstyle" type="radio" name="pi_construction_type" id="pi_construction_type" ng-model="pi_construction_type_model" value="Renovation / Improvements" ng-click="setConstructionStage()" force-model-update><%=renovationImprovementLbl%><br>
						    <input class="inputstyle" type="radio" name="pi_construction_type" id="pi_construction_type" ng-model="pi_construction_type_model" value="New Construction" checked ng-click="setConstructionStage()"  ng-checked="true" force-model-update><%=newConstructionLbl%><br>
					    </div>
					    <div class="formColumn">         					        
					        <label class="labelstyle" for="pi_occupied"><%=occupiedLbl%></label>
					        <input class="inputstyle" type = "radio" name="pi_occupied" id="pi_occupied" value="Yes"/><%=yesLbl%><br />        
					        <input class="inputstyle" type = "radio" name="pi_occupied" id="pi_occupied" value="No" /><%=noLbl%>
				        </div>
				        <p></p>
				    </div>
					<p>&nbsp;</p>
					<p>&nbsp;</p>				    			        			              
			  	</fieldset>
			</div>  
		    <div id="menu4" class="tab-pane fade">
				<fieldset class="fieldstyle" ng-disabled="isAppraiserSigned()" check-if-required>
			      <legend class="legendstyle">&nbsp;SERVICES</legend> 
			      <font size="3" class='input-option-box-style1'>
			      	  <label>Completed :</label><br>   
					  <input type="checkbox" id="pi_septic_installed" value="1"><%=septicLbl%>&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_sanitary_installed" value="1"><%=sanitarySewerLbl%>&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_storm_installed" value="1"><%=stormSewerLbl%>&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_municipal_installed" value="1"><%=municipalWaterLbl%>&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_well_installed" value="1"><%=wellLbl%>&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_curb_installed" value="1"><%=curbAndGutterLbl%>&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_paved_installed" value="1"><%=pavedRoadLbl%>&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_sidewalk_installed" value="1"><%=sideWalkLbl%>&nbsp;&nbsp;&nbsp;&nbsp;
				  </font>
				</fieldset>
				<p>&nbsp;</p>				
		    	<fieldset class="fieldstyle" id="constructionStageFieldset" ng-disabled="isAppraiserSigned()" check-if-required>
		    		<!-- <span>pi_construction_type_model = {{pi_construction_type_model}}</span> -->
		    		<legend class="legendstyle">&nbsp;CONSTRUCTION STAGE</legend>
					<div  ng-controller="constructionStageCtrl"> 
						<!-- <input type="text" id="constructionStageLen" value="{{constructionStage.length}}">  -->  
						<div class="table-responsive">	
							<table class="table table-striped table-bordered table-hover table-full-width" id="consturctionStage">
								<thead>
									<tr>
										<td><%=constructionStageLbl%></td>
										<td><%=allowedLbl%></td>
										<td><%=completedLbl%></td>
										<td><%=totalCompletedLbl%></td>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="x in MainController.constructionStage">
									  <td><input id="construction_stage_title_{{$index+1 | numberFixedLen:2}}" width="100px" type="text" ng-class="{'labelForInput': pi_construction_type_model == 'New Construction'}" class="construction-stage-title" ng-readonly="pi_construction_type_model == 'New Construction'" ng-model="x.StageDesc" force-model-update /><br></td>
									  <td><input id="construction_stage_allowed_{{$index+1 | numberFixedLen:2}}" type=number ng-model="x.Allowed" force-model-update empty-if-zero/></td>
									  <td>
									    <!-- <input id="construction_stage_complete_{{$index+1 | numberFixedLen:2}}" type="number" ng-model="x.Completed" min="0" max="100" enable-validation="isValidationRequired" force-model-update empty-if-zero /> -->
									    <input id="construction_stage_complete_{{$index+1 | numberFixedLen:2}}" type="number" name="construction_stage_complete_{{$index+1 | numberFixedLen:2}}" ng-model="x.Completed" min="0" max="100" force-model-update empty-if-zero />
									  </td>
									  <td>
									  	<!-- created two input fields first one is hidden. This is to display calculated results with proepr formatting -->
									    <input id="construction_stage_total_complete_{{$index+1 | numberFixedLen:2}}" type="number" ng-model="x.TotalCompleted" ng-value="getTotalCompleted(x)" ng-readonly="true" ng-hide="true"/>
									    <input id="disp_construction_stage_total_complete_{{$index+1 | numberFixedLen:2}}" type="text" value="{{getTotalCompleted(x) | number:2 | emptyIfZeroValue}}" ng-readonly="true" />
									  </td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td>Total</td>
										<td>
										   <!-- <input id="pi_total_allowed" name="pi_total_allowed" ng-model="pi_total_allowed" type="number" pi_total_allowed" min="0" max="100" enable-validation="isValidationRequired" ng-value="pi_total_allowed = (constructionStage | sumOfValue:'Allowed'); pi_total_allowed" ng-readonly="true"> -->
										   <input id="pi_total_allowed" name="pi_total_allowed" ng-model="pi_total_allowed" type="number" pi_total_allowed" min="0" max="100" ng-value="pi_total_allowed = (MainController.constructionStage | sumOfValue:'Allowed'); pi_total_allowed" ng-readonly="true" empty-if-zero>
									    </td>
										<td></td>
										<td>
											<input id="pi_total_total" name="pi_total_total" ng-model="pi_total_total" value="{{pi_total_total = (MainController.constructionStage | sumOfValue:'TotalCompleted')}}" ng-readonly="true" ng-hide="true"/>
											<input id="disp_pi_total_total" type="text" value="{{pi_total_total | number:2 | emptyIfZeroValue}}" ng-readonly="true"/>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
						<label for="pi_total_cost_of_construction">${totCostOfConstructionLbl}</label>
						<input id="pi_total_cost_of_construction" name="pi_total_cost_of_construction" type="number" ng-model="pi_total_cost_of_construction" empty-if-zero force-model-update />
						
						<label for="pi_estimated_cost_to_complete">${estimatedCostLbl}</label>
						<input id="pi_estimated_cost_to_complete" name="pi_estimated_cost_to_complete" type="number" ng-model="pi_estimated_cost_to_complete" ng-value="getEstimatedCodeToComplete()" ng-readonly="true" ng-hide="true"/>
						<input id="disp_pi_estimated_cost_to_complete" type="text" value="{{pi_estimated_cost_to_complete | number:2 | emptyIfZeroValue }}" ng-readonly="true"/>
						<!-- <pre>{{constructionStage | json}}</pre> -->			
					</div>
				</fieldset>
				<p>&nbsp;</p>						
		    	<fieldset class="fieldstyle" ng-disabled="isAppraiserSigned()" check-if-required>		    		
					<%-- <h4><%=totalCostOfConstructionLbl%></h4>
					<input type="text" id="pi_total_cost_of_construction"  style="width: 536px; ">	
					<h4><%=estimatedCostToCompleteLbl%></h4>
					<input type="text" id="pi_estimated_cost_to_complete"  style="width: 536px; "> 
					<br><br> --%>	
					   <legend class="legendstyle">&nbsp;<%=complianceLbl%></legend>					
					   <!--<h4><%=complianceLbl%></h4>-->
					   <%=complianceLine1Txt%><br><%=complianceLine2Txt%><br>					   
					   <div class="formColumn">					   
						   <input class="inputstyle" 
						          type = "radio"
						          name = "pi_compliance"
						          id = "pi_compliance"
						          value = "Yes"
						          checked = "checked" />
						   <label for = "sizeYes"><%=yesLbl%></label>        
						   <input class="inputstyle"
						   		  type = "radio"
						          name = "pi_compliance"
						          id = "pi_compliance"
						          value = "No" />             
						   <label for = "sizeNo"><%=noLbl%></label> 
					   <div class="formColumn">

					   <br>
				</fieldset>
				<p>&nbsp;</p>
				<fieldset class="fieldstyle" ng-disabled="isAppraiserSigned()" check-if-required>		   
					   <legend class="legendstyle">&nbsp;<%=commentsLbl%></legend>
					   <div> 	
							<textarea id="pi_comments" rows="5" cols="110"  style="width: 95%; line-height: 20px;"></textarea>
					   </div>  
				</fieldset>     					
		    </div>
		    <div id="menu7" class="tab-pane fade" watchvisible ng-form="certificationForm">
				<div class="container">
					<!-- <pre>{{certificationForm.$error}}</pre> -->
					<hr class="soften"/>
						<div class="signature-container" 
							ng-init= 'initSigRoles("<%=appraiserPasswordLbl%>", 
													"<%=supervisorPasswordLbl%>",
													"<%=appraiserSignatureLbl%>",
													"<%=supervisorSignatureLbl%>"
													)'
													>
							<div ng-repeat="(theRole, theRoleData) in sigRoles" class="signature-wrapper" ng-controller="sig-pad" ng-init="setUserRole(theRole)"
							>
								<h4>{{theRoleData.signatureHeader}}</h4>
								<!-- following is for debugging purposes -->
								<!-- <span>
									Sig User Role = {{userRole}} <br>
									isSigned() = {{isSigned()}}
								</span> -->
								<!--
								The section below is used specify the signature type ...
								*** DO NOT DELETE ***  
								-->
						  	    <%-- <div class="signature-type" ng-init="signatureData.sigType = 'none'">
							  	    <label for="signature-type" ng-click="signatureData.sigType='none'">Signature type:</label>
						  	    	<div class="myTooltip" ng-hide='true'>
								  	    <label>
								  	    	<input type="radio" id='signature-type-none' name='signature-type' value='none' ng-model='signatureData.sigType'>
								  	    	<img src="<%=appUrl%>/formhtml5/image/sig-scribble.png"/>
								  	    </label>
						  	    		<span class="myTooltiptext">Not selected. Should be hidden.</span>
						  	    	</div>						  	    	<div class="myTooltip">
								  	    <label>
								  	    	<input type="radio" id='{{theRoleData.signatureTypeScribble}}' name='{{theRoleData.signatureType}}' value='scribble' ng-model='sigType'>
								  	    	<img src="<%=appUrl%>/formhtml5/image/sig-scribble.png"/>
								  	    </label>
						  	    		<span class="myTooltiptext">Scribble Signature</span>
						  	    	</div>
						  	    	<div class="myTooltip">
								  	    <label>
								  	    	<input type="radio" id='{{theRoleData.signatureTypeCertificate}}' name='{{theRoleData.signatureType}}' value='certificate' ng-model='sigType'>
								  	    	<img src="<%=appUrl%>/formhtml5/image/sig-certificate.png"/>
								  	    </label>
						  	    		<span class="myTooltiptext">Certificate Based Signature</span>
						  	    	</div>
						  	    	<!-- <span>Signature Type Select: {{sigType}}</span> -->
						  	    </div> --%>
						  	    <!-- Initialize scope variables with the label translations to be used in the modal 'signatureModalContent.html' through controller 'sigModalInstanceCtrl' -->
								<div ng-hide="true" 
									ng-init='keystoreTypeLbl="${keystoreTypeLbl}";
											 keystoreFileLbl="${keystoreFileLbl}";
											 keystorePasswordLbl="${keystorePasswordLbl}";
											 reasonLbl="${reasonLbl}";
											 locationLbl="${locationLbl}";
											 contactInfoLbl="${contactInfoLbl}";
											 signaturePasswordLbl="${appraiserPasswordLbl}";
											'
											>
									<input id='appKeystoreType' name='appKeystoreType' type="text" ng-model="signatureData.keystoreType">
									<input id='appKeystoreFileName' name='appKeystoreFileName' type="text" ng-model="signatureData.keystoreFile.name">
									<input id='appKeystoreFileData' name='appKeystoreFileData' type="text" ng-model="signatureData.keystoreFileData">
									<input id='appKeystorePassword' name='appKeystorePassword' type="text" ng-model="signatureData.keystorePassword">
									<input id='appKeystoreReason' name='appKeystoreReason' type="text" ng-model="signatureData.reason">
									<input id='appKeystoreLocation' name='appKeystoreLocation' type="text" ng-model="signatureData.location">
									<input id='appKeystoreContactInfo' name='appKeystoreContactInfo' type="text" ng-model="signatureData.contactInfo">
								</div>						
							  	<div id='signature-pad' class="m-signature-pad break" ng-class="{'ng-invalid':certificationForm[theRoleData.signatureBase64].$invalid && mainPromiseResolved}" check-if-required
							  	>
							  		<div class="m-signature-pad--body">
										<canvas id="appraiser_signature_section" redraw ng-signature-pad="signature" ng-hide="isSigned()"></canvas>
										<img ng-src="{{signatureDataURL()}}" ng-hide="!isSigned()" load-signature-image>
										<input id="{{theRoleData.signatureBase64}}" name="{{theRoleData.signatureBase64}}" type="text" ng-hide="true" ng-model="signatureBase64" check-if-required-expr="sigDetailsAvail(theRoleData)" force-model-update/>
							  		</div>
						  			<div class="m-signature-pad--footer">
										<div class="description">Sign above</div>
										<!-- <button type="button" class="button clear" data-action="clear">Clear</button> -->
										<!-- <button type="button" class="button save" data-action="save">Save</button>  -->
										
										<div class="upload-download"
											flow-init={singleFile:true}
											flow-name="theRoleData.flow"
					      					flow-file-added="!!{png:1,jpg:1,jpeg:1}[$file.getExtension()] && isPhotoSizeValid($file.size) && handleImage($file, $event, $flow)"
										>
											<%-- <img src="<%=appUrl%>/formhtml5/image/signature.png"> --%>
											<img id="upload-sig-icon" flow-btn flow-attrs="{accept:'image/*'}" src="<%=appUrl%>/formhtml5/image/upload.png" title="Upload selected image as signature.">
											<%-- <img id="download-sig-icon" src="<%=appUrl%>/formhtml5/image/download.png" title="Download signature as image."> --%>
											<!-- <div ng-show="$flow.files.length">
												<img style="max-height:100%" flow-img="theRoleData.flow.files[0]" />
											</div>
											<br><br>
											<span>$flow.files.length = {{theRoleData.flow.files.length}}<br> $file.getExtension() = {{$file.getExtension()}}</span> -->
										</div>
										<a class="btn clear" ng-click="clear()" ng-disabled="isSigned()"><%=clearLbl%></a>
										<!-- <a class="btn save sign" ng-click="openSignatureModal()">Sign</a> -->  
										<!-- <a class="btn save" ng-click="sendData($event)">Sign</a> -->
										<div class='lock-icon'>
											<img ng-hide="!isSigned()" src="<%=appUrl%>/formhtml5/image/lock-icon.png"/>
											<img ng-hide="isSigned()" src="<%=appUrl%>/formhtml5/image/unlock-icon.png"/>
										</div>
										<!-- <p ng-hide="true">Signature Result: {{signatureResult.result}}</p> -->
						  			</div>
							  	</div>
						  	    <div class="break signature-details" >
							  	    <div class='signature-password'>
										<fieldset ng-disabled="false">
										  <label for="{{theRoleData.password1}}">{{theRoleData.passwordLbl}}</label>
										  <input type="password" id="{{theRoleData.password1}}" name="{{theRoleData.password1}}" ng-enter="doBlur(event)" ng-blur="password1Exit()" ng-model="password1" ng-init="password1Exit()"
										    ng-class="{'ng-invalid':certificationForm[theRoleData.signatureBase64].$invalid && mainPromiseResolved}" ng-required="!signature.isEmpty() && !isSigned()"/>
										</fieldset>
										<br>
										<!-- Add directive forceModelUpdate to force update of ngModel variable -->
							  			<input type="password" id="{{theRoleData.password2}}" name="{{theRoleData.password2}}" ng-model="password2" ng-hide="true" force-model-update/>
							  	    </div>
								  	<fieldset id="signatureDetailsFiledSet" ng-disabled="isSigned()" check-if-required>						  	
								  		<label for="{{theRoleData.id_name}}"><%=nameLbl%></label>  <!-- appraiser_name -->
								  		<input id="{{theRoleData.id_name}}" name="{{theRoleData.id_name}}" type="text" ng-model="theRoleData.roleNameModel" ng-readonly="theRole==='appraiser'" force-model-update/>
		    							<br>
		    							<label for="{{theRoleData.aic_member_number}}"><%=memberNoLbl%></label>
		    							<input type="text" name="{{theRoleData.aic_member_number}}" id="{{theRoleData.aic_member_number}}" ng-model="theRoldData.aic_member_number_model" check-if-required-expr="sigDetailsAvail(theRoleData)" force-model-update/>
		    							<!-- <br>
										<span>certificationForm[{{theRoleData.aic_member_number}}].$error </span>
										<pre>{{certificationForm[theRoleData.aic_member_number].$error | json}}</pre> -->						
								  		<br>
								  		<label for="{{theRoleData.designation}}_sel"><%=designationLbl%></label>
								  			<div class="select-editable stop-wrap">
									  		    <select editable-dropdown="{{theRoleData.designation}}" id="{{theRoleData.designation}}_sel" name="{{theRoleData.designation}}_sel">
									  		    	  <option value=""></option>
												      <option value="AACI">AACI</option>
												      <option value="CANDIDATE">CANDIDATE</option>
												      <option value="CRA">CRA</option>
												      <option value="1">DAC</option>
												      <option value="0">DAR</option>
												      <option value="E.A.">E.A.</option>
												      <option value="Other">Other ...</option>
			    								</select>
			    								<input id="{{theRoleData.designation}}" name="{{theRoleData.designation}}" ng-model="theRoleData.designationModel" check-if-required-expr="sigDetailsAvail(theRoleData)" force-model-update>
		    								</div>
		    							<br>
		    							<div class='row' ng-controller="datePickerController">
			    							<!-- <input type="text" id="date_signed_appraiser" name="date_signed_appraiser"> -->
		 	    							<label for="{{theRoleData.date_signed}}" class="col-xs-3 col-form-label vcenter"><%=dateSignedLbl%></label>
		 	    							<div class="col-xs-4 input-group vcenter">
			 	 								<input id="{{theRoleData.date_signed}}" name="{{theRoleData.date_signed}}" type="text"
			 	 								    ng-min="triggerValidateDates()" 
													class="form-control" uib-datepicker-popup="{{format}}" ng-model="theRoleData.date_signed_model" is-open="popup1.opened" datepicker-options="dateOptions" close-text="Close" alt-input-formats="altInputFormats" force-model-update/>
												<span class="input-group-btn">
												  <button type="button" class="btn btn-default" ng-click="open1()"><i class="glyphicon glyphicon-calendar"></i></button>
												</span>
											</div>
		 								</div>
		    							<div class='row' ng-controller="datePickerController">
			    							<label for="{{theRoleData.date_inspection}}" class="col-xs-3 col-form-label vcenter"><%=dateOfInspectionLbl%></label>
		 	    							<div class="col-xs-4 input-group vcenter">
			    								<input type="text" id="{{theRoleData.date_inspection}}" name="{{theRoleData.date_inspection}}"
			    									max="{{theRoleData.date_signed_model}}"
		   								   			class="form-control" uib-datepicker-popup="{{format}}" ng-model="theRoleData.date_inspection_model" is-open="popup1.opened" datepicker-options="dateOptions" close-text="Close" alt-input-formats="altInputFormats" force-model-update>
												<span class="input-group-btn">
												  <button type="button" class="btn btn-default" ng-click="open1()"><i class="glyphicon glyphicon-calendar"></i></button>
												</span>
											</div>
										</div>
										<span ng-show="certificationForm.{{theRoleData.date_signed}}.$error.dateSingedInspected" class="alert alert-danger">
    										Date signed must be greater than or equal date of inspection.
  										</span>
		    							<br>
		    							<label for="{{theRoleData.license_info}}"><%=licenseInfoLbl%></label>
		    							<input id="{{theRoleData.license_info}}" name="{{theRoleData.license_info}}" ng-model="theRoleData.license_info_model" type="text">
		    							<br>
		    							<label><%=noteTxt%></label>
								  	</fieldset>							  	
							  </div>
							</div>				  	
							<%-- <div class="signature-wrapper" ng-controller="sig-pad as supervisorSignature" ng-init="setSupervisor()">
								<h4><%=supervisorSignatureLbl%></h4>
							  	<div id='signature-pad' class="m-signature-pad break">
							  		<div class="m-signature-pad--body">
										<canvas id="supervisor_signature_section" redraw ng-signature-pad="signature" ng-hide="isSigned()"></canvas>
										<img ng-src="{{signatureImageURL}}" ng-hide="!isSigned()">
										<input id="supervisor_signature" name="supervisor_signature" type="text" ng-hide="true" ng-model="signatureBase64"/>
							  		</div>
						  			<div class="m-signature-pad--footer">
										<div class="description">Sign above</div>
										<!-- <button type="button" class="button clear" data-action="clear">Clear</button> -->
										<!-- <button type="button" class="button save" data-action="save">Save</button>  --> 			
										<a class="btn clear" ng-click="clear()" ng-disabled="isSigned()"><%=clearLbl%></a>
										<!-- <a class="btn save" ng-click="sendData($event)">Sign</a> -->
										<div class='lock-icon'>
											<img ng-hide="!isSigned()" src="<%=appUrl%>/formhtml5/image/lock-icon.png"/>
											<img ng-hide="isSigned()" src="<%=appUrl%>/formhtml5/image/unlock-icon.png"/>
										</div>										
										<!-- <p ng-hide="true">Signature Result: {{signatureResult.result}}</p> -->
						  			</div>
							  	</div>
							  	<div class="break signature-details">
							  	    <div class='signature-password'>
										<fieldset ng-disabled="false">
										  <label for="super_password1"><%=supervisorPasswordLbl%></label>
										  <input type="password" id="super_password1" name="super_password1" ng-enter="doBlur(event)" ng-blur="password1Exit()" ng-model="password1" ng-init="password1Exit()"/>
										</fieldset>
										<br>
							  			<input type="password" id="super_password2" name="super_password2" ng-model="password2" ng-hide="true"/>
							  	    </div>
							  	    <fieldset ng-disabled="isSupervisorSigned()">
								  	    <label for="super_appraiser_name"><%=nameLbl%></label>
								  	    <input id="super_appraiser_name" name="super_appraiser_name" type="text"/>
								  		<br>
								  		<label for="super_appraiser_designation"><%=designationLbl%></label>
								  		    <select id="super_appraiser_designation" name="super_appraiser_designation" ng-model="super_appraiser_designation">
								  		    	  <option value=""></option>
											      <option value="AACI">AACI</option>
											      <option value="CANDIDATE">CANDIDATE</option>
											      <option value="CRA">CRA</option>
											      <option value="1">DAC</option>
											      <option value="0">DAR</option>
											      <option value="E.A.">E.A.</option>
											      <option value="Other ...">Other ...</option>
		    								</select>
		    							<br>
		    							<label for="super_aic_member_number"><%=memberNoLbl%></label>
		    							<input type="text" name="super_aic_member_number" id="super_aic_member_number" ng-model="super_aic_member_number"/>
		    							<div class='row' ng-controller="datePickerController">
			    							<label for="super_appraiser_date_signed" class="col-xs-3 col-form-label vcenter"><%=dateSignedLbl%></label>
		 	    							<div class="col-xs-4 input-group vcenter">
				    							<input type="text" id="super_appraiser_date_signed" name="super_appraiser_date_signed"
				    								class="form-control" uib-datepicker-popup="{{format}}" ng-model="date_signed_appraiser" is-open="popup1.opened" datepicker-options="dateOptions" ng-required="true" close-text="Close" alt-input-formats="altInputFormats" />
												<span class="input-group-btn">
												  <button type="button" class="btn btn-default" ng-click="open1()"><i class="glyphicon glyphicon-calendar"></i></button>
												</span>
				    						</div>
			    						</div>
		    							<div class='row' ng-controller="datePickerController">
			    							<label for="super_appraiser_date_inspection" class="col-xs-3 col-form-label vcenter"><%=dateOfInspectionLbl%></label>
		 	    							<div class="col-xs-4 input-group vcenter">
			    								<input type="text" id="super_appraiser_date_inspection" name="super_appraiser_date_inspection"
				    								class="form-control" uib-datepicker-popup="{{format}}" ng-model="date_signed_appraiser" is-open="popup1.opened" datepicker-options="dateOptions" ng-required="true" close-text="Close" alt-input-formats="altInputFormats" />
												<span class="input-group-btn">
												  <button type="button" class="btn btn-default" ng-click="open1()"><i class="glyphicon glyphicon-calendar"></i></button>
												</span>
			    							</div>
		    							</div>
		    							<!--  
		    							<br>
		    							<label for="super_appraiser_date_signed">DATE SIGNED: </label>
		    							<input type="text" id="super_appraiser_date_signed" name="super_appraiser_date_signed">
		    							<br>
		    							<label for="super_appraiser_date_inspection">Date of Inspection: </label>
		    							<input type="text" id="super_appraiser_date_inspection" name="super_appraiser_date_inspection">
		    							-->
		    							<br>
		    							<label for="super_appraiser_license_info"><%=licenseInfoLbl%></label>
		    							<input id="super_appraiser_license_info" name="super_appraiser_license_info" type="text">
		    							<br>
		    							<label><%=noteTxt%></label>
	    							</fieldset>
							  	</div>
						   </div>	 --%>			  	
	
					</div>  
				</div>
		    </div>
		    <div id="menu8" class="tab-pane fade" ng-form="photosForm" ng-init="MainController.additionalImages = {}; MainController.additionalImagesDecache = {}">
		    	<fieldset ng-disabled="isAppraiserSigned()">
					<!-- <span class='allowed-photos' >Only PNG,GIF,JPG files allowed.</span> -->
					<!-- <input type="button" value="Test Synch Load Photos" ng-click="syncPhotosLoad()"> -->
					<!-- <span>File Number: {{file_number}}</span> -->
			    	<div class="photos-container" 
			    			ng-init="photosList=[1,2,3,4,5,6]">
				 		<div class="photo-wrapper"  ng-controller="photosController" ng-repeat="x in photosList"
				 			ng-class="{'pointer': !isAppraiserSigned(), 'no-pointer': isAppraiserSigned()}" 
				 			flow-init="{ query: getFlowQuery }"
					      	flow-file-added="(!isAppraiserSigned() || !photoLoadingDone) && isPhotoSizeValid($file.size) && !!{png:1,jpg:1,jpeg:1}[$file.getExtension()]"
					      	flow-files-submitted="doUpload()"
				 			flow-file-added="someHandlerMethod($file, $event, $flow)">
							<h4 class='photo-title'>${photoLbl} {{x}}</h4>
							<!-- BACKUP: ng-hide="$flow.files.length && processFileDone" -->
					 		<div class="property-photo" ng-hide="isImageAvailable()" flow-drop
						        flow-drag-enter="isAppraiserSigned()?style={}:style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style"
						        flow-btn flow-attrs="{accept:'image/*'}" >
						        <div class="drag-drop-photo">
						        </div>
						    	<%-- <img ng-src="<%=appUrl%>/formhtml5/image/drag-and-drop-photo.png" /> --%>
						    	<div class='drag-drop-lbl'>
						    		<span>${dragAndDropLbl1}</span>
						    		<span>${dragAndDropLbl2}</span>
						    	</div>
						  	</div>
						  	<!-- BACKUP: ng-show="$flow.files.length && processFileDone" -->
						  	<div class="property-photo" flow-drop ng-show="isImageAvailable()" 
						  		flow-drag-enter="isAppraiserSigned()?style={}:style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<!-- <img id="{{getImageFieldName()}}_section" style="max-height:100%" flow-img="$flow.files[0]" /> -->
						    	<img id="{{getImageFieldName()}}_sectionxx" style="max-height:100%" ng-src='{{ getImageURI() }}' />
						        <!-- <input id="additional_image{{x}}" name = "additional_image{{x}}" ng-hide="true" type="text" ng-model="imageStringB64" load-photo/> -->
						        <!-- Replace ng-model variable "imageFieldNameValue" with additionalImages[getImageFieldName()] -->
						        <!-- <input id="{{getImageFieldName()}}" name = "{{getImageFieldName()}}" ng-hide="true" type="text" ng-model="imageFieldNameValue" load-photo force-model-update/> -->
						        <input id="{{ imageFieldName }}" name = "{{ imageFieldName }}" ng-hide="true" type="text" ng-model="MainController.additionalImages[ imageFieldName ]" load-photo force-model-update/>
						  	</div>
						  	<div>
						  		<!-- BACKUP: ng-hide="$flow.files.length" -->
							    <a href="javascript:void(0);" class="btn" ng-hide="isImageAvailable()" flow-btn flow-attrs="{accept:'image/*'}"><%=selectImageLbl%></a>
							    <a href="javascript:void(0);" class="btn" ng-show="isImageAvailable()" flow-btn flow-attrs="{accept:'image/*'}">${changeImageLbl}</a>
							    <a href="javascript:void(0);" class="btn btn-danger" ng-show="isImageAvailable()"
							       ng-click="removeFile()">${removeImageLbl}</a>
							</div>
							<div class='photo-description'>
							  	<label class='description-lbl' for='additional_image_describe{{x}}'><%=descriptionLbl%></label>
							  	<input class='description' id='additional_image_describe{{x}}' name='additional_image_describe{{x}}' type="text" ng-model="MainController.additional_image_describe[x]" ng-required="isImageAvailable()" force-model-update/>
							</div>
					  	</div>
					</div>
				</fieldset>
		    </div>
		    <div id="menu9" class="tab-pane fade" ng-form = "mapForm">		    	
   		    	<fieldset ng-disabled="isAppraiserSigned()">   		    	    		    
			    	<canvas id="mapCanvas" width="1024" height="768" style="display: none"></canvas>
			    	<input id="locationmap_image" name = "locationmap_image" type="hidden" value=""/>
			    </fieldset>
		    </div>	    
		  </div>
	  </div>
	  <!-- JIRA: NE-2248 - make DIV elements disabled when signed  -->
	  <div id="map_area" ng-disabled="isAppraiserSigned()" style="display: none" ng-hide="hideLiveMap"></div>
	
	  <div id="pdf_area" style="display: none">	
		<object id= "pdf_obj" data="" width=100% height="850px">
		</object>  
	  </div>  
	  
	  <br>
	  <!-- <input type="button" ng-click = "changeValidity()" value = "changeValidity">
	  <span>
		  isValidationRequired = {{isValidationRequired}} <br>
	      mainForm.propertyForm.$invalid = {{mainForm.propertyForm.$invalid}} <br>
	      mainPromiseResolved = {{mainPromiseResolved}} <br>
	      mainForm.propertyForm.$error = {{mainForm.propertyForm.$error | json}} <br>
	      mainForm.propertyForm.pi_subject_name.$error = {{mainForm.propertyForm.$error | json}} <br>
      </span> -->	  
	  <div id="navigate_area"> 
		  <input id="previousBtn" class='largeButton' type='button' value="<%=previousBtnName%>">
		  <input id="nextBtn" class='largeButton' type='button' value="<%=nextBtnName%>">			  
	  </div> 	  
	  
	  <!--
	  <div id="pdf_area" class="content" style="display: none">
	    <div class="embed-container">
	        <iframe id= "pdf_obj" src=""></iframe>   
	    </div>
	  </div>  
	  -->	  
	      
	</div>
	
	<!-- For submission dialog use -->
	<div id="infoPopUp" title="Confirmation" style="display:none;">
	   <p align="left"><span class="ui-icon ui-icon-info" style="margin:0 7px 20px 0;"></span>"test msg!"</p>
	</div>
</body>

</html>