	  <div id="title_area" class="text-center">
		
		<div class="form-title">
			<h1>${formTitle} </h1>
			<img id="loading-indicator" src="<%=appUrl%>/assets/img/loading.gif" style="display: none">	
		</div>

		<div class="file-number-top label label-info">
			<span>NAS#:&nbsp&nbsp</span>
			<span ng-bind="file_number"></span>
		</div>

		<div class="control-icons-group">
			<span class="control-icon">
				<img id="ngSaveBtn" 		ng-click="ngProcessSave()" 		src="<%=appUrl%>/formhtml5/image/save.png" 		 title="${saveBtnName}"> 
			</span>
			<span class="control-icon">
	            <img id="ngReviewBtn" 		ng-click="ngProcessReview()" 	src="<%=appUrl%>/formhtml5/image/review.png" 	 title="${reviewBtnName}">				  	
			</span>
			<span class="control-icon">
				<img id="ngCompleteBtn" 	ng-click="ngProcessComplete()" 	src="<%=appUrl%>/formhtml5/image/complete.png" 	 title="${completeBtnName}">	
			</span>
			<span class="control-icon">
				<img id="ngPreviewBtn" 		ng-click="ngProcessPreview()" 	src="<%=appUrl%>/formhtml5/image/preview.png" 	 title="${previewBtnName}">	
			</span>
			<span class="control-icon">
				<img id="workAsPdfBtn" 										src="<%=appUrl%>/formhtml5/image/offlinepdf.png" title="${workAsPdfBtnName}">	
			</span>
			<span class="control-icon">
				<img id="ngSwithchViewBtn" 	ng-click="ngSwitchView()" 		src="<%=appUrl%>/formhtml5/image/switchview.png" title="Full View">	
			</span>
		</div>


			<!-- OLD --> 
			<!--
			  <span>		  	  			  
			  	  <font size="5">${formTitle} 
			-->  
			  	  <!-- <c:out value="${currFormId}"/>  -->
			<!--  	  
			  	  <img id="loading-indicator" src="<%=appUrl%>/assets/img/loading.gif" style="display: none">	
			  	  </font>
			  	  
				  <font size="2">			  
					  <img id="ngSaveBtn" ng-click="ngProcessSave()" src="<%=appUrl%>/formhtml5/image/save.png" title="${saveBtnName}"
					  	style="position: relative; left:100px; bottom:1px; width:50px; height:50px;"> 
					  <img id="ngReviewBtn" ng-click="ngProcessReview()" src="<%=appUrl%>/formhtml5/image/review.png" title="${reviewBtnName}"
					  	style="position: relative; left: 105px; bottom:0.5px; width:50px; height:50px;">				  	
					  <img id="ngCompleteBtn" ng-click="ngProcessComplete()" src="<%=appUrl%>/formhtml5/image/complete.png" title="${completeBtnName}"
					  	style="position: relative; left: 110px; bottom:1px; width:50px; height:50px;">	
					  <img id="ngPreviewBtn" ng-click="ngProcessPreview()" src="<%=appUrl%>/formhtml5/image/preview.png" title="${previewBtnName}"
					  	style="position: relative; left: 115px; bottom:1px; width:50px; height:50px;">	
					  <img id="workAsPdfBtn" src="<%=appUrl%>/formhtml5/image/offlinepdf.png" title="${workAsPdfBtnName}"
					  	style="position: relative; left: 120px; bottom:1px; width:50px; height:50px;">	
					  <img id="ngSwithchViewBtn" ng-click="ngSwitchView()" src="<%=appUrl%>/formhtml5/image/switchview.png" title="Full View"
					  	style="position: relative; left: 120px; bottom:1px; width:42px; height:42px;">			  					  				  				  
				  </font>	
				  		  
				  <span class="file-number-top"><label>NAS#:&nbsp&nbsp</label><span ng-bind="file_number"></span></span>		   	 
			  </span>
			  -->
	  </div>