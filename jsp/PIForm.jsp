
				<fieldset class="fieldstyle" ng-disabled="isAppraiserSigned()" check-if-required>
			      <legend class="legendstyle">&nbsp;SERVICES</legend> 
			      <font size="3" class='input-option-box-style1'>
			      	  <label>Completed :</label><br>   
					  <input type="checkbox" id="pi_septic_installed" value="1">${septicLbl}&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_sanitary_installed" value="1">${sanitarySewerLbl}&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_storm_installed" value="1">${stormSewerLbl}&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_municipal_installed" value="1">${municipalWaterLbl}&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_well_installed" value="1">${wellLbl}&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_curb_installed" value="1">${curbAndGutterLbl}&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_paved_installed" value="1">${pavedRoadLbl}&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" id="pi_sidewalk_installed" value="1">${sideWalkLbl}&nbsp;&nbsp;&nbsp;&nbsp;
				  </font>
				</fieldset>
				<p>&nbsp;</p>				
		    	<fieldset class="fieldstyle" id="constructionStageFieldset" ng-disabled="isAppraiserSigned()" check-if-required>
		    		<!-- <span>pi_construction_type_model = {{pi_construction_type_model}}</span> -->
		    		<legend class="legendstyle">&nbsp;CONSTRUCTION STAGE</legend>
					<div  ng-controller="constructionStageCtrl"> 
						<!-- <input type="text" id="constructionStageLen" value="{{constructionStage.length}}">  -->  
						<div class="table-responsive">	
							<table class="table table-striped table-bordered table-hover table-full-width" id="consturctionStage">
								<thead>
									<tr>
										<td>${constructionStageLbl}</td>
										<td>${allowedLbl}</td>
										<td>${completedLbl}</td>
										<td>${totalCompletedLbl}</td>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="x in MainController.constructionStage">
									  <td><input id="construction_stage_title_{{$index+1 | numberFixedLen:2}}" width="100px" type="text" ng-class="{'labelForInput': pi_construction_type_model == 'New Construction'}" class="construction-stage-title" ng-readonly="pi_construction_type_model == 'New Construction'" ng-model="x.StageDesc" force-model-update /><br></td>
									  <td><input id="construction_stage_allowed_{{$index+1 | numberFixedLen:2}}" type=number ng-model="x.Allowed" force-model-update empty-if-zero/></td>
									  <td>
									    <!-- <input id="construction_stage_complete_{{$index+1 | numberFixedLen:2}}" type="number" ng-model="x.Completed" min="0" max="100" enable-validation="isValidationRequired" force-model-update empty-if-zero /> -->
									    <input id="construction_stage_complete_{{$index+1 | numberFixedLen:2}}" type="number" name="construction_stage_complete_{{$index+1 | numberFixedLen:2}}" ng-model="x.Completed" min="0" max="100" force-model-update empty-if-zero />
									  </td>
									  <td>
									  	<!-- created two input fields first one is hidden. This is to display calculated results with proepr formatting -->
									    <input id="construction_stage_total_complete_{{$index+1 | numberFixedLen:2}}" type="number" ng-model="x.TotalCompleted" ng-value="getTotalCompleted(x)" ng-readonly="true" ng-hide="true"/>
									    <input id="disp_construction_stage_total_complete_{{$index+1 | numberFixedLen:2}}" type="text" value="{{getTotalCompleted(x) | number:2 | emptyIfZeroValue}}" ng-readonly="true" />
									  </td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td>Total</td>
										<td>
										   <!-- <input id="pi_total_allowed" name="pi_total_allowed" ng-model="pi_total_allowed" type="number" pi_total_allowed" min="0" max="100" enable-validation="isValidationRequired" ng-value="pi_total_allowed = (constructionStage | sumOfValue:'Allowed'); pi_total_allowed" ng-readonly="true"> -->
										   <input id="pi_total_allowed" name="pi_total_allowed" ng-model="pi_total_allowed" type="number" pi_total_allowed" min="0" max="100" ng-value="pi_total_allowed = (MainController.constructionStage | sumOfValue:'Allowed'); pi_total_allowed" ng-readonly="true" empty-if-zero>
									    </td>
										<td></td>
										<td>
											<input id="pi_total_total" name="pi_total_total" ng-model="pi_total_total" value="{{pi_total_total = (MainController.constructionStage | sumOfValue:'TotalCompleted')}}" ng-readonly="true" ng-hide="true"/>
											<input id="disp_pi_total_total" type="text" value="{{pi_total_total | number:2 | emptyIfZeroValue}}" ng-readonly="true"/>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
						<label for="pi_total_cost_of_construction">${totCostOfConstructionLbl}</label>
						<input id="pi_total_cost_of_construction" name="pi_total_cost_of_construction" type="number" ng-model="pi_total_cost_of_construction" empty-if-zero force-model-update />
						
						<label for="pi_estimated_cost_to_complete">${estimatedCostLbl}</label>
						<input id="pi_estimated_cost_to_complete" name="pi_estimated_cost_to_complete" type="number" ng-model="pi_estimated_cost_to_complete" ng-value="getEstimatedCodeToComplete()" ng-readonly="true" ng-hide="true"/>
						<input id="disp_pi_estimated_cost_to_complete" type="text" value="{{pi_estimated_cost_to_complete | number:2 | emptyIfZeroValue }}" ng-readonly="true"/>
						<!-- <pre>{{constructionStage | json}}</pre> -->			
					</div>
				</fieldset>
				<p>&nbsp;</p>						
		    	<fieldset class="fieldstyle" ng-disabled="isAppraiserSigned()" check-if-required>		    			
					   <legend class="legendstyle">&nbsp;${complianceLbl}</legend>					

					   ${complianceLine1Txt}<br>${complianceLine2Txt}<br>					   
					   <div class="formColumn">					   
						   <input class="inputstyle" 
						          type = "radio"
						          name = "pi_compliance"
						          id = "pi_compliance"
						          value = "Yes"
						          checked = "checked" />
						   <label for = "sizeYes">${yesLbl}</label>        
						   <input class="inputstyle"
						   		  type = "radio"
						          name = "pi_compliance"
						          id = "pi_compliance"
						          value = "No" />             
						   <label for = "sizeNo">${noLbl}</label> 
					   <div class="formColumn">

					   <br>
				</fieldset>
				<p>&nbsp;</p>
				<fieldset class="fieldstyle" ng-disabled="isAppraiserSigned()" check-if-required>		   
					   <legend class="legendstyle">&nbsp;${commentsLbl}</legend>
					   <div> 	
							<textarea id="pi_comments" rows="5" cols="110"  style="width: 95%; line-height: 20px;"></textarea>
					   </div>  
				</fieldset>     					
