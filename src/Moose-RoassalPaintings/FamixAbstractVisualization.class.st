"
I am the superclass of Moose visualizations, using Roassal 3.


I provide an API to be displayed
	- in a gt pane: #appearInPaneComposite: 
	- in a new window: #open.

My subclasses should define a default title and icon, and can override #...Title methods.

I know my visualization canvas and provide an accessor for it.
"
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
