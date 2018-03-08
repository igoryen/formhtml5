	<div ng-hide="true" ng-init="
    			additionalImages = 
    			{photos:
    				[
    				 {fieldName:'additional_image1', title:'${photoLbl} 1', imageDescribeField: 'additional_image_describe1'},
    				 {fieldName:'additional_image2', title:'${photoLbl} 2', imageDescribeField: 'additional_image_describe2'},
    				 {fieldName:'additional_image3', title:'${photoLbl} 3', imageDescribeField: 'additional_image_describe3'},
    				 {fieldName:'additional_image4', title:'${photoLbl} 4', imageDescribeField: 'additional_image_describe4'},
    				 {fieldName:'additional_image5', title:'${photoLbl} 5', imageDescribeField: 'additional_image_describe5'},
    				 {fieldName:'additional_image6', title:'${photoLbl} 6', imageDescribeField: 'additional_image_describe6'}
    				],
    			labels: {
                    dragAndDropLbl1: '${dragAndDropLbl1}',
    			 	dragAndDropLbl2: '${dragAndDropLbl2}',
    			 	selectImageLbl: '${selectImageLbl}',
    			 	changeImageLbl: '${changeImageLbl}',
    			 	removeImageLbl: '${removeImageLbl}',
    			 	descriptionLbl: '${descriptionLbl}'
    			 	}
    			};
				">
	</div>
	<div photo-list-upload list-data="additionalImages" file-number="file_number" images-model="MainController.imagesModel" images-describe-model="MainController.imagesDescribeModel">
   	</div>
	<c:if test="${(isFullView == 'Y')}">						
		<p>&nbsp;</p>
	</c:if>