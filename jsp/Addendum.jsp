			<div id="addendum_area">
			<fieldset class="fieldstyle" style="margin-left: 10px;"   ng-disabled="isAppraiserSigned()" check-if-required>					
				<legend class="legendstyle" ng-click="toggleElement('text_addendum', $event)">&nbsp;-&nbsp;TEXT ADDENDUM</legend>
				<div class="formColumn" ng-hide="oToggleElementList['text_addendum']" style="width: 100%; margin:5px;">  
					<textarea id="addendum" name="addendum" ng-model="addendum" placeholder="COMMENTS:"
					 rows="30" cols="110"  style="width: 98%; line-height: 20px;"></textarea>
				</div>		
			</fieldset>
			<p>&nbsp;</p>	
			<fieldset class="fieldstyle" style="margin-left: 10px;"   ng-disabled="isAppraiserSigned()" check-if-required>
				<legend class="legendstyle" ng-click="toggleElement('image_addendum', $event)">&nbsp;-&nbsp;IMAGE ADDENDUM</legend>
				<div class="formColumn" ng-hide="oToggleElementList['image_addendum']" style="width: 100%; margin:5px;">  
					<input id="dummy_field_01" style="display: none">
					<p>Under construction!</p>
				</div>			
			</fieldset>
			</div>