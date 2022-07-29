Iceberg remoteTypeSelector: #httpsUrl.

Stdio stdout << (Smalltalk os environment at: 'GITHUB_USER').

IceCredentialStore current
	storeCredential: (IceTokenCredentials new
		username: (Smalltalk os environment at: 'GITHUB_USER');
		token: (Smalltalk os environment at: 'GITHUB_TOKEN');
		yourself) 
	forHostname: 'github.com'.