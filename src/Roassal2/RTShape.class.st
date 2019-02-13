"
A RTShape is an element factory. A shape is shared amoung all the elements created by the shape. We therefore have the following relations

An ''element'' is a graphical representation of an arbitrary object. An element is combined with ''shapes'' to define its visual representation. A shape describes a visual primitive representation such as a box, a circle, a line or a textual label. Shapes can be combined to form elaborated shapes. An end user sees elements and interacts with these elements by using the mouse and keyboard. A Roassal element is a compound object that contains (i) a two dimensional spatial location; (ii) a set of interactions; (iii) a combination of shapes; (iv) a model, which is any arbitrary object that belongs to the domain model provided by the user.


shape := RTBox new size: 10.
e1 := shape elementOn: 'hello'.
e2 := shape elementOn: 'world'.

self assert: e1 shape == e2 shape.

self assert: e1 shape ~~ e1 trachelShape.
self assert: (e1 shape isKindOf: RTBox).
self assert: (e1 trachelShape isKindOf: TRBoxShape).

self assert: e1 trachelShape ~~ e2 trachelShape.

"
Class {
	#name : #RTShape,
	#superclass : #RTObject,
	#instVars : [
		'color',
		'scale',
		'rotation'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #public }
RTShape class >> + anotherShape [
	^ self new + anotherShape
]

{ #category : #public }
RTShape class >> color: aColor [
	^ self new color: aColor
]

{ #category : #accessing }
RTShape class >> compoundElement [

	^ self instance compoundElement
]

{ #category : #public }
RTShape class >> compoundElementOn: aModel [

	^ self instance compoundElementOn: aModel
]

{ #category : #public }
RTShape class >> compoundElementsOn: models [
	"Return a group of elements, which is a kind of ordered collection"
	| group aShape |
	group := RTGroup new.
	aShape := self instance.
	models do: [ :m | 
		group add: (aShape compoundElementOn: m) ].
	^ group
]

{ #category : #initialization }
RTShape class >> defaultColor [

	^ Color veryVeryLightGray
]

{ #category : #accessing }
RTShape class >> element [

	^ self instance element
]

{ #category : #public }
RTShape class >> elementOn: aModel [
	"Create an element with aModel as model and an instance of myself (which could be a subclass) as shape"
	^ self instance elementOn: aModel
]

{ #category : #public }
RTShape class >> elementsOn: models [
	"Return a group of elements, which is a kind of ordered collection"
	| group aShape |
	group := RTGroup new.
	aShape := self instance.
	models do: [ :m | 
		group add: (aShape elementOn: m) ].
	^ group
]

{ #category : #accessing }
RTShape class >> instance [
	^ self new
]

{ #category : #public }
RTShape >> + anotherShape [
	"Return a composed shape"
	^ RTCompositeShape with: self with: anotherShape instance
]

{ #category : #hooks }
RTShape >> borderColor: aBlockOrAColorOrSymbol [
	"This method is empty, and may be overideen in subclasses. Having this method is empty enables RTLine and other to receive that message, and doing anything."
]

{ #category : #hooks }
RTShape >> borderWidth: aBlockOrAColorOrSymbol [
	"This method is empty, and may be overideen in subclasses. Having this method is empty enables RTLine and other to receive that message, and doing anything."
]

{ #category : #accessing }
RTShape >> color [
	^ color
]

{ #category : #accessing }
RTShape >> color: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self colorElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTShape >> colorElement: aBlock [
	color := aBlock
]

{ #category : #rendering }
RTShape >> colorFor: anElement [
	^ color rtValue: anElement
]

{ #category : #public }
RTShape >> compoundElement [

	^ RTCompoundElement new addShape: self; yourself
]

{ #category : #public }
RTShape >> compoundElementOn: aModel [

	^ RTCompoundElement new model: aModel; addShape: self; yourself
]

{ #category : #public }
RTShape >> compoundElementsOn: models [
	| group |
	group := RTGroup new.
	models do: [ :m | group add: (self compoundElementOn: m) ].
	^ group
]

{ #category : #configuration }
RTShape >> defaultColor [
	"Return the color used by myself."
	^ self class defaultColor
]

{ #category : #public }
RTShape >> element [

	^ RTElement new addShape: self; yourself
]

{ #category : #public }
RTShape >> elementOn: aModel [

	^ RTElement new model: aModel; addShape: self; yourself
]

{ #category : #public }
RTShape >> elementsOn: models [
	| group |
	group := RTGroup new.
	models do: [ :m | group add: (self elementOn: m) ].
	^ group
]

{ #category : #accessing }
RTShape >> fillColor [
	^ self color
]

{ #category : #accessing }
RTShape >> fillColor: arg [
	^ self color: arg
]

{ #category : #accessing }
RTShape >> fillColorElement: arg [
	^ self colorElement: arg
]

{ #category : #accessing }
RTShape >> geometryFor: anElement [
	"Return a geometric representation of the shape. A geometric representation is used for computing intersections, overlapping, etc."

	^ GRectangle
		origin: anElement encompassingRectangle origin
		corner: anElement encompassingRectangle corner
]

{ #category : #initialization }
RTShape >> initialize [
	super initialize.
	color := self defaultColor.
	rotation := 0. 
	scale := 1.
]

{ #category : #accessing }
RTShape >> instance [
	^ self
]

{ #category : #accessing }
RTShape >> rotation [
	^ rotation
]

{ #category : #accessing }
RTShape >> rotation: aValueOrAOneArgBlock [
	self rotationElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTShape >> rotationElement: aBlock [
	rotation := aBlock
]

{ #category : #rendering }
RTShape >> rotationFor: anElement [
	^ rotation rtValue: anElement
]

{ #category : #accessing }
RTShape >> scale [
	^ scale
]

{ #category : #accessing }
RTShape >> scale: aValueOrAOneArgBlock [
	self scaleElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTShape >> scaleElement: aBlock [
	scale := aBlock
]

{ #category : #rendering }
RTShape >> scaleFor: anElement [
	^ scale rtValue: anElement
]

{ #category : #hooks }
RTShape >> trachelShapeClass [
	self subclassResponsibility 
]

{ #category : #public }
RTShape >> trachelShapeFor: anElement [
	| trachelShape |
	trachelShape := self trachelShapeClass new.
	self updateFor: anElement trachelShape: trachelShape.
	^ trachelShape
]

{ #category : #hooks }
RTShape >> updateFor: edgeOrElement [
	self updateFor: edgeOrElement trachelShape: edgeOrElement trachelShape
]

{ #category : #hooks }
RTShape >> updateFor: edgeOrElement trachelShape: trachelShape [

	self subclassResponsibility
]
