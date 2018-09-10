"
I generate ""threaded"" vm downloads  (linux threaded)

for example:

get-files/{version}/pharo-threaded-stable.zip
"
Class {
	#name : #ZeroConfVMVersionThreadedHearbeatScript,
	#superclass : #ZeroConfVMVersionScript,
	#category : 'ZeroConf-Unity'
}

{ #category : #private }
ZeroConfVMVersionThreadedHearbeatScript class >> basenameVM [
	^ 'vmT'
]

{ #category : #testing }
ZeroConfVMVersionThreadedHearbeatScript class >> worksWithVersion: version [
	^ version >= 60
]

{ #category : #accessing }
ZeroConfVMVersionThreadedHearbeatScript >> description [ 
	^ 'This script downloads the ', self status, ' ', self type capitalized, ' VM (Threaded Heartbeat) for ', self release, '.'
]

{ #category : #'script generation' }
ZeroConfVMVersionThreadedHearbeatScript >> generateDownloadVm [
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
ZeroConfVMVersionThreadedHearbeatScript >> generateLinuxScriptTest [
	super generateLinuxScriptTest.
	self 
		<<== 'REMEMBER ULIMITS REQUIREMENTS'
		<< 'echo "This VM uses a separate heartbeat thread to update its internal clock "'; cr;
		<< 'echo "and handle events. For best operation, this thread should run at a "'; cr;
		<< 'echo "higher priority, however the VM was unable to change the priority.  The "'; cr;
		<< 'echo "effect is that heavily loaded systems may experience some latency issues."'; cr;
		<< 'echo "If this occurs the VM will output instructions on how to grant the VM"'; cr;
		<< 'echo "the required privileges to increase thread priority to stderr.  A script"'; cr;
		<< 'echo "called CONFIG is also available in the Pharo install directory."'; cr;
		<< 'echo "cat <<END | sudo tee /etc/security/limits.d/pharo.conf'; cr; 
		<< '*      hard    rtprio  2'; cr; 
		<< '*      soft    rtprio  2'; cr; 
		<< 'END" > ./CONFIG'; cr;
		<< 'chmod +x ./CONFIG'; cr;
		cr
]

{ #category : #'script generation' }
ZeroConfVMVersionThreadedHearbeatScript >> generatePlatformTest [
	self << 'TMP_OS=`uname | tr "[:upper:]" "[:lower:]"`
if [[ "{$TMP_OS}" = *linux* ]]; then
    OS="linux";
else
    echo "Unsupported OS (threaded VM is just meant to linux)";
    exit 1;
fi'; cr
]

{ #category : #'script generation' }
ZeroConfVMVersionThreadedHearbeatScript >> generateVmProperties [
	self 
		<<== 'VM PROPERTIES';
		<< 'VM_TYPE="'; << self type; << '"'; cr;
		<< 'VM_ARCH="'; << self arch; << '"'; cr;
		<< 'VM_BINARY_NAME_LINUX="'; << self binaryNameLinux; << '"'; cr;
		<< 'VM_STATUS="'; << self status; << '"'; cr
		
]

{ #category : #accessing }
ZeroConfVMVersionThreadedHearbeatScript >> vmUrl [
	^'${FILES_URL}/${VM_TYPE}${VM_ARCH}-${OS}-threaded-${VM_STATUS}.zip'
]
