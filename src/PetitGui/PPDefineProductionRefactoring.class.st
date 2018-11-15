"
PetitParser Refactoring: definition of a production rule
"
Class {
	#name : #PPDefineProductionRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'class',
		'source',
		'protocols',
		'method'
	],
	#category : #'PetitGui-Refactoring'
}

{ #category : #'instance creation' }
PPDefineProductionRefactoring class >> onClass: aClass source: aString protocols: anArray [
	^ self new
		setClass: aClass;
		setSource: aString;
		setProtocols: anArray;
		yourself
]

{ #category : #private }
PPDefineProductionRefactoring >> checkSource [
	| rewriter |
	method := RBParser
		parseMethod: source
		onError: [ :string :position | ^ false ].
	rewriter := self sourceRewriter.
	[ rewriter executeTree: method ]
		whileTrue: [ method := rewriter tree ].
	^ method selector isUnary
]

{ #category : #preconditions }
PPDefineProductionRefactoring >> preconditions [
	^ (self checkCompositeParser: class)
		& (RBCondition withBlock: [ self checkSource ] errorString: 'Unable to parse source code')
]

{ #category : #accessing }
PPDefineProductionRefactoring >> selector [
	^ method selector
]

{ #category : #initialization }
PPDefineProductionRefactoring >> setClass: aClass [
	class := self classObjectFor: aClass
]

{ #category : #initialization }
PPDefineProductionRefactoring >> setProtocols: anArray [
	protocols := anArray
]

{ #category : #initialization }
PPDefineProductionRefactoring >> setSource: aString [
	source := aString
]

{ #category : #private }
PPDefineProductionRefactoring >> sourceRewriter [
	^ RBParseTreeRewriter new
		replace: '`#literal' with: '`#literal asParser' when: [ :node |
			(node isLiteralNode and: [ node value isString or: [ node value isCharacter ] ])
				and: [ (node parent isNil or: [ node parent isMessage not or: [ node parent selector ~= #asParser ] ])
				and: [ (node parents noneSatisfy: [ :each | each isBlock ]) ] ] ];
		replaceMethod: '`@method: `@args | `@temps | ``@.statements. ``.statement `{ :node | node isReturn not }' 
			with: '`@method: `@args | `@temps | ``@.statements. ^ ``.statement';
		yourself
]

{ #category : #transforming }
PPDefineProductionRefactoring >> transform [
	(class definesInstanceVariable: method selector asString)
		ifFalse: [ class addInstanceVariable: method selector asString ].
	class compile: method newSource classified: protocols
]
