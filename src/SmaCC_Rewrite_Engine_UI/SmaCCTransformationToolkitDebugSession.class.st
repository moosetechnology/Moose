Class {
	#name : #SmaCCTransformationToolkitDebugSession,
	#superclass : #DebugSession,
	#instVars : [
		'rootContext'
	],
	#category : #'SmaCC_Rewrite_Engine_UI'
}

{ #category : #accessing }
SmaCCTransformationToolkitDebugSession >> currentNode [
	| context |
	context := interruptedContext.
	[ context isNil ]
		whileFalse: [ (self isRewriteContext: context)
				ifTrue: [ ^ context receiver match ].
			context := context sender ].
	^ nil
]

{ #category : #testing }
SmaCCTransformationToolkitDebugSession >> isActive [
	^ rootContext notNil and: [ rootContext isDead not and: [ rootContext ~= self process suspendedContext or: [ rootContext willReturn not ] ] ]
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugSession >> isRewriteContext: context [
	^ (context receiver isKindOf: SmaCCRewriteMatchContext)
		and: [ (SmaCCRewriteMatchContext methodDictionary at: context selector ifAbsent: [ nil ]) ~~ context method ]
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugSession >> newSource [
	^ self rewriteEngine source asString
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugSession >> originalSource [
	^ self rewriteNode completeSource asString
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugSession >> rewriteEngine [
	^ self rootContext receiver
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugSession >> rewriteForContext: context [
	^ context receiver rewriteEngine rewriteRule rewriteForMethod: context method
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugSession >> rewriteNode [
	^ self rootContext tempAt: 1
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugSession >> rootContext [
	^ rootContext
		ifNil: [ rootContext := interruptedContext findContextSuchThat: [ :each | SmaCCTransformationToolkitDebugger isTransformationContext: each ] ]
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugSession >> transformationStack [
	| stack context rewrite |
	stack := OrderedCollection new.
	context := interruptedContext.
	[ context isNil ]
		whileFalse: [ (self isRewriteContext: context)
				ifTrue: [ rewrite := self rewriteForContext: context.
					rewrite notNil
						ifTrue: [ stack
								add:
									{rewrite.
									context} ] ].
			context := context sender ].
	^ stack
]
