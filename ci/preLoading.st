Iceberg remoteTypeSelector: #httpsUrl.

Stdio stderr << 'User: ' << (Smalltalk os environment at: 'USER') << String crlf.

Stdio stderr << 'GITHUB_TOKEN: ' << (Smalltalk os environment at: 'GITHUB_TOKEN') << String crlf.

IceCredentialStore current
	storeCredential: (IceTokenCredentials new
		username: (Smalltalk os environment at: 'USER');
		token: (Smalltalk os environment at: 'GITHUB_TOKEN');
		yourself) 
	forHostname: 'github.com'.