
	<div ng-hide="true" ng-init="
    			myListData = 
    			{photos:
    				[{fieldName:'subject_front',
    				  title:'${photoSubjectFront}'},
    				 {fieldName: 'subject_street',
    				  title: '${photoSubjectStreet}'},
    				 {fieldName: 'subject_rear',
    				  title: '${photoSubjectRear}'}
    				],
    			 labels: {dragAndDropLbl1: '${dragAndDropLbl1}',
    			 		  dragAndDropLbl2: '${dragAndDropLbl2}',
    			 		  selectImageLbl: '${selectImageLbl}',
    			 		  changeImageLbl: '${changeImageLbl}',
    			 		  removeImageLbl: '${removeImageLbl}'
    			 		  }
    			};
				">
	</div>
			
   	<div photo-list-upload list-data="myListData" file-number="file_number" images-model="MainController.imagesModel" 
   			fieldset-class="fieldset-photos-subject" container-class="photos-container-subject" photo-class="property-photo-subject">
   	</div>
   	<%-- <fieldset class="fieldstyle fieldset-photos-subject" ng-disabled="isAppraiserSigned()">
   		<legend class="legendstyle" ng-click="toggleElement('photoSubject', $event)">&nbsp;-&nbsp;PHOTO</legend>
	    	<div ng-hide="oToggleElementList['photoSubject']" class="photos-container photos-container-subject"
	    			ng-init="
	    			photosSubject = 
	    				[{fieldName:'subject_front',
	    				  title:'${photoSubjectFront}'},
	    				 {fieldName: 'subject_street',
	    				  title: '${photoSubjectStreet}'},
	    				 {fieldName: 'subject_rear',
	    				  title: '${photoSubjectRear}'}
	    				];
	    				MainController.subjectImages = {}">
		 		<div class="photo-wrapper"  ng-controller="photosController" ng-repeat="photo in photosSubject"
		 			ng-class="{'pointer': !isAppraiserSigned(), 'no-pointer': isAppraiserSigned()}" 
		 			flow-init="{ query: getFlowQuery }"
			      	flow-file-added="(!isAppraiserSigned() || !photoLoadingDone) && isPhotoSizeValid($file.size) && !!{png:1,jpg:1,jpeg:1}[$file.getExtension()]"
			      	flow-files-submitted="doUpload()"
		 			flow-file-added="someHandlerMethod($file, $event, $flow)">
					<h4 class='photo-title'>{{photo.title}}</h4>
			 		<div class="property-photo property-photo-subject" ng-hide="isImageAvailable()" flow-drop
				        flow-drag-enter="isAppraiserSigned()?style={}:style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style"
				        flow-btn flow-attrs="{accept:'image/*'}" >
				        <div class="drag-drop-photo">
				        </div>
				    	<div class='drag-drop-lbl'>
				    		<span>${dragAndDropLbl1}</span>
				    		<span>${dragAndDropLbl2}</span>
				    	</div>
				  	</div>
				  	<div class="property-photo property-photo-subject" flow-drop ng-show="isImageAvailable()" 
				  		flow-drag-enter="isAppraiserSigned()?style={}:style={border:'4px solid green'}" flow-drag-leave="style={}" ng-style="style">
				    	<img id="{{ photo.fieldName }}_image" style="max-height:100%" ng-src='{{ getImageURI() }}' />
				        <input id="{{ photo.fieldName }}" name = "{{ photo.fieldName }}" ng-hide="true" type="text" ng-model="MainController.subjectImages[ photo.fieldName ]" load-photo force-model-update/>
				        {{ photo.fieldName }}
				  	</div>
				  	<div>
					    <a href="javascript:void(0);" class="btn" ng-hide="isImageAvailable()" flow-btn flow-attrs="{accept:'image/*'}">${selectImageLbl}</a>
					    <a href="javascript:void(0);" class="btn" ng-show="isImageAvailable()" flow-btn flow-attrs="{accept:'image/*'}">${changeImageLbl}</a>
					    <a href="javascript:void(0);" class="btn btn-danger" ng-show="isImageAvailable()"
					       ng-click="removeFile()">${removeImageLbl}</a>
					</div>
			  	</div>
			</div>
	</fieldset> --%>
	<c:if test="${(isFullView == 'Y')}">						
		<p>&nbsp;</p>
	</c:if>					