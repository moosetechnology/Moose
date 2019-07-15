Class {
	#name : #PPConditionalParserTest,
	#superclass : #PPAbstractParserTest,
	#instVars : [
		'context'
	],
	#category : #'PetitTests-Tests'
}

{ #category : #'as yet unclassified' }
PPConditionalParserTest >> context [
	^ context
]

{ #category : #'as yet unclassified' }
PPConditionalParserTest >> setUp [
	super setUp.
	context := PPContext new
]

{ #category : #'as yet unclassified' }
PPConditionalParserTest >> testConditionCtxAccess [
	| parser |

	parser := ('a' asParser if: [ :ctx | (ctx propertyAt: #foo) = #bar ]).
	
	context propertyAt: #foo put: #bar.
	self assert: parser parse: 'a' .


	context propertyAt: #foo put: #zorg.
	self assert: parser fail: 'a' .

]

{ #category : #'as yet unclassified' }
PPConditionalParserTest >> testConditionFalse [
	| parser |
	parser := ('a' asParser if: [ :ctx | false ]).
	
	self assert: parser fail: 'a'.
	self assert: parser fail: 'b'.
]

{ #category : #'as yet unclassified' }
PPConditionalParserTest >> testConditionTrue [
	| parser |
	parser := ('a' asParser if: [ :ctx | true ]).
	
	self assert: parser parse: 'a'.
	self assert: parser fail: 'b'.
]
