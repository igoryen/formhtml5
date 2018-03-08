/*
 * Photos Controller
 */
var app = angular.module('myApp');
app.requires.push('flow');
app.config(['flowFactoryProvider', function (flowFactoryProvider) {
  flowFactoryProvider.defaults = {
	target : "/NAS/PhotoUploadCmd?imageOperation=upload",
	//target: "https://testap.nationwideappraisals.com/NAS/PhotoUploadCmd?imageOperation=upload",
	//target: "https://web.nationwideappraisals.com/NAS/PhotoUploadCmd?imageOperation=upload",
    //permanentErrors: [404, 500, 501],
	permanentErrors : [ 500, 501 ],
    maxChunkRetries: 1,
    chunkRetryInterval: 5000,
    simultaneousUploads: 4,
    singleFile: true,
	progressCallbacksInterval : 1,
	withCredentials : true,
	method : "octet",
	forceChunkSize : true,
	testChunks: false //if false, then 'doPost()' is called and 'doGet()' won't be called and the upload is not resumable.
  };
  //console.log('app1 config', flowFactoryProvider);
  //console.log('app1 config - flowFactoryProvider.opts', flowFactoryProvider.opts);

  flowFactoryProvider.on('catchAll', function (event) {
    console.log('catchAll', arguments);
  });
  
  flowFactoryProvider.on('fileAdded', function(file, event){
	  //debugger;
	  //console.log('fileAdded', file, event);
	  //event.preventDefault();
	  //cancelBubble(event);
	  //event.stopPropagation();
	  //file.pause();
	  //if (event) {
	  //	  event.preventDefault();
	  //}
	  //console.log('file upload was paused.');
	  return true;
  });

  flowFactoryProvider.on('filesAdded', function(files, event){
	  //console.log('filesAdded', files, event);
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

//Function to convert Base64 image to blob to be used to initialzie ng-flow image
//when loading from Database.
function b64toBlob(b64Data, contentType, sliceSize) {
	  contentType = contentType || '';
	  sliceSize = sliceSize || 512;

	  var byteCharacters = atob(b64Data.replace(/[\s]/g, ''));
	  var byteArrays = [];

	  for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
	    var slice = byteCharacters.slice(offset, offset + sliceSize);

	    var byteNumbers = new Array(slice.length);
	    for (var i = 0; i < slice.length; i++) {
	      byteNumbers[i] = slice.charCodeAt(i);
	    }

	    var byteArray = new Uint8Array(byteNumbers);

	    byteArrays.push(byteArray);
	  }

	  var blob = new Blob(byteArrays, {type: contentType});
	  return blob;
}

//This is another function to convert dataURL to Blob which includes the mime type
function dataURItoBlob(dataURI) {
    // convert base64/URLEncoded data component to raw binary data held in a string
    var byteString;
    if (dataURI.split(',')[0].indexOf('base64') >= 0)
        byteString = atob(dataURI.split(',')[1]);
    else
        byteString = unescape(dataURI.split(',')[1]);

    // separate out the mime component
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

    // write the bytes of the string to a typed array
    var ia = new Uint8Array(byteString.length);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }

    return new Blob([ia], {type:mimeString});
}

/*
 *  Code below for testing
var smallDataUrl = 'data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg"/>'
var b = dataURItoBlob(dataURI);
var newDataUrl; 
var fr = new FileReader();
fr.onload = function (event) {
	newDataUrl = event.target.result;
}
fr.readAsDataURL(b);
//newDataUrl has the new URL. 
 */

app.directive('loadPhoto', function () {
	return function (scope, element, attrs) {
		//This directive 'load-photo' is required to access the DOM element inside the scope
		//This will get the Base64 string of the image which is stored in the input element
		//debugger;
    	angular.element(document).ready(function () {
    		scope.loadPhoto(element[0]);
    	})
	}
})

app.controller('photosController', ['$scope', '$http', '$timeout', '$q',
		function ($scope, $http, $timeout, $q) {
			//debugger;
			//console.log('photosController');
			//console.log('$scope.MainController.imagesModel', $scope.MainController.imagesModel);
			$scope.getImageFieldName = function() {
				//The scope variable "x" is defined in HTML using ng-repeat in "photosForm" section
				//return "additional_image" + $scope.x;
				return $scope.photo.fieldName;
			}
			$scope.getFlowQuery = function () {
				return (
					{
						fileNumber: $scope.file_number,
						fieldName: $scope.getImageFieldName(),
						requestSource: getRequestSource()
					}
				)
			}
			var BLANK_IMG_URL = "//:0";
			$scope.isImageAvailable = function () {
				var result;
				var imageURI = $scope.getImageURI(); 
				result =  imageURI && imageURI != BLANK_IMG_URL;
				return result;
			}
			$scope.someHandlerMethod = function ($file, $event) {
				//console.log('someHandlerMethod', $event.target.parentNode);
			}
			$scope.imageFieldName = $scope.getImageFieldName();
			$scope.$on('flow::fileAdded', function (event, $flow, flowFile) {
				//console.log('flow::fileAdded - appraiser signature', event, $flow, flowFile);
				//Model Variable "imageFieldNameValue" was replaced with additionalImages[imageFieldName]
				//$scope.imageFieldNameValue = "";
				//$scope.MainController.additionalImages[$scope.imageFieldName] = "";
				/*if ($scope.isImageAvailable()) {
					$scope.removeFile(false);
				}*/
				//TO DO not needed: Enhancement required - Shirnk file after saving on the server.
				//No need to process file anymore to shrink it.
				//$scope.processFile(flowFile);
				//console.log('event.target = ', event.target);
				//flowFile.pause();
				//event.preventDefault();//prevent file from uploading
				//cancelBubble(event);
				//$flow.upload = null;
				//$flow.preventEvent(event);
				//console.log("flowFile.pause() executed.");
			});
			$scope.$on('flow::fileSuccess', function(event, $flow, flowFile, response, flowChunk){
				//console.log("$scope.$on('flow:fileSuccess' ", event, $flow, flowFile, message, flowChunk)
				//debugger;
				var uploadResult = getParameterByName("uploadResult", response);
				var uploadedFileName = getParameterByName("uploadedFileName", response);
				if (uploadResult == "success") {
					//$scope.imageFieldNameValue = uploadedFileName;
					//$scope.MainController.additionalImages[$scope.imageFieldName] = uploadedFileName;
					$scope.imagesModel[$scope.imageFieldName] = uploadedFileName;
					reDoDecache(); // To refresh the random number and force refresh the newly uploaded image
					//remove the uploaded file from the flow queue, as now it is not needed after it was uploaded to the server
					$flow.cancel();
				} else {
					//$scope.imageFieldNameValue = "";
					//$scope.MainController.additionalImages[$scope.imageFieldName] = "";
					$scope.imagesModel[$scope.imageFieldName] = "";
				}
			})
			$scope.doUpload = function () {
				//debugger;
				var markDeletedPromise;
				//If there is file pending for upload
				if ($scope.$flow.files.length) {
					//Mark existing file as deleted, if found
					markDeletedPromise = $scope.removeFile(false);
					//When mark delete is done, upload new file 
					markDeletedPromise.then(function (result){
						$scope.$flow.upload()
					});
				}
			}
			$scope.removeFile = function (doCancelFlow) {
				//debugger;
				//var tmp = new File([new Blob()], 'image.jpg', {type: 'image/png'})
				//$scope.$flow.files[0] = new Flow.FlowFile($scope.$flow, tmp);
				var q = $q.defer();
				if (doCancelFlow == undefined) {
					doCancelFlow = true;
				}
				if (!$scope.isImageAvailable()) {
					q.resolve('no image found, no problem... as a matter of fact, this is what we want!');
				} else {
					$scope.markImageDeleted(function () {
						if (doCancelFlow) {
							$scope.$flow.cancel();
						}
						$scope.imageStringB64 = '';
						$scope.imageURI = BLANK_IMG_URL;
						//$scope.imageFieldNameValue = '';
						//$scope.MainController.additionalImages[$scope.imageFieldName] = '';
						$scope.imagesModel[$scope.imageFieldName] = '';
						q.resolve('mark deketed done');
					});
					
				}
				return q.promise;
			}
			//The object "additionalImagesDecache" will be used to hold random value for each image field to force image refresh
			//Image refresh will be done dynamically using "ng-src" directive of the image element
			$scope.imagesDecache = {};
			function reDoDecache() {
				//$scope.MainController.additionalImagesDecache[$scope.imageFieldName] = Math.random();
				$scope.imagesDecache[$scope.imageFieldName] = Math.random();
			}
			reDoDecache();

			$scope.getImageURI = function () {
				var randomNumber;
				var result;
				//debugger;
				//if ($scope.file_number && $scope.imageFieldNameValue) {
				//randomNumber = $scope.MainController.additionalImagesDecache[$scope.imageFieldName];
				randomNumber = $scope.imagesDecache[$scope.imageFieldName];
				//if ($scope.file_number && $scope.MainController.additionalImages[$scope.imageFieldName]) {
				if (!$scope.imagesModel) {
					$scope.imagesModel = $scope.MainController.imagesModel;
				}
				if ($scope.file_number && $scope.imagesModel[$scope.imageFieldName]) {
					//$scope.MainController.additionalImagesDecache[$scope.imageFieldName] = Math.random();
					//debugger;
					result = getAppURL() + "/PhotoUploadCmd?imageOperation=render&fileNumber=" + $scope.file_number + "&requestSource=" + getRequestSource() + "&decache=" + randomNumber + "&imageFileName=" + 
							//$scope.MainController.additionalImages[$scope.imageFieldName];
							$scope.imagesModel[$scope.imageFieldName];
							//$scope.MainController.additionalImagesDecache[$scope.imageFieldName];
				} else {
					result = BLANK_IMG_URL;
				}
				return result;
			}
			//JIRA: NE-2255 - Delete Photo from server when removed from client
			$scope.markImageDeleted = function (successCallback, errorCallback) {
				//debugger;
				var sAppURL = getAppURL();
				var sUrl = sAppURL + "/PhotoUploadCmd?imageOperation=markdelete&fileNumber=" + $scope.file_number + "&requestSource=" + getRequestSource() + "&fieldName=" + $scope.imageFieldName  + "&imageFileName=" + 
							//$scope.MainController.additionalImages[$scope.imageFieldName];
							$scope.imagesModel[$scope.imageFieldName];
				$http({
			            method : 'GET',
			            url : sUrl,
			        }).success(function(data, status, headers, config) {
			            console.log(data);
			            if (successCallback) {
				            successCallback()
			            }
			        }).error(function(data, status, headers, config) {
			            console.log(data);
			            if (errorCallback) {
			            	errorCallback()
			            }
			        });
			}	
			
			$scope.processFileDone = true;
	        $scope.imageURI = BLANK_IMG_URL;
	        $scope.imageStringB64 = '';
	        $scope.processFile = function(flowFile){
	        	   $scope.processFileDone = true;
	               //console.log('$scope.processFile', flowFile);
	               var fileReader = new FileReader();
	               fileReader.onload = function (event) {
	                            //console.log('fileReader.onload - event=', event);
	                            var uri = event.target.result;
	                            var uriHead;
	                            $scope.imageURI = BLANK_IMG_URL;
	                            uriHead = uri.slice(0, uri.indexOf(",")+1);
                            	//debugger;
	                            
	                            var sTmp = uri.replace(/^data:image\/(gif|png|jpg|jpeg);base64,/, '');	 
	                            
	                            /* Shrink the image */
	                            var sUrl = $('#applicationURL').val() + "/servlet/com.visionmax.servlet.CommandServlet?command=resizeimage";
	                            
	                            var oImg = $.param({
	                                width: 350,
	                                height: 240,
	                                sBase64: sTmp
	                            });
	                            
	                            var config = {
	                                    headers : {
	                                        'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
	                                    }
	                                }
	                          	                            
	                    		$http.post(
	                    			sUrl,
	                    			oImg,
	                    			config
	                    		).success(function(data) {
	                    			if(!data.errors) {
	                    				$scope.imageStringB64 = data;
	                    				//$scope.imageURI = uriHead + data;
	                    				$scope.processFileDone = true;
	                    			} else {
	                    				console.log("ERROR: Error accured while shrinking the photo. Dump of 'data.errors' :" , data.errors);
	                    			}
	               				});	                            
	                            /* End Shrink */                         
	                            

	               };
	               fileReader.readAsDataURL(flowFile.file);
	        };
	        $scope.loadPhoto = function (elem) {
	        	
	        	//Load photo from Database
	        	//The photo Base64 is stored in the input element 'elem'
        		//debugger;

	        	$scope.photosLoadingDone = false;		//Used to indicate photo is being loaded from Database.
	        	//console.log('$scope.loadPhoto - $scope.imageStringB64 = ', $scope.imageStringB64);
	        	var blobImage;
	        	var tmpBase64;
	        	//tmpBase64 = 'iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==';
	        	//blobImage = b64toBlob($scope.imageStringB64, 'image/png');
	        	//blobImage = new Blob(['iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg=='], {type: 'image/png'})
	        	//blobImage.type = "image/png";
	        	
	        	//Load the photo using flow controller
	        	//Wait until document is ready to make sure that the input element has the Base64 string of the image
	        	tmpBase64 = angular.element(elem).val(); //$scope.imageStringB64;
	        	//debugger;
	        	if (isBase64Encoded(tmpBase64)) {
		        	//Convert Base64 to Blob object
		        	blobImage = b64toBlob(tmpBase64, 'image/png');
		        	blobImage.name = "image.png";
		        	//Add the Blob object to flow files.
		        	$scope.$flow.addFile(blobImage);
	        	}
	        	/*$timeout( function () {
		        	//debugger;
	        		//tmpBase64 = $scope.imageStringB64;
		        	tmpBase64 = $(elem).val();
		        	blobImage = b64toBlob(tmpBase64, 'image/png');
		        	blobImage.name = "image.png";
		        	$scope.$flow.addFile(blobImage);
	        	}, 600)*/
        		$scope.photosLoadingDone = true;	//Photo loading done.
	        }
	}]);
