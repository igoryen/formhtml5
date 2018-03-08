		  <ul  class="nav nav-pills">
		  
		    <li class="active" ng-class="{'ng-invalid':mainForm.homeForm.$invalid && mainPromiseResolved}" ng-init="doHideLiveMap();" ng-click="doHideLiveMap(); setActiveTabHome();"><a data-toggle="pill" href="#property_info_tab">${homeTabName}</a></li>
		    
		    <c:if test="${(currFormId eq PROGRESS_INSPECTION_EN_FORMID) || (currFormId eq PROGRESS_INSPECTION_FR_FORMID)}">
		    	<li ng-class="{'ng-invalid':mainForm.serviceForm.$invalid && mainPromiseResolved}" ng-click="doHideLiveMap(); setActiveTabServices();"><a data-toggle="pill" href="#pi_form_tab">${servicesTabName}</a></li>
		    </c:if>
		    
		    <c:if test="${(currFormId eq DRIVEBY_SERVICE_CUSPAP_EN_FORMID) || (currFormId eq DRIVEBY_SERVICE_CUSPAP_FR_FORMID)}">
		    	<li ng-class="{'ng-invalid':mainForm.serviceForm.$invalid && mainPromiseResolved}" ng-click="doHideLiveMap(); setActiveTabNeighbourhood();"><a data-toggle="pill" href="#neighbourhood_tab">${neighbourhoodSiteImprovementsTabName}</a></li>
		    	<li ng-class="{'ng-invalid':mainForm.serviceForm.$invalid && mainPromiseResolved}" ng-click="doHideLiveMap(); setActiveTabComparable();"><a data-toggle="pill" href="#comparable_tab">COMPARABLE</a></li>		    	
		    	<li ng-class="{'ng-invalid':mainForm.serviceForm.$invalid && mainPromiseResolved}" ng-click="doHideLiveMap(); setActiveTabDefinition();"><a data-toggle="pill" href="#definition_tab">DEFINITION</a></li>	    	
		    </c:if>	
		    	    
		    <li ng-class="{'ng-invalid':mainForm.certificationForm.$invalid && mainPromiseResolved}" ng-click="redrawCanvas(); doHideLiveMap(); setActiveTabCertification();"><a data-toggle="pill" href="#certification_tab">${certificationTabName}</a></li>
		    <li ng-class="{'ng-invalid':mainForm.photosForm.$invalid && mainPromiseResolved}" ng-click="doHideLiveMap(); setActiveTabPhoto();"><a data-toggle="pill" href="#photo_tab">${photoTabName}</a></li>
		    <li ng-class="{'ng-invalid':mainForm.mapForm.$invalid && mainPromiseResolved}" ng-click="doShowLiveMap(); setActiveTabLocationMap();"><a data-toggle="pill" href="#location_map_tab">${locationTabName}</a></li>
		    
		    <c:if test="${(currFormId eq DRIVEBY_SERVICE_CUSPAP_EN_FORMID) || (currFormId eq DRIVEBY_SERVICE_CUSPAP_FR_FORMID)}">
		    	<li ng-class="{'ng-invalid':mainForm.serviceForm.$invalid && mainPromiseResolved}" ng-click="doHideLiveMap(); setActiveTabAddendum();"><a data-toggle="pill" href="#addendum_tab">ADDENDUM</a></li>	
		    </c:if>	   
		    
		  </ul>