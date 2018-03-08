<head>	
	<!-- GOOGLE FONTS -->
	<!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed" rel="stylesheet" type="text/css"> -->
	<!-- <link href="https://fonts.googleapis.com/css?family=Mada" rel="stylesheet">  -->
	<!-- <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">  -->
	<!-- <link href="https://fonts.googleapis.com/css?family=PT+Sans+Narrow" rel="stylesheet">  -->
	<link href="https://fonts.googleapis.com/css?family=PT+Sans+Narrow&amp;subset=latin-ext" rel="stylesheet"> 

	<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
	<%@ taglib uri="/WEB-INF/c-1_0-rt.tld" prefix="c" %>
	<%@ taglib uri="/WEB-INF/fmt-rt.tld" prefix="fmt"%>
	
	<%@ page 
	language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import=
	"java.net.URL
	,com.nas.util.LanguageUtilFunction
	,java.util.*
	,com.visionmax.workflow.view.FormTree
	,com.visionmax.workflow.app.FormManager
	,com.visionmax.util.AppConfig
	,com.visionmax.components.authentication.AuthenticationToken
	,com.visionmax.util.SysParamsFactory
	,com.nas.app.AppConstants
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
	    
	    String formTitle = "test title!";
	    
//	 	String hasFullView = "Y"; 	 	   
	    
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
	<title>${progressInspectionTitle}</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">  
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
	
	<!-- For Calendar -->
	<SCRIPT language="JavaScript" src="<%=appUrl%>/popcalendar.js" ></SCRIPT>
	
	 <!-- Google Map API -->
	
    <script
    	src="https://maps.googleapis.com/maps/api/js?key=<%=googleMapCryptopKey%>">
    </script>		
		
	<script lang="javascript">
	
	//	The following varible list are global ones.
	 	var formView = new FormView();
	 	var appReqNum = getQueryVariable("appReqNum");
	 	var formId = getQueryVariable("formId");	 		 
	 	var formName = getQueryVariable("formName");
	 	var countryCode = getQueryVariable("countryCode");
	 	var formLanguage = getQueryVariable("formLanguage");	 	
	 	var process = getQueryVariable("process");
	 	var requestSource = getQueryVariable("requestSource");
	 	var serverURL = "<%=AppConfig.getInstance().getSingleValue("serverURL") %>";
	 	var webServerURLForLCCall = "<%=AppConfig.getInstance().getSingleValue("webServerURLForLCCall") %>";
	 	 	
	 	var completeMsg = 			"${completeMsg}";
		var saveMsg = 				"${saveMsg}";
		var requiredFieldAlertMsg = "${requiredFieldAlertMsg}";
		var formLockCorrectMsg = 	"${formLockCorrectMsg}";
		var formLockErrorMsg = 		"${formLockErrorMsg}";
		var passwordCorrectMsg = 	"${passwordCorrectMsg}";		
		var passwordErrorMsg1 = 	"${passwordErrorMsg1}";
		var passwordErrorMsg2 = 	"${passwordErrorMsg2}";		
		var passwordErrorMsg3 = 	"${passwordErrorMsg3}";
		var passwordErrorMsg4 = 	"${passwordErrorMsg4}";
		var passwordErrorMsg5 = 	"${passwordErrorMsg5}";
		var previewBtnName = 		"${previewBtnName}";
		var closePreviewBtnName = 	"${closePreviewBtnName}";
		var maxFileSizeMsg = 		"${maxFileSizeMsg}";
		
		var hasFullView = getQueryVariable("hasFullView"); //JIRA: NE-2223, this global variable will control if the form will be shown as full view.
		
		console.log("hasFullView: " + hasFullView); 
		
    //	The following varible list deals with form message by form type.
    
	 	console.log("process: " + process);
	 	
		console.log("language: " + "<%=language%>");
			
	 	 	
	//	Start document ready fucntions.
	//	The code has been moved into formMainController.js.		
	//	End of document ready.	
 	
	</script> 
	
	<c:set var="currFormId" scope="request" value="${formId}"/>
		
	<c:set var="isFullView" scope="request" value="${hasFullView}"/>
		
	<c:set var="PROGRESS_INSPECTION_EN_FORMID" scope="request" value="<%=AppConstants.PROGRESS_INSPECTION_EN_FORMID%>"/>
	<c:set var="PROGRESS_INSPECTION_FR_FORMID" scope="request" value="<%=AppConstants.PROGRESS_INSPECTION_FR_FORMID%>"/>	
	<c:set var="DRIVEBY_SERVICE_CUSPAP_EN_FORMID" scope="request" value="<%=AppConstants.DRIVEBY_SERVICE_CUSPAP_EN_FORMID%>"/>
	<c:set var="DRIVEBY_SERVICE_CUSPAP_FR_FORMID" scope="request" value="<%=AppConstants.DRIVEBY_SERVICE_CUSPAP_FR_FORMID%>"/>	
	

</head>