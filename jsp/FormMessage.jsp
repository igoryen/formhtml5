<%@ taglib uri="/WEB-INF/fmt-rt.tld" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/c-1_0-rt.tld" prefix="c" %>
<!-- HTML5 project HOME Tab  -->
<c:if test="${(currFormId eq PROGRESS_INSPECTION_EN_FORMID) || (currFormId eq PROGRESS_INSPECTION_FR_FORMID)}">
	<fmt:message key="formhtml5.jsp.progressInspection.formTitle" scope="request" var="formTitle"/>
</c:if>

<c:if test="${(currFormId eq DRIVEBY_SERVICE_CUSPAP_EN_FORMID) || (currFormId eq DRIVEBY_SERVICE_CUSPAP_FR_FORMID)}">
	<fmt:message key="formhtml5.jsp.driveByFormCUSPAP.formTitle" scope="request" var="formTitle"/>
</c:if>

<!-- HTML5 project common labels  -->

<fmt:message key="formhtml5.jsp.saveBtnName" scope="request" var="saveBtnName"/>
<fmt:message key="formhtml5.jsp.reviewBtnName" scope="request" var="reviewBtnName"/>
<fmt:message key="formhtml5.jsp.completeBtnName" scope="request" var="completeBtnName"/>
<fmt:message key="formhtml5.jsp.previewBtnName" scope="request" var="previewBtnName"/>
<fmt:message key="formhtml5.jsp.workAsPdfBtnName" scope="request" var="workAsPdfBtnName"/>	
<fmt:message key="formhtml5.jsp.closePreviewBtnName" scope="request" var="closePreviewBtnName"/>	

<fmt:message key="formhtml5.jsp.homeTabName" scope="request" var="homeTabName"/>
<fmt:message key="formhtml5.jsp.clientTabName" scope="request" var="clientTabName"/>
<fmt:message key="formhtml5.jsp.appraiserTabName" scope="request" var="appraiserTabName"/>
<fmt:message key="formhtml5.jsp.propertyTabName" scope="request" var="propertyTabName"/>
<fmt:message key="formhtml5.jsp.servicesTabName" scope="request" var="servicesTabName"/>

<fmt:message key="formhtml5.jsp.neighbourhoodSiteImprovementsTabName" scope="request" var="neighbourhoodSiteImprovementsTabName"/>
<fmt:message key="formhtml5.jsp.comparableTabName" scope="request" var="comparableTabName"/>
<fmt:message key="formhtml5.jsp.definitionTabName" scope="request" var="definitionTabName"/>
<fmt:message key="formhtml5.jsp.addendumTabName" scope="request" var="addendumTabName"/>

<fmt:message key="formhtml5.jsp.constructionStageTabName" scope="request" var="constructionStageTabName"/>
<fmt:message key="formhtml5.jsp.costTabName" scope="request" var="costTabName"/>
<fmt:message key="formhtml5.jsp.certificationTabName" scope="request" var="certificationTabName"/>
<fmt:message key="formhtml5.jsp.photoTabName" scope="request" var="photoTabName"/>
<fmt:message key="formhtml5.jsp.locationTabName" scope="request" var="locationTabName"/>	
<fmt:message key="formhtml5.jsp.nextBtnName" scope="request" var="nextBtnName"/>	
<fmt:message key="formhtml5.jsp.previousBtnName" scope="request" var="previousBtnName"/>	

<fmt:message key="formhtml5.jsp.legendGeneral" scope="request" var="legendGeneral"/>		
<fmt:message key="formhtml5.jsp.legendClient" scope="request" var="legendClient"/>
<fmt:message key="formhtml5.jsp.legendAppraiser" scope="request" var="legendAppraiser"/>
<fmt:message key="formhtml5.jsp.legendProperty" scope="request" var="legendProperty"/>
<fmt:message key="formhtml5.jsp.legendServices" scope="request" var="legendServices"/>	
<fmt:message key="formhtml5.jsp.legendConstructionStage" scope="request" var="legendConstructionStage"/>		
<fmt:message key="formhtml5.jsp.legendCost" scope="request" var="legendCost"/>	

<fmt:message key="formhtml5.jsp.completeMsg" scope="request" var="completeMsg"/>	
<fmt:message key="formhtml5.jsp.saveMsg" scope="request" var="saveMsg"/>	
<fmt:message key="formhtml5.jsp.requiredFieldAlertMsg" scope="request" var="requiredFieldAlertMsg"/>	
<fmt:message key="formhtml5.jsp.formLockCorrectMsg" scope="request" var="formLockCorrectMsg"/>	
<fmt:message key="formhtml5.jsp.formLockErrorMsg" scope="request" var="formLockErrorMsg"/>	
<fmt:message key="formhtml5.jsp.passwordCorrectMsg" scope="request" var="passwordCorrectMsg"/>	
<fmt:message key="formhtml5.jsp.passwordErrorMsg1" scope="request" var="passwordErrorMsg1"/>
<fmt:message key="formhtml5.jsp.passwordErrorMsg2" scope="request" var="passwordErrorMsg2"/>	
<fmt:message key="formhtml5.jsp.passwordErrorMsg3" scope="request" var="passwordErrorMsg3"/>
<fmt:message key="formhtml5.jsp.passwordErrorMsg4" scope="request" var="passwordErrorMsg4"/>
<fmt:message key="formhtml5.jsp.passwordErrorMsg5" scope="request" var="passwordErrorMsg5"/>	

<!-- HTML5 project legend GENERAL  -->
<fmt:message key="formhtml5.jsp.clientReferenceNoLbl" scope="request" var="clientReferenceNoLbl"/>
<fmt:message key="formhtml5.jsp.progressInspectionNoLbl" scope="request" var="progressInspectionNoLbl"/>
<fmt:message key="formhtml5.jsp.fileNoLbl" scope="request" var="fileNoLbl"/>
<fmt:message key="formhtml5.jsp.nasNoLbl" scope="request" var="nasNoLbl"/>

<!-- HTML5 project legend CLIENT -->
<fmt:message key="formhtml5.jsp.clientLbl" scope="request" var="clientLbl"/>
<fmt:message key="formhtml5.jsp.attentionLbl" scope="request" var="attentionLbl"/>
<fmt:message key="formhtml5.jsp.addressLbl" scope="request" var="addressLbl"/>
<fmt:message key="formhtml5.jsp.cityLbl" scope="request" var="cityLbl"/>
<fmt:message key="formhtml5.jsp.provinceLbl" scope="request" var="provinceLbl"/>
<fmt:message key="formhtml5.jsp.postalCodeLbl" scope="request" var="postalCodeLbl"/>
<fmt:message key="formhtml5.jsp.phoneLbl" scope="request" var="phoneLbl"/>
<fmt:message key="formhtml5.jsp.emailLbl" scope="request" var="emailLbl"/>

<!-- HTML5 project legend APPRAISER -->
<fmt:message key="formhtml5.jsp.appraiserLbl" scope="request" var="appraiserLbl"/>
<fmt:message key="formhtml5.jsp.companyLbl" scope="request" var="companyLbl"/>
<fmt:message key="formhtml5.jsp.addressLine1Lbl" scope="request" var="addressLine1Lbl"/>
<fmt:message key="formhtml5.jsp.addressLine2Lbl" scope="request" var="addressLine2Lbl"/>

<!-- HTML5 project legend PROPERTY -->
<fmt:message key="formhtml5.jsp.applicantNameLbl" scope="request" var="applicantNameLbl"/>
<fmt:message key="formhtml5.jsp.propertyAddressLbl" scope="request" var="propertyAddressLbl"/>
<fmt:message key="formhtml5.jsp.legalDescriptionLbl" scope="request" var="legalDescriptionLbl"/>
<fmt:message key="formhtml5.jsp.propertyTypeLbl" scope="request" var="propertyTypeLbl"/>
<fmt:message key="formhtml5.jsp.renovationImprovementLbl" scope="request" var="renovationImprovementLbl"/>
<fmt:message key="formhtml5.jsp.newConstructionLbl" scope="request" var="newConstructionLbl"/>
<fmt:message key="formhtml5.jsp.occupiedLbl" scope="request" var="occupiedLbl"/>
<fmt:message key="formhtml5.jsp.yesLbl" scope="request" var="yesLbl"/>
<fmt:message key="formhtml5.jsp.noLbl" scope="request" var="noLbl"/>

<fmt:message key="formhtml5.jsp.purposeOfAppraisal" scope="request" var="purposeOfAppraisal"/>

<!-- HTML5 project legend SERVICES in PI form -->
<fmt:message key="formhtml5.jsp.completedLbl" scope="request" var="completedLbl"/>
<fmt:message key="formhtml5.jsp.septicLbl" scope="request" var="septicLbl"/>
<fmt:message key="formhtml5.jsp.sanitarySewerLbl" scope="request" var="sanitarySewerLbl"/>
<fmt:message key="formhtml5.jsp.stormSewerLbl" scope="request" var="stormSewerLbl"/>
<fmt:message key="formhtml5.jsp.municipalWaterLbl" scope="request" var="municipalWaterLbl"/>
<fmt:message key="formhtml5.jsp.wellLbl" scope="request" var="wellLbl"/>
<fmt:message key="formhtml5.jsp.curbAndGutterLbl" scope="request" var="curbAndGutterLbl"/>
<fmt:message key="formhtml5.jsp.pavedRoadLbl" scope="request" var="pavedRoadLbl"/>
<fmt:message key="formhtml5.jsp.sideWalkLbl" scope="request" var="sideWalkLbl"/>

<!-- HTML5 project legend CONSTRUCTION STAGE in PI form -->
<fmt:message key="formhtml5.jsp.constructionStageLbl" scope="request" var="constructionStageLbl"/>
<fmt:message key="formhtml5.jsp.allowedLbl" scope="request" var="allowedLbl"/>
<fmt:message key="formhtml5.jsp.totalCompletedLbl" scope="request" var="totalCompletedLbl"/>
<fmt:message key="formhtml5.jsp.totCostOfConstructionLbl" scope="request" var="totCostOfConstructionLbl"/>
<fmt:message key="formhtml5.jsp.estimatedCostLbl" scope="request" var="estimatedCostLbl"/>

<!-- HTML5 project legend COMPLIANCE in PI form -->
<fmt:message key="formhtml5.jsp.totalCostOfConstructionLbl" scope="request" var="totalCostOfConstructionLbl"/>
<fmt:message key="formhtml5.jsp.estimatedCostToCompleteLbl" scope="request" var="estimatedCostToCompleteLbl"/>
<fmt:message key="formhtml5.jsp.complianceLbl" scope="request" var="complianceLbl"/>
<fmt:message key="formhtml5.jsp.complianceLine1Txt" scope="request" var="complianceLine1Txt"/>
<fmt:message key="formhtml5.jsp.complianceLine2Txt" scope="request" var="complianceLine2Txt"/>

<!-- HTML5 project legend COMMENTS in PI form  -->
<fmt:message key="formhtml5.jsp.commentsLbl" scope="request" var="commentsLbl"/>

<!-- HTML5 project legend CERTIFICATION  -->
<fmt:message key="formhtml5.jsp.appraiserSignatureLbl" scope="request" var="appraiserSignatureLbl"/>
<fmt:message key="formhtml5.jsp.supervisorSignatureLbl" scope="request" var="supervisorSignatureLbl"/>
<fmt:message key="formhtml5.jsp.clearLbl" scope="request" var="clearLbl"/>
<fmt:message key="formhtml5.jsp.keystoreTypeLbl" scope="request" var="keystoreTypeLbl"/>
<fmt:message key="formhtml5.jsp.keystoreFileLbl" scope="request" var="keystoreFileLbl"/>
<fmt:message key="formhtml5.jsp.keystorePasswordLbl" scope="request" var="keystorePasswordLbl"/>
<fmt:message key="formhtml5.jsp.reasonLbl" scope="request" var="reasonLbl"/>
<fmt:message key="formhtml5.jsp.locationLbl" scope="request" var="locationLbl"/>
<fmt:message key="formhtml5.jsp.contactInfoLbl" scope="request" var="contactInfoLbl"/>
<fmt:message key="formhtml5.jsp.appraiserPasswordLbl" scope="request" var="appraiserPasswordLbl"/>
<fmt:message key="formhtml5.jsp.supervisorPasswordLbl" scope="request" var="supervisorPasswordLbl"/>
<fmt:message key="formhtml5.jsp.nameLbl" scope="request" var="nameLbl"/>
<fmt:message key="formhtml5.jsp.designationLbl" scope="request" var="designationLbl"/>
<fmt:message key="formhtml5.jsp.memberNoLbl" scope="request" var="memberNoLbl"/>
<fmt:message key="formhtml5.jsp.dateSignedLbl" scope="request" var="dateSignedLbl"/>
<fmt:message key="formhtml5.jsp.dateOfInspectionLbl" scope="request" var="dateOfInspectionLbl"/>
<fmt:message key="formhtml5.jsp.licenseInfoLbl" scope="request" var="licenseInfoLbl"/>
<fmt:message key="formhtml5.jsp.noteTxt" scope="request" var="noteTxt"/>

<!-- HTML5 project legend PHOTO -->
<fmt:message key="formhtml5.jsp.dragAndDropLbl1" scope="request" var="dragAndDropLbl1"/>
<fmt:message key="formhtml5.jsp.dragAndDropLbl2" scope="request" var="dragAndDropLbl2"/>
<fmt:message key="formhtml5.jsp.photoLbl" scope="request" var="photoLbl"/>
<fmt:message key="formhtml5.jsp.photo1Lbl" scope="request" var="photo1Lbl"/>
<fmt:message key="formhtml5.jsp.photo2Lbl" scope="request" var="photo2Lbl"/>
<fmt:message key="formhtml5.jsp.photo3Lbl" scope="request" var="photo3Lbl"/>
<fmt:message key="formhtml5.jsp.photo4Lbl" scope="request" var="photo4Lbl"/>
<fmt:message key="formhtml5.jsp.photo5Lbl" scope="request" var="photo5Lbl"/>
<fmt:message key="formhtml5.jsp.photo6Lbl" scope="request" var="photo6Lbl"/>
<fmt:message key="formhtml5.jsp.descriptionLbl" scope="request" var="descriptionLbl"/>
<fmt:message key="formhtml5.jsp.selectImageLbl" scope="request" var="selectImageLbl"/>	
<fmt:message key="formhtml5.jsp.changeImageLbl" scope="request" var="changeImageLbl"/>	
<fmt:message key="formhtml5.jsp.removeImageLbl" scope="request" var="removeImageLbl"/>
<fmt:message key="formhtml5.jsp.maxFileSizeMsg" scope="request" var="maxFileSizeMsg"/>
<fmt:message key="formhtml5.jsp.photoSubjectFront" scope="request" var="photoSubjectFront"/>
<fmt:message key="formhtml5.jsp.photoSubjectStreet" scope="request" var="photoSubjectStreet"/>
<fmt:message key="formhtml5.jsp.photoSubjectRear" scope="request" var="photoSubjectRear"/>

	