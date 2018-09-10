"
Temporary script to overcome the migration form single dash ""-help"" options to double dash ""--help"" options in the pharo vm.
"
Class {
	#name : #ZeroConfVMVersionScript,
	#superclass : #ZeroConfVMScript,
	#instVars : [
		'status'
	],
	#category : 'ZeroConf-Unity'
}

{ #category : #private }
ZeroConfVMVersionScript class >> basenameVM [
	^ 'vm'
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> latestPharo10 [
	^ self type: 'pharo' release: '10' status: #latest
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> latestPharo20 [
	^ self type: 'pharo' release: '20' status: #latest
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> latestPharo30 [
	^ self type: 'pharo' release: '30' status: #latest
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> latestPharo40 [
	^ self type: 'pharo' release: '40' status: #latest
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> latestPharo50 [
	^ self type: 'pharo' release: '50' status: #latest
]

{ #category : #'as yet unclassified' }
ZeroConfVMVersionScript class >> latestPharo60 [
	^ self type: 'pharo' release: '60' status: #latest
]

{ #category : #'as yet unclassified' }
ZeroConfVMVersionScript class >> latestPharo70 [
	^ self type: 'pharo' release: '70' status: #latest
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> latestPharo: version [ 
	^ self 
		type: 'pharo' 
		release: version
		status: #latest
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> latestPharoS: version [ 
	^ self 
		type: 'pharoS' 
		release: version
		status: #latest
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> pharo10 [
	^ self type: 'pharo' release: '10' status: #stable
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> pharo20 [
	^ self type: 'pharo' release: '20' status: #stable
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> pharo30 [
	^ self type: 'pharo' release: '30' status: #stable
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> pharo40 [
	^ self type: 'pharo' release: '40' status: #stable
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> pharo50 [
	^ self type: 'pharo' release: '50' status: #stable
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> pharo60 [
	^ self type: 'pharo' release: '60' status: #stable
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> pharo70 [
	^ self type: 'pharo' release: '70' status: #stable
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> pharo: version status: status [ 
	^ self 
		type: 'pharo' 
		release: version
		status: status
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> pharoS: version status: status [ 
	^ self 
		type: 'pharoS' 
		release: version 
		status: status
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> stablePharo: version [ 
	^ self 
		type: 'pharo' 
		release: version
		status: #stable
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> stablePharoS: version [ 
	^ self 
		type: 'pharoS' 
		release: version
		status: #stable
]

{ #category : #'instance creation' }
ZeroConfVMVersionScript class >> type: aVMTypeString release: version status: status [
	^ self new
		type: aVMTypeString;
		release: version asString;
		status: status;
		yourself
]

{ #category : #accessing }
ZeroConfVMVersionScript >> basename [
	^ ((self release = 'stable') or: [ self release = 'latest' ])
		ifTrue: [ self commonBasename ]
		ifFalse: [ self commonBasename, release ]
	

]

{ #category : #accessing }
ZeroConfVMVersionScript >> basenameForCombinedIn: script [ 
	| baseScript |
	baseScript := script scripts first.
	^ baseScript isImage 
		ifTrue: [ self commonBasename ]
		ifFalse: [ self basename ] 
]

{ #category : #accessing }
ZeroConfVMVersionScript >> commonBasename [
	"Calculates a 'generic' basename, which means a basename without version number"
	| base |
	
	base := self class basenameVM.
	self isStack ifTrue: [ base := base, 'S' ].
	self isLatest ifTrue: [ base := base, 'Latest' ].

	^ base
]

{ #category : #accessing }
ZeroConfVMVersionScript >> description [ 
	^ 'This script downloads the ', self status, ' ', self type capitalized, ' VM for ', self release, '.'
]

{ #category : #'script generation' }
ZeroConfVMVersionScript >> generateBody [
	self generateVersionProperties; cr; cr.
	super generateBody
		
]

{ #category : #'script generation' }
ZeroConfVMVersionScript >> generateDownloadSources [
	(self release asNumber >= 70) ifTrue: [ ^ self ]. 
	self
		<<== 'DOWNLOAD THE PHARO ARCHIVED SOURCES FILE';
		<< 'if [ "$OS" = "linux" ]; then
	if [ -d "$VM_DIR/lib" ]; then
		SOURCES_DIR="`ls -d $VM_DIR/lib/pharo/*`";
	else
		SOURCES_DIR=$VM_DIR;
	fi
elif [ "$OS" = "mac" ]; then
	SOURCES_DIR=$VM_DIR;
else
	SOURCES_DIR=`dirname $PHARO_VM`;
fi

echoerr "Downloading PharoV${VERSION}.sources:"
echoerr "	$FILES_URL/sources.zip"
$DOWNLOAD_TO$VM_DIR/sources.zip $FILES_URL/sources.zip
unzip -q $VM_DIR/sources.zip -d $SOURCES_DIR
rm -rf $VM_DIR/sources.zip'; cr
]

{ #category : #'script generation' }
ZeroConfVMVersionScript >> generateDownloadVm [
	self 
		<<== ('DOWNLOAD {1} FOR {2} VM' format: { self type asUppercase. self release })
		<< ('VM_URL="{1}"' format: { self vmUrl }); cr;
		<< ('VM_DIR="{1}"' format: { self vmDirectoryPathString }); cr;
		<< '
echoerr "Downloading the latest ${VM_TYPE}VM:"
echoerr "	$VM_URL"

mkdir -p $VM_DIR
$DOWNLOAD_TO$VM_DIR/vm.zip $VM_URL

unzip -q $VM_DIR/vm.zip -d $VM_DIR
rm -rf $VM_DIR/vm.zip

if [ "$OS" == "win" ]; then
    PHARO_VM=`find $VM_DIR -name ${VM_BINARY_NAME_WINDOWS}.exe`
elif [ "$OS" == "mac" ]; then
    PHARO_VM=`find $VM_DIR -name ${VM_BINARY_NAME}`
elif [ "$OS" == "linux" ]; then
    PHARO_VM=`ls $VM_DIR/${VM_BINARY_NAME_LINUX}`
fi

echo $PHARO_VM'; cr
]

{ #category : #'script generation' }
ZeroConfVMVersionScript >> generateVersionProperties [
	self 
		<<== 'RELEASE VERSION';
		<< 'VERSION="'; << self release; << '"'; cr;
		<< 'FILES_URL="http://files.pharo.org/get-files/${VERSION}"'; cr.

]

{ #category : #'script generation' }
ZeroConfVMVersionScript >> generateVmProperties [
	super generateVmProperties.
	self << 'VM_STATUS="'; << self status; << '"'; cr.
]

{ #category : #testing }
ZeroConfVMVersionScript >> isLatest [
	^ self status asString = 'latest'
]

{ #category : #testing }
ZeroConfVMVersionScript >> isStack [
	^ self type = 'pharoS'
]

{ #category : #accessing }
ZeroConfVMVersionScript >> status [
	^ status ifNil: [ #stable ]
]

{ #category : #accessing }
ZeroConfVMVersionScript >> status: anObject [
	status := anObject
]

{ #category : #accessing }
ZeroConfVMVersionScript >> url [
	| base |
	
	base := self class basenameVM.
	self isStack ifTrue: [ base := base, 'S' ].
	self isLatest ifTrue: [ base := base, 'Latest' ].
	^ self baseUrl / (base, release capitalized)
]

{ #category : #accessing }
ZeroConfVMVersionScript >> vmUrl [
	^'${FILES_URL}/${VM_TYPE}${VM_ARCH}-${OS}-${VM_STATUS}.zip'
]
