		    	<fieldset class="fieldstyle" ng-disabled="isAppraiserSigned()">
		    		<legend class="legendstyle" ng-click="toggleElement('photo', $event)">&nbsp;-&nbsp;PHOTO</legend>
					<!-- <span class='allowed-photos' >Only PNG,GIF,JPG files allowed.</span> -->
					<!-- <input type="button" value="Test Synch Load Photos" ng-click="syncPhotosLoad()"> -->
					<!-- <span>File Number: {{file_number}}</span> -->
					<div ng-hide="oToggleElementList['photo']">	
				    	<div class="photos-container" 
				    			ng-init="
					    			photosAdditional =
					    				[
					    				 {fieldName:'additional_image1', title:'${photoLbl} 1', imageDescribeField: 'additional_image_describe1'},
					    				 {fieldName:'additional_image2', title:'${photoLbl} 2', imageDescribeField: 'additional_image_describe2'},
					    				 {fieldName:'additional_image3', title:'${photoLbl} 3', imageDescribeField: 'additional_image_describe3'},
					    				 {fieldName:'additional_image4', title:'${photoLbl} 4', imageDescribeField: 'additional_image_describe4'},
					    				 {fieldName:'additional_image5', title:'${photoLbl} 5', imageDescribeField: 'additional_image_describe5'},
					    				 {fieldName:'additional_image6', title:'${photoLbl} 6', imageDescribeField: 'additional_image_describe6'}
					    				];
				    			">
					 		<div class="photo-wrapper"  ng-controller="photosController" ng-repeat="photo in photosAdditional"
					 			ng-class="{'pointer': !isAppraiserSigned(), 'no-pointer': isAppraiserSigned()}" 
					 			flow-init="{ query: getFlowQuery }"
						      	flow-file-added="(!isAppraiserSigned() || !photoLoadingDone) && isPhotoSizeValid($file.size) && !!{png:1,jpg:1,jpeg:1}[$file.getExtension()]"
						      	flow-files-submitted="doUpload()"
					 			flow-file-added="someHandlerMethod($file, $event, $flow)">
								<h4 class='photo-title'>photo.title</h4>
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
							        <!-- <input id="{{ imageFieldName }}" name = "{{ imageFieldName }}" ng-hide="true" type="text" ng-model="MainController.additionalImages[ imageFieldName ]" load-photo force-model-update/> -->
							        <input id="{{ imageFieldName }}" name = "{{ imageFieldName }}" ng-hide="true" type="text" ng-model="MainController.imagesModel[ imageFieldName ]" load-photo force-model-update/>
							  	</div>
							  	<div>
							  		<!-- BACKUP: ng-hide="$flow.files.length" -->
								    <a href="javascript:void(0);" class="btn" ng-hide="isImageAvailable()" flow-btn flow-attrs="{accept:'image/*'}">${selectImageLbl}</a>
								    <a href="javascript:void(0);" class="btn" ng-show="isImageAvailable()" flow-btn flow-attrs="{accept:'image/*'}">${changeImageLbl}</a>
								    <a href="javascript:void(0);" class="btn btn-danger" ng-show="isImageAvailable()"
								       ng-click="removeFile()">${removeImageLbl}</a>
								</div>
								<div ng-if= "MainController.imagesDescribeModel" class='photo-description'>
								  	<label class='description-lbl' for='{{photo.imageDescribeField}}'>${descriptionLbl}</label>
								  	<input class='description' id='{{photo.imageDescribeField}}' name='{{photo.imageDescribeField}}' type="text" ng-model="MainController.imagesDescribeModel[photo.imageDescribeField]" ng-required="isImageAvailable()" force-model-update/>
								</div>
						  	</div>
						</div>
					</div>
				</fieldset>
		<c:if test="${(isFullView == 'Y')}">						
			<p>&nbsp;</p>
		</c:if>				