// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_s3;

class _S3HttpClient extends AwsHttpClient {
//List<Bucket> listBuckets(ListBucketsRequest listBucketsRequest)
  //throws AmazonClientException, AmazonServiceException {
  //  Request<ListBucketsRequest> request = createRequest(null, null, new ListBucketsRequest(), HttpMethodName.GET);
  //  return invoke(request, new Unmarshallers.ListBucketsUnmarshaller(), null, null);
  //}
}



/*
  https://github.com/aws/aws-sdk-net/tree/master/AWSSDK/Amazon.S3/Model
  public ListBucketsResponse ListBuckets(ListBucketsRequest request)
        {
            ConvertListBuckets(request);
            S3AsyncResult asyncResult = new S3AsyncResult(request, true);
            invoke<ListBucketsResponse>(asyncResult);
            return EndListBuckets(asyncResult);
        }
 
  void invoke<T>(S3AsyncResult s3AsyncResult, bool isRedirect) where T : S3Response, new()
        {
            if (s3AsyncResult.S3Request == null)
            {
                throw new AmazonS3Exception("No request specified for the S3 operation!");
            }

            string userAgent = config.UserAgent + " " + (s3AsyncResult.CompletedSynchronously ? "S3Sync" : "S3Async");
            s3AsyncResult.S3Request.Headers[AWSSDKUtils.UserAgentHeader] = userAgent;

            ProcessRequestHandlers(s3AsyncResult.S3Request);

            ImmutableCredentials immutableCredentials = credentials == null ? null : credentials.GetCredentials();
            try
            {
                if (!isRedirect)
                {
                    addS3QueryParameters(s3AsyncResult.S3Request, immutableCredentials);
                }

                WebHeaderCollection headers = s3AsyncResult.S3Request.Headers;
                Map parameters = s3AsyncResult.S3Request.parameters;
                Stream fStream = s3AsyncResult.S3Request.InputStream;

                // if credentials are present (non-anonymous) sign the request
                if (immutableCredentials != null)
                {
                    string toSign = buildSigningString(parameters, headers);
                    string auth;
                    if (immutableCredentials.UseSecureStringForSecretKey)
                    {
                        KeyedHashAlgorithm algorithm = new HMACSHA1();
                        auth = AWSSDKUtils.HMACSign(toSign, immutableCredentials.SecureSecretKey, algorithm);
                    }
                    else
                    {
                        KeyedHashAlgorithm algorithm = new HMACSHA1();
                        auth = AWSSDKUtils.HMACSign(toSign, immutableCredentials.ClearSecretKey, algorithm);
                    }
                    parameters[S3QueryParameter.Authorization] = auth;
                }

                string actionName = parameters[S3QueryParameter.Action];
                string verb = parameters[S3QueryParameter.Verb];

                LOGGER.DebugFormat("Starting request (id {0}) for {0}", s3AsyncResult.S3Request.Id, actionName);

                // Variables that pertain to PUT requests
                byte[] requestData = Encoding.UTF8.GetBytes("");
                long reqDataLen = 0;

                validateVerb(verb);

                if (verb.Equals(S3Constants.PutVerb) || verb.Equals(S3Constants.PostVerb))
                {
                    if (parameters.ContainsKey(S3QueryParameter.ContentBody))
                    {
                        string reqBody = parameters[S3QueryParameter.ContentBody];
                        s3AsyncResult.S3Request.BytesProcessed = reqBody.Length;
                        LOGGER.DebugFormat("Request (id {0}) body's length [{1}]", s3AsyncResult.S3Request.Id, reqBody.Length);
                        requestData = Encoding.UTF8.GetBytes(reqBody);

                        // Since there is a request body, determine the length of the
                        // data that will be sent to the server.
                        reqDataLen = requestData.Length;
                        parameters[S3QueryParameter.ContentLength] = reqDataLen.ToString();
                    }

                    if (parameters.ContainsKey(S3QueryParameter.ContentLength))
                    {
                        reqDataLen = Int64.Parse(parameters[S3QueryParameter.ContentLength]);
                    }
                }

                int maxRetries = config.IsSetMaxErrorRetry() ? config.MaxErrorRetry : AWSSDKUtils.DefaultMaxRetry;

                if (fStream != null)
                {
                    s3AsyncResult.OrignalStreamPosition = fStream.Position;
                }

                HttpWebRequest request = configureWebRequest(s3AsyncResult.S3Request, reqDataLen, immutableCredentials);

                parameters[S3QueryParameter.RequestAddress] = request.Address.ToString();

                try
                {
                    s3AsyncResult.RequestState = new RequestState(request, parameters, fStream, requestData, reqDataLen, s3AsyncResult.S3Request.ElapsedTicks);
                    if (reqDataLen > 0)
                    {
                        if (s3AsyncResult.CompletedSynchronously)
                        {
                            this.getRequestStreamCallback<T>(s3AsyncResult);
                        }
                        else
                        {
                            IAsyncResult httpResult = request.BeginGetRequestStream(new AsyncCallback(this.getRequestStreamCallback<T>), s3AsyncResult);
                            if (httpResult.CompletedSynchronously)
                            {
                                if (!s3AsyncResult.RequestState.GetRequestStreamCallbackCalled)
                                {
                                    getRequestStreamCallback<T>(httpResult);
                                }
                                s3AsyncResult.SetCompletedSynchronously(true);
                            }
                        }
                    }
                    else
                    {
                        if (s3AsyncResult.CompletedSynchronously)
                        {
                            this.getResponseCallback<T>(s3AsyncResult);
                        }
                        else
                        {
                            IAsyncResult httpResult = request.BeginGetResponse(new AsyncCallback(this.getResponseCallback<T>), s3AsyncResult);
                            if (httpResult.CompletedSynchronously)
                            {
                                if (!s3AsyncResult.RequestState.GetResponseCallbackCalled)
                                {
                                    getResponseCallback<T>(httpResult);
                                }
                                s3AsyncResult.SetCompletedSynchronously(true);
                            }
                        }
                    }
                }
                catch (Exception e)
                {
                    LOGGER.Error(e, "Error starting async http operation");
                    throw;
                }
            }
            finally
            {
                if (immutableCredentials != null)
                {
                    immutableCredentials.Dispose();
                }
            }
        }
 
 */


