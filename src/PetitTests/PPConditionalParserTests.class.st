Class {
	#name : #PPConditionalParserTests,
	#superclass : #PPAbstractParserTest,
	#instVars : [
		'context'
	],
	#category : #'PetitTests-Tests'
}

{ #category : #'as yet unclassified' }
PPConditionalParserTests >> context [
	^ context
]

{ #category : #'as yet unclassified' }
PPConditionalParserTests >> setUp [
	super setUp.
	context := PPContext new
]

{ #category : #'as yet unclassified' }
PPConditionalParserTests >> testConditionCtxAccess [
	| parser |

	parser := ('a' asParser if: [ :ctx | (ctx propertyAt: #foo) = #bar ]).
	
	context propertyAt: #foo put: #bar.
	self assert: parser parse: 'a' .


	context propertyAt: #foo put: #zorg.
	self assert: parser fail: 'a' .

]

{ #category : #'as yet unclassified' }
PPConditionalParserTests >> testConditionFalse [
	| parser |
	parser := ('a' asParser if: [ :ctx | false ]).
	
	self assert: parser fail: 'a'.
	self assert: parser fail: 'b'.
]

{ #category : #'as yet unclassified' }
PPConditionalParserTests >> testConditionTrue [
	| parser |
	parser := ('a' asParser if: [ :ctx | true ]).
	
	self assert: parser parse: 'a'.
	self assert: parser fail: 'b'.
]
