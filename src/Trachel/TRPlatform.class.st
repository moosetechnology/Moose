"
I have the methods of the default platform(pharo or visualworks)
"
Class {
	#name : #TRPlatform,
	#superclass : #TRObject,
	#classInstVars : [
		'current'
	],
	#category : #'Trachel-Core'
}

{ #category : #default }
TRPlatform class >> current [
	current isClass ifTrue: [ current := nil ].
	^ current ifNil: [ 
		current := self subclasses detect: [ :any | any isActivePlatform ].
		current := current new. ].
]

{ #category : #testing }
TRPlatform class >> isActivePlatform [
	self subclassResponsibility.
]

{ #category : #'accessing-classes' }
TRPlatform >> affineTransformClass [
	self subclassResponsibility.
]

{ #category : #windows }
TRPlatform >> browseClass: aClass [
	"Open the default system browser for a class"
	self subclassResponsibility 
]

{ #category : #'accessing-classes' }
TRPlatform >> colorFormClass [
	"return the default colorform, can be different in other smalltalk systems"
	self subclassResponsibility
]

{ #category : #'drawing - helpers' }
TRPlatform >> computeArcPathFor: aShape [
	self subclassResponsibility
]

{ #category : #'drawing - helpers' }
TRPlatform >> computeEllipsePathFor: aShape [
	self subclassResponsibility.
]

{ #category : #'drawing - helpers' }
TRPlatform >> computeRoundBoxPathFor: aShape [
	self subclassResponsibility
]

{ #category : #windows }
TRPlatform >> createPopupFor: aMorph in: aPoint background: aColor string: aString [
	"create a platform popup"
	self subclassResponsibility 
]

{ #category : #public }
TRPlatform >> dateAndTime [
	self subclassResponsibility
]

{ #category : #'accessing-classes' }
TRPlatform >> dateAndTimeClass [
	"return the default class for date and time"
	self subclassResponsibility
]

{ #category : #'date and time' }
TRPlatform >> dateAndTimeFromString: aString [
	"create a date and time from a string"
	self subclassResponsibility
]

{ #category : #fonts }
TRPlatform >> defaultFamilyFontName [
	self subclassResponsibility
]

{ #category : #windows }
TRPlatform >> deletePopup: apopup [
	"delete the platform popup for a class"
	self subclassResponsibility 
]

{ #category : #windows }
TRPlatform >> dialogChooseFrom: options values: values [
	"open a dialog window to select one of the options with the same values"
	self subclassResponsibility 
]

{ #category : #windows }
TRPlatform >> dialogInform: aMessage [
	"open a dialog with the message string"
	self subclassResponsibility 
]

{ #category : #windows }
TRPlatform >> dialogRequest: request initialAnswer: answer [
	"open a dialog window to ask one text input for the user with the initiali answer"
	self subclassResponsibility
	
]

{ #category : #windows }
TRPlatform >> dialogRequestSaveFilename: filename extensions: exts path: path [
	"open a dialog window from the file system to save a fil"
	self subclassResponsibility.
]

{ #category : #'http requests' }
TRPlatform >> download: aString [
	"returns the http web content from a direction like url"
	self subclassResponsibility
]

{ #category : #'http requests' }
TRPlatform >> downloadContent: aString [
	"returns the http web content from a direction like url"
	self subclassResponsibility
]

{ #category : #'http requests' }
TRPlatform >> downloadPng: aUrl [
	"return the content of a url, the content is an image"
	self subclassResponsibility
]

{ #category : #fonts }
TRPlatform >> fontFamilyName: name size: number [
	"return the an instance of the default class font with that name and that size"
	self subclassResponsibility
]

{ #category : #fonts }
TRPlatform >> fontListStrings [
	"return the font name of the fonts in the smalltalk system"
	self subclassResponsibility
]

{ #category : #'accessing-classes' }
TRPlatform >> formCanvasClass [
	self subclassResponsibility.
]

{ #category : #'accessing-classes' }
TRPlatform >> formClass [
	"return the default font class"
	self subclassResponsibility 
]

{ #category : #public }
TRPlatform >> formFromStream: aStream [
	"return a form or visual component from a image stream"
	^ self formClass fromBinaryStream: (aStream contents base64Decoded readStream )
]

{ #category : #fonts }
TRPlatform >> getFontForSize: aNumber [
	"return the a font with that size"
	self subclassResponsibility.
]

{ #category : #'accessing-classes' }
TRPlatform >> httpClientRequestClass [
	"return the default http client request class"
	self subclassResponsibility 
]

{ #category : #'accessing-classes' }
TRPlatform >> imageExporterForType: imageType [
	"return the class exporter for that image type"
	self subclassResponsibility
	
]

{ #category : #'accessing-classes' }
TRPlatform >> jsonReaderClass [
	"return de default json reader class"
	self subclassResponsibility
]

{ #category : #public }
TRPlatform >> materializeFromByteArray: array [
	self subclassResponsibility
]

{ #category : #'accessing-classes' }
TRPlatform >> matrixClass [
	self subclassResponsibility.
]

{ #category : #'accessing-classes' }
TRPlatform >> menuMorphClass [
	"return de default menu class"
	self subclassResponsibility 
]

{ #category : #'accessing-classes' }
TRPlatform >> messageTallyClass [
	self subclassResponsibility
]

{ #category : #'http requests' }
TRPlatform >> mimeDecodeToBytes: bytes [
	"return a stream from bytes"
	self subclassResponsibility
]

{ #category : #'http requests' }
TRPlatform >> mimeEncode: aStream [
	"convert a stream to bytes"
	self subclassResponsibility
]

{ #category : #'http requests' }
TRPlatform >> mimeEncode: aStream multiLine: aBool [
	"conver a stream to bytes using the skip character"
	self subclassResponsibility
]

{ #category : #'accessing-classes' }
TRPlatform >> morphClass [
	"returns the default Morph or equivalent class in smalltalk systems"
	self subclassResponsibility 
]

{ #category : #public }
TRPlatform >> newColorFormWithExtent: extent depth: depth [
	"returns an instance of color form"
	self subclassResponsibility 
]

{ #category : #public }
TRPlatform >> newFormWithExtent: extent depth: depth [
	"returns an instance of Form"
	self subclassResponsibility 
]

{ #category : #public }
TRPlatform >> packageNamed: packageName [
	"return an instance of the default package system in smalltalk"
	self subclassResponsibility
]

{ #category : #'accessing-classes' }
TRPlatform >> pngReadWriterClass [
	"returns the default PNG Reader Writer class"
	self subclassResponsibility 
]

{ #category : #'accessing-classes' }
TRPlatform >> polygonTesterClass [
	self subclassResponsibility
]

{ #category : #public }
TRPlatform >> roassalIcon [
	self subclassResponsibility
]

{ #category : #public }
TRPlatform >> session [
	self subclassResponsibility
]

{ #category : #windows }
TRPlatform >> showTemporaryCursor: cursorOrNil [
	self subclassResponsibility
]

{ #category : #'accessing-classes' }
TRPlatform >> surfaceClass [
	self subclassResponsibility.
]

{ #category : #'accessing-classes' }
TRPlatform >> trMorphClass [
	"return the default TRMorph class, or visual component for other smalltalk systems"
	self subclassResponsibility
]

{ #category : #utilities }
TRPlatform >> validInteractionsOf: shape oklist: list [
	self subclassResponsibility
]

{ #category : #utilities }
TRPlatform >> visitInteractionsFor: aVisitor and: anObject [
	self subclassResponsibility
]

{ #category : #fonts }
TRPlatform >> widthOfString: string font: font [
	"retuns the width of string with an instance of the default Font class"
	self subclassResponsibility 
]

{ #category : #fonts }
TRPlatform >> widthOfString: string fontFamilyName: fontFamilyName fontSize: fontSize [
	"returns the width of string with the name of the font and the size"
	self subclassResponsibility 
]

{ #category : #public }
TRPlatform >> workingDirectory [
	"retuns the working directory"
	self subclassResponsibility 
]
