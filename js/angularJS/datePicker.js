var app = angular.module('myApp');
app.requires.push('ngAnimate');
app.requires.push('ui.bootstrap');
app.controller('datePickerController', function ($scope) {
	$scope.popup1 = {
		opened: false
	};
	$scope.open1 = function() {
		//JIRA: NE-2297 - On in IE, Date Picker can be edited after locked.
		//      Do not open picker if signed.
		if (!$scope.isSigned()) {
			$scope.popup1.opened = true;
		}
	}
	$scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate', 'dd/MM/yyyy'];
	$scope.format = $scope.formats[4];
	$scope.altInputFormats = ['d!/M!/yyyy'];	
	$scope.dateOptions = {
		dateDisabled: disabled,
		formatYear: 'yy',
		maxDate: new Date(2020, 5, 22),
		minDate: new Date(1900, 1, 1),
		startingDay: 1
	};
	
	$scope.MainController.checkDate = function () {
		var myScope = $scope;
	}
	
	$scope.$watch('theRoleData.date_signed_model', validateDates);
	$scope.$watch('theRoleData.date_inspection_model', validateDates);
	function validateDates() {
		var theRoleData = $scope.theRoleData;
		var dateSignedField = $scope.certificationForm[theRoleData.date_signed];
		var dateInspectionField = $scope.certificationForm[theRoleData.date_inspection];
		var dateSigned = theRoleData.date_signed_model;
		var dateInspection = theRoleData.date_inspection_model;
		if ($scope.isValidationRequired === false) {
			return
		}
		if (!dateSigned || !dateInspection) {
			dateSignedField.$setValidity("dateSingedInspected", true);
			dateInspectionField.$setValidity("dateSingedInspected", true);
			return
		}
		if (dateInspection > dateSigned) {
			dateSignedField.$setValidity("dateSingedInspected", false);
			dateInspectionField.$setValidity("dateSingedInspected", false);
		} else {
			dateSignedField.$setValidity("dateSingedInspected", true);
			dateInspectionField.$setValidity("dateSingedInspected", true);
		}
	}
	$scope.triggerValidateDates = function () {
		validateDates();
		return null;
	}
// Disable weekend selection
	function disabled(data) {
		var date = data.date,
		mode = data.mode;
		//return mode === 'day' && (date.getDay() === 0 || date.getDay() === 6);
		return false;
	}
})