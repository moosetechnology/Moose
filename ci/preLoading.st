Iceberg remoteTypeSelector: #httpsUrl. 

LGitLibrary compile: 'unix64LibraryName

	^ FFIUnix64LibraryFinder findAnyLibrary: #(
		"This name is wrong, but some versions of the VM has this library shipped with the bad name"
		''libgit2.1.0.1.so'' 
		''libgit2.so.1.0.0'' 
		''libgit2.so.1.0''
		''libgit2.so.1.1''
		''libgit2.so.1.2''
		''libgit2.so.1.3''
		''libgit2.so.1.4''
		''libgit2.so.0.25.1'')'.

Stdio stderr << 'Pharo git version' << String crlf.
Stdio stderr << LGitLibrary uniqueInstance version printString << String crlf.
