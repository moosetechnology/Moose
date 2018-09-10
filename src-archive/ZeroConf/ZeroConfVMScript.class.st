"
I generate a downloader script in bash for the given type of VM
"
Class {
	#name : #ZeroConfVMScript,
	#superclass : #AbstractZeroConfBashScript,
	#instVars : [
		'type',
		'release',
		'vmDirectory',
		'arch'
	],
	#category : 'ZeroConf'
}

{ #category : #'instance creation' }
ZeroConfVMScript class >> latestPharo [
	^ ZeroConfVMLatestScript pharo
		yourself
]

{ #category : #'instance creation' }
ZeroConfVMScript class >> latestPharoS [
	^ ZeroConfVMLatestScript pharoS
		basename: 'vmSLatest';
		yourself
]

{ #category : #'instance creation' }
ZeroConfVMScript class >> pharo [
	^ self type: 'pharo'
]

{ #category : #'instance creation' }
ZeroConfVMScript class >> pharoS [
	^ (self type: 'pharoS')
		basename: 'vmS';
		yourself
]

{ #category : #'instance creation' }
ZeroConfVMScript class >> type: aVMTypeString [
	^ self new
		type: aVMTypeString;
		yourself
]

{ #category : #accessing }
ZeroConfVMScript >> arch [
	^ arch ifNil: [ '' ]
]

{ #category : #accessing }
ZeroConfVMScript >> arch: aString [
	arch := aString
]

{ #category : #accessing }
ZeroConfVMScript >> artifactDescription [
	^ Dictionary new
		at: self vmFolderName,'/' 	put: 'Directory containing the VM';
		at: self type         		put: 'Script to run the downloaded VM in headless mode';
		at: self type, '-ui'  		put: 'Script to run the downloaded VM in UI mode';
		yourself
]

{ #category : #accessing }
ZeroConfVMScript >> be64bits [
	super be64bits.
	self arch: '64'
]

{ #category : #accessing }
ZeroConfVMScript >> binaryName [
	^ self type capitalized
]

{ #category : #accessing }
ZeroConfVMScript >> binaryNameLinux [
	^ self type asLowercase
]

{ #category : #accessing }
ZeroConfVMScript >> binaryNameWindows [
	"Starting with 60, PharoVM has also PharoConsole.exe, to allow write to console"
	^ self binaryName, (self release asNumber >= 60 
		ifTrue: [ 'Console' ]
		ifFalse: [ '' ])
]

{ #category : #accessing }
ZeroConfVMScript >> defaultBasename [
	^ release 
		ifNil: [ 'vm' ]
		ifNotNil: [ 'vm', self release capitalized ]
]

{ #category : #accessing }
ZeroConfVMScript >> description [
	^ 'This script downloads the ', self release, ' ', self type capitalized, ' VM.'
]

{ #category : #'script generation' }
ZeroConfVMScript >> generateBody [
	self
		generateVmProperties; cr; cr;
		generateDetectSystemProperties; cr; cr;
		generateDownloadVm; cr; cr;
		generateDownloadSources; cr; cr;
		generateVmScriptCreator; cr; cr;
		generateLinuxScriptTest
]

{ #category : #'script generation' }
ZeroConfVMScript >> generateDetectSystemProperties [
	self 
		<<== 'DETECT SYSTEM PROPERTIES';
		generatePlatformTest; cr;
		generateArchitectureTest
]

{ #category : #'script generation' }
ZeroConfVMScript >> generateDownloadSources [
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

SOURCES_URL="http://files.pharo.org/sources/"

download_sources() {
	echoerr "Downloading $1.sources:"
	echoerr "	$SOURCES_URL/$1.sources.zip"
	$DOWNLOAD_TO$VM_DIR/sources.zip $SOURCES_URL/$1.sources.zip
	unzip -q $VM_DIR/sources.zip -d $SOURCES_DIR
	rm -rf $VM_DIR/sources.zip
}

download_sources PharoV30
download_sources PharoV40'; cr
]

{ #category : #'script generation' }
ZeroConfVMScript >> generateDownloadVm [
	self 
		<<== ('DOWNLOAD THE LATEST ', self type asUppercase, ' VM')
		<< 'VM_URL="' << self vmUrl << '"
VM_DIR="' << self vmDirectoryPathString << '"

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
ZeroConfVMScript >> generateLinuxScriptTest [
	self
		<<== 'TEST VM REQUIREMENTS UNDER LINUX'
		<< 'if [ "$OS" == "linux" ]; then
	$PHARO_VM '<< self optionDash <<'help '<< self optionDash <<'vm-display-null &> /dev/null 2>&1 || (\
		echo "On a 64-bit system? You must enable and install the 32-bit libraries"; \
		echo "   Please see http://pharo.org/gnu-linux-installation for detailed instructions" )
fi'; cr

]

{ #category : #'script generation' }
ZeroConfVMScript >> generateVmProperties [
	self 
		<<== 'VM PROPERTIES';
		<< 'VM_TYPE="'; << self type; << '"'; cr;
		<< 'VM_ARCH="'; << self arch; << '"'; cr;
		<< 'VM_BINARY_NAME="'; << self binaryName; << '"'; cr;
		<< 'VM_BINARY_NAME_LINUX="'; << self binaryNameLinux; << '"'; cr;
		<< 'VM_BINARY_NAME_WINDOWS="'; << self binaryNameWindows; << '"'; cr
]

{ #category : #'script generation' }
ZeroConfVMScript >> generateVmScriptCreator [
	self 
		<<== 'CREATE THE VM LAUNCHER SCRIPTS'
		<< ('create_vm_script() \{
	VM_SCRIPT=$1
	
	echo "#!/usr/bin/env bash" > $VM_SCRIPT
	echo ''# some magic to find out the real location of this script dealing with symlinks
DIR=`readlink "$0"` || DIR="$0";
DIR=`dirname "$DIR"`;
cd "$DIR"
DIR=`pwd`
cd - > /dev/null 
# disable parameter expansion to forward all arguments unprocessed to the VM
set -f
# run the VM and pass along all arguments as is'' >> $VM_SCRIPT
	
	# make sure we only substite $PHARO_VM but put "$DIR" in the script
	echo -n \\"\\$DIR\\"/\\"$PHARO_VM\\" >> $VM_SCRIPT
	
	# only output the headless option if the VM_SCRIPT name does not include "ui"
	if [[ "\{$VM_SCRIPT}" != *ui* ]]; then
		# output the headless option, which varies under each platform
		if [ "$OS" == "linux" ]; then
		    echo -n " {1}nodisplay " >> $VM_SCRIPT
		else
		    echo -n " {1}headless" >> $VM_SCRIPT
		fi
	fi
	
	# forward all arguments unprocessed using $@
	echo " \\"\\$@\\"" >> $VM_SCRIPT
	
	# make the script executable
	chmod +x $VM_SCRIPT
}

echoerr "Creating starter scripts {2} and {2}-ui"
create_vm_script "{2}"
create_vm_script "{2}-ui"' format: {self optionDash. self type}); cr
]

{ #category : #accessing }
ZeroConfVMScript >> optionDash [
	^ '--'
]

{ #category : #accessing }
ZeroConfVMScript >> release [
	^ release ifNil: [ 'stable' ]
]

{ #category : #accessing }
ZeroConfVMScript >> release: aString [
	release := aString
]

{ #category : #accessing }
ZeroConfVMScript >> type [
	
	^ type
]

{ #category : #accessing }
ZeroConfVMScript >> type: anObject [
	
	type := anObject
]

{ #category : #accessing }
ZeroConfVMScript >> vmBaseUrl [
	^ self fileBaseUrl / 'vm' / self type
]

{ #category : #accessing }
ZeroConfVMScript >> vmDirectory [
	^ vmDirectory ifNil: [ 'pharo-vm' asFileReference ]
]

{ #category : #accessing }
ZeroConfVMScript >> vmDirectory: aFileReference [
	vmDirectory := aFileReference
]

{ #category : #accessing }
ZeroConfVMScript >> vmDirectoryPathString [
	self flag: 'Return a relative path if possible...'.
	^ self vmDirectory basename
]

{ #category : #accessing }
ZeroConfVMScript >> vmFolderName [
	^ self vmDirectory basename
]

{ #category : #accessing }
ZeroConfVMScript >> vmUrl [
	^'http://files.pharo.org/vm/${VM_TYPE}/${OS}/' , self release , '.zip'
]
