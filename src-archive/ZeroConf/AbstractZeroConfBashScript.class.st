"
I am an abstract bash script creator providing helper methods to create zeroconf scripts.
See my subclasses for concrete script generators that download images and vms.
"
Class {
	#name : #AbstractZeroConfBashScript,
	#superclass : #Object,
	#instVars : [
		'directory',
		'baseUrl',
		'fileBaseUrl',
		'basename',
		'outputStream',
		'combiningScript',
		'additionalHelp',
		'additionalHtmlHelp',
		'url',
		'prefixingScript'
	],
	#category : 'ZeroConf'
}

{ #category : #accessing }
AbstractZeroConfBashScript class >> baseUrl [
	^ 'https://get.pharo.org' asZnUrl
]

{ #category : #accessing }
AbstractZeroConfBashScript class >> fileBaseUrl [
	^ 'https://files.pharo.org' asZnUrl
]

{ #category : #combining }
AbstractZeroConfBashScript >> , otherZeroConf [
	^ otherZeroConf combinedWith: self
]

{ #category : #combining }
AbstractZeroConfBashScript >> / otherZeroConf [
	^ otherZeroConf prefixedWith: self
]

{ #category : #'stream delegating' }
AbstractZeroConfBashScript >> << aString [
	outputStream << aString
]

{ #category : #'stream delegating' }
AbstractZeroConfBashScript >> <<-- aString [
	"Add aString as separator to the output script, the following line would be the output of `self <<-- 'foo'`:
	# foo ---------------------------------------------------------------------------"
	
	self << '# '; << aString; << ' '.
	(78 - aString size) timesRepeat: [ self << '-' ].
	self cr.
]

{ #category : #'stream delegating' }
AbstractZeroConfBashScript >> <<== aString [
	"Add aString as separator to the output script, the following line would be the output of `self <<== 'foo'`:
	# foo =========================================================================== "
	
	self << '# '; << aString; << ' '.
	(78 - aString size) timesRepeat: [ self << '=' ].
	self cr.
]

{ #category : #accessing }
AbstractZeroConfBashScript >> additionalHelp [
	^ additionalHelp ifNil: [ '' ]
]

{ #category : #accessing }
AbstractZeroConfBashScript >> additionalHelp: aString [
	additionalHelp := aString.
]

{ #category : #accessing }
AbstractZeroConfBashScript >> additionalHtmlHelp [
	^ additionalHtmlHelp ifNil: [
		self additionalHelp 
			copyReplaceAll: String cr with: ('<br/>', String lf);
			copyReplaceAll: String lf with: ('<br/>', String lf) ]
]

{ #category : #accessing }
AbstractZeroConfBashScript >> additionalHtmlHelp: aString [
	additionalHtmlHelp := aString
]

{ #category : #accessing }
AbstractZeroConfBashScript >> artifact [
	^ self artifactDescription keys
]

{ #category : #accessing }
AbstractZeroConfBashScript >> artifactDescription [
	"return a dictionary with 
		key:    Artifact name
		value:  Artifact description"
	
	^ self shouldBeImplemented 
]

{ #category : #accessing }
AbstractZeroConfBashScript >> artifacts [
	^ self artifactDescription keys
]

{ #category : #accessing }
AbstractZeroConfBashScript >> baseUrl [
	^ baseUrl ifNil: [ self class baseUrl ]
]

{ #category : #accessing }
AbstractZeroConfBashScript >> baseUrl: anUrl [
	baseUrl := anUrl
]

{ #category : #accessing }
AbstractZeroConfBashScript >> basename [
	^ basename ifNil: [ self defaultBasename ]
]

{ #category : #accessing }
AbstractZeroConfBashScript >> basename: aString [
	basename := aString
]

{ #category : #accessing }
AbstractZeroConfBashScript >> basenameForCombinedIn: script [ 
	^ self basename
]

{ #category : #accessing }
AbstractZeroConfBashScript >> be64bits [
	self baseUrl: (self class baseUrl addPathSegment: '64')
]

{ #category : #combining }
AbstractZeroConfBashScript >> combinedWith: otherScript [
	^ (self combiningScript with: self), otherScript
]

{ #category : #combining }
AbstractZeroConfBashScript >> combinedWithAll: combinedScripts [
	^ (self combiningScript with: self)
		addAll: combinedScripts scripts;
		yourself
]

{ #category : #accessing }
AbstractZeroConfBashScript >> combiningScript [
	^ combiningScript ifNil: [ self defaultCombiningScript ]
]

{ #category : #accessing }
AbstractZeroConfBashScript >> combiningScript: abObject [
	combiningScript := abObject
]

{ #category : #'stream delegating' }
AbstractZeroConfBashScript >> cr [
	outputStream cr
]

{ #category : #accessing }
AbstractZeroConfBashScript >> defaultBasename [
	^ self subclassResponsibility 
]

{ #category : #accessing }
AbstractZeroConfBashScript >> defaultCombiningScript [
	^ ZeroConfCombinedScript
]

{ #category : #accessing }
AbstractZeroConfBashScript >> defaultDirectory [
	^ FileLocator workingDirectory
]

{ #category : #accessing }
AbstractZeroConfBashScript >> defaultPrefixingScript [
	^ ZeroConfPrefixedScript
]

{ #category : #accessing }
AbstractZeroConfBashScript >> description [
	"A small description of what this script does"
	self subclassResponsibility
]

{ #category : #accessing }
AbstractZeroConfBashScript >> directory [
	^ directory
]

{ #category : #accessing }
AbstractZeroConfBashScript >> directory: aFileReference [
	directory := aFileReference
]

{ #category : #'file creation' }
AbstractZeroConfBashScript >> ensureDelete [
	self file ensureDelete
]

{ #category : #utility }
AbstractZeroConfBashScript >> exitFailure: aMessage [ 
	Exit signalFailure: aMessage 
]

{ #category : #accessing }
AbstractZeroConfBashScript >> file [
	^ self directory / self basename
]

{ #category : #accessing }
AbstractZeroConfBashScript >> fileBaseUrl [
	^ fileBaseUrl ifNil: [ self class fileBaseUrl ]
]

{ #category : #accessing }
AbstractZeroConfBashScript >> fileBaseUrl: anUrl [
	fileBaseUrl := anUrl
]

{ #category : #'script generation html' }
AbstractZeroConfBashScript >> formattedUrl [
	"Return a formatted url where $+ is not urlencoded"
	| pathString |
	^ String streamContents: [ :s|
		s << self url scheme << '://'.
		self url printAuthorityOn: s.
		pathString := self url pathPrintString.
		"do not print a single /"
		pathString = '/'
			ifFalse: [ s << pathString ]]
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generate [
	self openOutputStream.
	self 
		generateHeader; cr; cr;
		generateHelp; cr; cr;
		generateBody; cr; cr.
	self needsHtmlHelp 
		ifTrue: [ self generateHtmlHelp ]
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generateArchitectureTest [
	self << 'if [ -z "$ARCHITECTURE" ] ; then
    ARCHITECTURE=32;
fi'; cr
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generateArtifactsDescription [
	| artifactDescription artifacts maxArtifactNameSize |
	artifactDescription := self artifactDescription.
	artifacts := artifactDescription keys sorted.
	
	maxArtifactNameSize := artifacts inject: 0 into: [ :max :each | each size max: max ].
	
	artifacts 
		do: [ :artifact | 
			self
				<< '    '; << artifact.
			"pad the output"
			(maxArtifactNameSize - artifact size + 2) timesRepeat: [ self << ' '].
			self << (artifactDescription at: artifact)]
		separatedBy: [ self cr ]
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generateBashSettings [
	self 
		<< '# stop the script if a single command fails'; cr;
		<< 'set -e'; cr
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generateBody [
	"generate the script body, subclasses put their custom content here"
	self subclassResponsibility
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generateBodyOn: aStream [
	self outputStream: aStream.
	^ self generateBody.
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generateCurlWgetDetect [
	self 
		<< '#  try to use curl if possible'; cr;
		<< 'if [[ `which curl 2> /dev/null` ]]; then
	DOWNLOAD="curl --silent --location --compressed ";
	DOWNLOAD_TO="$DOWNLOAD --output ";
elif [[ `which wget 2> /dev/null` ]]; then
	DOWNLOAD_TO="wget --quiet --output-document=";
	DOWNLOAD="$DOWNLOAD_TO-";
else
	echo "Please install curl or wget on your machine";
	exit 1
fi'; cr
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generateDownloadFor: script [
	self
		<<-- script description; 
		<< '$DOWNLOAD '; print: script url; << ' | bash '; cr.
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generateHeader [
	self << '#!/usr/bin/env bash'; cr.
	self needsHtmlHelp
		ifTrue: [ self generateHtmlHeader; cr ].
	self 
		generateBashSettings; cr;
		generateHelperMethods.
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generateHelp [
	self 
		<<== 'ARGUMENT HANDLING';
		<< 'if { [ "$1" = "-h" ] || [ "$1" = "--help" ]; }; then'; cr;
		<< '	echo "';
		generateHelpMessage;
		<< '"'; cr;
		<< '	exit 0;'; cr;
		<< 'elif [ $# -gt 0 ]; then'; cr;
		<< '	echo "--help is the only argument allowed"'; cr;
		<< '	exit 1;'; cr;
		<< 'fi'; cr
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generateHelpMessage [
	self
		<< self description; cr; 
		<< 'The following artifacts are created:'; cr;
		generateArtifactsDescription; cr;
		<< self additionalHelp
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generateHelperMethods [
	self 
		<< '# define an echo that only outputs to stderr'; cr;
		<< 'echoerr() { echo "$@" 1>&2; }'; cr;
		generateCurlWgetDetect; cr; cr
]

{ #category : #'script generation html' }
AbstractZeroConfBashScript >> generateHtmlArtifactDescription [
	
	| artifactDescription |
	artifactDescription := self artifactDescription.
	
	self << '<table>'.
	artifactDescription keys sorted 
		do: [ :artifact | 
			
			self 
				<< '<tr>'
				<< '<td>' << artifact << '</td>'
				<< '<td>' << (artifactDescription at: artifact) << '</td>'
				<< '</tr>' ]
		separatedBy: [ self cr ].
	
	self << '</table>'
]

{ #category : #'script generation html' }
AbstractZeroConfBashScript >> generateHtmlDownloadUsing: aCommandString [
	self 
		<< '<code>'; << aCommandString; << '<a href="'; print: self url; << '">';
		<< self formattedUrl; << '</a> | bash </code>'; cr
]

{ #category : #'script generation html' }
AbstractZeroConfBashScript >> generateHtmlHeader [
	self 
		<< '#<html><head><!--'; cr;
		<< '# The line above makes a fake HTML document out of this bash script'; cr; cr;
		<< '#This zero conf script was generated from the sources found in:'; cr;
		<< '#';
		tab;
		<< 'https://github.com/pharo-project/pharo-zeroconf'; cr.

]

{ #category : #'script generation html' }
AbstractZeroConfBashScript >> generateHtmlHelp [
	self 
		<<== 'HTML HELP';
		<< 'HTML_HELP=<<HTML_HELP '; cr; << '-->'; cr;
		<< '<title>'; << self htmlTitle; << '</title>'; cr;
		<< '<style>'; generateHtmlStyle; << '</style>'; cr;
		<< '<body>'; cr;
		generateHtmlHelpBody; cr;
		<< '<!--'; cr;
		<< 'HTML_HELP';cr;
		<< '# --!></body></html>'
]

{ #category : #'script generation html' }
AbstractZeroConfBashScript >> generateHtmlHelpBody [
	self 
		<< '<h1>'; << self htmlTitle; << '</h1>'; cr;
		<< '<p>'; << self htmlDescription; << '</p>'; cr;		
		<< '<h2>Usage</h2>'; cr;
		generateHtmlDownloadUsing: 'curl '; << '<br/>'; cr;
		<< 'or if <code>curl</code> is not available: </br>'; cr;
		generateHtmlDownloadUsing: 'wget -O- '; cr;
		
		<< '<h2>Artifacts</h2>'; cr;
		generateHtmlArtifactDescription; cr;
		<< self additionalHtmlHelp
]

{ #category : #'script generation html' }
AbstractZeroConfBashScript >> generateHtmlStyle [
	self << '
	BODY, TABLE { 
		font-family: Arial;
		line-height: 1.5em;
	}
	BODY { 
		background-color: white;
		margin-top: -1.5em;
	}
	TD { 
		vertical-align: top;
		padding: 0 1ex 0 0;
	}
	PRE, CODE { 
		background-color: #EEE;
		padding: 0.5ex 0.8ex;
		border-radius: 0.5ex;
	}
	A { 
		color: black;
	}
	'
]

{ #category : #'script generation' }
AbstractZeroConfBashScript >> generatePlatformTest [
	self << 'TMP_OS=`uname | tr "[:upper:]" "[:lower:]"`
if [[ "{$TMP_OS}" = *darwin* ]]; then
    OS="mac";
elif [[ "{$TMP_OS}" = *linux* ]]; then
    OS="linux";
elif [[ "{$TMP_OS}" = *win* ]]; then
    OS="win";
elif [[ "{$TMP_OS}" = *mingw* ]]; then
    OS="win";
elif [[ "{$TMP_OS}" = *msys* ]]; then
    OS="win";
else
    echo "Unsupported OS";
    exit 1;
fi'; cr
]

{ #category : #testing }
AbstractZeroConfBashScript >> hasBasename [
	^ self basename isNotNil and: [ self basename isNotEmpty ]
]

{ #category : #accessing }
AbstractZeroConfBashScript >> helpText [
	"return the default help text for bash"
	^ self subclassResponsibility 
]

{ #category : #accessing }
AbstractZeroConfBashScript >> htmlDescription [
	^ self description
		copyReplaceAll: String cr with: '<br/>',String cr 
]

{ #category : #accessing }
AbstractZeroConfBashScript >> htmlTitle [
	^ 'Pharo Zeroconf Script'
]

{ #category : #testing }
AbstractZeroConfBashScript >> isCombined [
	^ false
]

{ #category : #testing }
AbstractZeroConfBashScript >> isImage [
	^ false
]

{ #category : #'stream delegating' }
AbstractZeroConfBashScript >> lf [ 
	outputStream lf
]

{ #category : #testing }
AbstractZeroConfBashScript >> needsHtmlHelp [
	^ true
]

{ #category : #'stream delegating' }
AbstractZeroConfBashScript >> nextPut: anObject [
	outputStream nextPut: anObject
]

{ #category : #'stream delegating' }
AbstractZeroConfBashScript >> nextPutAll: anObject [
	outputStream nextPutAll: anObject
]

{ #category : #'file creation' }
AbstractZeroConfBashScript >> openOutputStream [
	outputStream ifNotNil: [ 
		outputStream open ifTrue: [ ^ self ]].
	
	self directory ensureCreateDirectory.
	
	outputStream := self file writeStream.
	outputStream
		wantsLineEndConversion: true;
		lineEndConvention: #lf.
	
]

{ #category : #accessing }
AbstractZeroConfBashScript >> outputStream [
	^ outputStream
]

{ #category : #accessing }
AbstractZeroConfBashScript >> outputStream: aStream [
	outputStream := aStream
]

{ #category : #combining }
AbstractZeroConfBashScript >> prefixedWith: otherScript [
	^ (self prefixingScript withPrefix: otherScript) / self
]

{ #category : #combining }
AbstractZeroConfBashScript >> prefixedWithAll: prefixedScript [
	^ (self prefixingScript with: self)
		addAllPrefix: prefixedScript prefixScripts;
		yourself
]

{ #category : #accessing }
AbstractZeroConfBashScript >> prefixingScript [
	^ prefixingScript ifNil: [ self defaultPrefixingScript ]
]

{ #category : #accessing }
AbstractZeroConfBashScript >> prefixingScript: abObject [
	prefixingScript := abObject
]

{ #category : #'stream delegating' }
AbstractZeroConfBashScript >> print: anObject [
	outputStream print: anObject
]

{ #category : #'stream delegating' }
AbstractZeroConfBashScript >> store: anObject [
	outputStream store: anObject
]

{ #category : #'stream delegating' }
AbstractZeroConfBashScript >> tab [
	outputStream tab
]

{ #category : #accessing }
AbstractZeroConfBashScript >> url [
	"Return the URL of the location of this script"
	^ url ifNil: [ self baseUrl / self basename ]
]

{ #category : #accessing }
AbstractZeroConfBashScript >> url: aUrl [
	url := aUrl asZnUrl
]
