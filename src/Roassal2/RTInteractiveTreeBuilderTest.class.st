"
A RTInteractiveTreeBuilderTest is a test class for testing the behavior of RTInteractiveTreeBuilder
"
Class {
	#name : #RTInteractiveTreeBuilderTest,
	#superclass : #TestCase,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTInteractiveTreeBuilderTest >> test01 [
	"the basic test"
	| b |
	b := RTInteractiveTreeBuilder new.
	b explore: String using: #subclasses.
	b build.
]

{ #category : #tests }
RTInteractiveTreeBuilderTest >> test02 [
	"the setters and getters"
	| b |
	b := RTInteractiveTreeBuilder new.
	b shape box color: Color red.
	b labelShape text: [ :model | model name asUppercase ].
	b lineShape color: Color red.
	b horizontalGap: 250.
	b verticalGap: 10.
	b horizontalPadding: 10.
	self assert: b interaction numberOfInteractions equals: 3.
	
	b explore: Collection using: #subclasses.
	b build
]

{ #category : #tests }
RTInteractiveTreeBuilderTest >> test03 [
	"the layout"
	| b |
	b := RTInteractiveTreeBuilder new.
	b rightward.
	b leftward.
	b upward.
	b downward.
]
