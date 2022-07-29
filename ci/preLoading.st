Iceberg remoteTypeSelector: #httpsUrl.

Stdio stdout << (Smalltalk os environment at: 'USER').

IceCredentialStore current
	storeCredential: (IceTokenCredentials new
		username: (Smalltalk os environment at: 'USER');
		token: (Smalltalk os environment at: 'TOKEN');
		yourself) 
	forHostname: 'github.com'.