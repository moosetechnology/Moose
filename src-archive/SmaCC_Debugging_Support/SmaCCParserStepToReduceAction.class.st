Class {
	#name : #SmaCCParserStepToReduceAction,
	#superclass : #SmaCCParserStepAction,
	#category : #'SmaCC_Debugging_Support'
}

{ #category : #registration }
SmaCCParserStepToReduceAction class >> gtActionFor: aDebugger [
	<gtSmaCCDebuggingParserAction>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousInto
]

{ #category : #accessing }
SmaCCParserStepToReduceAction >> defaultLabel [
	^ 'Into Reduce'
]

{ #category : #accessing }
SmaCCParserStepToReduceAction >> defaultOrder [
	^ 50
]

{ #category : #actions }
SmaCCParserStepToReduceAction >> executeAction [
	| selectors |
	selectors := self session parser reduceTable
		inject: Set new
		into: [ :sum :each | 
			sum
				add: each last;
				yourself ].
	self
		stepUntil: [ :context | 
			(context findContextSuchThat: [ :each | (each receiver isKindOf: SmaCCParser) and: [ selectors includes: each selector ] ])
				notNil ]
]

{ #category : #accessing }
SmaCCParserStepToReduceAction >> help [
	^ 'Run until we get to the start of a reduction action or a parse error is encountered.'
]
