Class {
	#name : #RTTextBuilderTest,
	#superclass : #RTTest,
	#instVars : [
		'builder'
	],
	#category : #'Roassal2-Builder-TextBuilder'
}

{ #category : #asserting }
RTTextBuilderTest >> assertModel: anObject1 position: aSymbol1 equals: anObject2 position: aSymbol2 [ 
	| position1 position2 |
	position1 := aSymbol1 cull: (self encompassingRectangleFromModel: anObject1).
	position2 := aSymbol2 cull: (self encompassingRectangleFromModel: anObject2).
	self assert: (((position1 isNumber) and: [ position2 isNumber ])
					or: [ (position1 isPoint) and: [ position2 isPoint ] ]).
	position1 isNumber
		ifTrue: [ self assert: (position1 - position2) abs <= 1 ]
		ifFalse: [ self assert: (position1 - position2) abs <= (1 @ 1) ].
]

{ #category : #accessing }
RTTextBuilderTest >> elementFromModel: anObject [ 
	^ builder view elementFromModel: anObject
]

{ #category : #accessing }
RTTextBuilderTest >> encompassingRectangleFromModel: anObject [
	^ (self elementFromModel: anObject) encompassingRectangle
]

{ #category : #tests }
RTTextBuilderTest >> fixmeTestWordHighlight [
	| element text |
	builder := RTTextBuilder new.
	text := 'hello'.
	builder interaction highlightColored: Color blue.
	builder addText: text.
	element := builder view elementFromModel: text.
	self assert: element shape color = element shape defaultColor.
	element announce: (TRMouseEnter new shape: element trachelShape).
	self assert: element shape color = Color blue.
	element announce: (TRMouseLeave new shape: element trachelShape).
	self assert: element shape color = element shape defaultColor.
]

{ #category : #running }
RTTextBuilderTest >> setUp [
	super setUp.
	builder := RTTextBuilder new
]

{ #category : #tests }
RTTextBuilderTest >> testAdditionalInformation [
	| text trigger elHello elWorld |
	text := 'hello world'.
	trigger := false.
	builder wordHook: [ :anElement :anInterval | 
								anElement model = 'hello' 
									ifTrue: [ anElement attributeAt: #myValue put: 'value' ] ]. 
	builder wordInteraction 
				when: TRMouseClick 
				do: [ :event | (event element hasAttribute: #myValue) 
										ifTrue: [ trigger := true ] ].
	builder addText: text.

	elHello := builder view elementFromModel: 'hello'.
	elWorld := builder view elementFromModel: 'world'.
	
	self assert: (elHello hasAttribute: #myValue).
	self deny: (elWorld hasAttribute: #myValue).
	self assert: (elHello attributeAt: #myValue) = 'value'.

	self deny: trigger.
	elHello announce: (TRMouseClick new shape: elHello trachelShape).
	self assert: trigger.
	
	trigger := false.
	self deny: trigger.
	elWorld announce: (TRMouseClick new shape: elWorld trachelShape).
	self deny: trigger.
	
]

{ #category : #tests }
RTTextBuilderTest >> testClickableWord [
	| t element |
	t := false.
	 
	builder wordInteraction 
					when: TRMouseClick do: [ :event | t := true ].
	builder addText: 'hello world'.
	self deny: t.
	
	element := builder view elementFromModel: 'hello'.
	element announce: TRMouseClick.
	self assert: t
]

{ #category : #tests }
RTTextBuilderTest >> testExamples [
	RTTextBuilderExamples selectors do: [ :eachSelector |
		(RTTextBuilderExamples new perform: eachSelector) build.
	]
]

{ #category : #tests }
RTTextBuilderTest >> testHookIntervals [
	| text words intervals arr |
	words := OrderedCollection new.
	intervals := OrderedCollection new.
	text := 'my whole text', String cr, 'a b c'.
	builder wordHook: [ :anElement :anInterval | 
		words add: anElement model.
		intervals add: anInterval. ].
	builder addText: text.
	arr := OrderedCollection new.
	arr add: 'my'; add: ' '; add: 'whole'; add: ' '; add: 'text'; add: 'a'; add: ' '; add: 'b'; add: ' '; add: 'c'.
	self assert: words asArray equals: arr asArray.
	arr := OrderedCollection new.
	arr add: (1 to: 2); add: (3 to: 3); add: (4 to: 8); add: (9 to: 9); add: (10 to: 13) ; add: (15 to: 15); add: (16 to: 16); add: (17 to: 17); 
		add: (18 to: 18); add: (19 to: 19).
	self 
		assert: intervals asArray 
		equals: arr asArray
					
]

{ #category : #tests }
RTTextBuilderTest >> testOpening [

	builder open close
]

{ #category : #tests }
RTTextBuilderTest >> testOpeningOnEmpty [
	self assert: builder view numberOfElements = 0
]

{ #category : #tests }
RTTextBuilderTest >> testOpeningOnMultilineText [
	| elements text |
	text := 'hello
world'.
	builder addText: text.
	elements := builder view elements.
	self assert: elements size = 3.
	self assert: (elements anySatisfy: [ :el | el model = text ]).
	self assert: (elements anySatisfy: [ :el | el model = 'hello' ]).
	self assert: (elements anySatisfy: [ :el | el model = 'world' ]).
]

{ #category : #tests }
RTTextBuilderTest >> testOpeningOnMultilineText2 [
	| elements text |
	text := 'hello world
hola mundo'.
	builder addText: text.
	elements := builder view elements.
	self assert: elements size = 7.
	self assert: (elements anySatisfy: [ :el | el model = text ]).
	self assert: (elements anySatisfy: [ :el | el model = 'hello' ]).
	self assert: (elements anySatisfy: [ :el | el model = 'world' ]).
	self assert: (elements anySatisfy: [ :el | el model = 'hola' ]).
	self assert: (elements anySatisfy: [ :el | el model = 'mundo' ]).
]

{ #category : #tests }
RTTextBuilderTest >> testOpeningOnMultilineText2Position [
	| spaces text |
	text := 'hello world
hola mundo'.
	builder addText: text.
	spaces := builder view elements select: [ :each | each model = ' ' ].
	
	self assertModel: 'hello' position: #top equals: 'world' position: #top.
	self assertModel: 'hola' position: #top equals: 'mundo' position: #top.
	self assertModel: 'hello' position: #left equals: 'hola' position: #left.
	self assertModel: 'hello' position: #bottom equals: 'hola' position: #top.
	self assertModel: text position: [:rectangle | rectangle topLeft + 5 ] equals: 'hello' position: #topLeft.
]

{ #category : #tests }
RTTextBuilderTest >> testOpeningOnMultilineText3 [
	| text |
	text := (RTTextBuilderTest >> #testOpeningOnMultilineText3)
		sourceCode.
	builder addText: text.
	builder open close
]

{ #category : #tests }
RTTextBuilderTest >> testOpeningOnText [
	builder addText: 'hello world'.
	self assert: builder view numberOfElements = 4.
	
	builder addText: 'hello world'.
	self assert: builder view numberOfElements = 8.
]

{ #category : #tests }
RTTextBuilderTest >> testOpeningOnText2 [
	| elements text |
	text := 'hello world'.
	builder addText: text.
	elements := builder view elements.
	self assert: elements size = 4.
	self assert: (elements anySatisfy: [ :el | el model = text ]).
	self assert: (elements anySatisfy: [ :el | el model = 'hello' ]).
	self assert: (elements anySatisfy: [ :el | el model = ' ' ]).
	self assert: (elements anySatisfy: [ :el | el model = 'world' ]).
]

{ #category : #tests }
RTTextBuilderTest >> testWordHighlight [
	| element text |
	builder := RTTextBuilder new.
	text := 'hello world'.
	builder wordInteraction highlightColored: Color blue.
	builder addText: text.
	element := builder view elementFromModel: 'hello'.
	self assert: element trachelShape color = element shape defaultColor.
	element announce: (TRMouseEnter new shape: element trachelShape).
	self assert: element trachelShape color = Color blue.
	element announce: (TRMouseLeave new shape: element trachelShape).
	self assert: element trachelShape color = element shape defaultColor.
]
