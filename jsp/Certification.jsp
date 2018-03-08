<fieldset ng-disabled="isAppraiserSigned()" check-if-required>                   
    <legend ng-click="toggleElement('certification', $event)">&nbsp;-&nbsp;CERTIFICATION</legend>   
                
    <div class="reportSection" ng-hide="oToggleElementList['certification']">         
        <div class="container">
            <!-- <pre>{{certificationForm.$error}}</pre> -->

            
                    
            <c:if test="${(currFormId eq PROGRESS_INSPECTION_EN_FORMID) || (currFormId eq PROGRESS_INSPECTION_FR_FORMID)}">
                <p>CERTIFICATE: I certify that I have personally inspected the property at the above location and that in my opinion the state of completion is as indicated above.</p>
            </c:if>
                    
            <c:if test="${(currFormId eq DRIVEBY_SERVICE_CUSPAP_EN_FORMID) || (currFormId eq DRIVEBY_SERVICE_CUSPAP_FR_FORMID)}">                                               
                <ol>
                    <li><strong>I certify that, to the best of my knowledge and belief:</strong></li>
                    <li>The statements of fact contained in this report are true and correct.</li>
                    <li>The reported analyses, opinions and conclusions are limited only by the reported assumptions and limiting conditions and are my personal, impartial and unbiased professional analyses, opinions and conclusions.</li>
                    <li>I have no past, present or prospective interest or bias with respect to the property that is the subject of this report and no personal interest or bias with respect to the parties involved with this assignment, except as specified herein.</li>
                    <li>My engagement in this assignment is not contingent upon developing or reporting a predetermined result, upon the amount of value estimate, upon a direction in value that favours the cause of the client, upon the attainment of a stipulated result or the occurrence of a subsequent event.</li>
                    <li>My analyses, opinions and conclusions were developed, and this report has been prepared, in conformity with the Canadian Uniform Standards of Professional Appraisal Practice and with the Uniform Standards of Professional Appraisal Practice.</li>
                    <li>I have the knowledge and experience to complete this assignment competently. Except as herein disclosed, no other person has provided me with significant professional assistance in the completion of this appraisal assignment.</li>
                </ol>    
                <div class="form-row wall-to-wall">   
                    <textarea id="certify_comments1" name="certify_comments1" ng-model="certify_comments1" placeholder="COMMENTS:" rows="3" cols="120"  style="width: 100%; line-height: 20px; margin-left:0px;"></textarea>
                </div>
                <hr>
                        
                <strong>SUPERVISORY APPRAISER'S CERTIFICATION</strong>
                <p>If a supervisory appraiser has signed this appraisal report, he or she certifies and agress that "I directly supervised the appraiser who prepared this appraisal report and, having reviewed the report, agree with the statements and conclusion of the appraiser, agree to be bound by the appraiser's certification and am taking full responsibility for the appraisal and the appraisal report."<p>                        
                
            </c:if>
            
            <hr>
            <!-- SIGNATURE CONTAINER -->
            <div class="signature-container report-section-columns-group" ng-init= 'initSigRoles("${appraiserPasswordLbl}", "${supervisorPasswordLbl}", "${appraiserSignatureLbl}", "${supervisorSignatureLbl}")' >
                
                <!-- APPRAISER/SUPERVISOR SIGNATURE -->
                <div class="signature-wrapper report-section-column" ng-repeat="(theRole, theRoleData) in sigRoles" ng-controller="sig-pad" ng-init="setUserRole(theRole)">
                    
                    

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
                            </div>                                  <div class="myTooltip">
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
                        <input id='appKeystoreType'        name='appKeystoreType'        type="text" ng-model="signatureData.keystoreType">
                        <input id='appKeystoreFileName'    name='appKeystoreFileName'    type="text" ng-model="signatureData.keystoreFile.name">
                        <input id='appKeystoreFileData'    name='appKeystoreFileData'    type="text" ng-model="signatureData.keystoreFileData">
                        <input id='appKeystorePassword'    name='appKeystorePassword'    type="text" ng-model="signatureData.keystorePassword">
                        <input id='appKeystoreReason'      name='appKeystoreReason'      type="text" ng-model="signatureData.reason">
                        <input id='appKeystoreLocation'    name='appKeystoreLocation'    type="text" ng-model="signatureData.location">
                        <input id='appKeystoreContactInfo' name='appKeystoreContactInfo' type="text" ng-model="signatureData.contactInfo">
                    </div>                      
                    

                    <div class="m-signature-pad break" id='signature-pad' ng-class="{'ng-invalid':certificationForm[theRoleData.signatureBase64].$invalid && mainPromiseResolved}" check-if-required>
                        
                        <div class="m-signature-pad--body">
                            <label>{{theRoleData.signatureHeader}}</label>
                            <canvas id="appraiser_signature_section" redraw ng-signature-pad="signature" ng-hide="isSigned()"></canvas>
                            <img ng-src="{{signatureDataURL()}}" ng-hide="!isSigned()" load-signature-image>
                            <input id="{{theRoleData.signatureBase64}}" name="{{theRoleData.signatureBase64}}" type="text" ng-hide="true" ng-model="signatureBase64" check-if-required-expr="sigDetailsAvail(theRoleData)" force-model-update/>
                        </div>
                                    
                        <div class="m-signature-pad--footer alert alert-info">

                            <div class="footer-element ">Sign above</div>

                            <div class="footer-element btn btn-default" ng-click="clear()" ng-disabled="isSigned()">${clearLbl}</div>
                        
                            <!-- upload-download button -->
                            <!-- <div class="footer-element" flow-init={singleFile:true} flow-name="theRoleData.flow" flow-file-added="!!{png:1,jpg:1,jpeg:1}[$file.getExtension()] && isPhotoSizeValid($file.size) && handleImage($file, $event, $flow)">
                                <input id="upload-file-selector" flow-btn flow-attrs="{accept:'image/*'}" type="file">
                                <i class="fa_icon icon-upload-alt margin-correction"></i>upload signature image
                            </div>  -->  

                            <div class="footer-element upload-download btn btn-default" flow-init={singleFile:true} flow-name="theRoleData.flow" flow-file-added="!!{png:1,jpg:1,jpeg:1}[$file.getExtension()] && isPhotoSizeValid($file.size) && handleImage($file, $event, $flow)">
                                <%-- <img src="<%=appUrl%>/formhtml5/image/signature.png"> --%>
                                <img id="upload-sig-icon" flow-btn flow-attrs="{accept:'image/*'}" src="<%=appUrl%>/formhtml5/image/upload.png" title="Upload selected image as signature."> 
                                <%-- <img id="download-sig-icon" src="<%=appUrl%>/formhtml5/image/download.png" title="Download signature as image."> --%>
                                <!-- <div ng-show="$flow.files.length">
                                    <img style="max-height:100%" flow-img="theRoleData.flow.files[0]" />
                                </div>
                                <br><br>
                                <span>$flow.files.length = {{theRoleData.flow.files.length}}<br> $file.getExtension() = {{$file.getExtension()}}</span> -->
                            </div> 



                            

                            <div class="footer-element lock-icon">
                                <img ng-hide="!isSigned()" src="<%=appUrl%>/formhtml5/image/lock-icon.png"/>
                                <img ng-hide="isSigned()" src="<%=appUrl%>/formhtml5/image/unlock-icon.png"/>
                            </div>   

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
                            <div class="form-row">
                                <div class="input-text">
                                    <label for="{{theRoleData.id_name}}">${nameLbl}</label>  <!-- appraiser_name -->
                                    <input id="{{theRoleData.id_name}}" name="{{theRoleData.id_name}}" type="text" ng-model="theRoleData.roleNameModel" ng-readonly="theRole==='appraiser'" force-model-update/>
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="inputs-group">
                                    <div class="input-text">
                                        <label for="{{theRoleData.designation}}_sel">${designationLbl}</label>
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
                                    </div>

                                    <div class="input-text">
                                        <label for="{{theRoleData.aic_member_number}}" class="no-wrap">${memberNoLbl}</label>
                                        <input type="text" name="{{theRoleData.aic_member_number}}" id="{{theRoleData.aic_member_number}}" ng-model="theRoldData.aic_member_number_model" check-if-required-expr="sigDetailsAvail(theRoleData)" force-model-update/>
                                        <!-- <br>
                                        <span>certificationForm[{{theRoleData.aic_member_number}}].$error </span>
                                        <pre>{{certificationForm[theRoleData.aic_member_number].$error | json}}</pre> -->       
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-row" ng-controller="datePickerController">
                                <div class="input-text">
                                    <!-- <input type="text" id="date_signed_appraiser" name="date_signed_appraiser"> -->
                                    <label for="{{theRoleData.date_signed}}">${dateSignedLbl}</label>
                                    <input id="{{theRoleData.date_signed}}" name="{{theRoleData.date_signed}}" type="text" ng-min="triggerValidateDates()" uib-datepicker-popup="{{format}}" ng-model="theRoleData.date_signed_model" is-open="popup1.opened" datepicker-options="dateOptions" close-text="Close" alt-input-formats="altInputFormats" force-model-update/>
                                    <button type="button" class="btn btn-default" ng-click="open1()"><i class="glyphicon glyphicon-calendar"></i></button>
                                </div>
                            </div>
                            
                            <!-- <div class='row' ng-controller="datePickerController"> -->
                                <!-- <input type="text" id="date_signed_appraiser" name="date_signed_appraiser"> -->
                                <!-- <label for="{{theRoleData.date_signed}}" class="col-xs-3 col-form-label vcenter">${dateSignedLbl}</label>
                                <div class="col-xs-4 input-group vcenter">
                                    <input id="{{theRoleData.date_signed}}" name="{{theRoleData.date_signed}}" type="text"
                                        ng-min="triggerValidateDates()" 
                                        class="form-control" uib-datepicker-popup="{{format}}" ng-model="theRoleData.date_signed_model" is-open="popup1.opened" datepicker-options="dateOptions" close-text="Close" alt-input-formats="altInputFormats" force-model-update/>
                                    <span class="input-group-btn">
                                      <button type="button" class="btn btn-default" ng-click="open1()"><i class="glyphicon glyphicon-calendar"></i></button>
                                    </span>
                                </div>
                            </div> -->
                            
                            <div class='form-row' ng-controller="datePickerController">
                                <div class="input-text">
                                    <label for="{{theRoleData.date_inspection}}">${dateOfInspectionLbl}</label>
                                    <input type="text" id="{{theRoleData.date_inspection}}" name="{{theRoleData.date_inspection}}" max="{{theRoleData.date_signed_model}}" uib-datepicker-popup="{{format}}" ng-model="theRoleData.date_inspection_model" is-open="popup1.opened" datepicker-options="dateOptions" close-text="Close" alt-input-formats="altInputFormats" force-model-update>
                                    <button type="button" class="btn btn-default" ng-click="open1()"><i class="glyphicon glyphicon-calendar"></i></button>
                                </div>
                                <span ng-show="certificationForm.{{theRoleData.date_signed}}.$error.dateSingedInspected" class="alert alert-danger">
                                    Date signed must be greater than or equal date of inspection.
                                </span>
                            </div>
                
                            <div class="form-row">
                                <div class="input-text">
                                    <label for="{{theRoleData.license_info}}">${licenseInfoLbl}</label>
                                    <input id="{{theRoleData.license_info}}" name="{{theRoleData.license_info}}" ng-model="theRoleData.license_info_model" type="text">
                                    <br>
                                </div>
                            </div>

                            <span class="note">${noteTxt}</span>
                            
                        </fieldset>

                    </div>
                </div>
                <!-- end of APPRAISER/SUPERVISOR SIGNATURE -->


                <!-- HIDDEN -->
                <%-- 
                <div class="signature-wrapper report-section-column" ng-controller="sig-pad as supervisorSignature" ng-init="setSupervisor()">
                    

                    <div id='signature-pad' class="m-signature-pad break">
                        <div class="m-signature-pad--body">
                            <h4><%=supervisorSignatureLbl%></h4>
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
                </div>    
                --%>    
                <!-- end of HIDDEN -->           
    
            </div>  
            <!-- end of SIGNATURE CONTAINER -->
        </div>
        <!-- end of CONTAINER -->
    </div>
</fieldset> 

<c:if test="${(isFullView == 'Y')}">                        
    <p>&nbsp;</p>
</c:if>         

