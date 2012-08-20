// init the STS client for getting the access credentials
var dynode = require('dynode');
// When using the default client you must first give it auth credentials
dynode.auth({accessKeyId: "AKIAJI5UNX7M6B3RIXSQ", secretAccessKey: "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"});
//dynode.createTable("NewTable", console.log);
dynode.listTables(console.log);

