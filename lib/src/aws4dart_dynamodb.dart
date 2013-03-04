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

/**
 * DynamoDB client library
 */
library aws4dart_dynamodb;

import "dart:async";

import "package:dice/dice.dart";

import "shared/aws4dart_common.dart";

part "dynamodb/dynamodb_client.dart";
part "dynamodb/dynamodb_model.dart";
part "dynamodb/dynamodb_request.dart";
part "dynamodb/dynamodb_response.dart";

