"
-=-=-=-=
b := RTMondrian new.

b interaction snapToGrid.
b shape rectangle size: 20. 
b nodes: (1 to: 9).
b layout grid.
b
-=-=-=-=
"
Class {
	#name : #RTInteractionBuilder,
	#superclass : #RTAbstractBuilder,
	#instVars : [
		'interactions'
	],
	#category : #'Roassal2-Builder-Common'
}

{ #category : #public }
RTInteractionBuilder >> action: aBlockOrSymbol [
	"Add a new action, the argument is taken from the argument"
	^ self item: aBlockOrSymbol action: aBlockOrSymbol
]

{ #category : #'private-adding' }
RTInteractionBuilder >> addExclusiveInteraction: anInteraction [
	"We only keep all the interaction that have a different class"
	interactions := interactions select: [ :i | i class ~~ anInteraction class ].
	self addInteraction: anInteraction
]

{ #category : #'private-adding' }
RTInteractionBuilder >> addInteraction: anInteraction [
	interactions add: anInteraction
]

{ #category : #public }
RTInteractionBuilder >> constrainedDraggable [
	"Make sure that the inner elements cannot escape the encompassing element"
	| i |
	self removeInteractionOfType: RTAbstractDraggable.
	i := RTConstrainedDraggable new.
	i withinParent.
	interactions add: i. 
	^ i
]

{ #category : #public }
RTInteractionBuilder >> decoration [
	| i |
	i := RTDecoration new.
	interactions add: i. 
	^ i
]

{ #category : #public }
RTInteractionBuilder >> draggable [
	| i |
	self removeInteractionOfType: RTAbstractDraggable.
	i := RTDraggable new.
	self addInteraction: i.
	^ i
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> fixedPopupText: aBlock [
	self removeInteractionOfType: RTAbstractPopup.
	self addExclusiveInteraction: (RTFixedPopup new text: aBlock)
]

{ #category : #public }
RTInteractionBuilder >> hasInteractionOfType: cls [
	^ interactions
		anySatisfy: [ :anInt | anInt class == cls or: [ anInt class inheritsFrom: cls ] ]
]

{ #category : #public }
RTInteractionBuilder >> highlight [
	self highlightColored: Color blue
]

{ #category : #public }
RTInteractionBuilder >> highlightColored: aColorOrAOneArgBlockOrSymbol [
	
	self when: TRMouseEnter do: [ :event | 
		RTBlink 
			highlight: event element
			color: (aColorOrAOneArgBlockOrSymbol rtValue: event element model) ].

	self when: TRMouseLeave do: [ :event | 
		RTBlink
			unhighlight: event element ].
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> highlightElements: elementsOrABlock [
	"Highlight the elements, elementsOrABlock may either be a block (which takes as argument the selected element and return a list of elements"
	interactions add: [ :element | element @ (RTHighlightable highlightElements: (elementsOrABlock rtValue: element model)) ]
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> highlightNeighbors: aBlock [
	"Highlight the elements for which the model is given by 'aBlock rtValue: element model', where 'element' is the current element
	
	aBlock takes as input an object and return a collection of objects.
	"
	
	"
	Example:
b := RTMondrian new.
b interaction highlightNeighbour: [ :v | Array with: v - 1 with: v with: v + 1 ].
b nodes: (1 to: 11).
b layout grid.
b 
	
	"
	interactions add: [ :element | element @ (RTHighlightable highlight: aBlock) ]
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> highlightNeighbors: aBlock color: aColorOrABlock [
	"Highlight the elements for which the model is given by 'aBlock rtValue: element', where 'element' is the current element"
	interactions add: [ :element | element @ (RTHighlightable new 
																highlightedColor: aColorOrABlock; 
																highlight: aBlock) ]
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> highlightNeighbour: aBlock [
	self deprecated: 'Use #highlightNeighbors: instead'.
	
	"Highlight the elements for which the model is given by 'aBlock rtValue: element model', where 'element' is the current element
	
	aBlock takes as input an object and return a collection of objects.
	"
	
	"
	Example:
| b |
b := RTMondrian new.
b interaction highlightNeighbors: [ :v | Array with: v - 1 with: v with: v + 1 ].
b nodes: (1 to: 11).
b layout grid.
b 
	
	"
	interactions add: [ :element | element @ (RTHighlightable highlight: aBlock) ]
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> highlightNeighbour: aBlock color: aColorOrABlock [
	self deprecated: 'Use #highlightNeighbors:color: instead'.
	"Highlight the elements for which the model is given by 'aBlock rtValue: element', where 'element' is the current element"
	interactions add: [ :element | element @ (RTHighlightable new 
																highlightedColor: aColorOrABlock; 
																highlight: aBlock) ]
]

{ #category : #initialization }
RTInteractionBuilder >> initialize [
	super initialize.
	self initializeInteractions.
]

{ #category : #initialization }
RTInteractionBuilder >> initializeInteractions [
	interactions := OrderedCollection new
]

{ #category : #'accessing - computed' }
RTInteractionBuilder >> interactionOfType: cls [
	^ interactions
		detect: [ :anInt | anInt class == cls or: [ anInt class inheritsFrom: cls ] ]
		ifNone: [ nil ]
]

{ #category : #public }
RTInteractionBuilder >> item: aTitle action: aBlockOrSymbol [
	interactions add: [ :element | element @ (RTMenuActivable new item: aTitle asString action: [ aBlockOrSymbol rtValue: element model ]) ]
]

{ #category : #public }
RTInteractionBuilder >> menu [
	| i |
	i := RTMenuActivable new.
	interactions add: i. 
	^ i
]

{ #category : #'morphic specific' }
RTInteractionBuilder >> menu: aSymbolOrBlockOrMenu [
	"the argument has to return a menu morph, when evaluated against the object"
	interactions add: [ :element | element when: TRMouseRightClick do: [ :evt | (aSymbolOrBlockOrMenu rtValue: evt element model) popUpInWorld ] ]

]

{ #category : #public }
RTInteractionBuilder >> noInteractions [
	self initializeInteractions.
]

{ #category : #'accessing - computed' }
RTInteractionBuilder >> numberOfInteractions [
	^ interactions size
]

{ #category : #public }
RTInteractionBuilder >> popup [
	"Return a new popup, which is set in the builder"
	| i |
	i := RTPopup new.
	self addExclusiveInteraction: i. 
	^ i
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> popupText [
	self popupText: #yourself
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> popupText: aBlock [
	^ self popup text: aBlock
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> popupText: aBlock color: aColorBlock [
	self addExclusiveInteraction: (RTPopup new text: aBlock; textColor: aColorBlock)
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> popupTextColor: aColorBlock [
	self popupText: #yourself color: aColorBlock
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> popupView: aTwoArgBlock [
	"aTwoArgBlock has to follow the pattern [ :group :element |  ... ]
	group is an empty group. You need to add what you want to be displayed in the popup. el is the element on which the mouse is above."
	^ self popupView: aTwoArgBlock backgroundColor: (Color blue alpha: 0.6)
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> popupView: aTwoArgBlock backgroundColor: aBackgroundColor [
	"aTwoArgBlock has to follow the pattern [ :group :element |  ... ]
	group is an empty group. You need to add what you want to be displayed in the popup. el is the element on which the mouse is above."
	self addExclusiveInteraction: (RTPopup new background: aBackgroundColor group: aTwoArgBlock)
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> popupView: aTwoArgBlock backgroundColor: aBackgroundColor borderColor: aBorderColor [
	"aTwoArgBlock has to follow the pattern [ :group :element |  ... ]
	group is an empty group. You need to add what you want to be displayed in the popup. el is the element on which the mouse is above."
	self addExclusiveInteraction: (RTPopup new borderColor: aBorderColor; background: aBackgroundColor group: aTwoArgBlock)
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> popupViewWithName: aTwoArgBlock [
	"aTwoArgBlock has to follow the pattern [ :group :element |  ... ]
	group is an empty group. You need to add what you want to be displayed in the popup. el is the element on which the mouse is above."
	^ self popupViewWithName: aTwoArgBlock backgroundColor: (Color blue alpha: 0.6)

]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> popupViewWithName: aTwoArgBlock backgroundColor: aBackgroundColor [
	"aTwoArgBlock has to follow the pattern [ :group :element |  ... ]
	group is an empty group. You need to add what you want to be displayed in the popup. el is the element on which the mouse is above."
	self addExclusiveInteraction: (RTPopup new namedBackground: aBackgroundColor group: aTwoArgBlock)
]

{ #category : #public }
RTInteractionBuilder >> removeInteractionOfType: cls [
	"Remove the interaction of type cls if present"
	interactions 
		detect: [ :anInt | anInt class == cls or: [ anInt class inheritsFrom: cls ] ] 
		ifFound: [ :int | interactions := interactions copyWithout: int ]

"	| int |
	(interactions anySatisfy: [ :anInt | anInt class == cls or: [ anInt class inheritsFrom: cls ] ])
		ifTrue: [ 
			int := interactions detect: [ :anInt | anInt class == cls ].
			interactions := interactions copyWithout: int ]"
]

{ #category : #building }
RTInteractionBuilder >> setUpElement: elementOrGroup [
	"elements is an RTGroup, that contains RTElement or RTEdges"
	
	interactions do: [ :int | elementOrGroup @ int ]
]

{ #category : #building }
RTInteractionBuilder >> setUpElements: elements [
	"elements is an RTGroup, that contains RTElement or RTEdges"
	interactions do: [ :int | elements @ int ]
]

{ #category : #public }
RTInteractionBuilder >> showEdge [
	"Public method
	
	| b |
	b := RTMondrian new.
	b interaction showEdge connectToAll: [ :v | Array with: v + 1 ].
	b nodes: #(1 2 2 3).

	b layout circle initialRadius: 10. 
	b
	"
	
	"
	slighly more elaborated example:
classes := Collection withAllSubclasses.
b := RTMondrian new.
b shape circle.
b interaction showEdge 
					shape: (RTArrowedLine new color: Color green);
					connectToAll: #dependentClasses.
b nodes: classes.
b edges moveBehind; connectFrom: #superclass.
b normalizer normalizeSize: #numberOfLinesOfCode; normalizeColor: #numberOfLinesOfCode.
b layout cluster.
b
	"
	
	

	| i |
	i := RTShowEdge new.
	interactions add: i. 
	^ i
]

{ #category : #public }
RTInteractionBuilder >> showLabel [
	"Public method
	
	| b |
	b := RTMondrian new.
	b interaction showEdge connectToAll: [ :v | Array with: v + 1 ].
	b interaction showLabel highlightObject: [ :v | v + 1 ].
	b nodes: #(1 2 2 3).

	b layout circle initialRadius: 10. 
	b
	"
	
	"
	slighly more elaborated example:
classes := Collection withAllSubclasses.
b := RTMondrian new.
b shape circle.
b interaction showEdge 
					shape: (RTArrowedLine new color: Color green);
					connectToAll: #dependentClasses.

b interaction showLabel
					highlightObjects: #dependentClasses.
					
b nodes: classes.
b edges moveBehind; connectFrom: #superclass.
b normalizer normalizeSize: #numberOfLinesOfCode; normalizeColor: #numberOfLinesOfCode.
b layout cluster.
b
	"
	
	

	| i |
	i := RTShowLabel new.
	interactions add: i. 
	^ i
]

{ #category : #public }
RTInteractionBuilder >> snapToGrid [
	"Make the elements draggable and positioned on a grid"
	| i cls |
	cls := RTDraggable.
	self removeInteractionOfType: cls.
	i := RTDraggableSnapToGrid new.
	interactions add: i.
	^ i
]

{ #category : #'public - events-registering' }
RTInteractionBuilder >> when: event do: block [
	self addInteraction: [ :element | element when: event do: block ]
]
