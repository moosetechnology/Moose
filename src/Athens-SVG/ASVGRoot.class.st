"
i am root element of SVG document, correspond to a <svg> tag in document.
"
Class {
	#name : #ASVGRoot,
	#superclass : #ASContainerElement,
	#instVars : [
		'width',
		'height',
		'ids',
		'viewBox'
	],
	#category : #'Athens-SVG'
}

{ #category : #'to be done' }
ASVGRoot >> baseProfile: aString [ 
	self yourself
]

{ #category : #'to be done' }
ASVGRoot >> contentScriptType: aString [ 

	"ignore"
]

{ #category : #'to be done' }
ASVGRoot >> contentStyleType: aString [ 

	self yourself 
]

{ #category : #accessing }
ASVGRoot >> height [
	^ height
]

{ #category : #accessing }
ASVGRoot >> height: aString [ 
	height := ASLength fromString: aString
]

{ #category : #'attribute management' }
ASVGRoot >> inheritedAttributeAt: name [
	"i am root, nobody to inherit from"
	^ attributes at: name ifAbsent: nil
]

{ #category : #initialize }
ASVGRoot >> initialize [ 
	super initialize.
	ids := Dictionary new.
]

{ #category : #'to be done' }
ASVGRoot >> preserveAspectRatio: aString [ 

	self yourself 
]

{ #category : #rendering }
ASVGRoot >> renderOn: aCanvas viewportExtent: extent [

	viewBox ifNil: [ ^self renderOn: aCanvas ].
	
	aCanvas pathTransform restoreAfter: [
		aCanvas pathTransform
			translateX: viewBox origin x negated Y: viewBox origin y negated;
			scaleX: (extent x / viewBox width) asFloat Y: (extent y / viewBox height) asFloat.
		self renderOn: aCanvas.		
	]
]

{ #category : #internal }
ASVGRoot >> resolveIds [ 
	^ self resolveIds: ids
]

{ #category : #internal }
ASVGRoot >> setId: anId for: object [

	ids at: anId put: object
]

{ #category : #translate }
ASVGRoot >> translate: node [
	super translate: node.
	self resolveIds.

]

{ #category : #accessing }
ASVGRoot >> version: aString [ 

		self yourself 
]

{ #category : #accessing }
ASVGRoot >> viewBox: aString [ 
	"min-x min-y width height"
	
	| conv mx my w h |
	
	conv := ASConverter new stream: aString readStream.
	
	mx := conv skipBlanks nextNumber.
	my := conv skipBlanks nextNumber.
	w := conv skipBlanks nextNumber.
	h := conv skipBlanks nextNumber.

	viewBox := Rectangle origin: mx@my extent: w@h
]

{ #category : #accessing }
ASVGRoot >> width [
	^ width
]

{ #category : #accessing }
ASVGRoot >> width: aString [
	
	width := ASLength fromString: aString

]

{ #category : #accessing }
ASVGRoot >> x: aString [ 
	self yourself 
]

{ #category : #accessing }
ASVGRoot >> y: aString [ 
	self yourself 
]

{ #category : #internal }
ASVGRoot >> zoomAndPan: aString [ 
	"self shouldBeImplemented."
]
