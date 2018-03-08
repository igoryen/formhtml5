/**
 * Construction Stage Controller
 */
var app = angular.module('myApp');

app.controller('constructionStageCtrl', 
	['$scope', '$http',
    function ($scope, $http) {
		var serverUrl = getServerUrl();
		//console.log("serverUrl: " + serverUrl);
		
		/*var sAppURL = getAppURL();
		var sLang = getFormLanguage();
		var sUrl = "";
		var jsonResourceCmdUrl = "";
		
		console.log("sLang:" + sLang);  

		//Get Construction Stage default values based on Language and save result in master variable
		if(sLang == "EN") {
			sUrl = '/formhtml5/data/ConstructionStage_EN.json';
		} else if(sLang == "FR") {
			sUrl = '/formhtml5/data/ConstructionStage_FR.json';
		}
		jsonResourceCmdUrl = sAppURL 
		+ "/CommandServlet?command=getjsonresource&jsonResourceUrl="
		+ sUrl;
		$.ajax({
			async: false,
		    type: 'GET',
			url: jsonResourceCmdUrl,
			success: function(data, status) {
				//Save copy in master variabel for later use
				$scope.constructionStageMaster = data.records;
			 }
		});

		//Get empty values for consturction stage and store it in the related variable
		sUrl = '/formhtml5/data/ConstructionStage.json';
		jsonResourceCmdUrl = sAppURL 
		+ "/CommandServlet?command=getjsonresource&jsonResourceUrl="
		+ sUrl;
		$.ajax({
		     async: false,
		     type: 'GET',
			 url: jsonResourceCmdUrl,
			 success: function(data, status) {
				$scope.constructionStageEmpty = data.records;
			 }
		});*/
		
		//Set the main construction stage variable based on process type
		if (process == "req") { // This is a request, means it was never saved
			//JIRA: NE-2143 - set the table value based on the property type value
			//TODO: this code part need to be reviewed.
			//$scope.MainController.constructionStage = angular.copy($scope.MainController.constructionStageMaster);
			$scope.setConstructionStage();
		} else
		if(process == "save" || process == "clone" || process == "update") {
			//In this case, set construction stage table to empty table
			//This is needed to create an empty table to allow loading of element values using function "initFieldWithDefault()"
			$scope.MainController.constructionStage = angular.copy($scope.MainController.constructionStageEmpty);
		}
		//*************** old code to get construction stage default values
		/*if(process == "req") {
			if(sLang == "EN") {
				sUrl = '/formhtml5/data/ConstructionStage_EN.json';
			} else if(sLang == "FR") {
				sUrl = '/formhtml5/data/ConstructionStage_FR.json';
			}
		} else if(process == "save" || process == "clone" || process == "update") {
			sUrl = '/formhtml5/data/ConstructionStage.json';
		}
		console.log('sUrl = ', sUrl);
		jsonResourceCmdUrl = sAppURL 
			+ "/CommandServlet?command=getjsonresource&jsonResourceUrl="
			+ sUrl;
		$.ajax({
		    async: false,
		    type: 'GET',
			url: jsonResourceCmdUrl,
			success: function(data, status) {
				$scope.constructionStage = data.records;
				$scope.constructionStageMaster = angular.copy();
			}
		});*/
		//*************
		
		/* The following code is Angular way to do http get call. 
		 *It is sync way and will run after document ready and cause issue.
		 */
/*		$http.get(encodeURI(jsonResourceCmdUrl))
		.then(function(response) {
			//debugger;
			//console.log('$http.get - response.data.records = ', response.data.records)
			//console.log('$http.get - $scope.constructionStage = ', $scope.constructionStage)

			$scope.constructionStage = response.data.records;

			console.log("The response is ok.");
		});*/
		
		$scope.getTotalCompleted = function (x) {
			var result;
			result = x.Allowed * x.Completed / 100
			//result = toEmptyIfZero(result);
			x.TotalCompleted = result;
			return result;
		}
		
		//debugger;
		$scope.getEstimatedCodeToComplete = function() {
			var result;
			//debugger;
			result = $scope.pi_total_cost_of_construction * ($scope.pi_total_allowed - $scope.pi_total_total) / 100;
			//result = toEmptyIfZero(result);
			$scope.pi_estimated_cost_to_complete = result;
			return  result;
		}
	
}])