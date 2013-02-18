[![Build Status](https://drone.io/github.com/ltackmann/aws4dart/status.png)](https://drone.io/github.com/ltackmann/aws4dart/latest)

AWS SDK for Dart
================

Aws4Dart offers a coherent Dart API for interacting with Amazon's web services
orking with AWS and share as much code as possible between the modules.

Currently the following modules are being worked on.

   1. DynamoDB
   1. S3
   1. SQS
   1. STS


Usage
=====
Create a Dart project and add a **pubspec.yaml** file to it 

``` 
dependencies:
  aws4dart:
    git: git://github.com/ltackmann/aws4dart.git
```


and run **pub install**. 

Each AWS client have their own library file so for example to use 
the STS client add the following import to your program     

``` 
import "package:aws4dart/aws4dart_sts.dart";
``` 

TODO
----
    
   1. Pub enable the dependencies
   1. Publish Dart doc

License
-------
BSD License (Same as Dart itself). See LICENSE file.  
