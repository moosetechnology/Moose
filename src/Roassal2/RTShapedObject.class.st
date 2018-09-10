"
A RTShapedObject is the super class of RTElement and RTEdge. A RTShapeObject has the ability to keep attributes, and receive a shape. This is an abstract class, it is not meant to be instantiated.

Instance Variables
	attributes:		<Object>
	isFixed:		<Object>
	model:		<Object>
	shape:		<Object>
	trachelShape:		<Object>
	view:		<Object>

attributes
	- xxxxx

isFixed
	- xxxxx

model
	- xxxxx

shape
	- xxxxx

trachelShape
	- xxxxx

view
	- xxxxx

"
Class {
	#name : #RTShapedObject,
	#superclass : #RTAnnounceableObject,
	#instVars : [
		'isFixed',
		'model',
		'shape',
		'trachelShape',
		'view'
	],
	#category : #'Roassal2-Core'
}

{ #category : #'as yet unclassified' }
RTShapedObject class >> model: anObject [
	^ self new model: anObject
]

{ #category : #adding }
RTShapedObject >> + aRTShape [
	"Add a Roassal shape, class or instance of it. Not that a Trachel cannot be given as argument"
	"Using + between two shapes is used to compose shapes"
	self addShape: aRTShape instance
]

{ #category : #adding }
RTShapedObject >> addShape: aRTShape [
	(shape class == RTNoShape)  
		ifTrue: [	shape := aRTShape instance ]
		ifFalse: [ shape := RTCompositeShape with: shape with: aRTShape ].
	trachelShape := shape trachelShapeFor: self

]

{ #category : #adding }
RTShapedObject >> addedIn: aView [
	self subclassReponsibility
]

{ #category : #'accessing trachel' }
RTShapedObject >> color [
	^ trachelShape color
]

{ #category : #'accessing trachel' }
RTShapedObject >> color: aColor [ 
	^ trachelShape color: aColor
]

{ #category : #initialization }
RTShapedObject >> initialize [
	super initialize.
	shape := RTNoShape new.
	trachelShape := TRNoShape instance.
	isFixed := false
]

{ #category : #testing }
RTShapedObject >> isFixed [
	"True if the element is added in the trachel canvas as a fixed shape. 
	If this is the case, then it will remain fixed when drag and dropping the view"
	^ isFixed
]

{ #category : #accessing }
RTShapedObject >> model [
	^ model
]

{ #category : #accessing }
RTShapedObject >> model: anObject [
	"anObject could be any Smalltalk object. Shapes are computed based on that object"
	model := anObject
]

{ #category : #actions }
RTShapedObject >> pushBack [
	"Move the shaped object back"
	self trachelShape pushBack
]

{ #category : #actions }
RTShapedObject >> pushFront [
	"Move the shaped object front"
	self trachelShape pushFront
]

{ #category : #rendering }
RTShapedObject >> renderOn: trachelCanvas [
	trachelShape isNil ifTrue: [ self error: 'Cannot add an element without a shape. Add a shape to myself, using + or addShape:' . ^ self ].
		
	"Trachel shape use the same announcer than myself"
	trachelShape announcer: self announcer.
	
	"Each trachel shape knows the element. Note that this is not a static dependency between Trachel and Roassal since in Trachel, this element could be any object"
	trachelShape element: self.

	"This ifTrue:ifFalse: is not great. However it simplifies the design"
	self isFixed
		ifTrue: [ trachelCanvas addFixedShape: trachelShape ]
		ifFalse: [ trachelCanvas addShape: trachelShape ].

]

{ #category : #transformations }
RTShapedObject >> scaleBy: aPoint [ 
	trachelShape scaleBy: aPoint
]

{ #category : #actions }
RTShapedObject >> setAsFixed [
	"I will remain fixed when drag and dropping the view"
	isFixed := true 
]

{ #category : #actions }
RTShapedObject >> setAsNotFixed [
	"I will move when dragging the view"
	isFixed := false
]

{ #category : #accessing }
RTShapedObject >> shape [
	"Return the shape of the element. Note that modifying the return roassal shape __will not__ modify the visual appearance of the element. If you wish to do so, you need to work directly on the trachel shape, or call #update and #signalUpdate on the element to propagate the changes."
	^ shape
]

{ #category : #signalling }
RTShapedObject >> signalUpdate [
	^ trachelShape signalUpdate
]

{ #category : #announce }
RTShapedObject >> testCaseAnnounce: evt [
	"It is used for Test Cases because in that case evt does not know where it has been announced."
	| evtInstance |
	evtInstance := evt shape: self trachelShape.
	self announce: evtInstance
]

{ #category : #accessing }
RTShapedObject >> trachelShape [
	"Return the Trachel shape of the element, which has been generated from the Roassal shape and the model. Note that modifying the return Trachel shape __modifies__ the visual appearance of the element. You may want to update the view by sending #signalUpdate to it"
	^ trachelShape
]

{ #category : #updating }
RTShapedObject >> update [
	"Update the trachel shape and reset the path. This has the effect of moving the visual widget"

	self updateShape.
	self updatePosition
]

{ #category : #updating }
RTShapedObject >> updatePosition [
	trachelShape ifNotNil: [ trachelShape resetPath ]
]

{ #category : #rendering }
RTShapedObject >> updateShape [
	shape updateFor: self
]

{ #category : #accessing }
RTShapedObject >> view [
	^ view
]

{ #category : #accessing }
RTShapedObject >> view: aRoassalView [
	view := aRoassalView
]
