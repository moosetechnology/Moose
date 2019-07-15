Class {
	#name : #SmaCCTransformationToolkitDebugAction,
	#superclass : #DebugAction,
	#category : #'SmaCC_Rewrite_Engine_UI'
}

{ #category : #testing }
SmaCCTransformationToolkitDebugAction >> appliesToContext: aContext [
	^ self session isActive
]

{ #category : #private }
SmaCCTransformationToolkitDebugAction >> stepUntil: aBlock [
	| context process searchBlock transformationBlock previousContext searchContext found rootContext |
	searchBlock := SmaCCRewriteMatch haltBlock.
	transformationBlock := SmaCCRewriteTransformation haltBlock.
	SmaCCRewriteMatch haltBlock: nil.
	SmaCCRewriteTransformation haltBlock: nil.
	[ process := self session process.
	context := self currentContext.
	searchContext := process suspendedContext.
	previousContext := searchContext.
	found := false.
	[ searchContext notNil ]
		whileTrue: [ found := found or: [ searchContext == context ].
			(self session isRewriteContext: searchContext)
				ifTrue: [ rootContext := searchContext ].
			searchContext := searchContext sender ].
	(found and: [ rootContext notNil ])
		ifFalse: [ ^ self ].
	[ context notNil
		and: [ process isTerminating not and: [ process isTerminated not and: [ process suspendedContext notNil and: [ aBlock value: context ] ] ] ] ]
		whileFalse: [ previousContext == context
				ifFalse: [ (context findContextSuchThat: [ :c | c == rootContext ]) isNil
						ifTrue: [ ^ self session updateContextTo: context ].
					previousContext := context ].
			context := process step: context ].
	self session updateContextTo: context ]
		ensure: [ SmaCCRewriteMatch haltBlock: searchBlock.
			SmaCCRewriteTransformation haltBlock: transformationBlock ]
]
