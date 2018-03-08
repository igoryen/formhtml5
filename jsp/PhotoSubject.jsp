
	<div ng-hide="true" ng-init="
    			myListData = 
    			{photos:
    				[
    				 {fieldName:'subject_front', title:'${photoSubjectFront}'},
    				 {fieldName: 'subject_street', title: '${photoSubjectStreet}'},
    				 {fieldName: 'subject_rear', title: '${photoSubjectRear}'}
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
	<c:if test="${(isFullView == 'Y')}">						
		<p>&nbsp;</p>
	</c:if>					