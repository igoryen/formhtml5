/*
 * ng-signature-pad
 */
var app = angular.module('myApp');
app.requires.push('ngSignaturePad');
app.requires.push('ngAnimate');
app.requires.push('ui.bootstrap');
app.requires.push('flow');

/*app.config(['flowFactoryProvider', function (flowFactoryProvider) {
	  flowFactoryProvider.defaults = {
	    target: 'upload.php',
	    permanentErrors: [404, 500, 501],
	    maxChunkRetries: 1,
	    chunkRetryInterval: 5000,
	    simultaneousUploads: 4,
	    singleFile: true,
	  };
	  console.log('appSigPad config', flowFactoryProvider);	  
	  flowFactoryProvider.on('catchAll', function (event) {
		    console.log('appSigPad catchAll', arguments);
	  });
	  flowFactoryProvider.on('fileAdded', function(file, event){
		  debugger;
		  console.log('fileAdded', file, event);
		  //event.preventDefault();
		  //cancelBubble(event);
		  //event.stopPropagation();
		  file.pause();
		  //event.preventDefault();
		  //console.log('file upload was paused.');
		  return true;
	  });	  
}]);*/

//create the resize directive on the HTML document level
//this will link the window resize event with the actions to be done on 
//children level, meaning, on window resize, trigger certain events for all children.
app.directive('resize', function($window) {
	return {
		link: function (scope) {
				//console.log('resize - link');
				function onResize() {
					scope.$broadcast("resize::resize");
				}
				function cleanup() {
					angular.element($window).off('resize', onResize);
				}
				angular.element($window).on('resize', onResize);
				scope.$on('$destroy', cleanup);
				//onResize(); //call the resize function for the first time.
		}
	}
})

//
// This directive was used to trigger event on change of certain style attributes.
// It didn't work the way it was intended to work.
// The idea is to trigger action on show/hide of an element. But, was not lucky here.
/*app.directive('watchvisible', ['$timeout', function($timeout) {
	return {
		link: function(scope, elm, attr) {
			console.log('directive - watchvisible - elm = ', elm);
			console.log('directive - watchvisible - attr = ', attr);
			console.log('directive - watchvisible - elm.css(display) = ', elm.css('display'));
			scope.$watch(
				function() {
					console.log('inside watch function - elm.css(display)', elm.css('display'));
					console.log('elm[0].attr(id)', $(elm[0]).attr('id'));
					return  elm.css('display'); 
				}, 
				function(newValue, oldValue) {
					console.log('watchvisible directive - newValue = ', newValue);
					console.log('watchvisible directive - oldValue = ', oldValue);
					//$timeout(scope.$broadcast("resize::resize"), 500);
				}, true);
		}
	}
}])*/

//create the directive to handle the resize event when needed.
app.directive('redraw', ['$window', '$timeout', function ($window, $timeout) {
		return { 
			link: function (scope, elm, attr) {
				//console.log('resizable', scope);
				//console.log('$window', $window);
				//console.log('element', elm);
				var canvas = elm[0]; // .get(0);
				scope.$on('resize::resize', function () {
					//debugger;
					if (!canvas.offsetWidth && !canvas.offsetHeight) {
						//this means the canvas is hiddent.
						return;
					}
					//This function will handle the resize event and also redraws the image
					// When zoomed out to less than 100%, for some very strange reason,
					// some browsers report devicePixelRatio as less than 1
					// and only part of the canvas is cleared then.
					//debugger;
					var ratio =  Math.max($window.devicePixelRatio || 1, 1);
					//console.log('directive-redraw-link: element=', elm);
					//console.log('canvas =', canvas);
					var myDataURL = canvas.toDataURL();
					var context = canvas.getContext("2d");

					canvas.width = (canvas.offsetWidth || canvas.width) * ratio;
					canvas.height = (canvas.offsetHeight || canvas.height) * ratio;
					context.scale(ratio, ratio);
					var imageObj = new Image();
					imageObj.onload = function () {
						context.drawImage(this,0,0);
					};
					imageObj.src = myDataURL;
				})
				//console.log('inside redraw - link');
				//scope.$broadcast("resize::resize");
				$timeout(function ()  {
					scope.$broadcast("resize::resize");
				}, 250);
/*				scope.$watch(
					function() {
						return $(canvas).is(':visible') 
					}, function() {
					console.log('watch element visible');
					scope.$broadcast("resize::resize");
				});*/				
/*				scope.resizeCanvas = function () {
					// When zoomed out to less than 100%, for some very strange reason,
					// some browsers report devicePixelRatio as less than 1
					// and only part of the canvas is cleared then.
					var ratio =  Math.max($window.devicePixelRatio || 1, 1);
					var canvas = element.get(0);
					//console.log('canvas =', canvas);
					var myDataURL = canvas.toDataURL();
					var context = canvas.getContext("2d");
					canvas.width = canvas.offsetWidth * ratio;
					canvas.height = canvas.offsetHeight * ratio;
					context.scale(ratio, ratio);
					var imageObj = new Image();
					imageObj.onload = function () {
						context.drawImage(this,0,0);
					};
					imageObj.src = myDataURL;
				}
				scope.resizeCanvas();
				angular.element($window).bind('resize', function() {
					//console.log('Window Resize');
					scope.resizeCanvas();
				    scope.$apply();
				});		*/
			},
		}
}]);

app.directive('ngEnter', function () {
    return function (scope, element, attrs) {
        element.bind("keydown keypress", function (event) {
            if(event.which === 13) {
                scope.$apply(function (){
                	//debugger;
                    scope.$eval(attrs.ngEnter, {'event': event});
                });
 
                event.preventDefault();
            }
        });
    };
});

/*app.directive('passwordLock', ['$rootScope', function ($rootScope) {
	return { 
		link: function (scope, elm, attr) {
			console.log('directive - password-lock - link');
			console.log('elm=', elm);
			console.log('attr=', attr);
			debugger;
		}
	}
}]);*/

//Use directive 'bind-file' to get the details of the selected file from the input element
app.directive('bindFile', [function(){
	return {
		//require: 'ngModel', 	//This attribute 'data-ng-model' not required, it is specified just for future reference
		restrict: 'A',
		scope: {
			bindFile: '='	//This will bind to the specified value for the directive 'bind-file'
		},
		link: function (scope, el, attrs /*, ngModel*/) {
			el.bind('change', function (event){
				//This line of code is added for future reference
				//ngModel.$setViewValue(event.target.files[0]);
				//debugger;
				var result = {}; //This is the object that will have all data related to the file
				result.keystoreFile = event.target.files[0]; //The selected file from the input element
				var reader = new FileReader();
				reader.onload = function (loadEvent) {
					//Must use apply function since the event is executed outside the scope of Angular
					scope.$apply(function (){
						scope.bindFile.keystoreFileData = loadEvent.target.result;
					})
				}
				reader.readAsDataURL(event.target.files[0]);
				scope.bindFile.keystoreFile = result.keystoreFile;
			})
		}
	}
}]);


app.controller('sig-pad', ['$scope', '$http', '$rootScope', 'signatureLocking', '$uibModal', '$log', 
               function ($scope, $http, $rootScope, signatureLocking, $uibModal, $log) {

	//debugger;
	$scope.sigDetailsAvail = function (prmRoleData) {
		var myScope = $scope;
		//Check if Signature Details Available
		//Return true if the there is value on the Name Field
		var result = !!prmRoleData.roleNameModel
		return result;
	}
	$scope.handleImage = function ($file, $event, $flow) {
		//debugger;
		//console.log('someHandlerMethod', $event.target.parentNode);
		var theSig = $scope.signature;
		//var theCanvas = theSig._canvas;
		//var ctx = theSig._ctx;
		//$scope.signature.fromDataURL($scope.signature._canvas.toDataURL())
		/*var theImg = new Image();
		theImg.onload = function () {
			ctx.drawImage(theImg, 0, 0, theImg.width, theImg.height, 0, 0, theCanvas.width, theCanvas.height);
			theSig.fromDataURL(theSig._canvas.toDataURL('image/png'));
			URL.revokeObjectURL(theImg.src)
		}
		theImg.src = URL.createObjectURL($file.file);*/
		$scope.clear();
		var reader = new FileReader();
		reader.onload = function (loadEvent) {
			theSig.fromDataURL(loadEvent.target.result);
		}
		reader.readAsDataURL($file.file);
		return false;
	}
	//$scope.$on('flow::fileAdded', function (event, $flow, flowFile) {
		//console.log('appSigPad - flow::fileAdded - appraiser signature', event, $flow, flowFile);
		//$scope.processFile(flowFile);
		//console.log('event.target = ', event.target);			  				  
		//flowFile.pause();
		//event.preventDefault();//prevent file from uploading
	//});
	$scope.counter =0;
	$scope.appraiser_designation = null;
/*	$scope.$watch('signature', function () {
	    console.log('signature', $scope.signature)
	    $scope.changeName = function () {
	    	$scope.firstName = "Tarek";
	    	$scope.lastName = "Faham";
	    };
	})*/
	$scope.changeName = function () {
		$scope.firstName = "Tarek";
		$scope.lastName = "Faham";
	    };
    $scope.fullName = function () {
    	return $scope.firstName + " " + $scope.lastName;
	};
/*	$scope.testClick = function(theSign) {
		console.log(theSign);
		console.log($scope.signature._canvas.toDataURL());
		return ($scope.signature._canvas.toDataURL());
	}*/
/*	$scope.getDataURL = function () {
		if ($scope.signature) {
			return ($scope.signature._canvas.toDataURL());
		} else {
			$scope.counter++;
			console.log('signature is empty - ' , $scope.counter);
			return '';
		}
	}*/
	$scope.clear = function () {
		if (!$scope.isSigned()) {
			$scope.signature.clear();
			if ($scope.theRoleData && $scope.theRoleData.flow) {
				$scope.theRoleData.flow.cancel();
			}
		}
	}
	$scope.save = function () {
	    window.open($scope.signature.toDataURL());
	}
	$scope.isSigned = function () {
		if ($scope.password2 === "" || $scope.password2 === undefined) {
			$scope.password2 = null;
		}
		return ($scope.password2 !== null);
	}
	//var BLANK_PNG = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==";
	var BLANK_PNG = "";
	var BLANK_IMG_URL = "//:0";
	$scope.signatureDataURL = function () {
		//console.log('in function signatureDataURL - $scope.isSigned() = ', $scope.isSigned());
		//console.log('$scope.signature.isEmpty() = ', $scope.signature?$scope.signature.isEmpty():true);
		var result=BLANK_PNG;
		if ($scope.isSigned() && $scope.signatureBase64) {
			result = "data:image/png;base64," + $scope.signatureBase64;
		}
		else if(!$scope.isSigned() || ($scope.signature && $scope.signature.isEmpty())) {
			//console.log('blank image');
			result = BLANK_PNG;
		} else if ($scope.signature && $scope.signature.toDataURL) {
			//console.log('there is image');
			result = $scope.signature.toDataURL();
		}
		if (result == BLANK_PNG) {
			result = BLANK_IMG_URL;
		}
		return result;
	}
	$scope.signatureB64 = function() {
		//console.log('in function signatureB64 - $scope.signature = ', $scope.signature);
		var result=BLANK_PNG.replace(/^data:image\/(png|jpg);base64,/, '');
		if(!$scope.isSigned() || ($scope.signature && $scope.signature.isEmpty())) {
			result = BLANK_PNG.replace(/^data:image\/(png|jpg);base64,/, '');
		} else if ($scope.signature && $scope.signature.toDataURL) {
			result = $scope.signature.toDataURL().replace(/^data:image\/(png|jpg);base64,/, '');
		}
		return result;
	}
	$scope.rawSignatureB64 = function() {
		//console.log('in function signatureB64 - $scope.signature = ', $scope.signature);
		var result=""  //BLANK_PNG.replace(/^data:image\/(png|jpg);base64,/, '');
		if ($scope.isSigned() && $scope.signatureBase64) {
			result = $scope.signatureBase64;
		}
		else if ($scope.signature && !$scope.signature.isEmpty()) {
			result = $scope.signature.toDataURL().replace(/^data:image\/(png|jpg);base64,/, '');
		}
		return result;
	}
	$scope.sendData = function(e) {
		//e.preventDefault();
		//console.log('sendData - signature.toDataURL() = ', $scope.signature.toDataURL());
		var data = $.param({
			signatureBase64: $scope.signature.toDataURL().replace(/^data:image\/(png|jpg);base64,/, '')
        });
        var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
        	};
		//console.log('sendData', data);
        //$http.post("process.jsp", data, config)
		$http.post("signaturecontroller", data, config)
		.success(function(data, status) {
            $scope.signatureResult = data;
        })
	}
	$scope.clearSignature = function () {
		$scope.password1 = null;
		$scope.password2 = null;
		setTimeout(function (){$scope.$broadcast("resize::resize")}, 100);
	}
	$scope.userRole = signatureLocking.getNO_ROLE();
	
	$scope.setUserRole = function (prmUserRole) {
		//debugger;
		if (signatureLocking.isUserRoleAppraiser(prmUserRole)) {
			$scope.setAppraiser();
		} else
		if (signatureLocking.isUserRoleSupervisor(prmUserRole)) {
			$scope.setSupervisor();
		} else {
			$scope.setNO_ROLE();
		}
	}
	$scope.setAppraiser = function () {
		signatureLocking.setAppraiser($scope);
	}
	$scope.setSupervisor = function () {
		signatureLocking.setSupervisor($scope);
	}

	$scope.setNO_ROLE = function () {
		signatureLocking.setNO_ROLE($scope);
	}
	
	//$scope.password1Exit = function (userRole) {
		//console.log("$scope.signature = " , $scope.signature);
		//debugger;
		//signatureLocking.password1Exit(userRole, $scope);
		//console.log('password1Exit - Signature Status for role', userRole, signatureLocking.signatureStatus[userRole]());
	//}
	$scope.signatureBase64 = "";
	$scope.password1Exit = function () {
		$scope.mainPromise.then(function(success) {
			//debugger;
			var tmpIsSigned = $scope.isSigned();
			signatureLocking.password1Exit($scope);
			if (tmpIsSigned != $scope.isSigned()) {
				$scope.signatureBase64 = $scope.signatureB64();
				//console.log("$scope.signatureBase64 =", $scope.signatureBase64)
			}
		})
	}
	//$scope.isAppraiserSigned = signatureLocking.isAppraiserSigned;
	$scope.doBlur = function(event){
		//debugger;
	    var target = event.target;
	    target.blur();
	}
	//$scope.setFiles = function (element) {
	//	debugger;
	//}

	  $scope.animationsEnabled = true;

	  $scope.openSignatureModal = function (size) {
		 
		//debugger;
		if (!$scope.sigType || $scope.sigType == 'none') {
			return
		}
	    var modalInstance = $uibModal.open({
	      animation: $scope.animationsEnabled,
	      templateUrl: '/NAS/formhtml5/jsp/signatureModalContent.html',
	      controller: 'sigModalInstanceCtrl',
	      size: size,
	      resolve: {
	        signatureData: function () {
	        	//var params = {};
	        	//params.sigType = $scope.sigType;
	          return $scope.signatureData;
	        }	       
	      },
	      scope: $scope  //pass the scope as parent scope to the modal instance
	    });
	  //debugger;
	    modalInstance.result.then(function (signatureData) {
	      //debugger;
	      //console.log('then - first');
	      $scope.signatureData = signatureData;
	    }, function () {
	      //debugger;
	      //console.log('then - first');
	      $log.info('Modal dismissed at: ' + new Date());
	      //$scope.signatureData = {};
	    });
	  };
}]);

app.controller('sigModalInstanceCtrl', function ($scope, $uibModalInstance, signatureData) {


/*	  $scope.items = items;
	  $scope.selected = {
	    item: $scope.items[0]
	  };
*/
	//debugger;
	$scope.signatureData = signatureData;
	//$scope.signatureData.sigType = modalParams.sigType;
	$scope.accept = function () {
		$uibModalInstance.close($scope.signatureData);
	};

	$scope.cancel = function () {
		$uibModalInstance.dismiss('cancel');
	};
});
