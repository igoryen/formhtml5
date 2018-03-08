<!DOCTYPE html>
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
	,java.util.Date
	,java.util.Hashtable
	,java.text.SimpleDateFormat
	,javax.servlet.jsp.PageContext" %>
	
	
	<%
		String lang = (String)request.getSession().getAttribute("lang_cd");
		String appUrl = "/"+getServletContext().getServletContextName();
		String appURL = AppConfig.getInstance().getSingleValue("applicationURL");
		AuthenticationToken token = (AuthenticationToken) request.getSession().getAttribute("token");
		String requestSource = (String)request.getSession().getAttribute("requestSource");
		
		boolean isRequestFromMIP = false;
		if(requestSource != null && AppConstants.REQUEST_SOURCE_MIP.equals(requestSource)){
			isRequestFromMIP = true;
		}else{
			requestSource = "";			
		}
		
		String userName = null;
		if (null != token)  {
			userName = token.getUsername();
		}
		
		String language = "English";
	    Object lang_cd = session.getAttribute("lang_cd");
	    if (lang_cd != null)
	    {
	   		language = (String)lang_cd;
	   		pageContext.setAttribute("locale", LanguageUtilFunction.getLanguageLocale(language));
	    }
	%>
	
	<!-- The following section deals with text locale -->

	<fmt:setLocale value="${locale}"/>
	
	<!-- HTML5 project - Progress Inspection Form - HOME Tab  -->
	<fmt:message key="formhtml5.jsp.progressinspection.progressInspectionTitle" scope="request" var="progressInspectionTitle"/>
	<fmt:message key="formhtml5.jsp.progressinspection.saveBtnName" scope="request" var="saveBtnName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.reviewBtnName" scope="request" var="reviewBtnName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.completeBtnName" scope="request" var="completeBtnName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.previewBtnName" scope="request" var="previewBtnName"/>	
	<fmt:message key="formhtml5.jsp.progressinspection.homeTabName" scope="request" var="homeTabName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.clientTabName" scope="request" var="clientTabName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.appraiserTabName" scope="request" var="appraiserTabName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.propertyTabName" scope="request" var="propertyTabName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.servicesTabName" scope="request" var="servicesTabName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.constructionStageTabName" scope="request" var="constructionStageTabName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.costTabName" scope="request" var="costTabName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.certificationTabName" scope="request" var="certificationTabName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.photoTabName" scope="request" var="photoTabName"/>
	<fmt:message key="formhtml5.jsp.progressinspection.locationTabName" scope="request" var="locationTabName"/>	
	
	<!-- HTML5 project - Progress Inspection Form - Tab1  -->
	<fmt:message key="formhtml5.jsp.progressinspection.clientReferenceNoLbl" scope="request" var="clientReferenceNoLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.progressInspectionNoLbl" scope="request" var="progressInspectionNoLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.fileNoLbl" scope="request" var="fileNoLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.nasNoLbl" scope="request" var="nasNoLbl"/>
	
	<!-- HTML5 project - Progress Inspection Form - Tab2 -->
	<fmt:message key="formhtml5.jsp.progressinspection.clientLbl" scope="request" var="clientLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.attentionLbl" scope="request" var="attentionLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.addressLbl" scope="request" var="addressLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.cityLbl" scope="request" var="cityLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.provinceLbl" scope="request" var="provinceLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.postalCodeLbl" scope="request" var="postalCodeLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.phoneLbl" scope="request" var="phoneLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.emailLbl" scope="request" var="emailLbl"/>
	
	<!-- HTML5 project - Progress Inspection Form - Tab3 -->
	<fmt:message key="formhtml5.jsp.progressinspection.appraiserLbl" scope="request" var="appraiserLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.companyLbl" scope="request" var="companyLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.addressLine1Lbl" scope="request" var="addressLine1Lbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.addressLine2Lbl" scope="request" var="addressLine2Lbl"/>
	
	<!-- HTML5 project - Progress Inspection Form - Tab4 -->
	<fmt:message key="formhtml5.jsp.progressinspection.applicantNameLbl" scope="request" var="applicantNameLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.propertyAddressLbl" scope="request" var="propertyAddressLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.propertyTypeLbl" scope="request" var="propertyTypeLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.renovationImprovementLbl" scope="request" var="renovationImprovementLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.newConstructionLbl" scope="request" var="newConstructionLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.occupiedLbl" scope="request" var="occupiedLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.yesLbl" scope="request" var="yesLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.noLbl" scope="request" var="noLbl"/>

	<!-- HTML5 project - Progress Inspection Form - Tab5 -->
	<fmt:message key="formhtml5.jsp.progressinspection.completedLbl" scope="request" var="completedLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.septicLbl" scope="request" var="septicLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.sanitarySewerLbl" scope="request" var="sanitarySewerLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.stormSewerLbl" scope="request" var="stormSewerLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.municipalWaterLbl" scope="request" var="municipalWaterLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.wellLbl" scope="request" var="wellLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.curbAndGutterLbl" scope="request" var="curbAndGutterLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.pavedRoadLbl" scope="request" var="pavedRoadLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.sideWalkLbl" scope="request" var="sideWalkLbl"/>
	
	<!-- HTML5 project - Progress Inspection Form - Tab6 -->
	<fmt:message key="formhtml5.jsp.progressinspection.constructionStageLbl" scope="request" var="constructionStageLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.allowedLbl" scope="request" var="allowedLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.totalCompletedLbl" scope="request" var="totalCompletedLbl"/>
	
	<!-- HTML5 project - Progress Inspection Form - Tab7 -->
	<fmt:message key="formhtml5.jsp.progressinspection.totalCostOfConstructionLbl" scope="request" var="totalCostOfConstructionLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.estimatedCostToCompleteLbl" scope="request" var="estimatedCostToCompleteLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.complianceLbl" scope="request" var="complianceLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.complianceLine1Txt" scope="request" var="complianceLine1Txt"/>
	<fmt:message key="formhtml5.jsp.progressinspection.complianceLine2Txt" scope="request" var="complianceLine2Txt"/>
	<fmt:message key="formhtml5.jsp.progressinspection.commentsLbl" scope="request" var="commentsLbl"/>
	
	<!-- HTML5 project - Progress Inspection Form - Tab8  -->
	<fmt:message key="formhtml5.jsp.progressinspection.appraiserSignatureLbl" scope="request" var="appraiserSignatureLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.supervisorSignatureLbl" scope="request" var="supervisorSignatureLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.clearLbl" scope="request" var="clearLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.appraiserPasswordLbl" scope="request" var="appraiserPasswordLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.nameLbl" scope="request" var="nameLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.designationLbl" scope="request" var="designationLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.memberNoLbl" scope="request" var="memberNoLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.dateSignedLbl" scope="request" var="dateSignedLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.dateOfInspectionLbl" scope="request" var="dateOfInspectionLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.licenseInfoLbl" scope="request" var="licenseInfoLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.noteTxt" scope="request" var="noteTxt"/>
	
	<!-- HTML5 project - Progress Inspection Form - Tab9 -->
	<fmt:message key="formhtml5.jsp.progressinspection.photo1Lbl" scope="request" var="photo1Lbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.photo2Lbl" scope="request" var="photo2Lbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.photo3Lbl" scope="request" var="photo3Lbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.photo4Lbl" scope="request" var="photo4Lbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.photo5Lbl" scope="request" var="photo5Lbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.photo6Lbl" scope="request" var="photo6Lbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.descriptionLbl" scope="request" var="descriptionLbl"/>
	<fmt:message key="formhtml5.jsp.progressinspection.selectImageLbl" scope="request" var="selectImageLbl"/>	
	
	
	<%
		String progressInspectionTitle = (String)request.getAttribute("progressInspectionTitle");
	    String saveBtnName = (String)request.getAttribute("saveBtnName");
	    String reviewBtnName = (String)request.getAttribute("reviewBtnName");
	    String completeBtnName = (String)request.getAttribute("completeBtnName");
	    String previewBtnName = (String)request.getAttribute("previewBtnName");
		String homeTabName = (String)request.getAttribute("homeTabName");
		String clientTabName = (String)request.getAttribute("clientTabName");
		String appraiserTabName = (String)request.getAttribute("appraiserTabName");
		String propertyTabName = (String)request.getAttribute("propertyTabName");
		String servicesTabName = (String)request.getAttribute("servicesTabName");
		String constructionStageTabName = (String)request.getAttribute("constructionStageTabName");
		String costTabName = (String)request.getAttribute("costTabName");
		String certificationTabName = (String)request.getAttribute("certificationTabName");
		String photoTabName = (String)request.getAttribute("photoTabName");
		String locationTabName = (String)request.getAttribute("locationTabName");	
		
		String clientReferenceNoLbl = (String)request.getAttribute("clientReferenceNoLbl");
		String progressInspectionNoLbl = (String)request.getAttribute("progressInspectionNoLbl");
		String fileNoLbl = (String)request.getAttribute("fileNoLbl");
		String nasNoLbl = (String)request.getAttribute("nasNoLbl");
		
		String clientLbl = (String)request.getAttribute("clientLbl");
		String attentionLbl = (String)request.getAttribute("attentionLbl");
		String addressLbl = (String)request.getAttribute("addressLbl");
		String cityLbl = (String)request.getAttribute("cityLbl");
		String provinceLbl = (String)request.getAttribute("provinceLbl");
		String postalCodeLbl = (String)request.getAttribute("postalCodeLbl");
		String phoneLbl = (String)request.getAttribute("phoneLbl");
		String emailLbl = (String)request.getAttribute("emailLbl");

		String appraiserLbl = (String)request.getAttribute("appraiserLbl");
		String companyLbl = (String)request.getAttribute("companyLbl");
		String addressLine1Lbl = (String)request.getAttribute("addressLine1Lbl");
		String addressLine2Lbl = (String)request.getAttribute("addressLine2Lbl");

		String applicantNameLbl = (String)request.getAttribute("applicantNameLbl");
		String propertyAddressLbl = (String)request.getAttribute("propertyAddressLbl");
		String propertyTypeLbl = (String)request.getAttribute("propertyTypeLbl");
		String renovationImprovementLbl = (String)request.getAttribute("renovationImprovementLbl");
		String newConstructionLbl = (String)request.getAttribute("newConstructionLbl");
		String occupiedLbl = (String)request.getAttribute("occupiedLbl");
		String yesLbl = (String)request.getAttribute("yesLbl");
		String noLbl = (String)request.getAttribute("noLbl");

		String completedLbl = (String)request.getAttribute("completedLbl");
		String septicLbl = (String)request.getAttribute("septicLbl");
		String sanitarySewerLbl = (String)request.getAttribute("sanitarySewerLbl");
		String stormSewerLbl = (String)request.getAttribute("stormSewerLbl");
		String municipalWaterLbl = (String)request.getAttribute("municipalWaterLbl");
		String wellLbl = (String)request.getAttribute("wellLbl");
		String curbAndGutterLbl = (String)request.getAttribute("curbAndGutterLbl");
		String pavedRoadLbl = (String)request.getAttribute("pavedRoadLbl");
		String sideWalkLbl = (String)request.getAttribute("sideWalkLbl");

		String constructionStageLbl = (String)request.getAttribute("constructionStageLbl");
		String allowedLbl = (String)request.getAttribute("allowedLbl");
		String totalCompletedLbl = (String)request.getAttribute("totalCompletedLbl");
		String totalCostOfConstructionLbl = (String)request.getAttribute("totalCostOfConstructionLbl");
		String estimatedCostToCompleteLbl = (String)request.getAttribute("estimatedCostToCompleteLbl");
		String complianceLbl = (String)request.getAttribute("complianceLbl");
		String complianceLine1Txt = (String)request.getAttribute("complianceLine1Txt");
		String complianceLine2Txt = (String)request.getAttribute("complianceLine2Txt");
		String commentsLbl = (String)request.getAttribute("commentsLbl");

		String appraiserSignatureLbl = (String)request.getAttribute("appraiserSignatureLbl");
		String supervisorSignatureLbl = (String)request.getAttribute("supervisorSignatureLbl");
		String clearLbl = (String)request.getAttribute("clearLbl");
		String appraiserPasswordLbl = (String)request.getAttribute("appraiserPasswordLbl");
		String nameLbl = (String)request.getAttribute("nameLbl");
		String designationLbl = (String)request.getAttribute("designationLbl");
		String memberNoLbl = (String)request.getAttribute("memberNoLbl");
		String dateSignedLbl = (String)request.getAttribute("dateSignedLbl");
		String dateOfInspectionLbl = (String)request.getAttribute("dateOfInspectionLbl");
		String licenseInfoLbl = (String)request.getAttribute("licenseInfoLbl");
		String noteTxt = (String)request.getAttribute("noteTxt");

		String photo1Lbl = (String)request.getAttribute("photo1Lbl");
		String photo2Lbl = (String)request.getAttribute("photo2Lbl");
		String photo3Lbl = (String)request.getAttribute("photo3Lbl");
		String photo4Lbl = (String)request.getAttribute("photo4Lbl");
		String photo5Lbl = (String)request.getAttribute("photo5Lbl");
		String photo6Lbl = (String)request.getAttribute("photo6Lbl");
		String descriptionLbl = (String)request.getAttribute("descriptionLbl");
		String selectImageLbl = (String)request.getAttribute("selectImageLbl");		
		
	%>
	
	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
	<script type="text/javascript" src="<%=appUrl%>/jsp/scripts/nifty.js"></script>
	<script type="text/javascript" src="<%=appUrl%>/jsp/scripts/final.js"></script>
	<script type="text/javascript" src="<%=appURL%>/jsp/scripts/editwindow.js"></script>
	<script language="JavaScript" src="<%=appUrl%>/jsp/scripts/popcalendar.js" ></script>
	<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
	
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
	<script src="<%=appUrl%>/formhtml5/js/angularJS/util.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/app.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/ConstructionStageController.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/jquery/1.12.4/jquery.min.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/appSigPad.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/appPhotosController.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/angularJS/datePicker.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/bootstrap/bootstrap.min.js"></script>
    <link href="<%=appUrl%>/formhtml5/css/bootstrap/bootstrap.min.css" rel="stylesheet"> 
	<script src="<%=appUrl%>/formhtml5/js/nasform/form.js"></script>
	<link href="<%=appUrl%>/formhtml5/css/style.css" rel="stylesheet"/>
	
	<!-- For dialog -->
	<link rel="stylesheet" href="<%=appUrl%>/formhtml5/css/jquery-ui.css">
	<script src="<%=appUrl%>/formhtml5/js/jquery/1.12.4/jquery-1.12.4.js"></script>
	<script src="<%=appUrl%>/formhtml5/js/jquery/1.12.4/jquery-ui.js"></script>	
	
	
	<script language="javascript">
//	The following varibale list are global ones.
 	var formView = new FormView();
 	var appReqNum = getQueryVariable("appReqNum");
 	var formId = getQueryVariable("formId");
 	var countryCode = getQueryVariable("countryCode");
 	var formLanguage = getQueryVariable("formLanguage");	 	
 	var process = getQueryVariable("process");
 	
 	console.log("process: " + process);
 	 	
//	Start document ready fucntions.

	$(document).ready(function(){
		
		//Process complete button.
		processComplete(); 		

		//Process save button.
		processSave();
		
		//Process review button.
		processReview();
	    
	    //Process preview button.
	    processPreview();
	    
	    //Init certification section.
		initCertification();   
	    
	    //Init photo section.
		initPhoto();
	    
	    //Init location map section.
		processLocationMap();
	    
	    //The following code will get all of initial fields and its value for form.
		initFieldWithDefault();	
		
		//The following code will get the required field information in JSON.
		getRequiredFieldInfo(); 
		
		//The following code will populate all of dropdown menu with JSON saved in database.
		populateDropdownField();
				
	});	
		
//	End of document ready.	
 	
	</script> 
	
	<style type="text/css"> 
		table, td  {
		  border: 1px solid grey;
		  border-collapse: collapse;
		  padding: 5px;
		}
		#consturctionStage tr:nth-child(even){
				background-color: #f1f1f1;
		}
		.labelForInput {
		    background:rgba(0,0,0,0);
		    border:none;
		    width:350px;
		    display:block;
		}	
		
		.content {
		   width: 100%;
		   height: 100%;
		   margin: 0px auto;
		}
		
		.embed-container {
		   height: 0;
		   width: 100%;
		   padding-bottom: 66.25%; /* play with this until right */
		   overflow: hidden;
		   position: relative;
		}
		
		.embed-container iframe {
		   width: 65%;
		   height: 100%;
		   position: absolute;
		   top: 0;
		   left: 0;
		}
		
		.centerDiv {
		     position: absolute;
		     top: 50%;
		     height: 400px;
		     margin-top: -100px; /* Half of the height */
		     left: 50%;
		     width:800px;
		     margin-left: -400px; /* Half of the width */
		     border-radius: 5px;
		     padding:10px;
		 }	
		
		textarea {
		    resize: none;
		}
		
		
		.ui-dialog-titlebar {
		  	background-color: #2191c0;
		  	background-image: none;
		  	color: #000;
		}	
		
		.ui-dialog-titlebar-close{
	      	display: none;
		}
		
		 .ui-dialog { z-index: 1000 !important ;}			
				
	</style> 	

</head>

<body ng-app="myApp" ng-controller="mainController" flow-init flow-prevent-drop resize>   	
	<div class="container">
	  <div id="config_area" style="display: none">
	  		<input id="applicationURL" type="hidden" value="<%=appUrl%>" />
      </div>
	  <div id="message_area" class="centerDiv" style="display: none"></div>
	  <div id="title_area">
		  <span>
			  <p>
				  <font size="5"><%=progressInspectionTitle%></font>&nbsp;&nbsp;&nbsp;
				  <font size="2">
				  <button id="saveBtn"><%=saveBtnName%></button>
				  <button id="reviewBtn"><%=reviewBtnName%></button>
				  <input id="completeBtn" type="submit" value="<%=completeBtnName%>">
				  <input id="previewBtn" type='button' value="<%=previewBtnName%>">
				  </font>	
				  <img id="loading-indicator" src="<%=appUrl%>/assets/img/loading.gif" style="display: none">	 
			  </p>	
		
		  </span>
	  </div>
      <br>
      <!-- <span>Appraiser Signature isSigned() = {{isAppraiserSigned()}}</span>	 -->  
	  <br>
	  <div id="tab_area">
		  <ul  class="nav nav-pills">
		    <li class="active"><a data-toggle="pill" href="#home"><%=homeTabName%></a></li>
		    <li><a data-toggle="pill" href="#menu1"><%=clientTabName%></a></li>
		    <li><a data-toggle="pill" href="#menu2"><%=appraiserTabName%></a></li>
		    <li><a data-toggle="pill" href="#menu3"><%=propertyTabName%></a></li>
		    <li><a data-toggle="pill" href="#menu4"><%=servicesTabName%></a></li>
		    <li><a data-toggle="pill" href="#menu5"><%=constructionStageTabName%></a></li>    
		    <li><a data-toggle="pill" href="#menu6"><%=costTabName%></a></li>  
		    <li ng-click="redrawCanvas()"><a data-toggle="pill" href="#menu7"><%=certificationTabName%></a></li>
		    <li><a data-toggle="pill" href="#menu8"><%=photoTabName%></a></li>
		    <li><a data-toggle="pill" href="#menu9"><%=locationTabName%></a></li>    
		  </ul>
		  
		  <div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<fieldset ng-disabled="isAppraiserSigned()">
			    	<br>
					<h4>Client Reference No.:</h4>
					<input type="text" id="reference_number"  style="width: 536px; ">
					<h4>Progress Inspection No.:</h4>
					<input type="text" id="pi_number" style="width: 536px; ">	
					<h4>File No.:</h4>
					<input type="text" id="doc_number" style="width: 536px; ">	
					<h4>NAS No.:</h4>
					<input type="text" id="file_number" style="width: 270px; ">	
					<br><br>
				</fieldset>
			</div>  
		    <div id="menu1" class="tab-pane fade">
		    	<fieldset ng-disabled="isAppraiserSigned()">
			    	<br>
					<h4>Client:</h4>
					<input type="text" id="client_name" style="width: 536px; ">
					<h4>Attention:</h4>
					<input type="text" id="client_attention" style="width: 536px; ">	
					<h4>Address:</h4>
					<input type="text" id="client_address" style="width: 536px; ">	
					<h4>City:</h4>
					<input type="text" id="client_city" style="width: 270px; ">	
					<h4>Province:</h4>
					<select id="client_province" style="width: 270px; ">
						<option value=""></option>
					</select>	
					<h4>Postal Code:</h4>
					<input type="text" id="client_postal_code" style="width: 270px; ">	
					<h4>Phone:</h4>
					<input type="text" id="client_phone" pstyle="width: 240px; ">	
					<h4>Email:</h4>
					<input type="text" id="client_email" style="width: 500px; ">	
				</fieldset>
		    </div>
		    <div id="menu2" class="tab-pane fade">
		    	<fieldset ng-disabled="isAppraiserSigned()">
			    	<br>
					<h4>Appraiser:</h4>
					<input type="text" id="appraiser_name" ng-model="appraiser_name" style="width: 536px; ">
					<h4>Company:</h4>
					<input type="text" id="appraiser_company" style="width: 536px; ">	
					<h4>Address Line1:</h4>
					<input type="text" id="appraiser_address" style="width: 536px; ">	
					<h4>Address Line2:</h4>
					<input type="text" id="appr_address1" style="width: 536px; ">			
					<h4>City:</h4>
					<input type="text" id="appraiser_city" style="width: 270px; ">	
					<h4>Province:</h4>
					<input type="text" id="appraiser_province" style="width: 270px; ">
					<h4>Postal Code:</h4>
					<input type="text" id="appraiser_postal_code" style="width: 270px; ">	
					<h4>Phone:</h4>
					<input type="text" id="appraiser_phone" style="width: 240px; ">	
					<h4>Email:</h4>
					<input type="text" id="appraiser_email" style="width: 500px; ">
				</fieldset>
		    </div>
		    <div id="menu3" class="tab-pane fade">
		    	<fieldset ng-disabled="isAppraiserSigned()">
			    	<br>
					<h4>Applicant's Name:</h4>
					<input type="text" id="pi_subject_name" style="width: 536px; ">
					<h4>Property Address:</h4>
					<input type="text" id="pi_property_address" style="width: 536px; ">	
					<h4>City:</h4>
					<input type="text" id="pi_subj_city" style="width: 536px; ">	
					<h4>Province:</h4>
					<input type="text" id="pi_subj_province" style="width: 536px; ">			
					<h4>Postal Code:</h4>
					<input type="text" id="pi_subj_postal_code" style="width: 270px; ">	
			        <br>
			        <h4>Property Type:</h4>
				    <input type="radio" name="pi_construction_type" id="pi_construction_type" value="Renovation / Improvements" checked> Renovation/Improvements<br>
				    <input type="radio" name="pi_construction_type" id="pi_construction_type" value="New Construction"> New Constructionr<br>        
			        <br>
			        <h4>Occupied:</h4>         
			        <input type = "radio"
			        	   name = "pi_occupied"
			               id = "pi_occupied"
			               value = "Yes"
			               checked = "checked" />
			        <label for = "sizeYes">Yes</label>        
			        <input type = "radio"
			               name = "pi_occupied"
			               id = "pi_occupied"
			               value = "No" />
			        <label for = "sizeNo">No</label>
			  	</fieldset>
		    </div>
		    <div id="menu4" class="tab-pane fade">
				<fieldset ng-disabled="isAppraiserSigned()">
					<br>
				    <h4>Completed:</h4>       
					<input type="checkbox" id="pi_septic_installed" value="1"> Septic<br>
					<input type="checkbox" id="pi_sanitary_installed" value="1"> Sanitary Sewer<br>
					<input type="checkbox" id="pi_storm_installed" value="1"> Storm Sewer<br>
					<input type="checkbox" id="pi_municipal_installed" value="1"> Municipal Water<br>
					<input type="checkbox" id="pi_well_installed" value="1"> Well<br>
					<input type="checkbox" id="pi_curb_installed" value="1"> Curb and Gutter<br>
					<input type="checkbox" id="pi_paved_installed" value="1"> Paved Road<br>
					<input type="checkbox" id="pi_sidewalk_installed" value="1"> Sidewalk<br>
				</fieldset>
		    </div>
		    <div id="menu5" class="tab-pane fade">
		    	<fieldset ng-disabled="isAppraiserSigned()">
					<div  ng-controller="constructionStageCtrl"> 
					<br>
					<!--  
					<input type="hidden" id="constructionStageLen" value="{{constructionStage.length}}">   	
					-->	
					<table id="consturctionStage">
						<thead>
							<tr>
								<td>CONSTRUCTION STAGE</td>
								<td>ALLOWED</td>
								<td>COMPLETED</td>
								<td>TOTAL COMPLETED</td>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="x in constructionStage">
							  <td><input id="construction_stage_title_{{$index+1 | numberFixedLen:2}}" width="100px" type="text" class="labelForInput" disabled ng-readonly="true" ng-model="x.StageDesc" /></td>
							  <td><input id="construction_stage_allowed_{{$index+1 | numberFixedLen:2}}" type=number ng-model="x.Allowed"/></td>
							  <td><input id="construction_stage_complete_{{$index+1 | numberFixedLen:2}}" type=number ng-model="x.Completed "/></td>
							  <td><input id="construction_stage_total_complete_{{$index+1 | numberFixedLen:2}}" type=number ng-model="x.TotalCompleted"/></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td>Total</td>
								<td>{{constructionStage | sumOfValue:'Allowed'}}</td>
								<td colspan="2"></td>
							</tr>
						</tfoot>
					</table>			
					</div>
				</fieldset>
		    </div>    
		    <div id="menu6" class="tab-pane fade">
		    	<fieldset ng-disabled="isAppraiserSigned()">
				  <h4>Total Cost of Construction: $ </h4>
				  <input type="text" id="pi_total_cost_of_construction"  style="width: 536px; ">	
				  <h4>Estimated Cost to Complete: $ </h4>
				  <input type="text" id="pi_estimated_cost_to_complete"  style="width: 536px; "> 
				  <br><br>	
			      <h4>COMPLIANCE: </h4>
			      <p>The following schedule applies to advance draws provided that construction is proceeding as per plans, specifications, <br>and costs remain unchanged from the original appraisal report. 
			      <input type = "radio"
			             name = "pi_compliance"
			             id = "pi_compliance"
			             value = "Yes"
			             checked = "checked" />
			      <label for = "sizeYes">Yes</label>        
			      <input type = "radio"
			             name = "pi_compliance"
			             id = "pi_compliance"
			             value = "No" />             
			      <label for = "sizeNo">No</label> 
			      </p>
			      <br>
			      <h4>COMMENTS: </h4>	
			      <textarea id="pi_comments" rows="5" cols="125">
				  </textarea>
				</fieldset>
		    </div>
		    <div id="menu7" class="tab-pane fade" watchvisible>
				<div class="container">
					<hr class="soften"/>
						<div class="signature-container">
							<div class="signature-wrapper" ng-controller="sig-pad as appraiserSignature">
								<h4><%=appraiserSignatureLbl%></h4>
							  	<div id='signature-pad' class="m-signature-pad break">
							  		<div class="m-signature-pad--body">
										<canvas id="appraiser_signature_section" redraw ng-signature-pad="signature" ng-hide="isSigned()"></canvas>
										<img ng-src="{{isSigned()?signature.toDataURL():''}}" ng-hide="!isSigned()">
										<input id="appraiser_signature" name="appraiser_signature" type="hidden" ng-value="signatureB64()"/>
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
										<p ng-hide="true">Signature Result: {{signatureResult.result}}</p>
						  			</div>
							  	</div>
						  	    <div class="break signature-details" >
							  	    <div class='signature-password'>
							  		  <fieldset ng-disabled="false">
							  		    <label for="app_password1">Appraiser Password:</label>
							  		    <input type="password" id="app_password1" name="app_password1" ng-enter="doBlur(event)" ng-blur="password1Exit('appraiser')" ng-model="password1" ng-init="password1Exit('appraiser')"/>
							  		  </fieldset>
							  		  <br>
							  		<input type="password" id="app_password2" name="app_password2" ng-model="password2" ng-hide="true"/>
							  	    </div>
							  	<fieldset ng-disabled="isAppraiserSigned()">						  	
							  		<label for="id_appraiser_name"><%=nameLbl%></label><input id="id_appraiser_name" name="id_appraiser_name" type="text" ng-value="appraiser_name" ng-readonly="true"/>
							  		<br>
							  		<label for="appraiser_designation"><%=designationLbl%></label>
							  		    <select id="appraiser_designation" name="appraiser_designation">
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
	    							<label for="app_aic_member_number"><%=memberNoLbl%></label>
	    							<input type="text" name="app_aic_member_number" id="app_aic_member_number" ng-model="app_aic_member_number"/>
	    							<br>
	    							<div class='row' ng-controller="datePickerController">
		    							<!-- <input type="text" id="date_signed_appraiser" name="date_signed_appraiser"> -->
	 	    							<label for="date_signed_appraiser" class="col-xs-3 col-form-label vcenter"><%=dateSignedLbl%></label>
	 	    							<div class="col-xs-4 input-group vcenter">
		 	 								<input id="date_signed_appraiser" name="date_signed_appraiser" type="text" 
												class="form-control" uib-datepicker-popup="{{format}}" ng-model="date_signed_appraiser" is-open="popup1.opened" datepicker-options="dateOptions" ng-required="true" close-text="Close" alt-input-formats="altInputFormats" />
											<span class="input-group-btn">
											  <button type="button" class="btn btn-default" ng-click="open1()"><i class="glyphicon glyphicon-calendar"></i></button>
											</span>
										</div>
	 								</div>
	    							<div class='row' ng-controller="datePickerController">
		    							<label for="appraiser_date_inspection" class="col-xs-3 col-form-label vcenter"><%=dateOfInspectionLbl%></label>
	 	    							<div class="col-xs-4 input-group vcenter">
		    								<input type="text" id="appraiser_date_inspection" name="appraiser_date_inspection"
	   								   			class="form-control" uib-datepicker-popup="{{format}}" ng-model="date_signed_appraiser" is-open="popup1.opened" datepicker-options="dateOptions" ng-required="true" close-text="Close" alt-input-formats="altInputFormats">
											<span class="input-group-btn">
											  <button type="button" class="btn btn-default" ng-click="open1()"><i class="glyphicon glyphicon-calendar"></i></button>
											</span>
										</div>
									</div>    							   
	    							<br>
	    							<label for="appraiser_license_info"><%=licenseInfoLbl%></label>
	    							<input id="appraiser_license_info" name="appraiser_license_info" type="text">
	    							<br>
	    							<label><%=noteTxt%></label>
							  	</fieldset>							  	
							  </div>
						   </div>				  	
							<div class="signature-wrapper">
								<h4><%=supervisorSignatureLbl%></h4>
							  	<div id='signature-pad' class="m-signature-pad break" ng-controller="sig-pad">
							  		<div class="m-signature-pad--body">
										<canvas id="supervisor_signature_section" redraw ng-signature-pad="signature"></canvas>
										<input id="supervisor_signature" name="supervisor_signature" type="hidden" ng-value="signatureB64()"/>
							  		</div>
						  			<div class="m-signature-pad--footer">
										<div class="description">Sign above</div>
										<!-- <button type="button" class="button clear" data-action="clear">Clear</button> -->
										<!-- <button type="button" class="button save" data-action="save">Save</button>  --> 			
										<a class="btn clear" ng-click="clear()"><%=clearLbl%></a>
										<a class="btn save" ng-click="sendData($event)">Sign</a>
										<p ng-hide="true">Signature Result: {{signatureResult.result}}</p>
						  			</div>
							  	</div>
							  	<div class="break signature-details">
							  		<label for="super_appraiser_name"><%=nameLbl%></label><input id="super_appraiser_name" name="super_appraiser_name" type="text"/>
							  		<br>
							  		<label for="super_appraiser_designation"><%=designationLbl%></label>
							  		    <select id="super_appraiser_designation" name="super_appraiser_designation" ng-model="super_aic_member_number">
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
							  	</div>
						   </div>				  	
	
					</div>  
				</div>
		    </div>
		    <div id="menu8" class="tab-pane fade" >
		    	<fieldset ng-disabled="isAppraiserSigned()">
					<span class='allowed-photos' >Only PNG,GIF,JPG files allowed.</span>
			    	<div class="photos-container">
				 		<div class="photo-wrapper"  ng-controller="photosController" 
				 			flow-init
					      	flow-file-added="!!{png:1,gif:1,jpg:1,jpeg:1}[$file.getExtension()]"
					      	flow-files-submitted="$flow.upload()"
				 			flow-file-added="someHandlerMethod($file, $event, $flow)">
							<h4 class='photo-title'>Photo 1</h4>
					 		<div class="property-photo" ng-hide="$flow.files.length" 
						       flow-drop flow-drag-enter="isAppraiserSigned()?style={border:'1px red solid'}:style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<img id="additional_image1_section" ng-src="<%=appUrl%>/formhtml5/image/drag-and-drop-photo.png" />
						  	</div>
						  	
						  	<div class="property-photo" flow-drop ng-show="$flow.files.length"
						  		flow-drag-enter="style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="isAppraiserSigned()?'':style">
						    	<img style="max-height:100%" flow-img="$flow.files[0]" />
						        <input id="additional_image1" name = "additional_image1" type="hidden" ng-value="imageStringB64"/>				    	
						  	</div>
						  	<div>
							    <a href="#" class="btn" ng-hide="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Select image</a>
							    <a href="#" class="btn" ng-show="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Change</a>
							    <a href="#" class="btn btn-danger" ng-show="$flow.files.length"
							       ng-click="$flow.cancel()">
							      Remove
						    	</a>
							</div>
							<div class='photo-description'>
							  	<label class='description-lbl' for='additional_image_describe1'>Description: </label>
							  	<input class='description' id='additional_image_describe1' name='additional_image_describe1' type="text" />
							</div>
					  	</div>
				 		<div class="photo-wrapper"  ng-controller="photosController" 
				 			flow-init
					      	flow-file-added="!!{png:1,gif:1,jpg:1,jpeg:1}[$file.getExtension()]"
					      	flow-files-submitted="$flow.upload()"
				 			flow-file-added="someHandlerMethod($file, $event, $flow)">
							<h4 class='photo-title'>Photo 4</h4>
					 		<div class="property-photo" ng-hide="$flow.files.length" 
						       flow-drop flow-drag-enter="style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<img id="additional_image4_section" src="<%=appUrl%>/formhtml5/image/drag-and-drop-photo.png" />
						  	</div>
						  	<div class="property-photo" flow-drop ng-show="$flow.files.length"
						  		flow-drag-enter="style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<img style="max-height:100%" flow-img="$flow.files[0]" />
						        <input id="additional_image4" name = "additional_image4" type="hidden" ng-value="imageStringB64"/>					    	
						  	</div>
						  	<div>
							    <a href="#" class="btn" ng-hide="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Select image</a>
							    <a href="#" class="btn" ng-show="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Change</a>
							    <a href="#" class="btn btn-danger" ng-show="$flow.files.length"
							       ng-click="$flow.cancel()">
							      Remove
						    	</a>
							</div>
							<div class='photo-description'>
							  	<label class='description-lbl' for='additional_image_describe4'>Description: </label>
							  	<input class='description' id='additional_image_describe4' name='additional_image_describe4' type="text" />
							</div>
					  	</div>
				 		<div class="photo-wrapper"  ng-controller="photosController" 
				 			flow-init
					      	flow-file-added="!!{png:1,gif:1,jpg:1,jpeg:1}[$file.getExtension()]"
					      	flow-files-submitted="$flow.upload()"
				 			flow-file-added="someHandlerMethod($file, $event, $flow)">
							<h4 class='photo-title'>Photo 2</h4>
					 		<div class="property-photo" ng-hide="$flow.files.length" 
						       flow-drop flow-drag-enter="style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<img id="additional_image2_section" src="<%=appUrl%>/formhtml5/image/drag-and-drop-photo.png" />
						  	</div>
						  	<div class="property-photo" flow-drop ng-show="$flow.files.length"
						  		flow-drag-enter="style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<img style="max-height:100%" flow-img="$flow.files[0]" />
						        <input id="additional_image2" name = "additional_image2" type="hidden" ng-value="imageStringB64"/>					    	
						  	</div>
						  	<div>
							    <a href="#" class="btn" ng-hide="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Select image</a>
							    <a href="#" class="btn" ng-show="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Change</a>
							    <a href="#" class="btn btn-danger" ng-show="$flow.files.length"
							       ng-click="$flow.cancel()">
							      Remove
						    	</a>
							</div>
							<div class='photo-description'>
							  	<label class='description-lbl' for='additional_image_describe2'>Description: </label>
							  	<input class='description' id='additional_image_describe2' name='additional_image_describe2' type="text" />
						  	</div>
					  	</div>
				 		<div class="photo-wrapper"  ng-controller="photosController" 
				 			flow-init
					      	flow-file-added="!!{png:1,gif:1,jpg:1,jpeg:1}[$file.getExtension()]"
					      	flow-files-submitted="$flow.upload()"
				 			flow-file-added="someHandlerMethod($file, $event, $flow)">
							<h4 class='photo-title'>Photo 5</h4>
					 		<div class="property-photo" ng-hide="$flow.files.length" 
						       flow-drop flow-drag-enter="style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<img id="additional_image5_section" src="<%=appUrl%>/formhtml5/image/drag-and-drop-photo.png" />
						  	</div>
						  	<div class="property-photo" flow-drop ng-show="$flow.files.length"
						  		flow-drag-enter="style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<img style="max-height:100%" flow-img="$flow.files[0]" />
						        <input id="additional_image5" name = "additional_image5" type="hidden" ng-value="imageStringB64"/>					    	
						  	</div>
						  	<div>
							    <a href="#" class="btn" ng-hide="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Select image</a>
							    <a href="#" class="btn" ng-show="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Change</a>
							    <a href="#" class="btn btn-danger" ng-show="$flow.files.length"
							       ng-click="$flow.cancel()">
							      Remove
						    	</a>
							</div>
							<div class='photo-description'>					
							  	<label class='description-lbl' for='additional_image_describe5'>Description: </label>
							  	<input class='description' id='additional_image_describe5' name='additional_image_describe5' type="text" />
							</div>
					  	</div>
				 		<div class="photo-wrapper"  ng-controller="photosController" 
				 			flow-init
					      	flow-file-added="!!{png:1,gif:1,jpg:1,jpeg:1}[$file.getExtension()]"
					      	flow-files-submitted="$flow.upload()"
				 			flow-file-added="someHandlerMethod($file, $event, $flow)">
							<h4 class='photo-title'>Photo 3</h4>
					 		<div class="property-photo" ng-hide="$flow.files.length" 
						       flow-drop flow-drag-enter="style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<img id="additional_image3_section" src="<%=appUrl%>/formhtml5/image/drag-and-drop-photo.png" />
						  	</div>
						  	<div class="property-photo" flow-drop ng-show="$flow.files.length"
						  		flow-drag-enter="style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<img style="max-height:100%" flow-img="$flow.files[0]" />
						        <input id="additional_image3" name = "additional_image3" type="hidden" ng-value="imageStringB64"/>					    	
						  	</div>
						  	<div>
							    <a href="#" class="btn" ng-hide="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Select image</a>
							    <a href="#" class="btn" ng-show="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Change</a>
							    <a href="#" class="btn btn-danger" ng-show="$flow.files.length"
							       ng-click="$flow.cancel()">
							      Remove
						    	</a>
							</div>
							<div class='photo-description'>
							  	<label class='description-lbl' for='additional_image_describe3'>Description: </label>
							  	<input class='description' id='additional_image_describe3' name='additional_image_describe3' type="text" />
							</div>
					  	</div>
				 		<div class="photo-wrapper"  ng-controller="photosController" 
				 			flow-init
					      	flow-file-added="!!{png:1,gif:1,jpg:1,jpeg:1}[$file.getExtension()]"
					      	flow-files-submitted="$flow.upload()"
				 			flow-file-added="someHandlerMethod($file, $event, $flow)">
							<h4 class='photo-title'>Photo 6</h4>
					 		<div class="property-photo" ng-hide="$flow.files.length" 
						       flow-drop flow-drag-enter="style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<img id="additional_image6_section" src="<%=appUrl%>/formhtml5/image/drag-and-drop-photo.png" />
						  	</div>
						  	<div class="property-photo" flow-drop ng-show="$flow.files.length"
						  		flow-drag-enter="style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
						    	<img style="max-height:100%" flow-img="$flow.files[0]" />
						        <input id="additional_image6" name = "additional_image6" type="hidden" ng-value="imageStringB64"/>					    	
						  	</div>
						  	<div>
							    <a href="#" class="btn" ng-hide="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Select image</a>
							    <a href="#" class="btn" ng-show="$flow.files.length" flow-btn flow-attrs="{accept:'image/*'}">Change</a>
							    <a href="#" class="btn btn-danger" ng-show="$flow.files.length"
							       ng-click="$flow.cancel()">
							      Remove
						    	</a>
							</div>
							<div class='photo-description'>
							  	<label class='description-lbl' for='additional_image_describe6'>Description: </label>
							  	<input class='description' id='additional_image_describe6' name='additional_image_describe6' type="text" />
							</div>
					  	</div>
		
					</div>
				</fieldset>
		    </div>
		    <div id="menu9" class="tab-pane fade" >
   		    	<fieldset ng-disabled="isAppraiserSigned()">
			    	<canvas id="mapCanvas"></canvas>
			    	 <input id="locationmap_image" name = "locationmap_image" type="hidden" value=""/>
			    </fieldset>
		    </div>	    
		  </div>
	  </div>
	
	
	  <div id="pdf_area" style="display: none">	
		<object id= "pdf_obj" data="" width="850" height="950">
		</object>  
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
	<div id="confirmSubmit" title="Submit" style="display:none;">
	   <p align="left"><span class="ui-icon ui-icon-info" style="margin:0 7px 20px 0;"></span>"test msg!"</p>
	</div>
</body>

</html>