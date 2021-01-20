Class {
	#name : #FamixAbstractVisualization,
	#superclass : #Object,
	#instVars : [
		'canvas'
	],
	#category : #'Moose-RoassalPaintings-FamixVisualizations'
}

{ #category : #accessing }
FamixAbstractVisualization class >> defaultTitle [
	^ self subclassResponsibility
]

{ #category : #accessing }
FamixAbstractVisualization class >> icon [
	^ self subclassResponsibility
]

{ #category : #display }
FamixAbstractVisualization >> appearInPaneComposite: aGTComposite [
	aGTComposite roassal3
		title: self gtCompositeTitle;
		titleIcon: self class icon;
		initializeCanvas: [ self canvas ]
]

{ #category : #accessing }
FamixAbstractVisualization >> canvas [
	^ canvas
]

{ #category : #accessing }
FamixAbstractVisualization >> gtCompositeTitle [
	^ self class defaultTitle
]

{ #category : #initialization }
FamixAbstractVisualization >> initialize [
	super initialize.
	canvas := RSCanvas new.
	canvas @ RSCanvasController new noLegend
]

{ #category : #display }
FamixAbstractVisualization >> open [
	self canvas openWithTitle: self windowTitle
]

{ #category : #accessing }
FamixAbstractVisualization >> windowTitle [
	^ self class defaultTitle
]
