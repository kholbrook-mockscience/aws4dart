/*
 * Copyright 2013 Solvr, Inc. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"). You
 * may not use this file except in compliance with the License. A copy of
 * the License is located at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * or in the "license" file accompanying this file. This file is
 * distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
 * ANY KIND, either express or implied. See the License for the specific
 * language governing permissions and limitations under the License.
 */

part of aws4dart_s3;

class S3HttpClient extends AwsHttpClient {
//List<Bucket> listBuckets(ListBucketsRequest listBucketsRequest)
  //throws AmazonClientException, AmazonServiceException {
  //  Request<ListBucketsRequest> request = createRequest(null, null, new ListBucketsRequest(), HttpMethodName.GET);
  //  return invoke(request, new Unmarshallers.ListBucketsUnmarshaller(), null, null);
  //}
  
  Request createRequest(String bucketName, String key, AwsRequest originalRequest, HttpMethodName httpMethod) {
    var request = new DefaultRequest<X>(originalRequest, Constants.S3_SERVICE_NAME);
    request.setHttpMethod(httpMethod);

    // If we're using SSL and the bucket name contains a period, the hostname
    // won't line up with the cert hostname pattern, since wildcards are only
    // allowed to match one segment in a DNS name.
    var sslCertMismatch = endpoint.scheme.toLowerCase() == "https" &&
        bucketName != null && bucketName.contains(".");

    if (!clientOptions.isPathStyleAccess() && bucketNameUtils.isDNSBucketName(bucketName) &&
        !validIP(endpoint.getHost()) && !sslCertMismatch) {
      request.setEndpoint(convertToVirtualHostEndpoint(bucketName));
      request.setResourcePath(ServiceUtils.urlEncode(key));
    } else {
      request.setEndpoint(endpoint);

      if (bucketName != null) {
        /*
         * We don't URL encode the bucket name, since it shouldn't
         * contain any characters that need to be encoded based on
         * Amazon S3's naming restrictions.
         */
        request.setResourcePath(bucketName + "/"
            + (key != null ? ServiceUtils.urlEncode(key) : ""));
      }
    }

    return request;
  }
  
  Future<String> invoke(Request<Y> request, String bucket, String key) {
    for (Entry<String, String> entry : request.getOriginalRequest().copyPrivateRequestParameters().entrySet()) {
      request.addParameter(entry.getKey(), entry.getValue());
    }

    /*
     * The string we sign needs to include the exact headers that we
     * send with the request, but the client runtime layer adds the
     * Content-Type header before the request is sent if one isn't set, so
     * we have to set something here otherwise the request will fail.
     */
    if (request.getHeaders().get("Content-Type") == null) {
      request.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
    }

    AWSCredentials credentials = awsCredentialsProvider.getCredentials();
    AmazonWebServiceRequest originalRequest = request.getOriginalRequest();
    if (originalRequest != null && originalRequest.getRequestCredentials() != null) {
      credentials = originalRequest.getRequestCredentials();
    }

    ExecutionContext executionContext = createExecutionContext();
    executionContext.setSigner(createSigner(request, bucket, key));
    executionContext.setCredentials(credentials);

    return client.execute(request, responseHandler, errorResponseHandler, executionContext);
  }
}


