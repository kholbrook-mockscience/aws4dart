part of aws4dart:sts;

// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

interface StsClient default _StsClientImpl {
  StsClient(AwsConfig awsConfig);

  Future<StsCredential> getSessionToken();
}
