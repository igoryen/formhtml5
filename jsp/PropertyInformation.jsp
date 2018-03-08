<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <!-- GENERAL --> 
    <fieldset ng-disabled="isAppraiserSigned()" check-if-required>
        <legend ng-click="toggleElement('general', $event)">&nbsp;-&nbsp;${legendGeneral}</legend>

        <div class="reportSection" id="general" ng-hide="oToggleElementList['general']">

            <div class="form-row">
                <div class="input-text">
                    <label for="reference_number">${clientReferenceNoLbl}</label>
                    <input id="reference_number" type="text" id="reference_number" name="reference_number" ng-model="reference_number" width="250" maxlength="80" force-model-update>
                </div>

                <c:if test="${(currFormId eq PROGRESS_INSPECTION_EN_FORMID) || (currFormId eq PROGRESS_INSPECTION_FR_FORMID)}">
                    <div class="input-text">
                        <label for="pi_number">${progressInspectionNoLbl}</label>
                        <input type="text" id="pi_number" class="fixedWidthLabel" width="250" maxlength="80"> 
                    </div>  
                </c:if>
                <div class="input-text">
                    <label for="doc_number">${fileNoLbl}</label>
                    <input id="doc_number" type="text" width="250" maxlength="80"> 
                </div>
                <div class="input-text">
                    <label for="file_number">${nasNoLbl}</label>
                    <input id="file_number" class=" fixedWidthLabel" type="text"  name="file_number" ng-model="file_number" width="250" maxlength="80" force-model-update> 
                </div>

            </div>

        </div>
    </fieldset>
    <div id="client-and-appraiser" class="reportSectionGroup">
        <fieldset ng-disabled="isAppraiserSigned()" check-if-required>
            <legend ng-click="toggleElement('client', $event)">&nbsp;-&nbsp;${legendClient}</legend>

            <!-- CLIENT --> 

            <div id="client" class="reportSection" ng-hide="oToggleElementList['client']">

                <div class="form-row">
                    <div class="input-text">
                        <label for="client_name">${clientLbl}</label>
                        <input id="client_name" type="text" name="client_name" ng-model="client_name" style="background-color:rgb(239,240,241);" width="250" maxlength="80"  force-model-update>
                    </div>
                </div>
                <div class="form-row">
                    <div class="input-text">
                        <label for="client_attention">${attentionLbl}</label>
                        <input id="client_attention" type="text"  name="client_attention" ng-model="client_attention" width="250" maxlength="80"> 
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-text">
                        <label for="clien_address" >${addressLbl}</label>
                        <input id="client_address" type="text"  name="client_address" ng-model="client_address" width="250" maxlength="80">
                    </div>
                </div>

                <div class="form-row">

                    <div class="input-text">
                        <label for="client_city" >${cityLbl}</label>
                        <input id="client_city" type="text" name="client_city" ng-model="client_city" width="250" maxlength="80">
                    </div>

                    <div class="input-text province">
                        <label for="client_province" >${provinceLbl}</label>
                        <select id="client_province" name="client_province" ng-model="client_province" width="250" maxlength="80">
                            <option value=""></option>
                        </select>
                    </div>

                    <div class="input-text postal-code">
                        <label for="client_postal_code" >${postalCodeLbl}</label>
                        <input id="client_postal_code" type="text" name="client_postal_code" ng-model="client_postal_code" width="250" maxlength="80"> 
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-text">
                        <label for="client_phone" >${phoneLbl}</label>
                        <input id="client_phone" type="text"  name="client_phone" ng-model="client_phone" width="250" maxlength="80"> 
                    </div>
                    <div class="input-text">
                        <label for="client_email" >${emailLbl}</label>
                        <input id="client_email" type="text"  name="client_email" ng-model="client_email" width="250" maxlength="80">
                    </div>
                </div>
                <div class="form-row">
                    <div class="input-text">
                        <label for="hidden_client_field">&nbsp;</label>
                        <input id="hidden_client_field" type="text"  name="hidden_client_field" width="250" maxlength="80">
                    </div>
                </div>
            </div>
        </fieldset>
        <!-- APPRAISER --> 
        <fieldset ng-disabled="isAppraiserSigned()" check-if-required>
            <legend ng-click="toggleElement('appraiser', $event)">&nbsp;-&nbsp;${legendAppraiser}</legend>
            <div id="appraiser" class="reportSection" ng-hide="oToggleElementList['appraiser']">

                <div class="form-row">
                    <div class="input-text">
                        <label for="id_appraiser_name">${appraiserLbl}</label>
                        <!-- The scope variable 'sigRoles.appraiser.roleNameModel' is reused in certification page  -->
                        <input id="id_appraiser_name" type="text" name="id_appraiser_name" ng-model="sigRoles.appraiser.roleNameModel" width="250" maxlength="80" force-model-update>
                    </div>
                </div>
                <div class="form-row">
                    <div class="input-text">
                        <label for="appraiser_address">${companyLbl}</label>
                        <input type="text" id="appraiser_company" name="appraiser_company" ng-model="appraiser_company" style="background-color: rgb(239,240,241)" width="250" maxlength="80"     force-model-update>
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-text">  
                        <label for="appraiser_address">${addressLine1Lbl}</label>
                        <input type="text" id="appraiser_address" name="appraiser_address" ng-model="appraiser_address" width="250" maxlength="80" force-model-update>
                    </div>
                </div>

                <div class="form-row">  
                    <div class="input-text">
                        <label for="appr_address1">${addressLine2Lbl}</label>
                        <input type="text" id="appr_address1" width="250" maxlength="80">
                    </div>
                </div>


                <div class="form-row">

                    <div class="input-text">
                        <label for="appraiser_city">${cityLbl}</label>
                        <input type="text" id="appraiser_city" name="appraiser_city" ng-model="appraiser_city" force-model-update width="250" maxlength="80"> 
                    </div>

                    <div class="input-text province">
                        <label for="appraiser_province">${provinceLbl}</label>
                        <Select type="text" id="appraiser_province" name="appraiser_province" ng-model="appraiser_province" force-model-update width="250" maxlength="80">
                            <option value=""></option>
                        </Select>
                    </div>

                    <div class="input-text postal-code">
                        <label for="appraiser_postal_code">${postalCodeLbl}</label>
                        <input type="text" id="appraiser_postal_code" name="appraiser_postal_code" ng-model="appraiser_postal_code" width="250" maxlength="80" force-model-update> 
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-text">
                        <label for="appraiser_phone">${phoneLbl}</label>
                        <input type="text" id="appraiser_phone" name="appraiser_phone" ng-model="appraiser_phone" class="fixedWidthLabel" width="250" maxlength="80" force-model-update> 
                    </div>

                    <div class="input-text">
                        <label for="appraiser_email">${emailLbl}</label>
                        <input type="text" id="appraiser_email" name="appraiser_email" ng-model="appraiser_email" appraiser_email width="250" maxlength="80" force-model-update>
                    </div>
                </div>
            </div>
        </fieldset> 
    </div>

    <!-- PROPERTY INFO -->
    <fieldset ng-disabled="isAppraiserSigned()" check-if-required>
        <legend ng-click="toggleElement('property', $event)">&nbsp;-&nbsp;${legendProperty}</legend>
        <!-- CONDITION 1 -->

        <c:if test="${(currFormId eq PROGRESS_INSPECTION_EN_FORMID) || (currFormId eq PROGRESS_INSPECTION_FR_FORMID)}">

            <div class="reportSection" ng-hide="oToggleElementList['property']">

                <div class="form-row">
                    <div class="input-text">
                        <label for="pi_subject_name">${applicantNameLbl}</label>
                        <input type="text" id="pi_subject_name" name="pi_subject_name" ng-model="pi_subject_name" width="250" maxlength="80" force-model-update>
                    </div>
                </div>
                <div class="form-row">
                    <div class="input-text">
                        <label for="pi_property_address">${propertyAddressLbl}</label>
                        <input type="text" id="pi_property_address" name="pi_property_address" ng-model="pi_property_address" width="250" maxlength="80" force-model-update> 
                    </div>

                    <div class="input-text">
                        <label for="pi_subj_city">${cityLbl}</label>
                        <input class=" fixedWidthLabel"  type="text" id="pi_subj_city" name="pi_subj_city" ng-model="pi_subj_city" width="250" maxlength="80" force-model-update> 
                    </div>

                    <div class="input-text province">
                        <label for="pi_subj_province">${provinceLbl}</label>
                        <input id="pi_subj_province" type="text"  name="pi_subj_province" ng-model="pi_subj_province" class="fixedWidthLabel" width="250" maxlength="80" force-model-update> 
                    </div>

                    <div class="input-text postal-code">
                        <label for="pi_subj_postal_code">${postalCodeLbl}</label>
                        <input type="text" id="pi_subj_postal_code" name="pi_subj_postal_code" ng-model="pi_subj_postal_code" class="fixedWidthLabel" width="250" maxlength="80" force-model-update> 
                    </div>
                </div>
                <div class="form-row">
                    <div class="input-text">
                        <label for="pi_legal_description">${legalDescriptionLbl}</label>  
                        <input type="text" id="pi_legal_description" name="pi_legal_description" ng-model="pi_legal_description" style="width: 650px;" width="250" maxlength="80" force-model-update>
                    </div>
                </div>

                <!-- ????? -->
                <div class='input-option-box-style1' style="padding-left:10px">  
                    <div class="form-row">
                        <label for="pi_construction_type">${propertyTypeLbl}</label>
                        <input type="radio" name="pi_construction_type" id="pi_construction_type" ng-model="pi_construction_type_model" value="Renovation / Improvements" ng-click="setConstructionStage()" force-model-update>${renovationImprovementLbl}<br>
                        <input type="radio" name="pi_construction_type" id="pi_construction_type" ng-model="pi_construction_type_model" value="New Construction" checked ng-click="setConstructionStage()"  ng-checked="true" force-model-update>${newConstructionLbl}<br>
                    </div>
                    <div class="form-row">
                        <label for="pi_occupied">${occupiedLbl}</label>
                        <input type = "radio" name="pi_occupied" id="pi_occupied" value="Yes"/>${yesLbl}<br />
                        <input type = "radio" name="pi_occupied" id="pi_occupied" value="No" />${noLbl}
                    </div>
                    <p></p>
                </div>

        </c:if>
        <!-- CONDITION 2 -->
        <c:if test="${(currFormId eq DRIVEBY_SERVICE_CUSPAP_EN_FORMID) || (currFormId eq DRIVEBY_SERVICE_CUSPAP_FR_FORMID)}">
            <div id="property" class="reportSection" ng-hide="oToggleElementList['property']">

                <div class="form-row">
                    <div class="input-text">
                        <label for="subject_name">${applicantNameLbl}</label>
                        <input type="text" id="subject_name" name="subject_name" ng-model="subject_name" width="250" maxlength="80" force-model-update>
                    </div>
                </div>
                <div class="form-row">
                    <div class="input-text">
                        <label for="property_address">${propertyAddressLbl}</label>
                        <input type="text" id="property_address" name="property_address" ng-model="property_address" width="250" maxlength="80" force-model-update> 
                    </div>
                    <div class="input-text">
                        <label for="subj_city">${cityLbl}</label>
                        <input type="text" id="subj_city" name="subj_city" ng-model="subj_city" class="fixedWidthLabel" width="250" maxlength="80" force-model-update> 
                    </div>
                    <div class="input-text province">
                        <label for="subj_province">${provinceLbl}</label>
                        <input type="text" id="subj_province" name="subj_province" ng-model="subj_province" class="fixedWidthLabel" width="250" maxlength="80" force-model-update> 
                    </div>
                    <div class="input-text postal-code">
                        <label for="subj_postal_code">${postalCodeLbl}</label>
                        <input type="text" id="subj_postal_code" name="subj_postal_code" ng-model="subj_postal_code" class="fixedWidthLabel" width="250" maxlength="80" force-model-update> 
                    </div>
                </div>
                <div class="form-row">
                    <div class="input-text">
                       <label for="legal_description">${legalDescriptionLbl}</label>
                        <input id="legal_description" class=" fixedWidthLabel" type="text" name="legal_description" ng-model="legal_description" width="250" maxlength="80" force-model-update>
                    </div>
                </div>
                <!-- PURPOSE OF APPRAISAL --> 
                <!-- <div class="grouped"> -->
                <div class="form-row">
                    <label>${purposeOfAppraisal}</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input id="purpose_of_appraisal" type="radio" name="purpose_of_appraisal"  ng-model="purpose_of_appraisal" value="To estimate market value or" force-model-update>To estimate market value or</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="purpose_of_appraisal" type="radio"  name="purpose_of_appraisal" ng-model="purpose_of_appraisal" value="Other" force-model-update>Other</label>
                        </div>
                        <div class="input-text">
                            <input type="text" id="subj_purpose_of_appraisal_other" name="subj_purpose_of_appraisal_other" ng-model="subj_purpose_of_appraisal_other" width="250" maxlength="80" force-model-update>
                        </div>
                    </div>
                </div>
                <!-- </div>                              -->
                <!-- <div class="grouped"> -->
                <div class="form-row"> 
                    <label>INTENDED USE OF APPRAISALS:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio"  name="intended_use" id="intended_use" ng-model="intended_use" value="Mortgage Financing" force-model-update>Mortgage Financing</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="intended_use" id="intended_use" ng-model="intended_use" value="Other" force-model-update>Other</label>
                        </div>
                        <div class="input-text">
                            <input type="text" id="intended_use_other" name="intended_use_other" ng-model="intended_use_other" width="250" maxlength="80" force-model-update>
                        </div>
                    </div>
                </div>
                <!-- </div> -->
                <!-- <div class="grouped"> -->
                <div class="form-row"> 
                    <div class="input-text">
                        <label for="intended_users2">INTENDED USERS <span>(by name or type)</span>:</label>
                        <input type="text" id="intended_users2" name="intended_users2" ng-model="intended_users2" width="250" maxlength="80" force-model-update>
                    </div>
                </div>  
                <!-- </div> -->

                <!-- <div class="grouped"> -->
                <div class="form-row">
                    <label>REQUESTED BY: </label>
                    <div class="input-binary">
                        <label><input type="checkbox" name="requested_by_02" id="requested_by_02" ng-model="requested_by_02" value="1" force-model-update>Client Above</label>
                    </div>
                    <div class="input-binary">
                        <label><input type="checkbox" name="requested_by_01" id="requested_by_01" ng-model="requested_by_01" value="1" force-model-update>Nationwide Appraisal Services Inc.</label>
                    </div>
                    <div class="input-text">
                        <input type="text" id="subj_requested_by_other" name="subj_requested_by_other" ng-model="subj_requested_by_other" width="250" maxlength="80" force-model-update>
                    </div>
                </div> 
                <!-- </div> -->
                <!-- <div class="grouped"> -->
                <div class="form-row"> 
                    <label>THIS APPRAISAL REPORT REPRESENTS THE MARKET VALUE: <span>(if not current, see comments)</span></label>
                    <div class="input-binary">
                        <label><input type="radio"  name="report_representable_to" id="report_representable_to" ng-model="report_representable_to" value="Current" force-model-update>Current</label>
                    </div>
                    <div class="input-binary">
                        <label><input type="radio"  name="report_representable_to" id="report_representable_to" ng-model="report_representable_to" value="Retrospective" force-model-update>Retrospective</label>
                    </div>
                    <div class="input-binary">
                        <label><input type="radio"  name="report_representable_to" id="report_representable_to" ng-model="report_representable_to" value="Prospective" force-model-update>Prospective</label>
                    </div>
                </div>  
                <!-- </div>  -->
                <div class="form-row">
                    <div class="input-binary">
                        <label>
                            <input type="checkbox" name="update_of_original_report" id="update_of_original_report" ng-model="update_of_original_report" value="Update of original report" force-model-update>Update of original report completed on
                        </label>
                    </div>
                    <div class="input-text date">
                        <input type="text" name="original_report_date" id="original_report_date" ng-model="original_report_date"  value="" width="250" maxlength="80" force-model-updatreadonly="true" />
                    </div>

                    <div class="input-text date">
                        <label>with an effective date of</label>
                        <input type="text" class="dateInput" name="effective_date" id="effective_date" ng-model="effective_date"  value="" width="250" maxlength="80" force-model-updatreadonly="true" />
                        <img onclick='showCalendar(this, effective_date, "yyyy-mm-dd", null, 1, -1, -1)' src="<%=appUrl%>/Themes/popcalendar.png" alt="" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-text">
                        <label for="property_rights_appraised">PROPERTY RIGHTS APPRAISED: </label>
                        <select id="property_rights_appraised" name="property_rights_appraised" ng-model="property_rights_appraised" width="250" maxlength="80">
                            <option selected></option>
                            <option>Fee Simple</option>
                            <option>Leasehold</option>
                            <option>Cooperative</option>
                            <option>Condominium</option>
                            <option>Strata</option>
                            <option>Co-Ownership</option>
                        </select>
                    </div>

                    <div class="input-text money">
                        <label for="maintenance_fee">Maintenance Fee:$</label>
                        <input type="text" id="maintenance_fee" name="maintenance_fee" ng-model="maintenance_fee" width="250" maxlength="80" force-model-update>
                    </div>

                    <div class="input-binary">
                        <label><input type="radio" name="maintenance_fee_period" id="maintenance_fee_period" ng-model="maintenance_fee_period" value="Month" checked force-model-update>Month</label>
                    </div>

                    <div class="input-binary">
                        <label><input type="radio" name="maintenance_fee_period" id="maintenance_fee_period" ng-model="maintenance_fee_period" value="Year" force-model-update>Year</label>
                    </div>

                    <div class="input-binary">
                        <label><input type="checkbox" name="requested_by_02" id="requested_by_02" ng-model="requested_by_02" value="1" force-model-update>See Comments</label>
                    </div>

                </div>
                <!-- <div class="grouped"> -->
                <div class="form-row">
                    <label>IS THE SUBJECT A FRACTIONAL INTEREST,</label><label>PHYSICAL SEGMENT</label><label>OR PARTIAL HOLDING?</label>
                    <div class="input-binary">
                        <label><input type="radio" name="physical_partial_holding" id="physical_partial_holding" ng-model="physical_partial_holding" value="No" force-model-update>No</label>
                    </div>
                    <div class="input-binary">
                        <label><input type="radio" name="physical_partial_holding" id="physical_partial_holding" ng-model="physical_partial_holding" value="Yes" force-model-update>Yes</label>
                    </div>
                </div>
                <!-- </div> -->
                <div class="form-row">
                    <div class="input-text"> 
                        <label for="municipality_district">MUNICIPALITY AND DISTRICT:</label>
                        <input type="text" id="municipality_district" name="municipality_district" ng-model="municipality_district" width="250" maxlength="80" force-model-update>
                    </div>
                    <div class="input-text">
                        <label>MLS <span>District:</span></label>
                        <input  type="text" id="mls_district1" name="mls_district1" ng-model="mls_district1" width="250" maxlength="80" force-model-update>
                    </div>
                    <div class="input-text">
                        <input  type="text" id="mls_district2" name="mls_district2" ng-model="mls_district2" width="250" maxlength="80" force-model-update> 
                    </div>
                    <div class="input-text">
                        <input  type="text" id="mls_district3" name="mls_district3" ng-model="mls_district3" width="250" maxlength="80" force-model-update> 
                    </div>
                    <div class="input-text">
                        <input  type="text" id="mls_district4" name="mls_district4" ng-model="mls_district4" width="250" maxlength="80" force-model-update> 
                    </div>
                </div>
                <div class="form-row">
                    <div class="input-text"> 
                        <label>ASSESSMENT:</label>
                    </div>
                    <div class="input-text">
                        <label>Land$:</label>
                        <input type="text" id="land_assessment" class="costInput" name="land_assessment" ng-model="land_assessment" width="250" maxlength="80" force-model-update>
                    </div>  
                    <div class="input-text">
                        <label>Imp$:</label>  
                        <input type="text" id="imps_assessment" class="costInput" name="imps_assessment" ng-model="imps_assessment" width="250" maxlength="80" force-model-update> 
                    </div>  
                    <div class="input-text">
                        <label>Total$:</label>
                        <input type="text" id="total_assessment" class="costInput" name="total_assessment" ng-model="total_assessment" width="250" maxlength="80" force-model-update>
                    </div>
                    <div class="input-text date">
                        <label>Assessment Date:</label>
                        <input name="assessment_date" class="dateInput" id="assessment_date" ng-model="assessment_date" type="text" value="" width="250" maxlength="80" force-model-updatreadonly="true" />
                        <img onclick='showCalendar(this, assessment_date, "yyyy-mm-dd", null, 1, -1, -1)' src="<%=appUrl%>/Themes/popcalendar.png" alt="" />  
                    </div>
                    <div class="input-text">
                        <label>Taxes$:</label>
                        <input type="text" id="taxes" name="taxes" class="costInput" ng-model="taxes" width="250" maxlength="80" force-model-update>
                    </div>
                    <div class="input-text year">
                        <label>Year:</label>
                        <select type="text" id="tax_year" name="tax_year" ng-model="tax_year" width="250" maxlength="80">
                            <option selected></option>
                            <option>2007</option>
                            <option>2008</option>
                            <option>2009</option>
                            <option>2010</option>
                            <option>2011</option>
                            <option>2012</option>
                            <option>2013</option>
                            <option>2014</option>
                            <option>2015</option>
                            <option>2016</option>
                            <option>2017</option>
                            <option>2018</option>
                            <option>2019</option>
                            <option>2020</option>
                            <option>2021</option>
                        </select>
                    </div>
                </div>


                <!-- <div class="grouped"> -->
                <div class="form-row"> 
                    <div class="input-text">
                        <label>EXISTING USE:</label>
                        <input type="text" id="existing_use" name="existing_use" ng-model="existing_use" width="250" maxlength="80" force-model-update>
                    </div>
                </div>  
                <!-- </div> -->
                <!-- <div class="grouped"> -->
                <div class="form-row"> 
                    <label>HIGHEST AND BEST USE OF SUBJECT PROPERTY: </label> 
                        <div class="inputs-group">
                            <div class="input-binary">
                                <label><input type="radio"  name="highest_best_use" id="highest_best_use" ng-model="highest_best_use" value="As Is, or" force-model-update>As Is, or</label>
                            </div>
                            <div class="input-binary">
                                <label><input type="radio"  name="highest_best_use" id="highest_best_use" ng-model="highest_best_use" value="Other" force-model-update>Other</label>
                            </div>
                        </div>
                   </div> 
                <!-- </div> -->
                <div class="note">Note: If highest and best use is not the existing use, or not the use reflected in the report, see additional comments.</div>
            </div>
        </c:if>
    </fieldset>

    <c:if test="${(isFullView == 'Y')}">
        <p>&nbsp;</p>
    </c:if>
</html>
