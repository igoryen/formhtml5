
	  <!-- JIRA: NE-2248 - make DIV elements disabled when signed  -->
	  
	  <!--  The following code for location map is relocated to LocationMap02.jsp
	  <fieldset class="fieldstyle" style="width: 98.8%; margin-left: 10px;" ng-hide="hideLiveMap" ng-disabled="isAppraiserSigned()" check-if-required>
		  <legend id="location_map_lengend" class="legendstyle" ng-click="toggleElement('location_map', $event)">&nbsp;-&nbsp;LOCATION MAP</legend>
		  <div id="map_area" ng-hide="oToggleElementList['location_map']" ng-disabled="isAppraiserSigned()" style="display: none; "></div>	
	  </fieldset>
	  
	  <c:if test="${(isFullView == 'Y')}">						
		<p>&nbsp;</p>
	  </c:if>	    	  
	  -->
	  
	  
	  <div id="pdf_area" style="display: none">	
		<object id= "pdf_obj" data="" width=100% height="850px">
		</object>  
	  </div>  	  
	  <br>
	  <c:if test="${(isFullView != 'Y')}">          
		  <div id="navigate_area"> 
			  <input id="previousBtn" class='largeButton' type='button' value="${previousBtnName}">
			  <input id="nextBtn" class='largeButton' type='button' value="${nextBtnName}">			  
		  </div>
	  </c:if> 