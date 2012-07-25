Amazon tools for Dart
=====================

The idea with **aws4dart** is to create a coherent API for working with AWS and share as much code as possible between the modules.

Currently the following modules are being worked on.

   1. DynamoDB
   1. S3
   1. SQS
   1. STS


**Work in progress!** Dart has recently provided Crypto support that
allows us to interface with AWS - we are currently updating the code 
to work with the new API's

Usage
=====
Create a Dart project and add a **pubspec.yaml** file to it 

``` 
dependencies:
  aws4dart:
    git: git://github.com/Qalqo/aws4dart.git
```


and run **pub install** to install **aws4dart** (including its
dependencies). 

Each AWS client have their own library file so for example to use 
the STS client add the following import to your program     

``` 
#import("package:aws4dart/sts/lib.dart")
``` 

TODO
----
    
   1. Pub enable the dependencies
   1. Publish Dart doc

License
-------
BSD License (Same as Dart itself). See LICENSE file.  
