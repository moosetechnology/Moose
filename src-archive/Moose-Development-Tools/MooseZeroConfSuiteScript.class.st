"
I generate a downloader script in bash for a an entire Moose Suite. The script will download and extract the the archive containing the suite.

Instance Variables
	distinctOperatingSystems:		<Object>
	isOneClick:		<Object>
	suiteDownloadArtifact:		<Object>
	suiteVersion:		<Object>

distinctOperatingSystems
	- xxxxx

isOneClick
	- xxxxx

suiteDownloadArtifact
	- xxxxx

suiteVersion
	- xxxxx

"
Class {
	#name : #MooseZeroConfSuiteScript,
	#superclass : #ZeroConfImageScript,
	#instVars : [
		'suiteVersion',
		'suiteDownloadArtifact',
		'distinctOperatingSystems',
		'isOneClick'
	],
	#category : #'Moose-Development-Tools'
}

{ #category : #accessing }
MooseZeroConfSuiteScript class >> baseUrl [
	^ 'http://get.moosetechnology.org' asZnUrl
]

{ #category : #accessing }
MooseZeroConfSuiteScript class >> fileBaseUrl [
	^ 'https://dl.dropboxusercontent.com/u/18323746/' asZnUrl
]

{ #category : #'instance creation' }
MooseZeroConfSuiteScript class >> moose43Suite [

	^ self new
		suiteVersion: '43';
		suiteDownloadArtifact: 'moose_suite_4_3';
		makeOneClickDownload 
		
]

{ #category : #'instance creation' }
MooseZeroConfSuiteScript class >> moose44Suite [

	^ self new
		suiteVersion: '44';
		suiteDownloadArtifact: 'moose_suite_4_4';
		makeOneClickDownload 
		
]

{ #category : #'instance creation' }
MooseZeroConfSuiteScript class >> moose45Suite [

	^ self new
		suiteVersion: '45';
		suiteDownloadArtifact: 'moose_suite_4_5';
		makeOneClickDownload 
		
]

{ #category : #'instance creation' }
MooseZeroConfSuiteScript class >> moose46Suite [

	^ self new
		suiteVersion: '46';
		suiteDownloadArtifact: 'moose_suite_4_6';
		makeOneClickDownload 
		
]

{ #category : #'instance creation' }
MooseZeroConfSuiteScript class >> moose47Suite [

	^ self new
		suiteVersion: '47';
		suiteDownloadArtifact: 'moose_suite_4_7';
		makeOneClickDownload 
		
]

{ #category : #'instance creation' }
MooseZeroConfSuiteScript class >> moose48Suite [

	^ self new
		suiteVersion: '48';
		suiteDownloadArtifact: 'moose_suite_4_8'
		
]

{ #category : #'instance creation' }
MooseZeroConfSuiteScript class >> moose49Suite [

	^ self new
		suiteVersion: '49';
		suiteDownloadArtifact: 'moose_suite_4_9'
		
]

{ #category : #accessing }
MooseZeroConfSuiteScript >> defaultBasename [
	^ self suiteName copyReplaceAll: ' ' with: ''
]

{ #category : #accessing }
MooseZeroConfSuiteScript >> description [
	^ 'This script downloads the latest ', self suiteName, '.'.
]

{ #category : #'script generation' }
MooseZeroConfSuiteScript >> generateBody [
	
	self 
		generateDowloadSuiteProperties;
		generateDetectSystemProperties;
		generateDownloadSuite
]

{ #category : #'script generation' }
MooseZeroConfSuiteScript >> generateDetectSystemProperties [
	self 
		<<== 'DETECT SYSTEM PROPERTIES';
		generatePlatformTest; cr
]

{ #category : #'script generation' }
MooseZeroConfSuiteScript >> generateDowloadSuiteProperties [
	self 
		<<== (self suiteProjectName asUppercase , ' DOWNLOAD SUITE PROPERTIES');
		<< 'SUITE_NAME="'; << self suiteProjectName; << '"'; cr;
		<< 'SUITE_FULL_NAME="'; << (self suiteName) ; << '"'; cr;
		<< 'SUITE_DOWNLOAD_ID="'; << self  suiteDownloadArtifact; << '"'; cr; cr
]

{ #category : #'script generation' }
MooseZeroConfSuiteScript >> generateDownloadSuite [
	self 
		<<== ('DOWNLOAD  ', self suiteName asUppercase)
		<< 'SUITE_URL="' << self suiteUrl << '"
SUITE_ARCHIVE="' << 'suite.zip' <<'"
		

echoerr "Downloading  ${SUITE_FULL_NAME}:"
echoerr "	$SUITE_URL"


$DOWNLOAD_TO$SUITE_ARCHIVE $SUITE_URL

unzip -q $SUITE_ARCHIVE -d .
rm -rf $SUITE_ARCHIVE
'; cr
]

{ #category : #'script generation html' }
MooseZeroConfSuiteScript >> generateHtmlArtifactDescription [
	
	self << ('The latest ', self suiteName, '.')
]

{ #category : #accessing }
MooseZeroConfSuiteScript >> htmlTitle [
	^ self suiteProjectName, ' Zeroconf Script'
]

{ #category : #accessing }
MooseZeroConfSuiteScript >> isOneClick [

	^ isOneClick ifNil: [ false ]
]

{ #category : #accessing }
MooseZeroConfSuiteScript >> makeOneClickDownload [
	"Mark this suite as being one click. A one click suite has only one main archive 
	 containing the releases for all operating systems. A non one click suite has a 
	distinct archive for each operating system. "
	
	isOneClick := true
]

{ #category : #accessing }
MooseZeroConfSuiteScript >> suiteDownloadArtifact [

	^ suiteDownloadArtifact
]

{ #category : #accessing }
MooseZeroConfSuiteScript >> suiteDownloadArtifact: aString [

	suiteDownloadArtifact := aString
]

{ #category : #accessing }
MooseZeroConfSuiteScript >> suiteName [
	^ self suiteProjectName, ' ', self suiteVersion , ' Suite'
]

{ #category : #accessing }
MooseZeroConfSuiteScript >> suiteProjectName [
	^ 'Moose'
]

{ #category : #accessing }
MooseZeroConfSuiteScript >> suiteUrl [

	^ self isOneClick 
		ifFalse: [ self fileBaseUrl asString, '${SUITE_NAME}/' , self suiteDownloadArtifact , '-${OS}.zip'  ] 
		ifTrue: [ self fileBaseUrl asString, '${SUITE_NAME}/' , self suiteDownloadArtifact , '.zip' ]

]

{ #category : #accessing }
MooseZeroConfSuiteScript >> suiteVersion [

	^ suiteVersion
]

{ #category : #accessing }
MooseZeroConfSuiteScript >> suiteVersion: aString [

	suiteVersion := aString
]
