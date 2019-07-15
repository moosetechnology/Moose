"
I generate a downloader script in bash for the given type of VM plus the additional installation to use this VM under the current ubuntu version used by travis.
"
Class {
	#name : #ZeroConfTravisVM,
	#superclass : #AbstractZeroConfBashScript,
	#category : 'ZeroConf'
}

{ #category : #accessing }
ZeroConfTravisVM >> artifactDescription [
	^ { }
]

{ #category : #accessing }
ZeroConfTravisVM >> defaultBasename [
	^ 'travis'
]

{ #category : #accessing }
ZeroConfTravisVM >> description [
	^ 'This script installs the dependencies to run a pharo vm on a travis slave'
]

{ #category : #'script generation' }
ZeroConfTravisVM >> generateBody [
	self <<== 'INSTALL REQUIREMENTS'.
	self 
		<< 'sudo add-apt-repository ppa:pharo/stable'; lf;
		<< 'sudo apt-get update'; lf;
		<< 'sudo apt-get install pharo-vm-core:i386'; lf.
]
