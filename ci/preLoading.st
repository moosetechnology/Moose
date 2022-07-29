Iceberg remoteTypeSelector: #httpsUrl.

Stdio stderr << 'Hello' << (Smalltalk os environment at: 'USER').

IceCredentialStore current
	storeCredential: (IceTokenCredentials new
		username: (Smalltalk os environment at: 'USER');
		token: (Smalltalk os environment at: 'GITHUB_TOKEN');
		yourself) 
	forHostname: 'github.com'.