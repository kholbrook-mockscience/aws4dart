part of aws4dart_sts;

// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

abstract class StsClient {
  factory StsClient(AwsConfig config) => new _StsClientImpl(config);

  Future<StsCredential> getSessionToken();
}

