"
A RTAbstractHighlightable is an highlight mechanism of an element or group of elements. It trigger highlight on mouse enter and reset the highlight on mouse leave. By default it highlight the element itself, but by methods #highlight: and #highlightElements: any other element can be highlighted.

Instance Variables
	highlightElements:		<BlockClosure>

highlightElements
	- it is one argument block (o any object which understand #rtValue:) which returns collection of elements. Those element are then highlighted.

"
Class {
	#name : #RTAbstractHighlightable,
	#superclass : #RTInteraction,
	#instVars : [
		'highlightElements'
	],
	#classInstVars : [
		'lastHighlightedElements',
		'lastColor'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #public }
RTAbstractHighlightable class >> allSibblings [
	"Define the interaction to highlight all the elements having the same (using #=) model"
	^ self highlightElements: [ :el | 
		el model 
			ifNotNil: [ el view elementsFromModel: el model ] 
			ifNil: [ #() ] ]
	
	"^ self highlightElements: [ :el | el view elements select: [ :e | e model notNil and: [ e model = el model ] ] ]"
]

{ #category : #public }
RTAbstractHighlightable class >> highlight: aBlock [
	"aBlock return an element or a list of elements to highlight"
	^ self new highlight: aBlock
]

{ #category : #public }
RTAbstractHighlightable class >> highlightElements: aBlock [
	"aBlock return an element or a list of elements to highlight"
	^ self new highlightElements: aBlock
]

{ #category : #'reset shape' }
RTAbstractHighlightable class >> lastHighlightedElements [
	^ lastHighlightedElements
]

{ #category : #'reset shape' }
RTAbstractHighlightable class >> lastHighlightedElements: elements [
	lastHighlightedElements 
		ifNil: [ lastHighlightedElements := elements ]
		ifNotNil: [ lastHighlightedElements := lastHighlightedElements, elements ].
	
]

{ #category : #'reset shape' }
RTAbstractHighlightable class >> resetHighlightedElements [
	lastHighlightedElements := nil.
]

{ #category : #private }
RTAbstractHighlightable >> attributeIdentificator [
	^ self className asSymbol
]

{ #category : #actions }
RTAbstractHighlightable >> doHighlight: element [
	"Public method. Highlight the RTElement passed as argument. It may do the necessary recursion if set by a subclass"
	| elements |
	self unhighlightRecordedElements.
	elements := highlightElements rtValue: element.
	elements := elements copyWithout: nil.
	elements := self getRelevantElementsFrom: elements.
	elements do: [ :eachElement | self doHighlightElement: eachElement ].
	element attributes at: self attributeIdentificator put: elements.
	self class lastHighlightedElements: elements
]

{ #category : #actions }
RTAbstractHighlightable >> doHighlightElement: anElement [
	self subclassResponsibility
]

{ #category : #actions }
RTAbstractHighlightable >> doUnhighlight: element [
	"Public method. Unhighlight the RTElement passed as argument. It may do the necessary recursion if set by a subclass"
	self unhighlightRecordedElements.
	(element hasAttribute: self attributeIdentificator)
		ifFalse: [ ^ self ].
	(element attributeAt: self attributeIdentificator) 
		do: [ :el | self doUnhighlightElement: el ].
	element removeAttributeAt: self attributeIdentificator.
	
]

{ #category : #actions }
RTAbstractHighlightable >> doUnhighlightElement: anElement [
	self subclassResponsibility
]

{ #category : #actions }
RTAbstractHighlightable >> getRelevantElementsFrom: elements [
	"For a given collections of elements, this methods return the elements that must be considered."
	^ elements
]

{ #category : #public }
RTAbstractHighlightable >> highlight: aBlock [
	"aBlock return an object or a list of objects to highlight"
	highlightElements := [ :el | 
		| objects |
		objects := aBlock rtValue: el model.
		(objects flatCollect: [ :o | el view elementsFromModel: o ]) copyWithout: nil
		]
]

{ #category : #public }
RTAbstractHighlightable >> highlightElements [
	^ highlightElements
]

{ #category : #public }
RTAbstractHighlightable >> highlightElements: aBlock [
	"aBlock return an element or a list of elements to highlight"
	highlightElements := aBlock
]

{ #category : #public }
RTAbstractHighlightable >> highlightObject: aBlock [
	"aBlock returns an object to highlight"
	
	"
Example:

b := RTMondrian new.
b shape circle size: 10.
b interaction showEdge 
	connectToAll: #subclasses.

b interaction highlightNeighbors: #subclasses color: Color red.

b interaction showLabel 
	highlightObject: #superclass.
	

b nodes: (Collection withAllSubclasses).
b edges moveBehind; connectFrom: #superclass.
b layout radial.
b
	"
	
	self highlight: [ :oo | Array with: (aBlock rtValue: oo) ]
]

{ #category : #public }
RTAbstractHighlightable >> highlightObjects: aBlock [
	"aBlock returns an array of objects to highlight"
	
	"
Example:

b := RTMondrian new.
b shape circle size: 10.
b interaction showEdge 
	connectToAll: #subclasses.

b interaction highlightNeighbors: #subclasses color: Color red.

b interaction showLabel 
	highlightObjects: #subclasses.
	

b nodes: (Collection withAllSubclasses).
b edges moveBehind; connectFrom: #superclass.
b layout radial.
b
	"
	
	self highlight: [ :oo | aBlock rtValue: oo ]
]

{ #category : #initialize }
RTAbstractHighlightable >> initialize [
	super initialize.
	self highlightElements: [ :el | Array with: el ]
]

{ #category : #hooks }
RTAbstractHighlightable >> initializeElement: element [
	element
		when: TRMouseEnter
		do: [ :e | 
			self doHighlight: element.
			e signalUpdate ].
	element
		when: TRMouseLeave
		do: [ :e | 
			self doUnhighlight: element.
			e signalUpdate ]
]

{ #category : #actions }
RTAbstractHighlightable >> unhighlightRecordedElements [
	self class lastHighlightedElements ifNil: [ ^ self ].
	self class lastHighlightedElements do: [ :el | self doUnhighlightElement: el ].
	self class resetHighlightedElements.
]
