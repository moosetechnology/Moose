"
I generate a downloader script in bash for a Pharo image for the given pharo release
"
Class {
	#name : #ZeroConfImageScript,
	#superclass : #AbstractZeroConfBashScript,
	#instVars : [
		'release',
		'version'
	],
	#classInstVars : [
		'imageVersion'
	],
	#category : 'ZeroConf'
}

{ #category : #accessing }
ZeroConfImageScript >> artifactDescription [
	^ Dictionary new
		at: self imageName, '.image' put: 'A ', self imageName, ' image, to be opened with the Pharo VM';
		at: self imageName, '.changes' put: 'A changes file for the ', self imageName, ' Image';
		yourself
]

{ #category : #accessing }
ZeroConfImageScript >> defaultBasename [
	^ version 
		ifNil: [ self release asString ]
]

{ #category : #accessing }
ZeroConfImageScript >> defaultVersion [
	^ 'latest'
]

{ #category : #accessing }
ZeroConfImageScript >> description [
	^ 'This script downloads the latest ', self imageName, ' ', self release asString, ' Image.'.
]

{ #category : #'script generation' }
ZeroConfImageScript >> generateBody [
	self
		<<== ('DOWNLOADING THE LATEST ', self imageName asUppercase, ' ' , self release asString, ' IMAGE');
		<< 'IMAGE_URL="'; << self imageUrl; <<'"'; cr; cr;
		<< 'echoerr "Downloading the latest '; << self release; << ' Image:"
echoerr "    $IMAGE_URL"

TMP_DIR=`mktemp -d image.XXXXXX`
$DOWNLOAD_TO$TMP_DIR/image.zip $IMAGE_URL

unzip -q $TMP_DIR/image.zip -d $TMP_DIR
rm -rf image image.zip

if [ -e '; << self imageName; << '.image ]; then
	BKDATE=`date +%Y%m%d%H%M`
	cp -f '; << self imageName; << '.image '; << self imageName; << '.image.bak.$BKDATE
	cp -f '; << self imageName; << '.changes '; << self imageName; << '.changes.bak.$BKDATE
fi
PHARO_IMAGE=`find $TMP_DIR -name \*.image`
mv -f "$PHARO_IMAGE" '; << self imageName; <<'.image
PHARO_CHANGES=`find $TMP_DIR -name \*.changes`
mv -f "$PHARO_CHANGES" '; << self imageName; <<'.changes;'.

	(self release >= 70) 
		ifTrue: [ self cr; << '
PHARO_IMAGE_SOURCES=`find $TMP_DIR -name \*.sources`
PHARO_IMAGE_SOURCES_FILENAME=$(basename "$PHARO_IMAGE_SOURCES")
mv -i "$PHARO_IMAGE_SOURCES" "$PHARO_IMAGE_SOURCES_FILENAME"'; cr. ].
	
	self << '
rm -r $TMP_DIR >> /dev/null

echo '; << self imageName; <<'.image'; cr
]

{ #category : #accessing }
ZeroConfImageScript >> imageName [
	^ 'Pharo'
]

{ #category : #accessing }
ZeroConfImageScript >> imageUrl [
	^ self fileBaseUrl / 'image' / self release asString / self imageZip
]

{ #category : #accessing }
ZeroConfImageScript >> imageZip [
	^ self version, '.zip'
]

{ #category : #testing }
ZeroConfImageScript >> isImage [ 
	^ true
]

{ #category : #accessing }
ZeroConfImageScript >> release [
	^ release
]

{ #category : #accessing }
ZeroConfImageScript >> release: aNumber [
	release := aNumber
]

{ #category : #accessing }
ZeroConfImageScript >> version [
	^ version ifNil: [ self defaultVersion ].
]

{ #category : #accessing }
ZeroConfImageScript >> version: aString [
	version := aString
]
