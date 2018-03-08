	  <fieldset id="map_area_02" class="fieldstyle" style="margin-left: 10px;"  ng-hide="hideLiveMap" ng-disabled="isAppraiserSigned()" check-if-required>
		  <legend id="location_map_lengend" class="legendstyle" ng-click="toggleElement('location_map', $event)">&nbsp;-&nbsp;LOCATION MAP</legend>
		  <div id="map_area" ng-hide="oToggleElementList['location_map']" ng-disabled="isAppraiserSigned()" style="display: none; "></div>	
	  </fieldset>
	  
	  <c:if test="${(isFullView == 'Y')}">						
		<p>&nbsp;</p>
	  </c:if>