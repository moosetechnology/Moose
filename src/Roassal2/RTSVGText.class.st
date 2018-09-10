"
A RTSVGLine is represents the SVG text of a regular or rotated text, as defined in Roassal.

"
Class {
	#name : #RTSVGText,
	#superclass : #RTSVGEntity,
	#instVars : [
		'x',
		'y',
		'angle',
		'content',
		'fontSize'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGText >> addMatrix: stream visitor: visitor [
	"| m |
	m := element matrix.
	stream
		nextPutAll: 'matrix(';
		nextPutAll: (visitor number: m sx);
		nextPutAll: ',';
		nextPutAll: (visitor number: m shy);
		nextPutAll: ',';
		nextPutAll: (visitor number: m shx);
		nextPutAll: ',';
		nextPutAll: (visitor number: m sy);
		nextPutAll: ',';
		nextPutAll: (visitor number: m x);
		nextPutAll: ',';
		nextPutAll: (visitor number: m y negated);
		nextPutAll: ')'."
	| box |
	box := element encompassingRectangle.
	stream
		nextPutAll: 'rotate(';
		nextPutAll: (visitor number: self angle);
		nextPutAll: ', ';
		nextPutAll: (visitor number: self x);
		nextPutAll: ', ';
		nextPutAll: (visitor number: self y);
		nextPutAll: ') '.
		
	
]

{ #category : #adding }
RTSVGText >> addOn: stream using: aSVGVisitor [
	| box |
	aSVGVisitor names at: self element put: self id.
	self openDef: stream.
	self addPosition: stream.
	self startStyle: stream.
	self addFillColor: stream.
	self closeTag: stream.
	self startTransform: stream.
	self addMatrix: stream visitor: aSVGVisitor.
	self closeTag: stream.
	self startClass: stream.
	self closeTag: stream.
	self closeDefWithContent: stream.
	self addStringWithFont: self content fontSize: self fontSize into: stream.
	self addExternalInteractions: aSVGVisitor.
	self closeFullDef: stream.

]

{ #category : #adding }
RTSVGText >> addPosition: stream [
	|box temp |
	box := element encompassingRectangle.
	temp := RTSVGVisitor new.
	
	stream
		nextPutAll: 'x="';
		nextPutAll: (temp number: (self x - (box width / 5)));
		nextPutAll: '" y="';
		nextPutAll: (temp number: (self y + (box height / 4)));
		nextPutAll: '" '.
]

{ #category : #accessing }
RTSVGText >> angle [
	^ angle
]

{ #category : #accessing }
RTSVGText >> angle: anObject [
	angle := anObject
]

{ #category : #accessing }
RTSVGText >> content [
	^ content
]

{ #category : #accessing }
RTSVGText >> content: anObject [
	content := anObject
]

{ #category : #accessing }
RTSVGText >> element: anElement text: aString at: aPoint color: aColor [	
	self element: anElement text: aString at: aPoint color: aColor angle: nil
]

{ #category : #accessing }
RTSVGText >> element: anElement text: aString at: aPoint color: aColor angle: anAngle [
	self element: anElement.
	self content: aString.
	self x: aPoint x; y: aPoint y.
	self fillColor: aColor.
	self angle: anAngle.
	self fontSize: anElement fontSize.
]

{ #category : #accessing }
RTSVGText >> fontSize [
	^ fontSize
]

{ #category : #accessing }
RTSVGText >> fontSize: anObject [
	fontSize := anObject
]

{ #category : #initialization }
RTSVGText >> initialize [
	self type: 'text'.
	self label: 'text'
]

{ #category : #accessing }
RTSVGText >> x [
	^ x
]

{ #category : #accessing }
RTSVGText >> x: anObject [
	x := anObject
]

{ #category : #accessing }
RTSVGText >> y [
	^ y
]

{ #category : #accessing }
RTSVGText >> y: anObject [
	y := anObject
]
