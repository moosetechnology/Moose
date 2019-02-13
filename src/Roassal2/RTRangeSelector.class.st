"
A range along the X-Axis is selectable.

-=-=-=-=-=
g := RTGrapher new.
g view: RTView new.
ds := RTData new.
ds points: RTShape withAllSubclasses.
ds y: [ :cls | cls numberOfMethods - 50 ].
ds x: [ :cls | cls numberOfLinesOfCode - 150 ].
g add: ds.

g addDecorator: (RTRangeSelector new callback: [:es | es inspect ]).
""RTGrapherSelectRangeViewContext onGrapher: g.""
g 
-=-=-=--=-=

Another example:
-=-=-=--=-=
v := RTView new.
b := [ :someClasses |
	g := RTGrapher new.
	g view: v.
	ds := RTData new.
	ds points: someClasses.
	ds y: [ :cls | cls numberOfMethods ].
	ds x: [ :cls | cls numberOfLinesOfCode ].
	g add: ds.

	g addDecorator: (RTRangeSelector new callback: [:es | 
		| classesToZoomIn |
		classesToZoomIn := es collect: #model.
		v cleanAll.
		b value: classesToZoomIn
	]).
	g build.
].

b value: RTShape withAllSubclasses.
v
-=-=-=--=-=
"
Class {
	#name : #RTRangeSelector,
	#superclass : #RTAbstractGrapherDecorator,
	#instVars : [
		'visualRange',
		'rectangle',
		'pointWhenStartingDragging',
		'callback'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #accessing }
RTRangeSelector >> callback [
	"Return the block used as a callback when elements are selected"
	^ callback
]

{ #category : #accessing }
RTRangeSelector >> callback: aOneArgBlock [
	"The argument is evaluated with the selected Roassal elements"
	callback := aOneArgBlock
]

{ #category : #callback }
RTRangeSelector >> callbackWithSelectedElements [
	| selectedElements |
	selectedElements := self elementsWithinTheSelection.
	selectedElements ifEmpty: [ ^ self ].
	self evaluateCallBackWithElements: selectedElements
]

{ #category : #'accessing - computed' }
RTRangeSelector >> elementsWithinTheSelection [
	^ self elementsWithModel
		select: [ :e | rectangle containsPoint: e position ]
]

{ #category : #callback }
RTRangeSelector >> evaluateCallBackWithElements: selectedElements [
	callback value: selectedElements
]

{ #category : #initialization }
RTRangeSelector >> initialize [
	super initialize.
	self callback: [ :listOfSelectedElements | "No nothing here" ]
]

{ #category : #hooks }
RTRangeSelector >> render [
	self view
		when: TRMouseDragStart
		do: [ :evt | 
			| x |
			x := evt positionFromCamera x.
			pointWhenStartingDragging := x @ builder extent y negated.
			rectangle := pointWhenStartingDragging corner: x @ 0.
			visualRange := TRBoxShape new
				fromRectangle: rectangle
				color: Color blue trans.
			self view canvas addShape: visualRange.
			self signalUpdate ].
	self view
		when: TRMouseDragging
		do: [ :evt | 
			rectangle := Rectangle
				encompassing:
					(Array
						with: pointWhenStartingDragging
						with: evt positionFromCamera x @ 0).
			visualRange fromRectangle: rectangle.
			self signalUpdate ].
	self view
		when: TRMouseDragEnd
		do: [ :evt | 
			self callbackWithSelectedElements.
			visualRange remove.
			self signalUpdate ]
]
