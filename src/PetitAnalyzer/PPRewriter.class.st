"
PPRewriter walks over a grammar graph and transforms its parsers. If the grammar is modified, #hasChanged returns true.

Instance Variables:
	changed	<Boolean>	Indicates if the last operation has changed anything.
"
Class {
	#name : #PPRewriter,
	#superclass : #PPProcessor,
	#instVars : [
		'changed'
	],
	#category : #'PetitAnalyzer-Core'
}

{ #category : #public }
PPRewriter >> execute: aParser [
	"Perform the replace rules of the receiver on aParser, answer the resulting parser."

	| previous result |
	previous := context.
	changed := false.
	context := Dictionary new.
	result := aParser transform: [ :each |
		| transformed |
		transformed := self performRulesOn: each.
		transformed isNil
			ifTrue: [ each ]
			ifFalse: [ changed := true. transformed ] ].
	context := previous.
	^ result
]

{ #category : #testing }
PPRewriter >> hasChanged [
	"Answer if the last operation has changed anything."
	
	^ changed
]

{ #category : #initialization }
PPRewriter >> initialize [
	super initialize.
	changed := false
]

{ #category : #accessing }
PPRewriter >> replace: aSearchParser with: aReplaceParser [
	self replace: aSearchParser with: aReplaceParser when: [ :node | true ]
]

{ #category : #accessing }
PPRewriter >> replace: aSearchParser with: aReplaceParser when: aValidationBlock [
	self addRule: (PPParserReplaceRule searchFor: aSearchParser replaceWith: aReplaceParser when: aValidationBlock)
]

{ #category : #accessing }
PPRewriter >> replace: aSearchParser withValueFrom: aReplaceBlock [
	self replace: aSearchParser withValueFrom: aReplaceBlock when: [ :node | true ]
]

{ #category : #accessing }
PPRewriter >> replace: aSearchParser withValueFrom: aReplaceBlock when: aValidationBlock [
	self addRule: (PPBlockReplaceRule searchFor: aSearchParser replaceWith: aReplaceBlock when: aValidationBlock)
]
