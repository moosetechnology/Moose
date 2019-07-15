"
I am a class to create editable label shapes, but do not forget that roassal is for visualizations not to build morphs
"
Class {
	#name : #RTEditableLabel,
	#superclass : #RTLabel,
	#instVars : [
		'fieldArea',
		'editLabelShape',
		'updateMorphExtent',
		'events'
	],
	#category : #'Roassal2-MorphSpecific'
}

{ #category : #configuration }
RTEditableLabel >> editLabelShape: aBool [
	editLabelShape := aBool.
]

{ #category : #rendering }
RTEditableLabel >> hideTextMorphFor: anElement [
	| p base txt sss |
	fieldArea ifNil: [ ^ self ].
	editLabelShape ifFalse: [ 
		fieldArea delete. ^ self ].
	txt := fieldArea text asString.
	self updateTextFor: anElement with: txt. 
	fieldArea class = RubTextFieldArea ifTrue: [ 
		anElement trachelShape text: txt.
		 ]
	ifFalse: [ | lines aColor fontSize shape |
		lines := txt lines.
		aColor := self colorFor: anElement.
		fontSize := self heightFor: anElement.
		fontName := self fontNameFor: anElement.
		shape := anElement trachelShape.
		p := shape position.
		base := shape shapes first.
		shape remove.
		
		sss := shape allShapes.
		shape setShapes: OrderedCollection new.
		(sss select: [ :ssss | ssss class ~~ TRLabelShape ]) do: [ :ssss | shape addShape: ssss ].
		"shape removeShapesSuchAs: [ :ss | ss class == TRLabelShape ]."
		
		lines doWithIndex: [ :l :index | | lbl |
			lbl := TRLabelShape new text: l.
			lbl color: aColor; fontSize: fontSize; fontName: fontName.
			shape addShape: lbl ].
		shape verticalAndLeft.
		anElement view canvas addShape: shape.
		shape translateBy: p.
		shape announcer: base announcer.
	 ].
		
	anElement signalUpdate.
	
	
	fieldArea delete
]

{ #category : #initialization }
RTEditableLabel >> initialize [
	super initialize.
	self editLabelShape: true.
	self updateMorphExtent: true.
	events := OrderedCollection new.
]

{ #category : #events }
RTEditableLabel >> onKeystroke: ablock [
	events add: RubTextChanged-> ablock
]

{ #category : #events }
RTEditableLabel >> onPressingEnter: ablock [
	events add: RubReturnEntered -> ablock
]

{ #category : #rendering }
RTEditableLabel >> showTextMorphFor: anElement [
	"Return the created morph"
	| shape rect  trachelShape str posBlock clazz |
	self assert: [ anElement view notNil ] description: 'The argument should be within a view'.
	shape := anElement shape.
	rect := anElement encompassingRectangle.
	anElement trachelShape class = TRCompositeShape ifTrue: [ 
		trachelShape := (anElement trachelShape shapesInstancesOf: TRLabelShape) first.
		clazz := RubEditingArea ]
	ifFalse: [ 
		trachelShape := anElement trachelShape.
		clazz := RubTextFieldArea ].
	
	str :=  shape textFor: anElement.
	fieldArea := clazz new 
		takeKeyboardFocus;
		updateTextWith: str;
		font: trachelShape font;
		onAnnouncement: MorphLostFocus do: [ :ann | ann morph delete ];	
		openInWorld.
	fieldArea editor selectAt: str size+1.
	
	posBlock := [| pos |
		pos := anElement trachelShape isFixed ifTrue: 
			[ anElement position ] ifFalse: 
			[ anElement view canvas camera fromSpaceToPixel: anElement position ].
		anElement view canvas morph ifNotNil: 
			[ fieldArea position: anElement view canvas morph bounds origin+ pos - (fieldArea extent /2) ] ].

	posBlock value.
	editLabelShape ifFalse: [ 
		fieldArea updateTextWith: ''. ].
	
	events do: [ :evt | fieldArea announcer subscribe: evt key send: #value to: 
		[ evt value value: fieldArea text asString ] ] .
	updateMorphExtent ifTrue: [ 
		fieldArea announcer subscribe: RubTextChanged send: #value to: [ posBlock value ] ].
	^ fieldArea
	
]

{ #category : #rendering }
RTEditableLabel >> textFor: anElement [
	(anElement attributes includesKey: #text) ifFalse: [ 
		anElement attributes at: #text put: (super textFor: anElement) ].
	
	^ anElement attributes at: #text.
]

{ #category : #rendering }
RTEditableLabel >> trachelShapeFor: anElement [
	|  shape |
	
	shape := super trachelShapeFor: anElement.
	anElement when: TRMouseDoubleClick do: [ :evt | 
		self showTextMorphFor: anElement ].
	anElement when: TRMouseLeave do: [ :evt |
		self hideTextMorphFor: anElement. ].
	^ shape
]

{ #category : #configuration }
RTEditableLabel >> updateMorphExtent: aBool [
	updateMorphExtent := aBool
]

{ #category : #rendering }
RTEditableLabel >> updateTextFor: element with: aText [
	element attributes at: #text put: aText
]
