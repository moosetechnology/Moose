"
Usage: zeroconf [ --output=<DIR> ] [ --test ]
    --output=    Output the zeroconf scripts to <DIR> instead of the current working directory
	--test        Run each generated script to ensure it works
	
Description:
I generate zeroconf commandline scripts next to the current image.
"
Class {
	#name : #ZeroConfCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'outputDirectory'
	],
	#category : 'ZeroConf'
}

{ #category : #accessing }
ZeroConfCommandLineHandler class >> alpha64Version [ 
	^ 70
]

{ #category : #accessing }
ZeroConfCommandLineHandler class >> alphaVersion [ 
	^ 70
]

{ #category : #accessing }
ZeroConfCommandLineHandler class >> commandName [
	^ 'zeroconf'
]

{ #category : #accessing }
ZeroConfCommandLineHandler class >> description [
	^ 'Generate Pharo zeroconf bash scripts'
]

{ #category : #helper }
ZeroConfCommandLineHandler class >> generate [
	self generateInDirectory: 'out' asFileReference
]

{ #category : #helper }
ZeroConfCommandLineHandler class >> generateInDirectory: aReference [
	self new
		commandLine: (CommandLineArguments withArguments: {'--output=', aReference fullName});
		generateScripts
]

{ #category : #accessing }
ZeroConfCommandLineHandler class >> image64Versions [
	^ #(60 61 70)
]

{ #category : #accessing }
ZeroConfCommandLineHandler class >> imageVersions [
	^ #(70 61 60 50 40 30 20 14 13 12)
]

{ #category : #accessing }
ZeroConfCommandLineHandler class >> stable64Version [ 
	^ 61
]

{ #category : #accessing }
ZeroConfCommandLineHandler class >> stableVersion [ 
	^ 61
]

{ #category : #private }
ZeroConfCommandLineHandler class >> subdir64 [
	"subdirectory for 64bits"
	^ '64'
]

{ #category : #activation }
ZeroConfCommandLineHandler >> activate [
	self activateHelp
		ifTrue: [ ^ self ].
	
	self outputDirectory ensureCreateDirectory.
	
	(self hasOption: 'test')
		ifTrue: [ self testScripts ]
		ifFalse:[ self generateScripts ].
	
	self
		exitSuccess
]

{ #category : #'actions testing' }
ZeroConfCommandLineHandler >> cleanUpAfterScript: aScript [
	self testDirectory deleteAllChildren
]

{ #category : #'accessing scripts 64' }
ZeroConfCommandLineHandler >> combined64Scripts [
	^ Array streamContents: [ :stream |
		self image64Scripts 
			select: #canBeCombined
			thenDo: [ :each | 
				((self vmScriptsVersion: each release)
				 	do: #be64bits)
					do: [ :vm | stream nextPut: (each, vm) be64bits ] ] ]
]

{ #category : #'accessing scripts' }
ZeroConfCommandLineHandler >> combinedScripts [
	^ Array streamContents: [ :stream |
		(self imageScripts 
			select: #canBeCombined)
			do: [ :each | 
				(self vmScriptsVersion: each release) 
					do: [ :vm | stream nextPut: each, vm ] ] ]
]

{ #category : #'accessing scripts 64' }
ZeroConfCommandLineHandler >> default64Script [
	^ (ZeroConfImageVersionScript pharo: self class stable64Version) be64bits, 
	  (ZeroConfVMVersionScript pharo: self class stable64Version status: #stable) be64bits
]

{ #category : #'accessing scripts' }
ZeroConfCommandLineHandler >> defaultScript [
	^ (ZeroConfImageVersionScript pharo: self class stableVersion), 
	  (ZeroConfVMVersionScript pharo: self class stableVersion status: #stable) 
]

{ #category : #'actions testing' }
ZeroConfCommandLineHandler >> ensureEmptyTestDirectory [
	self testDirectory exists
		ifFalse: [ ^ self testDirectory ensureDirectory ].
		
	self testDirectory isFile
		ifTrue: [ ^ self exitFailure: 'Test output directory ', self testDirectory fullName, ' is an exising file.' ].
		
	self testDirectory hasChildren
		ifTrue: [ ^ self exitFailure: 'Test output directory ', self testDirectory fullName, ' is not empty.' ].
]

{ #category : #'actions generating' }
ZeroConfCommandLineHandler >> generate: script [ 
	self setScriptDirectory: script.
	script directory ensureCreateDirectory.
	
	self stdout nextPutAll: script basename; lf.
	script 
		ensureDelete;
		generate.
]

{ #category : #'actions generating' }
ZeroConfCommandLineHandler >> generateScripts [
	self scripts do: [ :script | self generate: script ].
	self generate: self indexScript.
	
	outputDirectory := self outputDirectory / self class subdir64. 
	self scripts64 do: [ :script | self generate: script ].
	self generate: self index64Script.

]

{ #category : #'accessing scripts 64' }
ZeroConfCommandLineHandler >> image64Scripts [
	^ self symbolicImage64Scripts, self numericImage64Scripts
]

{ #category : #accessing }
ZeroConfCommandLineHandler >> image64Versions [
	^ self class image64Versions
]

{ #category : #'accessing scripts' }
ZeroConfCommandLineHandler >> imageScripts [
	^ self symbolicImageScripts, self numericImageScripts, self minimalScripts
]

{ #category : #accessing }
ZeroConfCommandLineHandler >> imageVersions [
	^ self class imageVersions
]

{ #category : #'accessing scripts 64' }
ZeroConfCommandLineHandler >> index64Script [
	"the index.html is a special script that downloads the current stable release of Pharo with the VM.
	Additionally it has a complete list of exported scripts in the html help"
	| indexScript |
	indexScript := self default64Script. 
	indexScript additionalHtmlHelp: (String streamContents: [ :s |
		self indexScriptExamplesHtmlOn: s.
		self other64ScriptsHtmlOn: s ] ).
	indexScript 
		basename: 'index.html';
		url: (indexScript baseUrl addPathSegment: self class subdir64).
	^ indexScript.
]

{ #category : #accessing }
ZeroConfCommandLineHandler >> indexLinkTo564HtmlOn: s [
	s 
		<< '<h2>Pharo 64bit version</h2>'; cr;
		<< 'Pharo 64bit versions can be found here: <a href="https://get.pharo.org/64">https://get.pharo.org/64</a>'.
]

{ #category : #'accessing scripts' }
ZeroConfCommandLineHandler >> indexScript [
	"the index.html is a special script that downloads the current stable release of Pharo with the VM.
	Additionally it has a complete list of exported scripts in the html help"
	| indexScript |
	indexScript := self defaultScript. 
	indexScript additionalHtmlHelp: (String streamContents: [ :s |
		self indexLinkTo564HtmlOn: s.
		self indexScriptExamplesHtmlOn: s.
		self otherScriptsHtmlOn: s ] ).
	indexScript 
		basename: 'index.html';
		url: indexScript baseUrl.
	^ indexScript.
]

{ #category : #accessing }
ZeroConfCommandLineHandler >> indexScriptExamplesHtmlOn: s [ 
	s << '<h2>Pharo Example</h2>'; cr;
	<< '<table>

<tr>
<td>Show the command line help:</td>
<td><code>./pharo Pharo.image --help</code></td>
</tr>

<tr>			
<td>List all command line handlers:</td>
<td><code>./pharo Pharo.image --list</code></td>
</tr>

<tr>			
<td>Evaluate an expression on the command line:</td>
<td><code>./pharo Pharo.image eval "Class allInstances"</code></td>
</tr>

</table>'.
]

{ #category : #'accessing scripts' }
ZeroConfCommandLineHandler >> minimalScripts [
	^ (self imageVersions 
		select: [ :each | ZeroConfMinimalImageVersionScript canBeGenerated: each ]) 
		collect: [ :each | ZeroConfMinimalImageVersionScript pharo: each ]
]

{ #category : #'accessing scripts 64' }
ZeroConfCommandLineHandler >> numericImage64Scripts [
	^ self image64Versions 
		collect: [ :version | (ZeroConfImageVersionScript pharo: version) be64bits ]
]

{ #category : #'accessing scripts' }
ZeroConfCommandLineHandler >> numericImageScripts [
	^ self imageVersions collect: [ :version|
		ZeroConfImageVersionScript pharo: version ]
]

{ #category : #accessing }
ZeroConfCommandLineHandler >> other64ScriptsHtmlOn: stream [
	stream
		<< '<h2>Other Scripts</h2>'; cr;
		<< '<table>'.
	self scripts64
		do: [ :script| 
			stream << '<tr>';
				<< '<td><code><a href="'; print: script url; << '">'; << script formattedUrl; << '</a></code></td>';
				<< '<td>'; << script description; << '</td>';
				<< '<tr>' ]
		separatedBy: [ stream cr ].
	stream << '</table>'
]

{ #category : #accessing }
ZeroConfCommandLineHandler >> otherScriptsHtmlOn: stream [
	stream
		<< '<h2>Other Scripts</h2>'; cr;
		<< '<table>'.
	self scripts
		do: [ :script| 
			stream << '<tr>';
				<< '<td><code><a href="'; print: script url; << '">'; << script formattedUrl; << '</a></code></td>';
				<< '<td>'; << script description; << '</td>';
				<< '<tr>' ]
		separatedBy: [ stream cr ].
	stream << '</table>'
]

{ #category : #accessing }
ZeroConfCommandLineHandler >> outputDirectory [
	^ outputDirectory ifNil: [ 
		outputDirectory := (self hasOption: 'output')
			ifTrue: [ (self optionAt: 'output') asFileReference ]
			ifFalse: [ FileSystem workingDirectory ]]
]

{ #category : #'actions testing' }
ZeroConfCommandLineHandler >> printTestStartOfScript: aScript [
	| message |
	message := 'Testing ', aScript file fullName.
	self stderr
		yellow: message; lf;
		yellow: ('' padLeftTo: message size with: $=); lf.
]

{ #category : #'accessing scripts' }
ZeroConfCommandLineHandler >> scripts [
	^ self imageScripts, self vmScripts, self combinedScripts
]

{ #category : #'accessing scripts 64' }
ZeroConfCommandLineHandler >> scripts64 [
	^ self image64Scripts, self vm64Scripts, self combined64Scripts
]

{ #category : #accessing }
ZeroConfCommandLineHandler >> setScriptDirectory: script [
	script directory ifNil: [ 
		script directory: self outputDirectory ].
	^ script
]

{ #category : #'accessing scripts 64' }
ZeroConfCommandLineHandler >> symbolicImage64Scripts [
	^ { 
		(ZeroConfImageVersionScript pharo: self class stable64Version) be64bits
			basename: 'stable';
			yourself.
		(ZeroConfImageVersionScript pharo: self class alpha64Version) be64bits
			basename: 'alpha';
			yourself }
]

{ #category : #'accessing scripts' }
ZeroConfCommandLineHandler >> symbolicImageScripts [
	"manually mark a stable and an unstable alpha release"
	^ { 
		(ZeroConfImageVersionScript pharo: self class stableVersion)
			basename: 'stable';
			yourself.
		(ZeroConfImageVersionScript pharo: self class alphaVersion)
			basename: 'alpha';
			yourself. }
]

{ #category : #'actions testing' }
ZeroConfCommandLineHandler >> test: aScript [	
	self printTestStartOfScript: aScript.
	
	aScript directory: self testDirectory.
		
	[ aScript validate ] 
		ensure: [ self cleanUpAfterScript: aScript ]
	
]

{ #category : #accessing }
ZeroConfCommandLineHandler >> testDirectory [
	^ self outputDirectory / 'test'
]

{ #category : #'actions testing' }
ZeroConfCommandLineHandler >> testScripts [	
	self 
		ensureEmptyTestDirectory.
	
	self scripts do: [ :script |
		self test: script ].
	
	self test: self indexScript.
]

{ #category : #accessing }
ZeroConfCommandLineHandler >> testTimeout [
	"Timeout used when testing scripts. Each script is guaranteed only this much time before it is aborted."
	^ 30 seconds
]

{ #category : #'accessing scripts' }
ZeroConfCommandLineHandler >> travisVmScripts [
	^ self vmScripts collect: [ :script| ZeroConfTravisVM new, script ]
]

{ #category : #'accessing scripts 64' }
ZeroConfCommandLineHandler >> vm64Scripts [
	^ self image64Versions 
		inject: #() 
		into: [ :all :each | all, ((self vmScriptsVersion: each) do: #be64bits) ]
]

{ #category : #'accessing scripts' }
ZeroConfCommandLineHandler >> vmScripts [
	^ self imageVersions 
		inject: #() 
		into: [ :all :each | all, (self vmScriptsVersion: each) ]
]

{ #category : #'accessing scripts' }
ZeroConfCommandLineHandler >> vmScriptsVersion: version [
	| scripts hasThreaded hasTimer |
	
	scripts := { 
		ZeroConfVMVersionScript stablePharo: version.
		"ZeroConfVMVersionScript stablePharoS: version" }.
		
	hasThreaded := ZeroConfVMVersionThreadedHearbeatScript worksWithVersion: version.
	hasThreaded ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionThreadedHearbeatScript stablePharo: version) ]. 

	hasTimer := ZeroConfVMVersionTimerHearbeatScript worksWithVersion: version.
	hasTimer ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionTimerHearbeatScript stablePharo: version) ]. 

	"Just alpha versions have unstable vms (once released, vm freezes)"
	version = self class alphaVersion ifTrue: [ 
		scripts := scripts copyWith: (ZeroConfVMVersionScript latestPharo: version).
		hasThreaded ifTrue: [ 
			scripts := scripts copyWith: (ZeroConfVMVersionThreadedHearbeatScript latestPharo: version) ].
		hasTimer ifTrue: [ 
			scripts := scripts copyWith: (ZeroConfVMVersionTimerHearbeatScript latestPharo: version) ] ].

	^ scripts
]
