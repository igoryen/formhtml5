/**
 * 
 */
//var app = angular.module('myApp', ['flow'])
var app = angular.module('myApp');
app.requires.push('flow');
app.config(['flowFactoryProvider', function (flowFactoryProvider) {
  flowFactoryProvider.defaults = {
    target: 'upload.php',
    permanentErrors: [404, 500, 501],
    maxChunkRetries: 1,
    chunkRetryInterval: 5000,
    simultaneousUploads: 4,
    singleFile: true,
  };
  console.log('app1 config', flowFactoryProvider);
  console.log('app1 config - flowFactoryProvider.opts', flowFactoryProvider.opts);

  flowFactoryProvider.on('catchAll', function (event) {
    console.log('catchAll', arguments);
  });
  
  flowFactoryProvider.on('fileAdded', function(file, event){
	  console.log('fileAdded', file, event);
	  //event.preventDefault();
	  //cancelBubble(event);
	  //event.stopPropagation();
	  file.pause();
	  event.preventDefault();
	  //console.log('file upload was paused.');
	  return true;
  });

  flowFactoryProvider.on('filesAdded', function(files, event){
	  console.log('filesAdded', files, event);
	  //event.preventDefault();
	  //cancelBubble(event);
	  //event.stopPropagation();
	  //console.log('stopPropagation and Prevent Default Event was called.');
	  return true;
  });
/*
  flowFactoryProvider.on('filesSubmitted', function(file, event){
	  console.log('filesSubmitted', file, event);
	  event.preventDefault();
	  //event.stopImmediatePropagation();
	  cancelBubble(event);
	  console.log('stopPropagation and filesSubmitted Prevent Default Event was called.');
	  return false;
  });
  flowFactoryProvider.on('uploadStart', function(file, event){
	  console.log('uploadStart', file, event);
	  if (event) {
		  event.preventDefault();
	  }
	  console.log('uploadStart Prevent Default Event was called.');
	  return false;
  });
*/
  /*  flowFactoryProvider.on('fileAdded', function (event, $flow, flowFile) {
	  console.log('fileAdded', arguments);
	  event.preventDefault();//prevent file from uploading
  });*/
  // Can be used with different implementations of Flow.js
  // flowFactoryProvider.factory = fustyFlowFactory;
}]);
function cancelBubble(e) {
	 var evt = e ? e:window.event;
	 if (evt.stopPropagation)    evt.stopPropagation();
	 if (evt.cancelBubble!=null) evt.cancelBubble = true;
};

app.controller('appraiserSignature', 
		function ($scope) {
			$scope.someHandlerMethod = function ($file, $event) {
				console.log('someHandlerMethod', $event.target.parentNode);
			}
			$scope.$on('flow::fileAdded', function (event, $flow, flowFile) {
					  console.log('flow::fileAdded - appraiser signature', event, $flow, flowFile);
					  $scope.processFile(flowFile);
	//				  console.log('event.target = ', event.target);			  				  
					  //flowFile.pause();
					  //event.preventDefault();//prevent file from uploading
					  //cancelBubble(event);
					  //$flow.upload = null;
					  //$flow.preventEvent(event);
					  //console.log("flowFile.pause() executed.");
			});
			  /* Code to convert image to base64. */
	        $scope.imageString = '';
	        $scope.imageStringB64 = '';
	        $scope.processFile = function(flowFile){
	               console.log('$scope.processFile', flowFile);
	               var fileReader = new FileReader();
	               fileReader.onload = function (event) {
	                            console.log('fileReader.onload - event=', event);
	                            var uri = event.target.result;
	                            $scope.imageString = uri;
//	                            console.log('uri = ', uri);
	                            $scope.imageStringB64 = uri.replace("data:image/png;base64,", "");    
	               };
	               fileReader.readAsDataURL(flowFile.file);
	        }; 
			console.log('in appraiserSignature controller');
			//debugger;
			console.log('appraiser Signature controller', $scope);
	});
