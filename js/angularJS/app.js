
/**
 * app.js
 */
function toEmptyIfZero(theNumber) {
	var result;
	if (typeof theNumber === 'string') {
		result = theNumber.replace(/\,/g,"");
	} else {
		result = theNumber;
	}
	if (parseFloat(result) === 0 || !isFinite(result)) {
		result = "";
	}
	if (result != "") {
		result = theNumber;
	}
	return result;
}

(function () {
    'use strict';
     var app = angular.module('myApp', []);
     app.filter('sumOfValue', function() {
    		return function(data, key) {
    			//console.log(key);
    			if (angular.isUndefined(data) && angular.isUndefined(key))
    				return 0;
    			var sum = 0;
    			var itemVal=0;
    			angular.forEach(data, function(v, k) {
    				itemVal = parseFloat(v[key]);
    				if (!isFinite(itemVal)) {
    					itemVal = 0;
    				}
    				sum += itemVal;
    			});
    			return sum;
    		}
    	});
     app.filter('numberFixedLen', function () {
    	    return function(a,b){
    	        return(1e4+""+a).slice(-b);
    	    };
    	});
     app.filter('emptyIfZeroValue', function () {
    	 return function(theNumber) {
    		 var result;
    		 result = theNumber;
    		 result = toEmptyIfZero(result)
    		 return result;
    	 }
     })
})();