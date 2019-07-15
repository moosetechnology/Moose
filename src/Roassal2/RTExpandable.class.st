"
Make an element clickable and expandable. When expanded, elements may be added inside.

Consider the following example:
[[[
v := RTView new.

s := RTShapeBuilder new
		rectangle;
		width: [ :c | c numberOfVariables * 5 ]; height: #numberOfMethods.
		
es := s elementsOn: RTShape withAllSubclasses.
v add: es.

es @ RTPopup @ (RTLabelled new setAsHighlightable).

expand := (RTExpandable new
				group: [ :group :element | 
					methods := (RTBox new color: Color red) 
										elementsOn: element model rtmethods.
					RTGridLayout on: methods.
					methods @ RTPopup.
					group addAll: methods];
				afterBlock: [ RTGridLayout on: es] ).
es @ expand. 

RTGridLayout on: es.
^ v

]]]
"
Class {
	#name : #RTExpandable,
	#superclass : #RTClickStateInteraction,
	#instVars : [
		'afterBlock',
		'groupBlock'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #accessing }
RTExpandable >> afterBlock [
	^ afterBlock
]

{ #category : #accessing }
RTExpandable >> afterBlock: aZeroArgBlock [
	"The block is executed after an expension or a retraction"
	afterBlock := aZeroArgBlock
]

{ #category : #'as yet unclassified' }
RTExpandable >> createAndRememberElementsFor: element [
	| t |
	t := self createElementsFor: element.
	element attributes at: #expandedElements put: t.
	element attributes at: #oldExtent put: element extent.
	^ t
]

{ #category : #'as yet unclassified' }
RTExpandable >> createElementsFor: element [
	| g |
	g := RTGroup new.
	groupBlock value: g value: element.
	^ g
]

{ #category : #'as yet unclassified' }
RTExpandable >> createOrRetreiveElementsFor: element [
	^ (self hasElementBeenExpended: element)
		ifTrue: [ self retreiveElementsFor: element ]
		ifFalse: [ self createAndRememberElementsFor: element ]
]

{ #category : #'as yet unclassified' }
RTExpandable >> evaluateAfterBlock [
	afterBlock value
]

{ #category : #'as yet unclassified' }
RTExpandable >> group [
	"Return aTwoArgBlock has to follow the pattern [ :group :element |  ... ]
	group is an empty group. You need to add what you want to be displayed in the popup. el is the element on which the mouse is above."
	^ groupBlock 
]

{ #category : #'as yet unclassified' }
RTExpandable >> group: aTwoArgBlock [
	"aTwoArgBlock has to follow the pattern [ :group :element |  ... ]
	group is an empty group. You need to add what you want to be displayed in the popup. el is the element on which the mouse is above."
	groupBlock := aTwoArgBlock
]

{ #category : #'as yet unclassified' }
RTExpandable >> hasElementBeenExpended: element [
	^ element attributes includesKey: #expandedElements
]

{ #category : #'as yet unclassified' }
RTExpandable >> retreiveElementsFor: element [
	^ element attributes at: #expandedElements
]

{ #category : #'as yet unclassified' }
RTExpandable >> select: element [
	| es |
	"es := self createOrRetreiveElementsFor: element."
	es := self createAndRememberElementsFor: element.
	
	element view addAll: es.

	RTNest new 
		on: element nest: es.
		
	self evaluateAfterBlock.

]

{ #category : #'as yet unclassified' }
RTExpandable >> unselect: element [
	(self retreiveElementsFor: element) do: #remove.
	element extent: (element attributes at: #oldExtent).
	self evaluateAfterBlock
]
