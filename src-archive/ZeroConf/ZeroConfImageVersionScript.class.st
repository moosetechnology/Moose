"
I generate a simple script which downloads a Pharo image from an url: 

http://files.pharo.org/get-files/VERSION 

"
Class {
	#name : #ZeroConfImageVersionScript,
	#superclass : #ZeroConfPharoImageScript,
	#instVars : [
		'imageFileName'
	],
	#category : 'ZeroConf-Unity'
}

{ #category : #accessing }
ZeroConfImageVersionScript class >> defaultImageFileName [
	^ 'pharo'
]

{ #category : #accessing }
ZeroConfImageVersionScript >> be64bits [
	super be64bits.
	self imageFileName: 'pharo64'.
	
]

{ #category : #testing }
ZeroConfImageVersionScript >> canBeCombined [
	^ true
]

{ #category : #'script generation' }
ZeroConfImageVersionScript >> generateBody [
	self generateVersionProperties; cr; cr.
	super generateBody
]

{ #category : #'script generation' }
ZeroConfImageVersionScript >> generateVersionProperties [
	self 
		<<== 'RELEASE VERSION';
		<< 'VERSION="'; << self release; << '"'; cr;
		<< 'FILES_URL="http://files.pharo.org/get-files/${VERSION}"'; cr;
		<< 'IMAGE_FILE_NAME="'; << self imageFileName; << '"'; cr.
]

{ #category : #accessing }
ZeroConfImageVersionScript >> imageFileName [
	^ imageFileName ifNil: [ self class defaultImageFileName ]
]

{ #category : #accessing }
ZeroConfImageVersionScript >> imageFileName: aString [
	imageFileName := aString
]

{ #category : #accessing }
ZeroConfImageVersionScript >> imageUrl [
	^ '${FILES_URL}/${IMAGE_FILE_NAME}.zip'
]
