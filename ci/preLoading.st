Iceberg remoteTypeSelector: #httpsUrl.

Stdio stderr << 'User: ' << (Smalltalk os environment at: 'USER') << String crlf.


IceCredentialStore current
	storeCredential: (IceTokenCredentials new
		username: (Smalltalk os environment at: 'USER');
		token: (Smalltalk os environment at: 'TOKEN');
		yourself) 
	forHostname: 'github.com'.