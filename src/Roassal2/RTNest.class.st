"
A RTNest is about nesting a group of objects in an element, typically located below.

Here is an example:
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
| v  es |
v := RTView new.
es := RTBox elementsOn: RTShape withAllSubclasses.

v addAll: es.

RTNest new
	for: es
	add: [ :group :model | 
		group addAll: ((RTBox new color: Color blue) elementsOn: model rtmethods).
		RTGridLayout on: group.
	].

RTFlowLayout new on: es.
es @ RTPopup @ RTDraggable.
v
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTNest,
	#superclass : #RTObject,
	#instVars : [
		'layout',
		'padding',
		'behavior',
		'view',
		'labelShape'
	],
	#category : #'Roassal2-Core'
}

{ #category : #'setting nesting behavior' }
RTNest >> behavior: aBehavior [
	behavior := aBehavior 
]

{ #category : #public }
RTNest >> centerOn: backElement elements: elements [
	"Public method. This method does the following actions:
		- resize the backElement to encompasse all the elements
		- translate all the elements on top of backElement
		- perform a layout if one is set"

	self centerOnTrachelShape: backElement trachelShape elements: elements
]

{ #category : #public }
RTNest >> centerOnTrachelShape: trachelShape elements: elements [
	"Public method. This method does the following actions:
		- resize the backElement to encompasse all the elements
		- translate all the elements on top of backElement
		- perform a layout if one is set"

	behavior centerOnTrachelShape: trachelShape elements: elements asGroup.

]

{ #category : #utility }
RTNest >> doLayoutIfNecessaryOn: elements [
	layout ifNotNil: [ layout on: elements ]
]

{ #category : #utility }
RTNest >> encompassingRectangleOf: elements [
	^ elements asGroup encompassingRectangle 

]

{ #category : #public }
RTNest >> for: collectionOfElements add: aTwoArgBlock [
	"aTwoArgBlock follows [ :group :model | ... ]"
	"Return all the elements added by the argument block"
	
	"
	Example:
	| v es |
	v := RTView new.
	es := RTBox elementsOn: RTShape withAllSubclasses.
	v addAll: es.
	RTNest new
		for: es
		add: [ :group :model | 
			group
				addAll: ((RTBox new color: Color blue) elementsOn: model rtmethods).
			RTGridLayout on: group ].
	RTFlowLayout new on: es.
	es @ RTPopup @ RTDraggable.
	^ v
	"
	
	| allAddedObject |
	allAddedObject := RTGroup new.
	collectionOfElements do: [ :element |
		| g |
		g := RTGroup new.
		aTwoArgBlock value: g value: element model.
		self doLayoutIfNecessaryOn: g.
		self on: element nest: g.
		
		"Add the elements in the view. If no view has been set, it try to use the view of the elements"
		view isNil
			ifTrue: [ 
				element view ifNil: [ self error: 'Please, specify in RTNest a view to which elements have to be added in using #view:.' ].
				element view addAll: g ]
			ifFalse: [ view addAll: g ].
		allAddedObject addAll: g
	].
	^ allAddedObject
]

{ #category : #public }
RTNest >> for: collectionOfElements inShape: aSymbol add: aTwoArgBlock [
	"aTwoArgBlock follows [ :group :model | ... ]"
	"This methods assumes that each shape of collection of Elements is a multi composed shape"
	
	collectionOfElements do: [ :element |
		| g |
		g := RTGroup new.
		aTwoArgBlock value: g value: element model.
		self on: element inShape: aSymbol nest: g.
		element view addAll: g.
	]
]

{ #category : #public }
RTNest >> indexOfNonLabelShapeIn: backElement [
	| nonLabelShape |
	nonLabelShape := backElement shape allShapes detect: [ :aShape | aShape class ~~ RTLabel ].
	^ backElement shape allShapes indexOf: nonLabelShape
]

{ #category : #initialization }
RTNest >> initialize [
	super initialize.
	padding := 5.
	self noBehavior
]

{ #category : #public }
RTNest >> isCompositeAndHasLabel: backElement [
	^ backElement shape class == RTCompositeShape
		and: [ backElement shape allShapes anySatisfy: [ :aShape | aShape class == RTLabel ] ]
]

{ #category : #accessing }
RTNest >> layout [
	^ layout
]

{ #category : #accessing }
RTNest >> layout: aLayout [
	"Set a layout that is used before doing the nesting"
	layout := aLayout
]

{ #category : #'OBSOLETE - to be removed' }
RTNest >> makeElements: elements draggableBy: backElement [
	^ self makeElements: elements draggableByTrachelShape: backElement trachelShape
	 
]

{ #category : #'OBSOLETE - to be removed' }
RTNest >> makeElements: elements draggableByTrachelShape: trachelShape [
	| callback |
	callback := TRTranslationCallback block: [ :shape :step | elements do: [ :e | e translateBy: step ] ].
	trachelShape addCallback: callback 
]

{ #category : #utility }
RTNest >> makeElements: elements resizable: backElement [
	"If an element of elements is resized, then the backElement should be resized as well.
	"
	| callback1 callback2 |
	callback1 := TRExtentCallback block: [ :shape :newsize |
		self resizeWithoutRecursion: backElement for: elements
	].
	callback2 := TRTranslationCallback block: [ :shape :newsize |
		self resizeWithoutRecursion: backElement for: elements
	].
	elements do: [ :e | e trachelShape addCallback: callback1 ; addCallback: callback2 ] 
]

{ #category : #utility }
RTNest >> makeElements: elements resizableWithoutRecursion: backElement [
	"If an element of elements is resized, then the backElement should be resized as well.
	"
	| callback1 callback2 |
	callback1 := TRExtentCallback block: [ :shape :newsize |
		self resizeWithoutRecursion: backElement for: elements
	].
	callback2 := TRTranslationCallback block: [ :shape :newsize |
		self resizeWithoutRecursion: backElement for: elements
	].
	elements do: [ :e | e trachelShape addCallback: callback1 ; addCallback: callback2 ] 
]

{ #category : #utility }
RTNest >> mark: backElement with: elements [
	(backElement hasAttribute: #nestedElements)
		ifFalse: [ backElement attributeAt: #nestedElements put: RTGroup new ].
	(backElement attributeAt: #nestedElements) addAll: elements.
	elements do: [ :anElement | anElement attributeAt: #parentElement put: backElement ]
]

{ #category : #'setting nesting behavior' }
RTNest >> noBehavior [
	self behavior: (RTNoBehavior instance)
]

{ #category : #public }
RTNest >> on: element inShape: aSymbol nest: elements [
	"public method"
	"add nested elements, in a particular shape of the composed shape of the element. Assume that the shape of element is composed"
	"aSymbol could be #first, #second, #third, #fourth"
	
	"We assume that the roassal shape of element is composed"
	^ self on: element inShape: aSymbol nest: elements layout: #vertical
]

{ #category : #public }
RTNest >> on: element inShape: aSymbol nest: elements layout: aSymbolLayout [
	"public method"
	"aSymbol could be #first, #second, #third, #fourth
	
	aSymbolLayout is either #vertical or #horizontal"
	
	self doLayoutIfNecessaryOn: elements.
	
	"We assume that the roassal shape of element is composed"
	behavior on: (aSymbol rtValue: element trachelShape shapes) setNested: elements asGroup.
	"self onTrachelShape: (aSymbol rtValue: element trachelShape shapes) nest: elements."

	aSymbolLayout rtValue: element trachelShape.
	element trachelShape relayout.
	self mark: element with: elements
]

{ #category : #public }
RTNest >> on: backElement nest: elements [
	"public method"

	"backElement is the elements on which elements are layout-ed"

	"- position the elements above backElement. 
	 - resize backElement to encapsulate the elements
	 - perform a layout of the elements if a layout has been set
	 - make the inner elements draggable"

	"We check if the shape of backElement is a composite shape. nested elements should not be on the Label. We manually consider this situation since it is recurrent"

	| indexOfNonLabel |
	self
		assert: [ elements isKindOf: Collection ]
		description: 'Need to provide a collection as second argument'.
	self
		assert: [ backElement isKindOf: RTElement ]
		description: 'Need to provide an element as first argument'.
	(self isCompositeAndHasLabel: backElement)
		ifTrue: [ indexOfNonLabel := self indexOfNonLabelShapeIn: backElement.
			^ self
				on: backElement
				inShape: [ :array | array at: indexOfNonLabel ]
				nest: elements ].
	self doLayoutIfNecessaryOn: elements.
	self on: backElement simplyNest: elements.
	self mark: backElement with: elements
]

{ #category : #public }
RTNest >> on: backElement nestRootOf: elements [
	"public method"

	"backElement is the elements on which elements are layout-ed"

	"elements is a collection of elements. These elements may have relation between them (e.g., nesting). This method is useful for example to nest elements that have been produced by RTMondrian"

	"- position the elements above backElement. 
	 - resize backElement to encapsulate the elements
	 - perform a layout of the elements if a layout has been set
	 - make the inner elements draggable"

	"We check if the shape of backElement is a composite shape. nested elements should not be on the Label. We manually consider this situation since it is recurrent"

	^ self on: backElement nest: (elements select: [ :e | e parentElement isNil ])
]

{ #category : #public }
RTNest >> on: backElement simplyNest: elements [
	behavior on: backElement setNested: elements asGroup
]

{ #category : #'OBSOLETE - to be removed' }
RTNest >> onResizable: backElement nest: elements [
	"PROBABLY THIS METHOD HAS TO BE DELETED"

	"public method"
	"backElement is the elements on which elements are layout-ed"
	"- position the elements above backElement. 
	 - resize backElement to encapsulate the elements
	 - perform a layout of the elements if a layout has been set
	 - make the inner elements draggable"
	
	layout ifNotNil: [ layout on: elements ].
	self centerOn: backElement elements: elements.
	self makeElements: elements draggableBy: backElement.
"	self makeElements: elements transformable: backElement."
	self makeElements: elements resizableWithoutRecursion: backElement.

]

{ #category : #'OBSOLETE - to be removed' }
RTNest >> onTrachelShape: trachelShape nest: elements [
	"public method"
	"backElement is the elements on which elements are layout-ed"
	"- position the elements above backElement. 
	 - resize backElement to encapsulate the elements
	 - perform a layout of the elements if a layout has been set
	 - make the inner elements draggable"

	self doLayoutIfNecessaryOn: elements.
	behavior on: trachelShape setNested: elements asGroup

	"self centerOnTrachelShape: trachelShape elements: elements.
	self makeElements: elements draggableByTrachelShape: trachelShape."

]

{ #category : #accessing }
RTNest >> padding [
	^ padding
]

{ #category : #accessing }
RTNest >> padding: aNumber [
	padding := aNumber
]

{ #category : #'OBSOLETE - to be removed' }
RTNest >> resize: backElement bounds: encompassingRectangle [
	"it translates backElement, but does not trigger events."
	| newRec |
	newRec := (encompassingRectangle topLeft - (padding @ padding)) extent: 
					((encompassingRectangle width + (padding * 2)) @ 
					 (encompassingRectangle height + (padding * 2))).

	backElement trachelShape
		extent: (encompassingRectangle width + (padding * 2)) @ (encompassingRectangle height + (padding * 2)).	
	backElement translateTo: encompassingRectangle center
]

{ #category : #'OBSOLETE - to be removed' }
RTNest >> resize: backElement for: elements [
	| encompassingRectangle |
	encompassingRectangle := self encompassingRectangleOf: elements.
	self resize: backElement bounds: encompassingRectangle.

]

{ #category : #utility }
RTNest >> resizeWithoutRecursion: backElement bounds: encompassingRectangle [
	"it translates backElement, but does not trigger events."
	| newRec |
	newRec := (encompassingRectangle topLeft - (padding @ padding)) extent: 
					((encompassingRectangle width + (padding * 2)) @ 
					 (encompassingRectangle height + (padding * 2))).

	backElement trachelShape
		extent: (encompassingRectangle width + (padding * 2)) @ (encompassingRectangle height + (padding * 2)).	
	backElement trachelShape doWithoutCallbacks: [ backElement translateTo: encompassingRectangle center ]
]

{ #category : #utility }
RTNest >> resizeWithoutRecursion: backElement for: elements [
	| encompassingRectangle |
	encompassingRectangle := self encompassingRectangleOf: elements.
	self resizeWithoutRecursion: backElement bounds: encompassingRectangle.

]

{ #category : #'setting nesting behavior' }
RTNest >> stretchable [
	"It makes a scaling/zooming effect.
	If you change backElement's extent, it changes proportionaly extent and position of nested elements. 
	So the overall image --- composition of backElement and elements --- does not change. 
	It only zoom in/out the overall image."
	self behavior: (RTStretchBehavior new)
]

{ #category : #'setting nesting behavior' }
RTNest >> topLeft [
	self behavior: (RTTopLeftBehavior new)
]

{ #category : #accessing }
RTNest >> view [
	^ view
]

{ #category : #accessing }
RTNest >> view: aRTView [
	"Set the view in which elements have to be added in for:add:"
	view := aRTView
]
