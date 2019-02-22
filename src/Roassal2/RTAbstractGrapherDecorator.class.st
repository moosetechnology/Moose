Class {
	#name : #RTAbstractGrapherDecorator,
	#superclass : #RTObject,
	#instVars : [
		'builder',
		'shapeBuilder',
		'placedInFront',
		'datasets'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #utility }
RTAbstractGrapherDecorator >> boxFrom: fromPoint to: toPoint [
	| l ext |
	ext := fromPoint corner: toPoint.
	l := (RTBox new width: ext width abs; height: ext height abs; color: (Color blue alpha: 0.3)) element.
	l translateTo: ext center.
	builder view add: l.
	^ l
]

{ #category : #accessing }
RTAbstractGrapherDecorator >> builder: aGraphBuilder [
	builder := aGraphBuilder
]

{ #category : #testing }
RTAbstractGrapherDecorator >> convertPointForGraph: p [
	^ p x @ p y negated
]

{ #category : #accessing }
RTAbstractGrapherDecorator >> dataset: aDataset [
	self datasets: (Array with: aDataset)
]

{ #category : #accessing }
RTAbstractGrapherDecorator >> datasetValues [
	"Return the list of Y values for all the datasets"

	^ self datasets flatCollect: #getValuesY
]

{ #category : #accessing }
RTAbstractGrapherDecorator >> datasetValuesX [
	"Return the list of X values for all the datasets"

	^ self datasets flatCollect: #getValuesX
]

{ #category : #accessing }
RTAbstractGrapherDecorator >> datasets [
	^ datasets ifNil: [ builder datasets ]
]

{ #category : #accessing }
RTAbstractGrapherDecorator >> datasets: aCollection [
	datasets := aCollection
]

{ #category : #'accessing - computed' }
RTAbstractGrapherDecorator >> elementsWithModel [
	^ self view elements select: [ :e | e model notNil ]
]

{ #category : #testing }
RTAbstractGrapherDecorator >> hasDatasets [
	^ datasets isNotNil and: [ datasets isNotEmpty ]
]

{ #category : #initialization }
RTAbstractGrapherDecorator >> initialize [
	super initialize.
	shapeBuilder := RTShapeBuilder new. 
	shapeBuilder line.
	placedInFront := true.
]

{ #category : #configuration }
RTAbstractGrapherDecorator >> isBehind [
	^ placedInFront = false
]

{ #category : #configuration }
RTAbstractGrapherDecorator >> isInFront [
	^ placedInFront = true
]

{ #category : #testing }
RTAbstractGrapherDecorator >> isPointOverTheBuilder: aPoint [
	"Return true of false on whether the provided point is above the builder.
	Note that the point is translated from the camera"
	| pp |
	pp := self convertPointForGraph: aPoint.
	
	"Humm... I am not sure this is the best way to do this. What happens if the view is embedded?"
	^ pp >= (0 @ 0) and: [ pp <= builder extent ]
]

{ #category : #utility }
RTAbstractGrapherDecorator >> label: aString above: position [
	"Add a label in the view"
	| e |
	e := self label: aString on: position.
	e translateTo: position - (e extent / 2).
	^ e
]

{ #category : #utility }
RTAbstractGrapherDecorator >> label: aString on: position [
	"Add a label in the view"
	^ self label: aString on: position color: RTLabel defaultColor
]

{ #category : #utility }
RTAbstractGrapherDecorator >> label: aString on: position color: aColor [
	"Add a label in the view"
	| e |
	e := (RTLabel new color: aColor) elementOn: aString.
	e translateTo: position.
	builder view add: e.
	^ e
]

{ #category : #utility }
RTAbstractGrapherDecorator >> lineFrom: fromPoint to: toPoint [
	| e1 e2 l |
	e1 := (RTEllipse new size: 0) element.
	e2 := (RTEllipse new size: 0) element.
	e1 translateTo: fromPoint.
	e2 translateTo: toPoint.
	l := shapeBuilder edgeFrom: e1 to: e2.
	builder view add: e1; add: e2; add: l.
	^ l
]

{ #category : #configuration }
RTAbstractGrapherDecorator >> moveBehind [
	placedInFront := false
]

{ #category : #configuration }
RTAbstractGrapherDecorator >> moveInFront [
	placedInFront := true
]

{ #category : #hooks }
RTAbstractGrapherDecorator >> render [
	self subclassResponsibility 
]

{ #category : #accessing }
RTAbstractGrapherDecorator >> shape [
	^ shapeBuilder
]

{ #category : #signalling }
RTAbstractGrapherDecorator >> signalUpdate [
	^ self view signalUpdate
]

{ #category : #accessing }
RTAbstractGrapherDecorator >> view [
	^ builder view
]
