Class {
	#name : #RTDecoration,
	#superclass : #RTInteraction,
	#instVars : [
		'items'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #actions }
RTDecoration >> displayDecoration: anElement [
	| position decorations callback |
	position := anElement encompassingRectangle topRight.
	decorations := anElement attributeAt: #decoration ifAbsentPut: [ RTGroup new ].
	decorations ifNotEmpty: [ ^ self ].
	items reverseDo: [ :item | | decoration halfExtent |
		decoration := item element.
		decoration when: TRMouseClick do: [ :anDecorationEvent | item action rtValue: anElement ].
		item tooltip ifNotNil: [ :text | decoration @ (RTPopup text: text) ].
		halfExtent := (decoration extent // 2) * (1 @ -1).
		decoration translateTo: position - halfExtent.
		position := position - (decoration extent x @ 0).
		decorations add: decoration.
		anElement view add: decoration.
	].
	callback := TRTranslationCallback block: [ :shape :step | decorations translateBy: step ].
	anElement attributeAt: #decorationCallback put: callback.
	anElement trachelShape addCallback: callback.
]

{ #category : #actions }
RTDecoration >> hideDecoration: anElement [ 
	| decorations callback |
	decorations := anElement attributeAt: #decoration ifAbsent: [ ^ self ].
	decorations do: #remove.
	anElement removeAttributeAt: #decoration ifAbsent: [ nil ].
	callback := anElement attributeAt: #decorationCallback ifAbsent: [ ^ self ].
	anElement trachelShape removeCallback: callback ifAbsent: [ nil ].
]

{ #category : #initialization }
RTDecoration >> initialize [
	super initialize.
	items := OrderedCollection new.
]

{ #category : #hooks }
RTDecoration >> initializeElement: aRTElement [ 
	aRTElement 
		when: TRMouseEnter 
		do: [ :anEvent | 
			self displayDecoration: aRTElement.
			anEvent signalUpdate ].
	
	aRTElement 
		when: TRMouseLeave 
		do: [ :anEvent |
			self hideDecoration: aRTElement.
			anEvent signalUpdate ]
]

{ #category : #public }
RTDecoration >> shape: aRTShape action: anOneArgBlock [ 
	self shape: aRTShape tooltip: nil action: anOneArgBlock 
]

{ #category : #public }
RTDecoration >> shape: aRTShape tooltip: tooltipString action: anOneArgBlock [ 
	items add: (RTDecorationItem new 
									shape: aRTShape; 
									tooltip: tooltipString;
									action: anOneArgBlock;
									yourself)
]
