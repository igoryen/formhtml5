<!DOCTYPE html>

<html lang="EN">

<%@ include file="FormHeader.jsp" %>

<body ng-app="myApp" ng-controller="formMainController as MainController" flow-init flow-prevent-drop resize>   
	
	<div class="container" ng-init='initLabels()'>
		
	  <%@ include file="ConfigArea.jsp" %>
	  
	  <%@ include file="MessageArea.jsp" %>

	  <%@ include file="TitleArea.jsp" %>
      
	  <div id="tab_area" ng-form="mainForm">
			
		  <c:if test="${(isFullView != 'Y')}">	
			 <%@ include file="TabControl.jsp" %>
		  </c:if>
		  		
			<!-- Full View -->									
			<c:if test="${(isFullView == 'Y')}">
			
			  	<div class="tab-content">
	
					<%@ include file="PropertyInformation.jsp" %>												
					<%@ include file="PIForm.jsp" %>
							 
		 			<div watchvisible ng-form="certificationForm">
						<%@ include file="Certification.jsp" %>
					</div>	
									
					<div ng-form="photosForm" ng-init="MainController.additionalImages = {}; MainController.additionalImagesDecache = {}">
						<%@ include file="Photo.jsp" %>
					</div>
					
					<div ng-init="doShowLiveMap()" ng-form = "mapForm">							
						<%@ include file="LocationMap01.jsp" %>											
					</div>					
					
				</div>	
					
																
			</c:if>	
			
			<!-- Tab View -->
			<c:if test="${(isFullView != 'Y')}">
			
				<div class="tab-content">
	
					<div id="property_info_tab" class="tab-pane fade in active" ng-form="homeForm">
						<%@ include file="PropertyInformation.jsp" %>
					</div>	
																
					<div id="pi_form_tab" class="tab-pane fade">
						<%@ include file="PIForm.jsp" %>
					</div>
	
					<div id="certification_tab" class="tab-pane fade" watchvisible ng-form="certificationForm">			 
						<%@ include file="Certification.jsp" %>	
					</div>							
					
					<div id="photo_tab" class="tab-pane fade" ng-form="photosForm" ng-init="MainController.additionalImages = {}; MainController.additionalImagesDecache = {}">
						<%@ include file="Photo.jsp" %>		    	
					</div>
			    					
			    	<div id="location_map_tab" ng-init="doHideLiveMap();" class="tab-pane fade" ng-form = "mapForm">		
						<%@ include file="LocationMap01.jsp" %>	  		    	
			    	</div>
			    				    					
      			</div>
								
			</c:if>				
					  
	  </div>
	  
	  <!-- The google map div has to be root div  -->
	  	  
	  
	  <c:if test="${(isFullView != 'Y')}">
	  	<%@ include file="LocationMap02.jsp" %>
	  </c:if>
	  
	  <c:if test="${(isFullView == 'Y')}">				
		<%@ include file="LocationMap02.jsp" %>												
	  </c:if>				   
	  
	  <%@ include file="ContainerFooter.jsp" %>
	  	  	      
	</div>
	
	<%@ include file="Dialog.jsp" %>
	
</body>

</html>




