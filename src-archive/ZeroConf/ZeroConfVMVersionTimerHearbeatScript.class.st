Class {
	#name : #ZeroConfVMVersionTimerHearbeatScript,
	#superclass : #ZeroConfVMVersionScript,
	#category : 'ZeroConf-Unity'
}

{ #category : #private }
ZeroConfVMVersionTimerHearbeatScript class >> basenameVM [
	^ 'vmI'
]

{ #category : #testing }
ZeroConfVMVersionTimerHearbeatScript class >> worksWithVersion: version [
	^ version >= 60
]

{ #category : #accessing }
ZeroConfVMVersionTimerHearbeatScript >> description [ 
	^ 'This script downloads the ', self status, ' ', self type capitalized, ' VM (Timer Heartbeat) for ', self release, '.'
]

{ #category : #'script generation' }
ZeroConfVMVersionTimerHearbeatScript >> generateDownloadVm [
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

PHARO_VM=`ls $VM_DIR/${VM_BINARY_NAME_LINUX}`

echo $PHARO_VM'; cr
]

{ #category : #'script generation' }
ZeroConfVMVersionTimerHearbeatScript >> generatePlatformTest [
	self << 'TMP_OS=`uname | tr "[:upper:]" "[:lower:]"`
if [[ "{$TMP_OS}" = *linux* ]]; then
    OS="linux";
else
    echo "Unsupported OS (threaded VM is just meant to linux)";
    exit 1;
fi'; cr
]

{ #category : #'script generation' }
ZeroConfVMVersionTimerHearbeatScript >> generateVmProperties [
	self 
		<<== 'VM PROPERTIES';
		<< 'VM_TYPE="'; << self type; << '"'; cr;
		<< 'VM_ARCH="'; << self arch; << '"'; cr;
		<< 'VM_BINARY_NAME_LINUX="'; << self binaryNameLinux; << '"'; cr;
		<< 'VM_STATUS="'; << self status; << '"'; cr
		
]

{ #category : #accessing }
ZeroConfVMVersionTimerHearbeatScript >> vmUrl [
	^'${FILES_URL}/${VM_TYPE}${VM_ARCH}-${OS}-timer-${VM_STATUS}.zip'
]
